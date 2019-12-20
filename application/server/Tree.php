<?php
namespace app\server;
use think\Db;
/**
 * 树列表数据处理类
 */
class Tree
{	

    /** 递归分类  
     * @param array $data 权限列表数组
     * @param number $pid
     */
    public static function get_tree($data,$pid=0,$clear=false){
        static $res=array(); 
        if($clear)
        {
            $res=array();
        }
        foreach ($data as $v)
        {
            if($v['pid']==$pid)
            {
                $res[]=$v;
                // 找子分类
                self::get_tree($data,$v['id']);
            }
        }
        return $res;
    }
    /** 递归分类2 children加入自己的格式
     * @param array $data 权限列表数组
     * @param number $pid
     */
    public static function get_tree_children($data,$pid=0){
        foreach ($data as $k=>$v)
        {
            if($v['pid']==$pid)
            {
                $v['children'] = self::get_tree_children($data,$v['id']);
                if(!$v['children'])
                {
                    unset($v['children']);
                }
                $res[]=$v;       
            }
        }
        return $res;
    }




    /**
     * 根据id求出所有子id
     * @param array $data 权限列表数组
     * @param string $id 需要查找的权限id
     */
    public static function get_child($data,$id,$clear=false){
        static $res=array();
        if($clear)
        {
            $res=array();
        }
        foreach ($data as $v)
        {
            if($v['pid']==$id)
            {
                $res[]=$v['id'];
                self::get_child($data,$v['id']);
            }
        }
        return $res;
    }


    /**
     * zTree返回数据生成
     * @param      array   $data   树信息数组
     * @param      string  $id     对应数据库id字段的名
     * @param      string  $pid    对应数据库pid字段的名
     * @param      string  $name   对应数据库name字段的名
     * @return     string  拼接好的zTree字符
     */

    public static function zTree_data($data,$id="id",$pid="pid",$name="name"){
        $str = "[";
        foreach($data as $v)
        {
            $str.="{".$id.":".$v[$id].",".$pid.":".$v[$pid].",".$name.":'".$v[$name]."'"."},";
        }
        $str.="]";
        return $str;
    }

    /**
     * 递归
     * layui扩展eleTree的数据格式返回
     * @param  [type] $data [description]
     * @return [type]       [description]
     */
    public static function eleTree_data($data,$pid=0){
        foreach ($data as $k=>$v)
        {
            if($v['pid']==$pid)
            {
                $tmp['id']=$v['id'];
                $tmp['label']=$v['name'];
                $tmp['children'] = self::eletree_data($data,$v['id']);
                if(!$tmp['children'])
                {
                    unset($tmp['children']);
                }
                $res[]=$tmp;       
            }
        }
        return $res;
    }

    /**
     * 递归layui的tree模块的数据格式返回
     * @Author   lzy
     * @DateTime 2019-08-15
     * @param    [type]     $data  [description]
     * @param    integer    $pid   [description]
     * @param    integer    $level [用来展开顶级分类]
     * @return   [type]            [description]
     */
    public static function layuiTree_data($data,$pid = 0,$level = 0){
        foreach ($data as $k=>$v)
        {
            if($v['pid']==$pid)
            {
                $tmp['id']=$v['id'];
                $tmp['title']=$v['name'];
                $tmp['pid']=$pid;
                if($level == 0){
                   $tmp['spread']=true; 
                }
                $tmp['children'] = self::layuiTree_data($data,$v['id'],$level+1);
                if(!$tmp['children'])
                {
                    unset($tmp['children']);
                }
                $res[]=$tmp;       
            }
        }
        return $res;
    }






    /**
     * 页面左边导航条数据拼凑
     * @param  [array] $data [description]
     * @return [type]       [description]
     */
    public static function left_nav_data($data){
        if(!empty($data))
        {
            $arr=$data['authinfo_1'];
            foreach ($arr as $k=>$v) {
                $i=0;
                $res[$k]['title']=$v['name'];
                $res[$k]['icon']=$v['icon'];
                $res[$k]['href']="";
                $v['is_new']==1?$res[$k]['target']='_blank':"";
                //是否展开
                $res[$k]['spread']=false;
                foreach ($data['authinfo_2'] as $k2 => $v2) {
                    if($v2['pid']==$v['id'])
                    {
                        $res[$k]['children'][$i]['title']=$v2['name'];
                        $res[$k]['children'][$i]['icon']=$v2['icon'];
                        $res[$k]['children'][$i]['href']=url($v2['module'].'/'.$v2['control'].'/'.$v2['action']);
                        $v2['is_new']==1?$res[$k]['children'][$i]['target']='_blank':"";
                        $res[$k]['children'][$i]['spread']=true;
                        $i++;
                    } 
                }
            }
            return json_encode($res);
        }
    }



}
