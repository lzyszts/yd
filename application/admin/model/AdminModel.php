<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use crypt\Aes;
use app\server\Http;
use think\model\concern\SoftDelete;
/**
 * 管理员表模型
 */

class AdminModel extends Model
{

	use SoftDelete;
	//软删除标记字段
    protected $deleteTime = 'delete_time';
	//初始化表名
   	protected function initialize(){
   		$this->table = config("database.prefix").'admin';
   	}
	/**
	 * 管理员插入
	 */
	public function adminAdd($params=[]){
		//密码加密
		$salt=GetNumberCode();
		$params['login_pwd']=LoginPwdEncryption($params['login_pwd'],$salt);
		$params['login_salt']=$salt;
		$params['role_ids']=implode(",", $params['role_ids']);
		$res=$this->allowField(true)->save($params);
		if($res){
			return return_data('管理员插入成功',1);
		}{
			return return_data('管理员插入失败',-1);
		}
	}
	/**
	 * 管理员编辑
	 */
	public function adminEdit($params=[]){
		if($params['id']==1)
		{
			return return_data('超级管理员无法修改',-1);
		}
		if(!empty($params['new_pwd']))
		{
			$salt=GetNumberCode();
			$params['login_pwd']=LoginPwdEncryption($params['new_pwd'],$salt);
			$params['login_salt']=$salt;
		}
		$params['role_ids']=implode(",", $params['role_ids']);
		$params['update_time']=time();
		$res=$this->allowField(['login_pwd','login_salt','email','admin_des','role_ids','update_time'])->isUpdate(true)->save($params);
		if($res){
			//删除编辑的用户mca、左边导航缓存
			$info=$this->field('username')->find($params['id']);
			$username=$info['username'];
	    	cache(config('cache.user_auth_mca').'_'.$username,null);
	    	cache(config('cache.user_left_nav').'_'.$username,null);
			return return_data('管理员修改成功',1);
		}{
			return return_data('管理员修改失败',-1);
		}
	}



	/**
	 * 管理员页面列表
	 */
	public function getAdminList(){
		$params=request()->param();
		$key=$params['key'];
		$limit=$params['limit'];
		$where=[];
		if(!empty($key)){
			$where[]=['username','like',"%".$key."%"];
		}
		$count = $this->where($where)->count();
		$list = $this->field('id,username,email,admin_des,login_total,login_time,role_ids,add_time,state')
					 ->where($where)
					 ->order('id')
					 ->paginate($limit)
					 ->toArray();//返回数组格式			 
		//角色ids转中文
		$data=$this->ids_to_ch($list['data']);
		$data=layui_data($data,$count);
		return $data;
	}
	/**
	 * 管理员信息
	 * role_ids转换为数组
	 */
	public function getAdminInfo($id){
		if(!empty($id))
		{
			$admin_info=$this->where('id',$id)->find();	
			$admin_info['role_ids_array']=explode(',', $admin_info['role_ids']);
			return $admin_info;
		}
	}


	/**
	 * 管理员状态切换
	 */
	public function adminSwitch($params=[]){
		$params['state']=='true'?$state=1:$state=0;
		if(is_numeric($params['id']))
		{
			if($params['id']==1)
			{
				return return_data('超级管理员无法禁用',-1);
			}
			$res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
			if($res)
			{
				return return_data('管理员状态切换成功',1);
			}else{
				return return_data('管理员状态切换失败',-1);
			}
		}else{
			return return_data('管理员id信息错误',-1);
		}
	}
	/**
	 * 管理员删除
	 */
	public function adminDel($id){
		if(!is_numeric($id))
		{
			return return_data('管理员id信息错误',-1);
		}
		$res=$this->destroy($id);
		if($res)
		{
			//删除此用户mca、左边导航缓存
			$info=$this->field('username')->find($id);
			$username=$info['username'];
	    	cache(config('cache.user_auth_mca').'_'.$username,null);
	    	cache(config('cache.user_left_nav').'_'.$username,null);
			return return_data('管理员删除成功',1);
		}else{
			return return_data('管理员删除失败',-1);
		}
	}


