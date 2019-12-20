<?php
namespace app\admin\controller;
use app\admin\model\AdminModel;
use app\admin\model\RoleModel;
use app\admin\validate\UserValidate;
use app\server\Access;

/**
 * 后台首页控制器
 */

class Index extends Base
{

    //不需要登录的方法
    protected $no_login = ['login','loginOut'];
    //登录后不需要权限的方法
    protected $no_auth =['index'=>['getAdminNav','main']];

    public function index(){
        $admin=session('admin');
    	$this->assign([
    		'title' => '野嘀后台管理',
            'admin' => $admin,
    	]);
        return $this->fetch();
    }

    /**
     * ajax
     * 获取用户左边列表
     */

    public function getAdminNav(){
        $model_admin=new AdminModel;
        $model_role=new RoleModel;
        //读取用户角色下的权限ids(多个角色合并)
        $auth_ids=$model_role->getAdminAuth();
        //根据权限读取用户列表
        $data=$model_admin->getAdminNav($auth_ids);
        //转换为前端列表需要的格式
        $data=\app\server\Tree::left_nav_data($data);
        echo $data;
    }

    /**
     * 后台首页
     */
   public function main(){
        $admin=session('admin');
        $article_info=Access::article_count();  //文章数
        $download_info=Access::download_count();//下载量
        $echarts_data=Access::echarts_data();
        $echarts_data=implode(',',$echarts_data);//下载表格数据
        $this->assign([
            'title' => '首页',
            'username' => $admin['username'],
            'article_info' => $article_info,
            'download_info' => $download_info,
            'echarts_data' => $echarts_data,
        ]);
        return $this->fetch();
    }
    /**
     * 登录页面
     * ajax
     * rentrn json 错误信息
     */
    public function login(){
        if(request()->isAjax() && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            $data=base64_decode($params['data']);
            $params=json_decode($data,true);
            //帐号验证
            $validate=new UserValidate();
            if($validate->scene('login')->check($params))
            {  
                $model_admin=new AdminModel;
                //基本验证成功后再验证密码
                $res=$model_admin->checkUser($params);
                echo $res;
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '系统后台登录',
            ]);
            return $this->fetch();
        }
    }

    /**
     * 退出系统
     */
    public function loginOut(){
        //清空缓存
        //\think\facade\Cache::clear();
        $admin=session('admin');
        cache(config('cache.user_auth_mca').'_'.$admin['username'],null);
        cache(config('cache.user_left_nav').'_'.$admin['username'],null);
        session(null);
        $this->redirect(url('admin/index/login'));
    }

}
