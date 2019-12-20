<?php
namespace app\admin\controller;
use app\admin\validate\UserValidate;
use app\admin\model\AdminModel;
use app\admin\model\RoleModel;
use think\Db;
/**
 * 管理员控制器
 */

class Admin extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = ['index'=>['getAdminList','main']];

	/**
	 * 管理员列表页
	 */
    public function index()
    {
    	$this->assign([
    		'title' => '管理员管理',
    	]);
        return $this->fetch();
    }

    /**
     * ajax
     * 管理员列表
     * @return [type] [description]
     */
   	public function getAdminList(){
   	   	$admin_model=new AdminModel();
   		$layui_data=$admin_model->getAdminList();
   		echo $layui_data;
   	}


    /**
     * 管理员添加/展示
     */
    public function adminAdd(){
    	if(request()->isAjax() && request()->isPost())
    	{
    		// 参数
			$params = $this->request->param();
			//表单验证    
			$validate=new UserValidate();
			if($validate->check($params))
			{	
				//模型插入
				$admin_model=new AdminModel();
				$res=$admin_model->adminAdd($params);
				echo $res;	
			}else{
				echo return_data($validate->getError(),-1);
			}
    	}else{
            $role_info=RoleModel::getRoleName();
    		$this->assign([
	    		'title' => '管理员添加',
                'role_info' => $role_info
	    	]);
	    	return $this->fetch();
    	}
    }



    /**
     * 管理员编辑/展示   
     */
    public function adminEdit(){
        $admin_model=new AdminModel();  
        // 参数过滤空
        $params = $this->request->param('','','trim');
        if(request()->isAjax() && request()->isPost())
        {
            //表单验证    
            $validate=new UserValidate();
            if($validate->scene('edit')->check($params))
            {   
                //模型编辑
                $res=$admin_model->adminEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{         
            $admin_info=$admin_model->getAdminInfo($params['id']);
            $role_info=RoleModel::getRoleName();
            $this->assign([
                'title' => '管理员编辑',
                'admin_info' => $admin_info,
                'role_info' => $role_info
            ]);
            return $this->fetch();
        }
    }


    /**
     * 管理员启用禁用
     */
    public function adminSwitch(){
        $params=$this->request->post();
        $admin_model=new AdminModel();  
        $res=$admin_model->adminSwitch($params);
        echo $res;
    }
    /**
     * 管理员软删除
     */
    public function adminDel(){
        $params=$this->request->post();
        if($params['id']=="1")
        {
            echo return_data('超级管理员无法删除',-1);
            die;
        }
        $admin_model=new AdminModel();  
        $res=$admin_model->adminDel($params['id']);
        echo $res;
    } 
    


}
