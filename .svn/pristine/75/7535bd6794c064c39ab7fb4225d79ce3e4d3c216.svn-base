<?php
namespace app\server;
use think\Db;
use think\Image;
/**
 * 图片处理类
 */
class Img
{	
	/**
	 * UEeditor编辑器的配置文件
	 * @return [type] [description]
	 */
	public static function ueConfig(){
		$config=file_get_contents(__MY_PUBLIC_URL__."/static/common/ue/php/config.json");
		return json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "",$config),true);
	}

	/**
	 * UEeditor上传的图片处理
	 * @param  [object]  $file      [文件对象]
	 * @param  [array]  $validate   [验证规则]
	 * @param  integer $is_compress [是否压缩默认1是]
	 * @return [type]               [返回ueeditor需要的格式信息]
	 */
	public static function ueImg($file,$validate,$is_compress=1){
        $info = $file->validate($validate)->move(UPLOAD_PATH);
        //图片大小(压缩算比例用)
        $size=$file->getInfo()['size'];
        //类型
        $type=$file->getInfo()['type'];
        //原始图片名
        $original=$file->getInfo()['name'];
        if($info)
        {
            $filename = $info->getFileName();
            $src = $info->getSaveName();
            // tp5.1存储路径是\要改为/
            $src = str_replace('\\','/',$src);
            $realPath = $info->getRealPath();
            //信息插入临时表
            $id=self::imgInfoAdd($original,$filename,$src,$realPath);
            if($is_compress)
            {
            	//压缩图片并且裁剪到1200以内
            	self::imgCompress(UPLOAD_PATH.$src,$size,1200); 
            }
            if(!$id)
            {
            	return ['state'=>'图片信息保存错误,请重试'];
            }
            $res=[
                'state'=>'SUCCESS',
                'original'=>$original,
                'size'=>$size,
                'title'=>$filename,
                'type'=>$type,
                'url'=>UPLOAD_URL.$src,
            ];
            return $res;
        }else{
            return ['state'=>$file->getError()];
        }  
	}
	/**
	 * [layui上传的单张图片]
	 * @param  [object]  $file      [文件对象]
	 * @param  [array]  $validate   [验证规则]
	 * @param  integer $is_compress [是否压缩默认0否]
	 * @param  integer $is_thumb    [是否创建缩略图默认0否]
	 * @param  string  $thumb_w     [缩略图宽]
	 * @param  string  $thumb_h     [缩略图高]
	 * @return [type]               [description]
	 */
	public static function layImg($file,$validate,$is_compress=0,$is_thumb=0,$thumb_w='324',$thumb_h='226'){
        $info = $file->validate($validate)->move(UPLOAD_PATH);
        //原始图片名
        $original=$file->getInfo()['name'];
        //上传失败
        if(!$info)
        {
          	return return_data($file->getError(),-1);
        }
        //上传成功
        $filename = $info->getFileName();
        $src = $info->getSaveName();
        // tp5.1存储路径是\要改为/
        $src = str_replace('\\','/',$src);
        $realPath = $info->getRealPath();
        //信息插入临时表
        $id=self::imgInfoAdd($original,$filename,$src,$realPath);
        if($is_compress){
        	//压缩图片
        	$size=$file->getInfo()['size'];//图片大小(压缩算比例用)
            self::imgCompress(UPLOAD_PATH.$src,$size); 
        }
        //生成缩略图
        if($is_thumb)
        {
        	self::imgThumb(UPLOAD_PATH.$src,$thumb_w,$thumb_h);
        }
        if(!$id)
        {
            return return_data('图片信息保存错误',-1);
        }
        return return_data('上传成功',1,["id"=>$id,"src"=>$src,"url"=>UPLOAD_URL.$src]);
	}

	/**
	 * 上传图片信息插入临时表
	 * @param  [type] $original  [图片上传名]
	 * @param  [type] $img_name  [图片名]
	 * @param  [type] $src       [路径]
	 * @param  [type] $real_path [盘符真实路径]
	 * @return [type]            [description]
	 */
	public static function imgInfoAdd($real_name,$img_name,$src,$real_path){
		$admin=session('admin');
		$data=[
			'username'=>$admin['username'],
			'real_name'=>$real_name,
			'img_name'=>$img_name,
			'src'=>$src,
			'real_path'=>$real_path,
			'state'=>0,
			'add_time'=>time(),
		];
		$img_id = Db::name('img_info')->insertGetId($data);
		return $img_id;
	}
	/**
	 * 传入有效图片ids字符串
	 * 图片标记为1
	 * 然后删除此用户其他无效的图片信息及文件
	 */
	public static function imgInfoOperation($img_ids){
		$img_ids=empty($img_ids)?0:$img_ids;
		$admin=session('admin');
		//标记ids的state为1
		$res=Db::name('img_info')->where('id','in',$img_ids)->setField('state',1);
		//删除其他无用的图片
		$img_info=Db::name('img_info')->where('username',$admin['username'])->where('state',0)->select();
	    foreach ($img_info as $v) {
	        $del_src=UPLOAD_PATH.$v['src'];
	        if(file_exists($del_src))
	        {
	        	unlink($del_src);
	        }
	    }
	    //删除临时图片表信息
	    Db::name('img_info')->where('username',$admin['username'])->where('state',0)->delete();
	}
	/**
	 * 传入图片ids字符串
	 * 删除图片信息及文件
	 * @return [type] [description]
	 */
	public static function imgDelByIds($img_ids){
		$img_info=Db::name('img_info')->where('id','in',$img_ids)->select();
		//删除文件
		foreach ($img_info as $v) {
	        $del_src=UPLOAD_PATH.$v['src'];
	        if(file_exists($del_src))
	        {
	        	unlink($del_src);
	        }
	    }
	    //删除表信息
	    $img_info=Db::name('img_info')->where('id','in',$img_ids)->delete();
	}
	/**
	 * 压缩图片
	 * @param  [type] $src   	[路径]
	 * @param  [type] $scale 	[图片大小]
	 * @param  [int] $maxWidth  [图片最大宽度,默认1200,不限制传入false]
	 */
	public static function imgCompress($src,$size,$maxWidth="1200"){
		$image = Image::open($src);
		// 返回图片的宽度
		$width = $image->width(); 
		$height = $image->height();
		//限制最大宽
		if($maxWidth!==false)
		{
			if($width>$maxWidth)
			{
				$image->thumb($maxWidth,$height);
			}
		}
		//大于200k则开启压缩
		if($size>0.2*1024*1024)
		{
			//图像大小算压缩比例
			$proportion=$size/(3*1024*1024);
			$scale=(1-$proportion)*100;
			if($scale<90)
			{
				$scale+=10;
			}
			if($scale<30)
			{
				$scale=30;
			}
			$image->save($src,null,$scale);
		}
	} 
	/**
	 * 图片生成缩略图
	 * @param  [type]  $scr  [路径]
	 * @param  integer $type [类型]
	 * @return [type]        [description]
	 */
	public static function imgThumb($src,$width,$height,$type=1){
		$image = Image::open($src);
		$image->thumb($width,$height)->save($src);
	}
}
