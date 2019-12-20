<?php
namespace app\admin\controller;
use app\admin\validate\UserValidate;
use app\admin\model\UserModel;
use app\admin\model\RoleModel;
use think\Db;
/**
 * 前台用户表控制器
 */

class User extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = ['index'=>['getUserList']];
    public function initialize(){
        parent::initialize();
        $this->userModel=new UserModel;
    }
	/**
	 * 用户列表页
	 */
    public function index()
    {
    	$this->assign([
    		'title' => '用户管理',
    	]);
        return $this->fetch();
    }

    /**
     * Ajax
     * 获取前台用户列表数据
     * @Author   lzy
     * @DateTime 2019-08-21
     * @return   [type]     [description]
     */
   	public function getUserList(){
   		$layui_data=$this->userModel->getUList();
   		echo $layui_data;
   	}



    /**
     * 用户编辑/展示   
     */
    public function userEdit(){
        // 参数过滤空
        $params = $this->request->param('','','trim');
        if(request()->isAjax() && request()->isPost())
        {
            //表单验证    
            $validate=new UserValidate();
            if($validate->scene('userEdit')->check($params))
            {   
                $res=$this->userModel->userEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{         
            $user_info = $this->userModel->getUserInfo($params['id']);
            $role_info=RoleModel::getRoleName();
            $this->assign([
                'title' => '用户编辑',
                'user_info' => $user_info,
                'role_info' => $role_info,
            ]);
            return $this->fetch();
        }
    }


    /**
     * 用户启用禁用
     */
    public function userSwitch(){
        $params=$this->request->post();
        $res=$this->userModel->userSwitch($params);
        echo $res;
    }

    


}
