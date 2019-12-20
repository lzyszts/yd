<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 管理员、用户验证类
 */

class UserValidate extends Validate
{
	protected $rule = [
		'username' => 'require|regex:^[a-zA-Z0-9_-]{4,10}$|unique:admin',
		'login_pwd' => 'require|length:6,25',
		'role_ids' => 'require',
		'new_pwd' => 'length:6,25',
		'id' => 'number',
		'area_id' => 'number'
	];
	protected $message  = [
		'username.require' =>'用户名不能为空',
		'username.unique' =>'用户名已存在',
		'username.regex' =>'用户名用户名必须是4-10位大写、小写、下划线组合组成!',
		'username.checkUserUnique' =>'用户名已存在!',
		'login_pwd.length' =>'密码必须为6-25位之间',
		'role_ids.require' => '角色必须选择',
		'new_pwd.length' => '新密码必须为6-25位之间',
		'id.number' => '管理员id错误',
		'area_id.number' => '区域id错误'
	];

	//定义验证场景 :登录验证的
	public function sceneLogin(){
		//登录去掉唯一验证
		return $this->only(['username','login_pwd'])
		->remove('username', 'unique');
	}
	//编辑验证的
	public function sceneEdit(){
		return $this->only(['role_ids','new_pwd','id']);
	}
	//前台用户编辑验证的
	public function sceneUserEdit(){
		return $this->only(['role_ids','id','area_id']);
	}

}
