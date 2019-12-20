<?php
namespace app\admin\controller;
use app\admin\model\AreaModel;
use app\admin\validate\AreaValidate;
use think\Db;
/**
 * 区域控制器
 */

class Area extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = [
        'index'=>['getarealist'],
    ];
    public function initialize(){
        parent::initialize();
        $this->areaModel=new AreaModel;
    }
	/**
	 * 区域列表页
	 */
    public function index()
    {
    	$this->assign([
    		'title' => '区域管理',
    	]);
        return $this->fetch();
    }

    /**
     * ajax
     * 区域列表
     * @return [type] [description]
     */
   	public function getAreaList(){
   		$layui_data=$this->areaModel->getAreaList();
   		echo $layui_data;
   	}


    /**
     * 区域添加/展示
     */
    public function areaAdd(){
    	if(request()->isAjax() && request()->isPost())
    	{
    		// 参数
			$params = $this->request->param();
			//表单验证    
			$validate=new AreaValidate();
			if($validate->check($params))
			{	
				//模型插入
				$res=$this->areaModel->areaAdd($params);
				echo $res;	
			}else{
				echo return_data($validate->getError(),-1);
			}
    	}else{
    		$this->assign([
	    		'title' => '区域添加',
	    	]);
	    	return $this->fetch();
    	}
    }



    /**
     * 区域编辑/展示   
     */
    public function areaEdit(){
        // 参数过滤空
        $params = $this->request->param('','','trim');
        if(request()->isAjax() && request()->isPost())
        {
            //表单验证      
            $validate=new AreaValidate();
            if($validate->scene('edit')->check($params))
            {   
                //模型编辑
                $res=$this->areaModel->areaEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{         
            $area_info=$this->areaModel->getAreaInfo($params['id']);
            $this->assign([
                'title' => '区域编辑',
                'area_info' => $area_info,
            ]);
            return $this->fetch();
        }
    }

    /**
     * 区域删除
     */
    public function areaDel(){
        $params=$this->request->post();
        $res=$this->areaModel->areaDel($params['id']);
        echo $res;
    } 


}
