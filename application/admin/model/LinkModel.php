<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Img;
/**
 * 链接表模型
 */

class LinkModel extends Model
{


	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'link';
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
     * 链接添加
     * @return [type] [description]
     */
    public function linkAdd($params=[]){
		$thumb_id=$params['thumb_id'];
		//删除临时图和临时信息
		Img::imgInfoOperation($thumb_id);
		//插入链接
		$res=$this->allowField(true)->save($params);
		if($res){
			//更新配置缓存信息
            \app\server\Cache::linksInit(1);
			return return_data('添加链接成功',1);
		}{
			return return_data('添加链接失败',-1);
		}
    }
    /**
     * 链接编辑
     * @return [type] [description]
     */
    public function linkEdit($params=[]){
    	//1、
		//之前缩略图id
		$old_id=$this->field('thumb_id')->find($params['id']);
		$old_id=$old_id['thumb_id'];
		if($old_id)
		{
			//之前缩略图状态改为0
			Db::name('img_info')->where('id','=',$old_id)->setField('state',0);
		}
		//加入缩略图id
		if(!empty($params['thumb_id']))
		{
			$thumb_id=$params['thumb_id'];
		}else{
			$params['thumb_id']=0;
		}
		//删除临时图和临时信息
		Img::imgInfoOperation($thumb_id);
		//修改文章
		$res=$this->allowField(true)->isUpdate(true)->save($params);
		if($res){
			//更新配置缓存信息
            \app\server\Cache::linksInit(1);
			return return_data('链接信息修改成功',1);
		}{
			return return_data('链接信息修改失败',-1);
		}
    }


    /**
     * 链接删除
     * 找到缩略图同时删除
     * @return [type] [description]
     */
    public function linkDel($id){
        if(!is_numeric($id))
        {
            return return_data('链接id信息错误',-1);
        }
        $link_info=$this->find($id);
        $thumb_id=$link_info['thumb_id'];
        if($thumb_id!==0)
        {
        	//删除缩略图
        	Img::imgDelByIds($thumb_id);
        }
        //删除链接信息
        $res=$this->where('id',$id)->delete();
        if($res)
        {
        	//更新配置缓存信息
            \app\server\Cache::linksInit(1);
            return return_data('链接删除成功',1);
        }else{
            return return_data('链接删除失败',-1);
        }
    }




    /**
	 * 链接启用禁用
	 */
	public function linkSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(!is_numeric($params['id']))
		{
			return return_data('链接id信息错误',-1);
		}
		$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
		if($res)
		{
			return return_data('链接状态切换成功',1);
		}else{
			return return_data('链接状态切换失败',-1);
		}
	}

/***************************************************/

	/**
	 * 根据id获取链接内容
	 * 图片id转换为src
	 * @return [type] [description]
	 */
	public function getLink($id){
		if(!empty($id))
		{
			$link_info=$this
			->alias('a')
			->field('a.*,b.real_name,CONCAT("'.UPLOAD_URL.'",b.src) img_url')
			->leftJoin(config('database.prefix').'img_info b','a.thumb_id=b.id')
			->where('a.id',$id)
			->find();	
		}
		return $link_info;
	}

	
	/**
	 * 取链接列表
	 */
	public function getLinkList(){
		$params=request()->param();
		$count=$this->count();
		$limit=$params['limit'];
		$list=$this
			->alias('a')
			->field('a.*,CONCAT("'.UPLOAD_URL.'",b.src) src')
			->leftJoin(config('database.prefix').'img_info b','a.thumb_id=b.id')
			->order('a.sort')
			->paginate($limit)
			->toArray();
		$data = layui_data($list['data'],$count);
		return $data;
	}


	/**
	 * 前台取链接列表
	 */
	public function getLinks(){
		$data=$this
			->alias('a')
			->field('a.*,CONCAT("'.UPLOAD_URL.'",b.src) img_url')
			->leftJoin(config('database.prefix').'img_info b','a.thumb_id=b.id')
			->order('a.sort')
			->select();
		return $data;
	}


}
