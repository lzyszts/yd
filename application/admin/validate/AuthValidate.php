<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 权限表单验证类
 */

class AuthValidate extends Validate
{
	protected $rule = [
		'pid' => 'require|number',
		'name' => 'require|length:2,30',
		'control' => 'require|length:2,30|alpha',
		'module' => 'require|length:2,30|alpha',
		'action' => 'require|length:2,30|alpha',
		'is_show' => 'in:0,1',
		'is_new' => 'in:0,1',
		'sort' => 'integer|require',
		'type' =>'in:0,1|require'
	];
	protected $message  = [
		'pid.require' =>'所属分类不能为空',
		'control.require' =>'控制器不能为空',
		'control.length' =>'控制器长度只能为2-30字符',
		'control.alpha' =>'控制器名称只能为字母',
		'name.require' =>'权限名不能为空',
		'name.length' =>'权限名长度只能为2-30字符',
		'module.require' =>'模块不能为空',
		'module.length' =>'模块长度只能为2-30字符',
		'module.alpha' =>'模块名称只能为字母',
		'action.require' =>'方法不能为空',
		'action.length' =>'方法长度只能为2-30字符',
		'action.alpha' =>'方法名称只能为字母',
		'sort.integer' =>'排序必须为整数',
		'sort.require' =>'排序不能为空',
		'is_new.in' =>'新页面字段异常',
		'is_show.in' =>'是否显示字段异常',
		'id.require' => 'id字段不能为空',
		'id.integer' => 'id字段错误',
		'type.in' =>'权限类别字段错误',
		'type.require' =>'权限类别不能为空',
	];


	//定义验证场景 :编辑时验证的
	public function sceneEdit(){
		return $this->only(['name','module','action','is_show','is_new','sort'])
		->append('id','require|integer');
	}

	//栏目添加时候验证
	public function sceneColumnAdd(){
		return $this->only(['name','pid','control','action','sort','state','is_new'])
		->append('state','in:0,1');
	}	
	//栏目编辑时候验证
	public function sceneColumnEdit(){
		return $this->only(['id','name','control','action','sort','state','is_new'])
		->append('id','require|integer')
		->append('state','in:0,1');
	}




}
