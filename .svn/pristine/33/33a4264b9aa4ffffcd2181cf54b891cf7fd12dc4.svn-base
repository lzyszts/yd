<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 角色验证类
 */

class RoleValidate extends Validate
{
	protected $rule = [
		'role_id' => 'number',
		'name' => 'require',
		'role_auth_ids'=>'checkIds',

	];
	protected $message  = [
		'role_id.number' => '角色id字段错误',
		'name.require' => '角色名不能为空',
		'role_auth_ids.checkIds' => '权限ids错误',
	];


	/**
	 * 权限ids必须为数字数组
	 */
	protected function checkIds($data){
		if(!empty($data))
		{
			foreach ($data as $v) 
			{
				if(!is_numeric($v))
				{
					return false;
				}
			}
		}
		return true;	
	}

}
