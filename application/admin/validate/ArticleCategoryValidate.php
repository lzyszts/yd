<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 文章分类验证类
 */

class ArticleCategoryValidate extends Validate
{
	protected $rule = [
		'name' =>'require|length:1,32'
	];
	protected $message  = [
		'name.require' =>'分类名不能为空',
		'name.length' =>'分类名长度错误',
		'id.require'=>'分类id字段不能为空',
		'id.number'=>'分类id字段异常',
	];

	//编辑时验证的
	public function sceneEdit(){
		return $this->append('id','require|number');
	}





}
