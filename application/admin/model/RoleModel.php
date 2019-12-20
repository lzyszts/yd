<?php
namespace app\admin\model;
use think\Model;
use think\Db;
/**
 * 角色表模型
 */

class RoleModel extends Model
{
	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'role';
   	}
	/*protected $insert = ['add_time'];

	//自动插入
	protected function setAddTimeAttr($v){
		return time();
	}*/

	/**
	 * 插入角色
	 * 1、插入角色
	 * 2、插入角色权限关联
	 */
	public function roleAdd($params=[]){
		$role_data=[
			'name' => $params['name'],
			'role_des' => $params['role_des'],
			'add_time' => time(),
			'state' => 1,
		];
		//开启事务
		Db::startTrans();
		//插入返回主键
		
		$role_id=Db::name('role')->insertGetId($role_data);
		if(empty($role_id)){
			Db::rollback();
			return return_data('角色信息保存失败,请重试',-1);
		}
		//角色权限关联数据添加
		//如果没有后台首页权限则加入
		if(!isset($params['role_auth_ids']) || !in_array('1',$params['role_auth_ids']) )
		{
			$params['role_auth_ids'][]="1";
		}
		foreach ($params['role_auth_ids'] as $v) 
		{
			if(!empty($v))
			{
				$ra_data[]=[
					'role_id' => $role_id,
					'auth_id' => $v,
					'add_time' => time()
				];
			}	
		}
		$count=Db::name('role_auth')->insertAll($ra_data);
		if($count<count($ra_data))
		{
			//回滚
			Db::rollback();
			return return_data('角色权限保存失败,请重试',-1);
		}
		
		// 提交事务
        Db::commit();
		return return_data('新增角色成功',1);
	}
	/**
	 * 编辑角色
	 * 1、编辑角色信息
	 * 2、删除角色权限关联
	 * 3、重新插入角色关联权限
	 */
	public function roleEdit($params=[]){
		$role_data=[
			'id' => $params['role_id'],
			'name' => $params['name'],
			'role_des' => $params['role_des'],
			'update_time' => time(),
		];
		//开启事务
		Db::startTrans();
		//修改用户信息
		if(Db::name('role')->update($role_data)!==false)
		{
			$role_id=$params['role_id'];
		}
		if(empty($role_id)){
			Db::rollback();
			return return_data('角色信息保存失败,请重试',-1);
		}
		//角色关联权限先删除
		$res=Db::name('role_auth')->where('role_id',$role_id)->delete();
		if($res=== false)
		{
			Db::rollback();
			return return_data('角色权限信息删除失败,请重试',-1);
		}
		//角色权限关联权限重新添加
		//如果没有后台首页权限则加入
		if(!isset($params['role_auth_ids']) || !in_array('1',$params['role_auth_ids']) )
		{
			$params['role_auth_ids'][]="1";
		}
		foreach ($params['role_auth_ids'] as $v) 
		{
			if(!empty($v))
			{
				$ra_data[]=[
					'role_id' => $role_id,
					'auth_id' => $v,
					'add_time' => time()
				];
			}	
		}
		$count=Db::name('role_auth')->insertAll($ra_data);
		if($count<count($ra_data))
		{
			//回滚
			Db::rollback();
			return return_data('角色权限保存失败,请重试',-1);
		}	
		// 提交事务
    	Db::commit();
    	//清除所有缓存
        \think\facade\Cache::clear();
		return return_data('角色修改成功',1);
	}

	/**
	 * 删除角色
	 * 删除对应权限
	 */
	public function roleDel($id){
		//开启事务
		Db::startTrans();
		if($this->destroy($id)===false)
		{
			Db::rollback();
			return return_data('角色删除失败,请重试',-1);
		}
		//删除关联的权限
		$res=Db::name('role_auth')->where('role_id',$id)->delete();
		if($res=== false)
		{
			Db::rollback();
			return return_data('角色权限信息删除失败,请重试',-1);
		}
		// 提交事务
    	Db::commit();
        //清除所有缓存
        \think\facade\Cache::clear();
		return return_data('角色删除成功',1);
	}


/***************************************************/


	/**
	 * 根据角色id获取角色信息和对应权限
	 * @return [array] [角色信息，增加auth_ids是权限数组]
	 */
	public function getRoleAuth($role_id){
		$role_info="";
		//单个角色
		if(is_numeric($role_id))
		{
			$role_info=$this->find($role_id);
			$role_auth=Db::name('role_auth')->field('auth_id')->where('role_id',$role_id)->select();
			$role_info['auth_ids']=$role_auth=i_array_column($role_auth,'auth_id');
		}
		return $role_info;
	}
	/**
	 * 后台用户
	 * 单个角色获得权限数组
	 * 多个角色id => 1,2,3,4获得权限并且合并相同
	 * 缓存存在则直接返回缓存数据
	 * @return [array]           [权限isd数组]
	 */
	public static function getAdminAuth(){
		//先更新下session下面的admin信息避免修改管理员角色然后清空缓存后走进来读的旧角色
		$old_admin=session('admin');
		$admin=Db::table(config("database.prefix").'admin')->find($old_admin['id']);
		session('admin',$admin);
		$role_ids=$admin['role_ids'];
		//单个角色
		if(is_numeric($role_ids))
		{
			$auth_array=Db::name('role_auth')->field('auth_id')->where('role_id',$role_ids)->select();
			$ids=i_array_column($auth_array,'auth_id');
			$role_info=implode(',', $ids);
		}
		//多个角色合并相同权限
		if(strpos($role_ids, ','))
		{
			$auth_array=Db::name('role_auth')->field('auth_id')->where('role_id','in',$role_ids)->select();
			$ids=i_array_column($auth_array,'auth_id');
	         //去掉重复的
	        $role_auth_ids=array_unique($ids);
	         //再转成权限ids数组
	        $role_info=implode(',', $role_auth_ids);
		}
		return $role_info;
	}


	/**前台用户
	 * 单个角色获得权限数组
	 * 多个角色id => 1,2,3,4获得权限并且合并相同
	 * 缓存存在则直接返回缓存数据
	 * @return [array]           [权限isd数组]
	 */
	public static function getUserAuth(){
		//先更新下session下面的ueer表信息避免修改管理员角色然后清空缓存后走进来读的旧角色
		$old_admin=session('user');
		$user=Db::table(config("database.prefix").'user')->find($old_admin['id']);
		session('user',$user);
		$role_ids=$user['role_ids'];
		//单个角色
		if(is_numeric($role_ids))
		{
			$auth_array=Db::name('role_auth')->field('auth_id')->where('role_id',$role_ids)->select();
			$ids=i_array_column($auth_array,'auth_id');
			$role_info=implode(',', $ids);
		}
		//多个角色合并相同权限
		if(strpos($role_ids, ','))
		{
			$auth_array=Db::name('role_auth')->field('auth_id')->where('role_id','in',$role_ids)->select();
			$ids=i_array_column($auth_array,'auth_id');
	         //去掉重复的
	        $role_auth_ids=array_unique($ids);
	         //再转成权限ids数组
	        $role_info=implode(',', $role_auth_ids);
		}
		return $role_info;
	}



	/**
	 * 角色列表
	 */
	public function getRoleList(){
		$get = request()->get();
		$count = $this->count();
		$list = $this->select();
		$data = layui_data($list,$count);
		return $data;
	}

	/**
	 * 返回所有角色id、角色名
	 * @return [type] [description]
	 */
	public static function getRoleName(){
		$res=Db::name('role')->field('id,name')->select();
		return $res;
	}




}
