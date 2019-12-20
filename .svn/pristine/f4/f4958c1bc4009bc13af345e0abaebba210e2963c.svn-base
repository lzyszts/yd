<?php
namespace app\admin\model;
use think\Model;
use think\Db;
/**
 * 文章表模型
 */

class LogModel extends Model
{

	protected function initialize(){
   		$this->table = config("database.prefix").'admin_log';
   	}

	/**
	 * 日志列表
	 */
	public function getLogList(){
		$params=request()->param();
		$count=$this->count();
		$limit=$params['limit'];
		$list=$this
			->order('id desc')
			->limit($limit)
			->paginate($limit)
			->toArray();
		$data = layui_data($list['data'],$count);
		return $data;
	}

	/**
	 * 日志删除
	 */
	public function logDel(){
		//10天前
		$time=strtotime('-10 day',time());
		$res=$this->where('add_time','<',$time)->delete();
		if($res!==false)
		{
			return return_data('日志删除成功',1);
		}else{
			return return_data('日志删除失败',-1);
		}
	}


}

