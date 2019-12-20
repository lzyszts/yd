<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Tree;
/**
 * 权限表模型
 */

class AuthModel extends Model
{

	//初始化表名
    protected function initialize(){
        $this->table = config("database.prefix").'auth';
    }

	/**
	 * 权限列表信息
	 */
	public function getAuthList($type="0"){
		$data=$this->where("type","=",$type)->order('sort')->select();
        switch ($type) {
            case '0':
                $list = Tree::get_tree($data);
                break;  
            case '1':
                 $list= Tree::get_tree($data,0,true);
                break;
            default:
                # code...
                break;
        }
		return $list;
	}




    /**
     * 权限插入
     * @return [type] [description]
     */
    public function authAdd($params=[]){
        $params['add_time']=time();
        //计算层级
        if($params['pid']==0)
        {
            $params['level']=0;
        }else{
            $parent=$this->find($params['pid']);
            $params['level']=$parent['level']+1;
        }
        $res=$this->allowField(true)->save($params);
        if($res){
            return return_data('权限插入成功',1);
        }{
            return return_data('权限插入失败',-1);
        }
    }
    /**
     * 权限修改
     * @return [type] [description]
     */
    public function authEdit($params=[]){
        if($params['id']==1)
        {
            return return_data('后台首页不能编辑',-1);
        }
        $params['add_time']=time();
        $res=$this->isUpdate(true)->allowField(true)->save($params);
        if($res){
            //清除所有缓存
            \think\facade\Cache::clear();
            return return_data('权限修改成功',1);
        }{
            return return_data('权限修改失败',-1);
        }
    }

    /**
     * 删除权限及子分类
     * @param  [type] $id [需要删除的id]
     * @return [type]     [description]
     */
    public function authDel($id){
        $data=$this->select();
        $child_ids=Tree::get_child($data,$id);
        $child_ids[]=(int)$id;
        $res=$this->destroy($child_ids);
        if($res>=0){
            //清除所有缓存
            \think\facade\Cache::clear();
            return return_data('已删除'.$res."条权限数据",1);
        }else{
            return return_data('权限删除失败',-1);
        }
    }
    /**
     * 根据id获取权限信息
     */
    public function getAuthInfo($id){
        if(is_numeric($id))
        {
            $auth_info=$this->where('id',$id)->find(); 
            return $auth_info;
        }
    }
/*************************************************************/



    /**
     * 权限ids字符串转换为m-c-a数组
     * @param  [string] $auth_ids [权限ids字符串]
     * @return [type]           [description]
     */
    public static function idsToMca($auth_ids){
        if(empty($auth_ids))
        {
           $auth_mca=[];
        }else{
            $auth_info=Db::name('auth')->where('id','in',$auth_ids)->select();
            foreach ($auth_info as $v) {
                $auth_mca[]=strtolower($v['module'].'-'.$v['control'].'-'.$v['action']);
            }
        } 
        return $auth_mca;
    }





}
