<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 区域管理单验证类
 */
class AreaValidate extends Validate
{
	protected $rule = [
		'name' => 'require|length:1,60|unique:area',
		'in' => 'require|money',
		'out' => 'require|money',
	];
	protected $message  = [
		'name.require' =>'区域名不能为空',
		'name.length' =>'区域名长度为1-60字符',
		'name.unique' =>'区域名已存在',
		'in.require' =>'入金金额不能为空',
		'in.money' =>'入金金额错误,最多保留2位小数',
		'out.require' =>'出金金额不能为空',
		'out.money' =>'出金金额错误,最多保留2位小数',
	];


	//定义验证场景 :编辑时验证的
	public function sceneEdit(){
		return $this->append('id','require|integer');
	}

	//验证金额最多2位小数
	protected function money($value,$rule,$data=[]){
		if(preg_match('/^\d+.?\d{1,2}$/', $value))
		{
			return true;
		}
		return false;
	}




}
