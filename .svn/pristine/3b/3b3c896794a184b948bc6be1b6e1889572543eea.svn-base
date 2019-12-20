<?php
namespace app\home\controller;
use think\Controller;
use think\Db;
use app\server\Cache;

/**
 * 前台基类控制器
 */

class Base extends Controller
{

    //初始化
    public function  initialize(){
    	//所有页面公共信息
      	$this->getPublic();

    }
    /**
     * 获取公共底部链接信息
     * @Author   lzy
     * @DateTime 2019-09-04
     * @return   [type]     [description]
     */
    private function getPublic(){
    	// 微博微信
    	$links = Cache::linksInit();
    	// 配置信息(公司信息)
		$config = Cache::configInit();
		// 栏目信息
		$cloumn = Cache::columnInit();

    	$this->assign([
    		'footer' => $links,
    		'config' => $config,
    		'cloumn' => $cloumn,
    	]);
    	// 栏目信息
    	
    }

}
