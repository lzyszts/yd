<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Img;
use app\server\FileOp;
/**
 * 下载信息表模型
 */

class DownloadModel extends Model
{

	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'download';
   	}
	protected $insert = ['add_time'];
	protected $update = ['update_time'];

	//自动插入
	protected function setAddTimeAttr($v){
		return time();
	}
	protected function setUpdateTimeAttr($v){
		return time();
	}

    /**
     * 下载添加
     * @return [type] [description]
     */
    public function downloadAdd($params=[]){
		$img_id=$params['logo_id'];
		$file_id=$params['file_id'];
		//删除临时图和临时信息
		Img::imgInfoOperation($img_id);
		//删除临时文件信息
		FileOp::fileInfoOperation($file_id);
		//插入下载
		$res=$this->allowField(true)->save($params);
		if($res){
			return return_data('添加下载成功',1);
		}{
			return return_data('添加下载失败',-1);
		}
    }


    /**
     * 下载编辑
     * @return [type] [description]
     */
    public function downloadEdit($params=[]){
    	$params['file_id']=empty($params['file_id'])?0:$params['file_id'];
    	//1、之前下载信息
		$old_info=$this->find($params['id']);
		$olo_img_id=$old_info['logo_id'];
		$old_file_id=$old_info['file_id'];
		//处理图片
		if($olo_img_id)
		{
			//之前缩略图状态改为0
			Db::name('img_info')->where('id',$olo_img_id)->setField('state',0);
		}
		//删除临时图和临时信息
		Img::imgInfoOperation($params['logo_id']);
		//处理文件
		FileOp::fileInfoOperation($params['file_id'],$old_file_id);

		//修改下载
		$res=$this->allowField(true)->isUpdate(true)->save($params);
		if($res){
			return return_data('下载信息修改成功',1);
		}{
			return return_data('下载信息修改失败',-1);
		}
    }


    /**
     * 下载删除
     * 缩略图同时删除
     * 文件同时删除
     * @return [type] [description]
     */
    public function downloadDel($id){
        if(!is_numeric($id))
        {
            return return_data('下载id信息错误',-1);
        }
        $download_info=$this->find($id);
        $img_id=$download_info['logo_id'];
		///删除图片
        Img::imgDelByIds($img_id);
        //删除文件
        FileOp::fileDelByIds($download_info['file_id']);
        //删除下载信息
        $res=$this->where('id',$id)->delete();
        if($res)
        {
            return return_data('下载删除成功',1);
        }else{
            return return_data('下载删除失败',-1);
        }
    }




    /**
	 * 下载启用禁用
	 */
	public function downloadSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(!is_numeric($params['id']))
		{
			return return_data('下载id信息错误',-1);
		}
		$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
		if($res)
		{
			return return_data('下载状态切换成功',1);
		}else{
			return return_data('下载状态切换失败',-1);
		}
	}

/***************************************************/

	/**
	 * 根据id获取下载内容
	 * 图片id转换为src
	 * @return [type] [description]
	 */
	public function getDownload($id){
		if(!empty($id))
		{
			$download_info=$this
			->alias('a')
			->field('a.*,b.real_name,c.real_name file_name,CONCAT("'.UPLOAD_URL.'",b.src) url')
			->leftJoin(config('database.prefix').'img_info b','a.logo_id=b.id')
			->leftJoin(config('database.prefix').'file_info c','a.file_id=c.id')
			->where('a.id',$id)
			->find();	
		}
		return $download_info;
	}

	
	
	/**
	 * 取文件列表数据
	 * @Author   lzy
	 * @DateTime 2019-09-05
	 * @param    [array]    $type [类型数组['pc','phone','video']]
	 * @return   [type]           [description]
	 */
	public function getDownloadList($type){
		$count=$this->count();
		$limit=$params['limit'];
		$list=$this
			->alias('a')
			->field('a.*,concat("'.UPLOAD_URL.'",b.src) src,concat("'.DOWNLOAD_URL.'",c.src) down_src,c.real_name')
			->leftJoin(config('database.prefix').'img_info b','a.logo_id=b.id')
			->leftJoin(config('database.prefix').'file_info c','a.file_id=c.id')
			->where('a.type','in',$type)
			->where('a.state',1)
			->order('a.type,a.sort,a.add_time desc')  //type组内排序
			->paginate($limit)
			->toArray();
		$data = layui_data($list['data'],$count);
		return $data;
	}


}
