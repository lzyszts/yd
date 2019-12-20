<?php
namespace app\home\model;
use think\Model;
use think\Db;

/**
 * 前台获取数据
 */

class DataModel extends Model
{


	/**
	 * 获取轮播图数据
	 * @Author   lzy
	 * @DateTime 2019-09-04
	 * @return   [type]     [description]
	 */
	public function getSlide(){
		$data = Db::name('slide')
			->alias('a')
			->field('a.*,CONCAT("'.UPLOAD_URL.'",b.src) url')
			->leftJoin(config('database.prefix').'img_info b','a.img_id=b.id')
			->order('a.type,a.sort')  //type组内排序
			->select();
		return $data;
	}

	/**
	 * 新闻列表数据
	 * @Author   lzy
	 * @DateTime 2019-09-05
	 * @return   [type]     [description]
	 */
	public function getNews($column_id){
		$params=request()->param();
		$limit = $params['limit']?$params['limit']:5;
		//$count = Db::name('article')->where('state',1)->count();
		$data = Db::name('article')
				->alias('a')
				->field('a.id,a.title,a.describe,a.add_time,CONCAT("'.UPLOAD_URL.'",b.src) url')
				->leftJoin(config('database.prefix').'img_info b','a.head_img_id=b.id') 
				->leftJoin(config('database.prefix').'article_category c','a.category_id=c.id') 
				->where("c.column_id",$column_id)
				->where('a.state',1)
				->order('a.id desc')
				->paginate($limit);
		return $data;
	}
	/**
	 * 新闻详情
	 * @Author   lzy
	 * @DateTime 2019-09-05
	 * @return   [type]     [description]
	 */
	public function getNewInfo($id){
		$data = Db::name('article')
				->field('id,title,add_time,content')
				->where('id',$id)
				->where('state',1)
				->order('id desc')
				->find();
		return $data;
	}



	/**
	 * 视频列表数据
	 * @Author   lzy
	 * @DateTime 2019-09-05
	 * @return   [type]     [description]
	 */
	public function getVideo($limit = 6){
		$data = Db::name('download')
				->alias('a')
				->field('a.id,a.download_name,a.add_time,concat("'.UPLOAD_URL.'",b.src) img_url,concat("'.DOWNLOAD_URL.'",c.src) file_url,c.real_name')
				->leftJoin(config('database.prefix').'img_info b','a.logo_id=b.id') 
				->leftJoin(config('database.prefix').'file_info c','a.file_id=c.id')
				->where('a.state',1)
				->where('a.type','video')
				->order('a.id desc')
				->paginate($limit);
		return $data;
	}

	/**
	 * 
	 */
	public function videoInfo(){
		$params=request()->param();
		$id = $params['id'];
		if(!is_numeric($id) || empty($id))
		{
			return home_data("视频信息异常",-1);
		}
		$data = Db::name('download')
				->alias('a')
				->field('a.id,a.download_name,a.add_time,concat("'.UPLOAD_URL.'",b.src) img_url,concat("'.DOWNLOAD_URL.'",c.src) file_url,c.real_name')
				->leftJoin(config('database.prefix').'img_info b','a.logo_id=b.id') 
				->leftJoin(config('database.prefix').'file_info c','a.file_id=c.id')
				->where('a.state',1)
				->where('a.type','video')
				->where('a.id',$id)
				->order('a.id desc')
				->find();
		return $data;		
	}

	/**
	 * 获取产品中心分类
	 * @Author   lzy
	 * @DateTime 2019-11-13
	 * @return   [type]     [description]
	 */
	public function getCpCategory($column_id){
		$res = Db::name('article_category')->where("column_id",$column_id)->select();
		return $res;
	}

	/**
	 * 获取产品文章列表
	 * @Author   lzy
	 * @DateTime 2019-11-13
	 * @return   [type]     [description]
	 */
	public function getCpList($category_id){
		$data = Db::name('article')
			->alias('a')
			->field('a.id,a.title,a.describe,a.add_time,CONCAT("'.UPLOAD_URL.'",b.src) url')
			->leftJoin(config('database.prefix').'img_info b','a.head_img_id=b.id') 
			->where('a.category_id',$category_id)
			->where('a.state',1)
			->order('a.id desc')
			->select();
		return $data;
	}



	/**************************/
	/**
	 * 获取当前栏目id
	 * @Author   lzy
	 * @DateTime 2019-11-13
	 * @return   [type]     [description]
	 */
	public function getColumnId(){
		$c = strtolower(request()->controller());
		$a = strtolower(request()->action());
		$res = Db::name('column')
			->where("control",$c)
			->where("action",$a)
			->find();
		return $res['id'];
	}




}
