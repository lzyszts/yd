<?php
namespace app\admin\controller;
use app\admin\model\LogModel;
use think\Db;
/**
 * 日志控制器
 */

class Log extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = ['index'=>['getLogList']];


	/**
	 * 日志列表页
	 */
    public function index()
    {
    	$this->assign([
    		'title' => '日志管理',
    	]);
        return $this->fetch();
    }

    /**
     * ajax
     * 日志列表信息
     * @return [type] [description]
     */
   	public function getLogList(){
   		$log_model=new LogModel;
   		$layui_data=$log_model->getLogList();
   		echo $layui_data;
   	}


    /**
     * 日志删除
     */
    public function logDel(){
        $params=$this->request->post();
        $log_model=new LogModel;  
        $res=$log_model->logDel($params);
        echo $res;
    } 



}
