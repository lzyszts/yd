<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Img;
use app\server\Access;
/**
 * 文章表模型
 */

class ArticleModel extends Model
{

	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'article';
   	}
	protected $insert = ['add_time'];
	protected $update = ['update_time'];

	//自动插入
	protected function setAddTimeAttr($v){
		return time();
	}
	protected function setUpdateTimeAttr($v){
		return time();
	}


/***************************************************/
	/**
	 * 文章插入
	 * 1、找出head_img的id
	 * 2、根据content的图片的src找出id
	 * @param  array  $params  [提交的参数]
	 * @param  [type] $content [未格式化的内容用来找图片id]
	 */
	public function articleAdd($params=[],$content){
		//找出文章中的图片的ids
		$ids=$this->imgOperation($content);
		$params['content']=$content;
		$params['content_imgs_ids']=implode(",", $ids);
		//加入缩略图id
		if(!empty($params['head_img_id']))
		{
			$ids[]=$params['head_img_id'];
		}
		//删除临时图和临时信息
		Img::imgInfoOperation(implode(",", $ids));
		$params['update_time']=time();
		//插入文章
		$res=$this->allowField(true)->save($params);
		if($res){
			//统计数据+1
			Access::atricle_add();
			return return_data('文章插入成功',1);
		}else{
			return return_data('文章插入失败',-1);
		}
	}
	/**
	 * 文章编辑
	 * 1、先把之前的文章所有图片(包括缩略图)state标记为0
	 * 2、重新标记有效图
	 * 
	 * @param  array  $params  [提交的参数]
	 * @param  [type] $content [未格式化的内容用来找图片id]
	 * @return [type] [description]
	 */
	public function articleEdit($params=[],$content){
		//1、
		//之前所有ids 缩略图id+内容所有id
		$old_ids=$this->getArticleImgIds($params['id']);
		$old_ids=$old_ids['ids'];
		//之前图片状态都改为0
		Db::name('img_info')->where('id','in',$old_ids)->setField('state',0);
		//2、
		//找出文章中的图片的ids
		$ids=$this->imgOperation($content);
		$params['content']=$content;
		$params['content_imgs_ids']=implode(",", $ids);
		//加入缩略图id
		if(!empty($params['head_img_id']))
		{
			$ids[]=$params['head_img_id'];
		}else{
			$params['head_img_id']=0;
		}
		//删除临时图和临时信息
		Img::imgInfoOperation(implode(",", $ids));
		//修改文章
		$res=$this->allowField(true)->isUpdate(true)->save($params);
		if($res){
			return return_data('文章修改成功',1);
		}{
			return return_data('文章修改失败',-1);
		}
	}

	/**
	 * 文章删除
	 * 找到缩略图+内容图片ids同时删除
	 * @return [type] [description]
	 */
	public function articleDel($id){
		if(!is_numeric($id))
		{
			return return_data('文章id信息错误',-1);
			
		}
		//所有ids 缩略图id+内容所有id
		$article_info=$this->getArticleImgIds($id);
		//删除图片信息及文件
		Img::imgDelByIds($article_info['ids']);
		//删除文章信息
		$res=$this->where('id',$id)->delete();
		if($res)
		{
			//统计数据+1
			Access::atricle_del();
			return return_data('文章删除成功',1);
		}else{
			return return_data('文章删除失败',-1);
		}
	}

	
	/**
	 * 文章列表
	 */
	public function getArticleList(){
		$params=request()->param();
		$key=$params['key'];
		$category_id=$params['category_id'];
		$limit=$params['limit'];
		$where=[];
		if(!empty($key)){
			$where[]=['title','like',"%".$key."%"];
		}
		if(!empty($category_id))
		{
			$where[]=['category_id','eq',$category_id];
		}
		$count = $this->where($where)->count();
		$list = $this
				->alias('a')
				->field('a.id,a.title,a.title_color,a.describe,a.author,a.state,a.access_count,a.head_img_id,a.add_time,a.update_time,a.position,a.work_number,a.education,c.name category,CONCAT("'.UPLOAD_URL.'",b.src) src')
				->leftJoin(config('database.prefix').'img_info b','a.head_img_id=b.id') 
				->leftJoin(config('database.prefix').'article_category c','a.category_id=c.id') 
				->where($where)
				->order('a.id desc')
				->paginate($limit)
				->toArray();
		$data = layui_data($list['data'],$count);
		return $data;
	}

	/**
	 * 根据id获取文章内容
	 * @return [type] [description]
	 */
	public function getArticle($params=[]){
		$id=$params['id'];
		if(!is_numeric($id))
		{
			return return_data('文章id必须为正整数',-1);
		}
		$article_info=$this
		->alias('a')
		->field('a.*,b.real_name,c.name category_name,CONCAT("'.UPLOAD_URL.'",b.src) head_img_src')
		->leftJoin(config('database.prefix').'img_info b','a.head_img_id=b.id')
		->leftJoin(config('database.prefix').'article_category c','a.category_id=c.id')
		->where('a.id',$id)
		->find();
		return $article_info;
	}



	/**
	 * 文章状态切换
	*/
	public function articleSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(is_numeric($params['id']))
		{
			$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
			if($res)
			{
				return return_data('文章状态切换成功',1);
			}else{
				return return_data('文章状态切换失败',-1);
			}
		}else{
			return return_data('文章id信息错误',-1);
		}
	}


	/*************************************/
	/**
	 * UEeditor
	 * 插入新文章之前处理上传图片
	 * 正则匹配img和图片名
	 * @return [array] 图片ids
	 */
	private function imgOperation($content){
		$pattern='/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.jpeg|\.png]))[\'|\""].*?[\/]>/i';
	    preg_match_all($pattern, $content, $res);
	    $num=count($res[1]);
	    //保存图片ids
	    $img_names=[];
	    for($i=0;$i<$num;$i++){
	        $img_info=$res[1][$i];
	        $tmp_arr=explode('/',$img_info);
	        //图片名
	        $img_names[]=end($tmp_arr);
	    }
	    $img_names=implode(",", $img_names);
	    $ids=Db::name('img_info')->field('id')->where('img_name','in',$img_names)->select();
	    $ids=i_array_column($ids,'id');
	    return $ids;
	}




	/**
	 * 根据id获取文章所有的图片id,
	 * @return [array] [文章信息和所有图片ids]
	 */
	private function getArticleImgIds($article_id){
		$article_info=$this->find($article_id);
		//之前所有ids 缩略图id+内容所有id
		if(!empty($article_info['content_imgs_ids']))
		{
			$ids=$article_info['head_img_id'].','.$article_info['content_imgs_ids'];
		}else{
			$ids=$article_info['head_img_id'];
		}
		$data['article_info']=$article_info;
		$data['ids']=$ids;
		return $data;
	}

}

