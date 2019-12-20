<?php
namespace app\admin\controller;
use app\admin\model\AuthModel;
use app\admin\model\RoleModel;
use app\admin\validate\RoleValidate;
/**
 * 角色控制器
 */

class Role extends Base
{
    //不需要登录的方法
    protected $no_login = [];
    //登录后不需要权限的方法
    protected $no_auth =['index'=>['roleList']];
	/**
	 * 角色列表页
	 * @return [type] [description]
	 */
    public function index()
    {
    	$this->assign([
    		'title' => '角色管理',
    	]);
        return $this->fetch();
    }

    /**Ajax
     * 角色信息数据
     */
    public function roleList(){
    	$role_model=new RoleModel();
   		$layui_data=$role_model->getRoleList();
   		echo $layui_data;
    }

    /**
     * 新增角色添加
     */
    public function roleAdd(){
        if(request()->isAjax() && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new RoleValidate();
            if($validate->check($params))
            {   
                //模型插入
                $role_model=new RoleModel();    
                $res=$role_model->roleAdd($params);
                echo $res;
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $auth_model=new AuthModel;
            $back=$auth_model->getAuthList();
            $home=$auth_model->getAuthList(1);
            $this->assign([
                'title' => '角色添加',
                'back' =>$back,
                'home' =>$home
            ]);
            return $this->fetch();
        }
    } 
    /**
     * 角色编辑
     */
    public function roleEdit(){
        $role_model=new RoleModel();  
        $auth_model=new AuthModel();
        if(request()->isAjax() && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new RoleValidate();
            if($validate->check($params))
            {   
                //模型编辑
                $res=$role_model->roleEdit($params);
                echo $res;
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params=$this->request->param();
            $back=$auth_model->getAuthList();
            $home=$auth_model->getAuthList(1);
            $role_info=$role_model->getRoleAuth($params['id']);
            $this->assign([
                'title' => '角色编辑',
                'back' =>$back,
                'home' =>$home,
                'role_info' =>$role_info
            ]);
            return $this->fetch();
        }
    }

    /**
     * 角色删除
     */
    public function roleDel(){
        $id=$this->request->param('id');
        if($id=="1" || $id=="2")
        {
            echo return_data('系统默认角色无法删除',-1);
            die;
        }
        $model_role=new RoleModel;
        $res=$model_role->roleDel($id);
        echo $res;
    }


}
