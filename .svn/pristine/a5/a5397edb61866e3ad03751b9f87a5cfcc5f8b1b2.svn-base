<?php
namespace app\admin\model;
use think\Model;
use think\Db;

/**
 * 前台用户表模型
 */

class UserModel extends Model
{
	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'user';
   	}
   	/**
   	 * 前台用户编辑
   	 * @Author   lzy
   	 * @DateTime 2019-08-21
   	 * @param    array      $params [description]
   	 * @return   [type]             [description]
   	 */
	public function userEdit($params=[]){
		$params['role_ids']=implode(",", $params['role_ids']);
		$params['update_time']=time();
		$res=$this->allowField(['role_ids','area_id','update_time'])->isUpdate(true)->save($params);
		if($res){
			//删除编辑的用户mca、用户桌面缓存
			$info=$this->field('username')->find($params['id']);
			$username=$info['username'];
	    	cache(config('cache.user_auth_mca').'_'.$username,null);
	    	cache(config('cache.user_desk_mca').'_'.$username,null);
			return return_data('用户修改成功',1);
		}{
			return return_data('用户修改失败',-1);
		}
	}



	/**
	 * 管理员页面列表
	 */
	public function getUserList(){
		$params=request()->param();
		$key=$params['key'];
		$limit=$params['limit'];
		$where=[];
		if(!empty($key)){
			$where[]=['username','like',"%".$key."%"];
		}
		$count = $this->where($where)->count();
		$list = $this->where($where)
					 ->order('id')
					 ->paginate($limit)
					 ->toArray();//返回数组格式			 
		//角色ids转中文
		$data=$this->ids_to_ch($list['data']);
		$data=layui_data($data,$count);
		return $data;
	}
	/**
	 * 前台用户页面列表
	 */
	public function getUList(){
		$params=request()->param();
		$key=$params['key'];
		$limit=$params['limit'];
		$where=[];
		if(!empty($key)){
			$where[]=['username','like',"%".$key."%"];
		}
		$count = $this->where($where)->count();
		$list = $this->alias('a')
					 ->field('a.*,b.name area')
				     ->leftJoin(config('database.prefix').'area b','a.area_id=b.id')
					 ->where($where)
					 ->order('a.id')
					 ->paginate($limit)
					 ->toArray();//返回数组格式	
		//角色ids转中文
		$data=$this->ids_to_ch($list['data']);
		$data=layui_data($data,$count);
		return $data;
	}

	/**
	 * 用户信息
	 * role_ids转换为数组
	 */
	public function getUserInfo($id){
		if(!empty($id))
		{
			$user_info=$this->where('id',$id)->find();	
			$user_info['role_ids_array']=explode(',', $user_info['role_ids']);
			return $user_info;
		}
	}


	/**
	 * 用户状态切换
	 */
	public function userSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(is_numeric($params['id']))
		{
			$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
			if($res)
			{
				return return_data('用户状态切换成功',1);
			}else{
				return return_data('用户状态切换失败',-1);
			}
		}else{
			return return_data('用户id信息错误',-1);
		}
	}


	






	/************************************************/


	/**
	* 根据权限ids求对应中文名
	*/
	public function ids_to_ch($data){
		$role_data=Db::name('role')->select();
		//1、把role表数据做成以id为下标的数组
		foreach ($role_data as $key=>$value){
		 	$role_data2[$value['id']]=$value;
		}
		//2、把用户的role_id分别转换成中文
		foreach ($data as $k=>$v){
			 $role_ids=$v['role_ids'];
			 $arr_ids=explode(',', $role_ids); //用户权限ids分成数组
			 foreach ($arr_ids as $v2){      //v2是用户每一个role_ids
			     $arr_str[]=$role_data2[$v2]['name'];
			 }
			 $str=implode('，', $arr_str);
			 $data[$k]['role_name']=$str;
			 unset($arr_str);
		}
		return $data;
	}



}
