<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 文章验证类
 */

class ArticleValidate extends Validate
{
	protected $rule = [
		'title' => 'require|length:1,60',	
		'author' => 'require|length:1,60',
		'category_id' => 'require|number',
		'title_color' => 'requireWith:title_color|length:7',
		'sort' => 'require|length:1,11',
		'positon' => 'length:1,100',
		'work_number' => 'number|between:0,255',
		'education' => 'length:1,16',
	];
	protected $message  = [
		'title.require' =>'文章标题不能为空',
		'title.length' =>'文章标题长度错误',
		'author.require' =>'作者不能为空',
		'author.length' =>'作者长度错误',
		'category_id.require' =>'必须选择分类',
		'category_id.number' =>'分类id字段错误',
		'title_color.length' =>'颜色字段错误',
		'sort.require' =>'排序不能为空',
		'sort.length' =>'排序长度不能超过11位',
		'id.require' =>'传入id不能为空',
		'positon.length' =>'工作地点长度错误',
		'work_number.number' =>'招聘人数必须为数字',
		'work_number.between' =>'招聘人数为0-255',
		'education.length' =>'学历字段长度错误',
	];

	//定义验证场景 :编辑时验证的
	public function sceneEdit(){
		return $this->append('id','require|number');
	}





}
