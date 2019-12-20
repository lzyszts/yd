<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Tree;
//use think\model\concern\SoftDelete;
/**
 * 角色表模型
 */

class ArticleCategoryModel extends Model
{


	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'article_category';
   	}
	protected $insert = ['add_time'];
	protected $update = ['update_time'];

	//use SoftDelete;
	//软删除标记字段
    //protected $deleteTime = 'delete_time';
	//自动插入
	protected function setAddTimeAttr($v){
		return time();
	}
	protected function setUpdateTimeAttr($v){
		return time();
	}


/***************************************************/

	/**
	 * 分类添加	
	 */
	public function categoryAdd($params=[]){
		$res=$this->allowField(true)->save($params);
		if($res){
			return return_data('文章分类插入成功',1);
		}{
			return return_data('文章分类插入失败',-1);
		}
	}
	/**
	 * 分类修改
	 */
	public function categoryEdit($params=[]){
        $res=$this->isUpdate(true)->allowField(true)->save($params);
        if($res){
            return return_data('文章分类修改成功',1);
        }{
            return return_data('文章分类修改失败',-1);
        }
	}
	/**
	 * 分类删除
	 */
	public function categoryDel($id){
        if(!is_numeric($id))
        {
        	return return_data('文章分类id信息错误',-1);
        }
        $default_id=[1,2,3];
        if(in_array($id, $default_id))
        {
        	return return_data('系统默认分类无法删除',-1);
        }
    	//查询分类下是否存在文章
    	$res=Db::name('article')->where('category_id',$id)->find();
    	if($res)
    	{
    		return return_data('分类下存在文章,请先删除文章',-1);
    	}
    	//软删除
        $res=$this->destroy($id);
        if($res)
        {
            return return_data('文章分类删除成功',1);
        }else{
            return return_data('文章分类删除失败',-1);
        }
      
    }
	/**
	 * 分类列表
	 */
	public function getCategoryList(){
		$count = $this->count();
		$list = $this
				->alias('a')
				->field('a.*,b.name column_name')
				->leftJoin(config('database.prefix').'column b','a.column_id=b.id') 
				->order('a.sort')
				->select();
		$data = layui_data($list,$count);
		return $data;
	}

	/**
	 * 取栏目树列表
	 * @Author   lzy
	 * @DateTime 2019-09-11
	 * @return   [type]     [description]
	 */
	public function getColum(){
		$data=Db::name('column')->order('sort')->select();
		return Tree::get_tree($data);
	}



}
