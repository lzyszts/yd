<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Img;
/**
 * 轮播图表模型
 */

class SlideModel extends Model
{

	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'slide';
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
     * 轮播图添加
     * @return [type] [description]
     */
    public function slideAdd($params=[]){
		$img_id=$params['img_id'];
		//删除临时图和临时信息
		Img::imgInfoOperation($img_id);
		//插入轮播图
		$res=$this->allowField(true)->save($params);
		if($res){
			return return_data('添加轮播图成功',1);
		}{
			return return_data('添加轮播图失败',-1);
		}
    }


    /**
     * 轮播图编辑
     * @return [type] [description]
     */
    public function slideEdit($params=[]){
    	//1、
		//之前轮播图id
		$old_id=$this->field('img_id')->find($params['id']);
		$old_id=$old_id['img_id'];
		if($old_id)
		{
			//之前缩略图状态改为0
			Db::name('img_info')->where('id','=',$old_id)->setField('state',0);
		}
		//删除临时图和临时信息
		Img::imgInfoOperation($params['img_id']);
		//修改轮播图
		$res=$this->allowField(true)->isUpdate(true)->save($params);
		if($res){
			return return_data('轮播图信息修改成功',1);
		}{
			return return_data('轮播图信息修改失败',-1);
		}
    }


    /**
     * 轮播图删除
     * 找到缩略图同时删除
     * @return [type] [description]
     */
    public function slideDel($id){
        if(!is_numeric($id))
        {
            return return_data('轮播图id信息错误',-1);
        }
        $slide_info=$this->find($id);
        $img_id=$slide_info['img_id'];
		///删除轮播图
        Img::imgDelByIds($img_id);
        //删除轮播图信息
        $res=$this->where('id',$id)->delete();
        if($res)
        {
            return return_data('轮播图删除成功',1);
        }else{
            return return_data('轮播图删除失败',-1);
        }
    }




    /**
	 * 轮播图启用禁用
	 */
	public function slideSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(!is_numeric($params['id']))
		{
			return return_data('轮播图id信息错误',-1);
		}
		$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
		if($res)
		{
			return return_data('轮播图状态切换成功',1);
		}else{
			return return_data('轮播图状态切换失败',-1);
		}
	}

/***************************************************/

	/**
	 * 根据id获取轮播图内容
	 * 图片id转换为src
	 * @return [type] [description]
	 */
	public function getslide($id){
		if(!empty($id))
		{
			$slide_info=$this
			->alias('a')
			->field('a.*,b.src,b.real_name,CONCAT("'.UPLOAD_URL.'",b.src) url')
			->leftJoin(config('database.prefix').'img_info b','a.img_id=b.id')
			->where('a.id',$id)
			->find();	
		}
		return $slide_info;
	}


	
	
	/**
	 * 取轮播图列表
	 */
	public function getslideList(){
		$params=request()->param();
		$count=$this->count();
		$limit=$params['limit'];
		$list=$this
			->alias('a')
			->field('a.*,CONCAT("'.UPLOAD_URL.'",b.src) src')
			->leftJoin(config('database.prefix').'img_info b','a.img_id=b.id')
			->order('a.type,a.sort')  //type组内排序
			->paginate($limit)
			->toArray();
		$data = layui_data($list['data'],$count);
		return $data;
	}


}
