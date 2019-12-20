<?php
namespace app\home\model;
use think\Model;
use think\Db;
/**
 * 前台插入数据
 */

class InfoModel extends Model
{

	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'info';
   	}

	/**
	 * 插入用户留言
	 * 限制用户当天最多插入3条
	 * @Author   lzy
	 * @DateTime 2019-09-04
	 * @return   [type]     [description]
	 */
	public function addInfo($params){
		$ip = request()->ip();
		$date = date('Y-m-d',time());
		// 查询当前IP今天插入了几条
		$count = $this->where('date',$date)
		->where('ip',$ip)->count();

		if($count >= 3){
			return return_data('每天最多提交三次!',-1);
		}
		$params['ip'] = $ip;
		$params['date'] = $date;
		$params['add_time'] = time();
		$res=$this->allowField(true)->save($params);
		if($res){
			return return_data('加盟信息提交成功',1);
		}else{
			return return_data('加盟信息提交失败',-1);
		}
	}



}