	/**
	 * 后台登录密码验证
	 * admin后台密码验证
	 * 其他账号找交易服务器验证，然后信息保存到本地
	*/
	public function checkUser($params=[]){
		$username = $params['username'];
		$password = $params['login_pwd'];
		$en_pwd = Aes::encrypt($password,config('web.aeskey'));


		/*
		$data = [
			'name' => $username,
			'pass' => $password,
			'flag' => 1
		];
		//其他用户找交易服务器验证
		$res = Http::_request([
			'url' => "http://211.149.172.53:88/LoginForExtra",
			'method' => "post",
			'data' => http_build_query($data)
		]);
		// 返回的编码
		$encode = mb_detect_encoding($res, array("ASCII",'UTF-8',"GB2312","GBK",'BIG5'));
		$res = iconv($encoding, "utf-8",$res);
		$res = json_decode($res,true);

		if($res['Ret'] !== "Succ")
		{
			return return_data($res['Msg'], -1);
		}*/

		//验证成功后下一步操作
		// 获取管理员
        $admin = $this->where('username','=',$params['username'])->find();
        if(empty($admin))
        {
            return return_data('管理员不存在', -1);
        }
        // 密码校验
        $login_pwd = LoginPwdEncryption($params['login_pwd'], $admin['login_salt']);
        if($login_pwd != $admin['login_pwd'])
        {
            return return_data('密码错误', -1);
        }
        if($admin['state']==0)
        {
        	return return_data('管理员被禁用', -1);
        }
        // 校验成功
        // session存储
        session('admin', $admin);
		//清空缓存
//\think\facade\Cache::clear();
        //缓存配置信息
        \app\server\Cache::configInit();
		// 更新数据库、删除缓存
        if(session('admin') != null)
        {
            $login_salt = GetNumberCode(6);
            $data = [
                    'login_salt'    =>  $login_salt,
                    'login_pwd'     =>  LoginPwdEncryption($params['login_pwd'], $login_salt),
                    'login_total'   =>  $admin['login_total']+1,
                    'login_time'    =>  time(),
                ];
            if($this->where('id','=',$admin['id'])->update($data))
            {
                return return_data('登录成功',1,url('index'));
            }
        }
        // 失败
        session('admin', null);
        return return_data('登录失败，请稍后再试！', -1);
	}
	
	/**
	 * 登录后获取用户左侧导航数据
	 * @param  [array] $admin [session信息]
	 * @return [type]        [description]
	 */
	/**
	 * 登录后获取用户左侧导航数据
	 * 增加了type，判定只取后台权限
	 * @Author   lzy
	 * @DateTime 2019-08-16
	 * @param    [type]     $auth_ids [description]
	 * @return   [type]               [description]
	 */
	public function getAdminNav($auth_ids){
		$admin=session('admin');
		$data=cache(config('cache.user_left_nav').'_'.$admin['username']);
		if(!$data){	
			$data=[];
			//管理员显示所有菜单
			//type = 0 后台权限
			if(!empty($admin) && $admin['username']=='admin')
			{
				$data['authinfo_1']=Db::name('auth')->where('level','0')->where('is_show','1')->where('type',0)->order('sort')->select();
				$data['authinfo_2']=Db::name('auth')->where('level','1')->where('is_show','1')->where('type',0)->order('sort')->select();
			}else{
				if(!empty($auth_ids))
				{
					$data['authinfo_1']=Db::name('auth')->where('level','0')->where('id','in',$auth_ids)->where('is_show','1')->where('type',0)->order('sort')->select();
					$data['authinfo_2']=Db::name('auth')->where('level','1')->where('id','in',$auth_ids)->where('is_show','1')->where('type',0)->order('sort')->select();
				}
			}
			//加缓存
			cache(config('cache.user_left_nav').'_'.$admin['username'],$data,3600);
		}
		return $data;
	}







	/************************************************/


	/**
	* 根据权限ids求对应中文名
	*/
	public function ids_to_ch($data){
		$role_data=Db::name('role')->select();
		//1、把role表数据做成以id为下标的数组
		foreach ($role_data as $key=>$value){
		 	$role_data2[$value['id']]=$value;
		}
		//2、把用户的role_id分别转换成中文
		foreach ($data as $k=>$v){
			 $role_ids=$v['role_ids'];
			 $arr_ids=explode(',', $role_ids); //用户权限ids分成数组
			 foreach ($arr_ids as $v2){      //v2是用户每一个role_ids
			     $arr_str[]=$role_data2[$v2]['name'];
			 }
			 $str=implode('，', $arr_str);
			 $data[$k]['role_name']=$str;
			 unset($arr_str);
		}
		return $data;
	}



}
