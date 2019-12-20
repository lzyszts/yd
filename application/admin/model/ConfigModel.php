<?php
namespace app\admin\model;
use think\Model;
use think\Db;

//use think\model\concern\SoftDelete;
/**
 * 配置表模型
 */

class ConfigModel extends Model
{
	protected function initialize(){
   		$this->table = config("database.prefix").'config';
   	}
	protected $update = ['update_time'];
	protected function setUpdateTimeAttr($v){
		return time();
	}

	/**
	 * 网站后台配置信息修改
	 */
	public function websiteEdit($params=[]){
		//处理逗号改为小写
		$params['imgType']=str_replace("，", ",", $params['imgType']);
		$params['fileType']=str_replace("，", ",", $params['fileType']);
		$params['videoType']=str_replace("，", ",", $params['videoType']);
		$params['update_time'] = time();
		//循环修改配置信息
		foreach ($params as $only_tag => $v) {
			$res=$this->where('only_tag','=',$only_tag)->update(['value'=>$v]);
		}
		if($res!==false)
		{
			//更新配置缓存信息
			\app\server\Cache::configInit(1);
			//更新cookie下面的配置
			\app\server\Cache::configCookie(1);
			return return_data('网站配置信息修改成功',1);
		}else{
			return return_data('网站配置信息修改失败',-1);
		}
	}	
	/**
	 * 网站前台配置信息修改
	 */
	public function infoEdit($params=[]){
		//循环修改配置信息
		foreach ($params as $only_tag => $v) {
			$res=$this->where('only_tag','=',$only_tag)->update(['value'=>$v]);
		}
		if($res!==false)
		{
			//更新配置缓存信息
			\app\server\Cache::configInit(1);
			return return_data('网站前台配置信息修改成功',1);
		}else{
			return return_data('网站前台配置信息修改失败',-1);
		}
	}



	/**
	 * 所有配置信息
	 * @return [type] [description]
	 */
	public function configList(){
		$data=$this->column('only_tag,name,value,describe');
		return $data;
	}








}
