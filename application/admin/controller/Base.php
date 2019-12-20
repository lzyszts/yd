<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;
use app\admin\model\RoleModel;
use app\admin\model\AuthModel;


class Base extends Controller
{
	//子类用来放不需要登陆的方法
    protected $no_login = [];
    //子类放登录后不需要权限认证的方法
    protected $no_auth = [];
    //当前m-c
    protected $mc;
    //登录后的session信息
    protected $admin;

    /**
     * 1、判断是否登录
     * 2、判断是否有权限
     */
	public function initialize(){
		$request=$this->request;
		$this->admin=session('admin');
		//当前m-c的小写
		$this->mc=strtolower($request->module().'-'.$request->controller());
		//不需要登录的方法加入当前m-c-前缀
		$no_login=$this->no_login;
		array_walk($no_login,array($this,'addPrefix'));
		//当前m-c-a小写
		$now_mca=$request->module().'-'.$request->controller().'-'.$request->action();
		$now_mca=strtolower($now_mca);
		//1、没有登录并且不用在不需要登录的mca中的
		if($this->admin==false && in_array($now_mca, $no_login)===false &&  $this->no_login[0]!='*')
		{
			$this->error('请先登陆!',url("admin/index/login"),2);
		}
		if($this->admin)
		{
			//2、登录后的页面判断次用户是否有权限
			//cache的名字后面加上"_用户名"
			$auth_mca=cache(config('cache.user_auth_mca').'_'.$this->admin['username']);
			if(!$auth_mca)
			{
				//当前用户权限ids
				$auth_ids=RoleModel::getAdminAuth();
				//当前用户权限mca数组
				$auth_mca=AuthModel::idsToMca($auth_ids);
				// 默认加入后台首页
				$auth_mca[] = "admin-index-index";
				cache(config('cache.user_auth_mca').'_'.$this->admin['username'],$auth_mca,3600);
			}
			//如果当前方法属于某个方法下不需要验证的方法的话
			//就把当前mca改为某个方法
			//$k是方法名
			//$v是这个方法下绑定的不需要验证的方法名
			//这方法有个弊端，如果多个方法下面都绑定这个不需要验证的方法的话，当前mca只会改成循环出的一个方法，所以需要用户对第一个方法有权限
			//2019.10.14  弊端已解决,组合一个数组允许权限的数组，然后对比用户与允许数组是否有相同元素
			if(!empty($this->no_auth))
			{
				foreach ($this->no_auth as $k => $v) {
					//数组全转小写
					$v = array_map('strtolower',$v);
					if(in_array($request->action(),$v))
					{
						/*$now_mca=$request->module().'-'.$request->controller().'-'.$k;
						$now_mca=strtolower($now_mca);
						break;*/
						$allow_mca[] = $this->mc.'-'.$k;
					}
				}
			}
			//1、当前操作没有在不需要登录的mca中
			//2、当前操作  没有出现在 默认允许的 权限列表 里边 
			//3、当前用户 还不是超级管理员admin
	        //4、允许权限列表与用户权限列表没有相同值的时候
	        //以上1234条件同时满足，就“无访问权限”

			if(in_array($now_mca, $no_login)===false && $this->admin['username']!=='admin' && in_array($now_mca,$auth_mca)===false && !array_intersect($user_mca,$allow_mca))
			{
				// 判断是否AJAX或者表单上传
				$header = request()->header();
				if(request()->isAjax() || strpos($header['content-type'],'multipart/form-data')!==false)
				{
					echo return_data('无权限操作',-1);die;
				}
				else{
					echo '无权限访问';die;
				}
			}

			//3、都没问题则设置系统配置的cookie
			$config=\app\server\Cache::configCookie();
		}
	}

	/**
	 * 数组每个元素加入一个前缀
	 */
	public function addPrefix(&$v){
		//加上当前m-c-
		//转换为小写
		$v=strtolower($this->mc.'-'.$v);
	}




   	
}
