<?php
namespace app\server;
use think\Db;
/**
 * 文件处理类
 */
class FileOp
{	

	/**
	 * [layui上传的单个文件]
	 * @param  [object]  $file      [文件对象]
	 * @param  [array]  $validate   [验证规则]
	 * @return [type]               [description]
	 */
	public static function layFile($file,$validate){
        $info = $file->rule('sha1')->validate($validate)->move(DOWNLOAD_PATH);
        //上传失败
        if(!$info)
        {
          	return return_data($file->getError(),-1);
        }
        //上传成功
        $original=$file->getInfo()['name']; //原始文件名
        $filename = $info->getFileName();	//文件名
        $src = $info->getSaveName();		//存储路径
        $realPath = $info->getRealPath();	//盘符真实路径

        //判断文件名是否已经存在,存在则不插入文件信息表
        $file_id=Db::name('file_info')->where('file_name',$filename)->find();
        $file_id=$file_id['id'];
        if(!$file_id)
        {
        	//信息插入临时表
       	 	$file_id=self::fileInfoAdd($original,$filename,$src,$realPath);
       	 	if(!$file_id)
	        {
	            return return_data('文件信息保存错误,请重试',-1);
	        }
        }
        return return_data('上传成功',1,["id"=>$file_id,"src"=>$src,'realName'=>$original]);
	}

	/**
	 * 上传文件信息插入临时表
	 * @param  [type] $original  [文件上传名]
	 * @param  [type] $file_name  [文件名]
	 * @param  [type] $src       [路径]
	 * @param  [type] $real_path [盘符真实路径]
	 * @return [type]            [description]
	 */
	public static function fileInfoAdd($real_name,$file_name,$src,$real_path){
		$admin=session('admin');
		$data=[
			'username'=>$admin['username'],
			'real_name'=>$real_name,
			'file_name'=>$file_name,
			'src'=>$src,
			'real_path'=>$real_path,
			'state'=>0,
			'add_time'=>time(),
		];
		$file_id = Db::name('file_info')->insertGetId($data);
		return $file_id;
	}
	/**
	 * 传入有效文件id,编辑前的file_id
	 * 文件标记为1
	 * 删除其他0的
	 */
	public static function fileInfoOperation($file_id,$old_file_id = 0){
		$admin=session('admin');
		$res=Db::name('file_info')->where('id',$file_id)->setField('state',1);
		//当有旧id存在时说明是编辑
		if($old_file_id!==0 && $old_file_id != $file_id)
		{
			//寻找还有没有其他信息关联这个文件id
			$res=Db::name('download')->where('file_id',$old_file_id)->count();
			//如果没有其他人关联了这个文件id、count结果只有自己则为1,则标记为0(删除文件)
			if($res==1)
			{
				Db::name('file_info')->where('id',$old_file_id)->setField('state',0);
			}
			//dump(Db::name('file_info')->getLastSql());die;
		}

		//删除其他无用的文件
		$file_info=Db::name('file_info')->where('username',$admin['username'])->where('state',0)->select();
	    foreach ($file_info as $v) {
	        $del_src=DOWNLOAD_PATH.$v['src'];
	        //删除文件
	        if(file_exists($del_src))
	        {
	        	unlink($del_src);
	        }
	    }
	    //删除临时文件表信息
	    Db::name('file_info')->where('username',$admin['username'])->where('state',0)->delete();
	}
	/**
	 * 传入文件ids字符串
	 * 删除文件信息及文件
	 * 需要判断是否还有其他下载信息关联这个文件id
	 */
	public static function fileDelByIds($file_id){
		if($file_id==0)
		{
			return;
		}
		//寻找还有没有其他信息关联这个文件id
		$res=Db::name('download')->where('file_id',$file_id)->count();
		//如果没有其他人关联了这个文件id则删除文件
		if($res==1)
		{
			$file_info=Db::name('file_info')->where('id',$file_id)->find();
			$del_src=DOWNLOAD_PATH.$file_info['src'];
			if(file_exists($del_src))
	        {
	        	unlink($del_src);
	        }
	        //删除表信息
	   		Db::name('file_info')->where('id',$file_id)->delete();
		}
	}
}
