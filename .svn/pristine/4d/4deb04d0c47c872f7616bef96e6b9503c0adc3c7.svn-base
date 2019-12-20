<?php
namespace app\admin\model;
use think\Model;
use think\Db;

/**
 * 信息表模型
 */

class InfoModel extends Model
{
	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'info';
   	}

	/**
	 * 信息列表
	 */
	public function getInfoList(){
		$count = $this->count();
		$list = $this->select();
		$data = layui_data($list,$count);
		return $data;
	}

	/**
	 * 加盟信息删除
	 * @Author   lzy
	 * @DateTime 2019-09-11
	 * @param    [type]     $id [description]
	 * @return   [type]         [description]
	 */
	public function infoDel($id){
		if(!is_numeric($id))
		{
			return return_data('加盟信息id信息错误',-1);
			
		}
		//删除加盟信息
		$res=$this->where('id',$id)->delete();
		if($res)
		{
			return return_data('加盟信息删除成功',1);
		}else{
			return return_data('加盟信息删除失败',-1);
		}
	}


	






}
