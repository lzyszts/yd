<?php
namespace app\home\validate;
use think\Validate;
/**
 *	前台提交数据验证类
 */

class InfoValidate extends Validate
{
	protected $rule = [
		"name" => "require",
		"wx" => "require",
		"sheng" => "require",
		"city" => "require",
		"mobile" => "require",
	];
	protected $message  = [
		'name.require' => '联系人姓名不能为空',
		'wx.require' => '联系人微信不能为空',
		'sheng.require' => '联系人省份不能为空',
		'city.require' => '联系人城市不能为空',
		'mobile.require' => '联系人电话不能为空',
	];

	//加入我们提交信息时验证的
	public function sceneAdd(){
		return $this->only(['name','wx','sheng','city','mobile']);
	}



}
