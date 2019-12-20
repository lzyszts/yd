<?php
namespace app\server;
use think\Db;
/**
 * 缓存处理类
 */

class Cache
{	

	/**
	 * 清空指定缓存
	 * @param  [type] $arr [缓存名数组]
	 * @return [type]      [description]
	 */
	public static function clearCache($arr){
		foreach ($arr as $v) {
			cache($v,null);
		}
	}


	/**
     * 系统配置信息初始化缓存
     * @param    [int] $state [是否更新缓存数据,0否,1是]
     * return config表的缓存
     */
    public static function configInit($state = 0)
    {
        $data = cache(config('cache.config'));
        if($state == 1 || empty($data))
        {
            // 所有配置
            $data = Db::name('config')->column('value', 'only_tag');
            cache(config('cache.config'), $data);
        }
        return $data;
    }

    /**
     * 設置系統配置的cookie
     * @param    [int] $state [是否更新缓存数据,0否,1是]
     */
    public static function configCookie($state = 0){
        $config=self::configInit();
        if(!cookie('config') || $state == 1)
        {
            $data=[
                'imgType'=>$config['imgType'],
                'uploadImgSize'=>$config['uploadImgSize'],
                'fileType'=>$config['fileType'],
                'uploadFileSize'=>$config['uploadFileSize'],
                'videoType'=>$config['videoType'],
                'uploadVideoSize'=>$config['uploadVideoSize'],
            ];
            cookie('config',json_encode($data));
        }
    }

    /**
     * 链接信息缓存
     * @Author   lzy
     * @DateTime 2019-09-05
     * @param    [int] $state [是否更新缓存数据,0否,1是]
     * @return   [type]     [description]
     */
    public static function linksInit($state = 0){
        $data = cache(config('cache.links'));
        if($state == 1 || empty($data))
        {
            // 所有链接信息
            $data=Db::name('link')
            ->alias('a')
            ->field('a.*,CONCAT("'.UPLOAD_URL.'",b.src) img_url')
            ->leftJoin(config('database.prefix').'img_info b','a.thumb_id=b.id')
            ->order('a.sort')
            ->select();
            cache(config('cache.links'), $data);
        }
        return $data;
    }
    /**
     * 栏目信息缓存
     * @Author   lzy
     * @DateTime 2019-09-05
     * @param    [int] $state [是否更新缓存数据,0否,1是]
     * @return   [type]     [description]
     */
    public static function columnInit($state = 0){
        $data = cache(config('cache.column'));
        if($state == 1 || empty($data))
        {
            // 栏目树信息
           $data = Db::name('column')
           ->order('sort')
           ->select();
           $data = \app\server\Tree::get_tree($data);
        }
        return $data;
    }


}
