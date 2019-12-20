<?php
namespace app\admin\controller;
use app\admin\model\AuthModel;
use app\admin\validate\AuthValidate;
/**
 * 权限列表控制器
 */

class Auth extends Base
{
    protected $no_auth = ['authAdd'=>['authList']];
    private $authModel;

    public function initialize(){
        parent::initialize();
        $this->authModel=new AuthModel;
    }

    /**
	 * 权限列表页
	 * @return [type] [description]
	 */
    public function index()
    {
    	$back=$this->authModel->getAuthList();
        $home=$this->authModel->getAuthList(1);
    	$this->assign([
    		'title' => '权限管理',
    		'back' =>$back,
            'home' =>$home
    	]);
        return $this->fetch();
    }

    /**
     * 新增权限
     * 表单展示/新增
     * 增加了后台+前台权限
     * @Author   lzy
     * @DateTime 2019-08-19
     * @return   [type]     [description]
     */
    public function authAdd(){
    	if(request()->isAjax() && request()->isPost())
    	{
    		// 参数
			$params = $this->request->param();
			//表单验证    
			$validate=new AuthValidate();
			isset($params['is_show'])?"":$params['is_show']="0";
			isset($params['is_new'])?"":$params['is_new']="0";
			if($validate->check($params))
			{	
				//模型插入
				$res=$this->authModel->authAdd($params);
				echo $res;
			}else{
				echo return_data($validate->getError(),-1);
			}
    	}else{
            //后台权限树
	    	$back=$this->authModel->getAuthList();
            //前台权限树
            $home=$this->authModel->getAuthList(1);
            $back_data=\app\server\Tree::layuiTree_data($back);
            $home_data=\app\server\Tree::layuiTree_data($home);

	    	$this->assign([
		    	'title' => '权限添加',
		    	'back' =>json_encode($back_data),
                'home' =>json_encode($home_data),
	    	]);
	    	return $this->fetch();
    	}
    }


    /**
     * 修改权限 
     * 表单展示/修改
     */
    public function authEdit(){
    	if(request()->isAjax() && request()->isPost())
    	{
    		// 参数
			$params = $this->request->post();
			//表单验证    
			$validate=new AuthValidate();
			isset($params['is_show'])?"":$params['is_show']="0";
			isset($params['is_new'])?"":$params['is_new']="0";
			if($validate->scene('edit')->check($params))
			{	
				//模型修改
				$res=$this->authModel->authEdit($params);
				echo $res;	
			}else{
				echo return_data($validate->getError(),-1);
			}
    	}else{
            $params = $this->request->param('','','trim');   
            $auth_info = $this->authModel->getAuthInfo($params['id']);
	    	$this->assign([
		    	'title' => '权限编辑',
                'auth_info' => $auth_info
	    	]);
	    	return $this->fetch();
    	}
    }

    /**
     * 权限删除
     * 删除子分类
     */
    public function authDel(){
    	$id=$this->request->param('id');
		$res=$this->authModel->authDel($id);
		echo $res;
    }

    /**
     * zTree的数据
     * @Author   lzy
     * @DateTime 2019-08-15
     * 更换为layui的后已废弃
    public function authList(){
    	$list=$this->authModel->getAuthList();
   		echo \app\server\Tree::zTree_data($list);
    }
    */

}
