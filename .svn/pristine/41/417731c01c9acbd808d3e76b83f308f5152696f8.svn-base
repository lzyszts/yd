<?php
namespace app\admin\model;
use think\Model;
use think\Db;
use app\server\Tree;
/**
 * 栏目表模型
 */

class ColumnModel extends Model
{
    //初始化表名
    protected function initialize(){
        $this->table = config("database.prefix").'column';
    }
	/**
	 *栏目列表信息
	 */
	public function getColumnList($type="default"){
        $count=$this->count();
        $data=$this->order('sort')->select();
        $list=Tree::get_tree($data);
        switch ($type) {
            case 'default':
                //返回layui格式需要数据
                echo layui_data($list,$count);
                break; 
            case 'eleTree':
                //返回layui插件eleTree格式需要数据
                $eleTree_data=Tree::eleTree_data($list);
                if(empty($eleTree_data))
                {
                    //没有数据则只要顶级分类
                    $eleTree_data=["0"=>['id'=>0,'label'=>'顶级分类']];
                }else{
                    array_unshift($eleTree_data,['id'=>0,'label'=>'顶级分类']);
                }
                $res=[
                    'code'=>0,
                    'data'=>$eleTree_data
                ];
                echo json_encode($res);
                break;
            default:
                break;
        }
	}

    /**
     * 栏目插入
     * @return [type] [description]
     */
    public function columnAdd($params=[]){
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
            //更新配置缓存信息
            \app\server\Cache::columnInit(1);
            return return_data('栏目插入成功',1);
        }{
            return return_data('栏目插入失败',-1);
        }
    }

    /**
     * 栏目修改
     * @return [type] [description]
     */
    public function columnEdit($params){
        $params['add_time']=time();
        $res=$this->isUpdate(true)->allowField(true)->save($params);
        if($res){
            //更新配置缓存信息
            \app\server\Cache::columnInit(1);
            return return_data('栏目修改成功',1);
        }{
            return return_data('栏目修改失败',-1);
        }
    }

    /**
     * 删除栏目及子分类
     * @param  [type] $id [需要删除的id]
     * @return [type]     [description]
     */
    public function columnDel($id){
        $data=$this->select();
        $child_ids=Tree::get_child($data,$id);
        $child_ids[]=(int)$id;
        $res=$this->destroy($child_ids);
        if($res>=0){
            //更新配置缓存信息
            \app\server\Cache::columnInit(1);
            return return_data('已删除'.$res."条栏目数据",1);
        }else{
            return return_data('栏目删除失败',-1);
        }
    }
    /**
     * 栏目状态切换
     */
    public function columnSwitch($params=[]){
        $params['state']=='true'?$state=1:$state=0;
        if(is_numeric($params['id']))
        {
            $res=$this->allowField(true)->isUpdate(true)->save(['state'=>$state],['id'=>$params['id']]);
            if($res)
            {
                //更新配置缓存信息
                \app\server\Cache::columnInit(1);
                return return_data('栏目状态切换成功',1);
            }else{
                return return_data('栏目状态切换失败',-1);
            }
        }else{
            return return_data('栏目id信息错误',-1);
        }
    }

    /**
     * 根据id获取栏目信息
     */
    public function getColumnInfo($id){
        if(is_numeric($id))
        {
            $column_info=$this->where('id',$id)->find(); 
            return $column_info;
        }
    }






}
