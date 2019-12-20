<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 文件验证类
 */
class FileValidate extends Validate
{
	protected $rule = [
		'id' =>'require|integer',
		'download_name' =>'require',
		'type' =>'length:1,32',
		'logo_id' =>'integer',
		'file_id' =>'integer',
		'sort' =>'integer',
		'is_new' =>'in:0,1',
		'describe' =>'length:0,60',
	];
	protected $message  = [
		'sort.require'=>'排序不能为空',
		'sort.integer'=>'排序必须为整数',
		'is_new.in'=>'新页面字段数据异常',
		'describe.length'=>'描述信息必须60长度以内',
		'id.require' =>'链接id不能为空',
		'id.integer' =>'链接id类型异常',
		'download_name.require'=>'名称为空',
		'logo_id.integer'=>'logo的id异常',
		'file_id.integer'=>'上传文件id异常',
	];
	//下载信息添加
	public function sceneDownload(){
		return $this->only(['download_name','type','logo_id','file_id','sort','describe']);
	}	
	//下载信息编辑
	public function sceneDownloadEdit(){
		return $this->only(['id','download_name','type','logo_id','file_id','sort','describe']);
	}


}
