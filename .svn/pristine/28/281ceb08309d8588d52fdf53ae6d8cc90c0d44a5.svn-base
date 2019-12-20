<?php
namespace app\home\controller;
use think\Controller;
use app\home\model\DataModel;
use app\home\model\InfoModel;
use app\home\validate\InfoValidate;

/**
 * 页面控制器
 */

class Index extends Base
{
    public function initialize(){
        parent::initialize();
        $this->dataModel=new DataModel;
    }
    /**
     * 首页
     */
    public function index(){
      $slide = $this->dataModel->getSlide();
      $video = $this->dataModel->getVideo(3);
      $this->assign([
          'title' => '野嘀官网',
          'slide' => $slide,
          'video' => $video
      ]);
      return $this->fetch();
    }   
    /**
     * 公司介绍
    */
    public function about(){
      $this->assign([
          'title' => '公司介绍',
      ]);
      return $this->fetch();
    }      

    /**
     * 产品
    */
    public function product(){
      $params = $this->request->param();
      $category = $params['category'];
      // 栏目id 
      $column_id = $this->dataModel->getColumnId();
      // 获取分类
      $column = $this->dataModel->getCpCategory($column_id);
      // 获取分类下文章
      if(empty($category)){
        // 为空找第一个分类的产品
        $category = $column[0]['id'];
      }
      $article_list = $this->dataModel->getCpList($category);
      $this->assign([
          'title' => '产品中心',
          'column' => $column,
          'article_list' => $article_list,
      ]);
      return $this->fetch();
    }      
    /**
     * 产品详情
     */
    public function content(){
      $params = $this->request->param();
      $data = $this->dataModel->getNewInfo($params['id']);
      $this->assign([
          'title' => '产品详情',
          'action' => 'product',
          'data' => $data
      ]);
      return $this->fetch();
    }

    /**
     * 寻味记
    */
    public function xunweiji(){
      $data = $this->dataModel->getVideo();
      $this->assign([
          'title' => '寻味记',
          'data' => $data
      ]);
      return $this->fetch();
    }    
    /**
     * 视频
     */
    public function video(){
      $video = $this->dataModel->videoInfo();
      $this->assign([
          'title' => '寻味记',
          'action' => 'xunweiji',
          'video' => $video
      ]);
      return $this->fetch();
    }

    /**
     * 企业服务
     */
    public function service(){
      $this->assign([
          'title' => '企业服务',
      ]);
      return $this->fetch();
    }    
    /**
     * 新闻
     */
    public function news(){
      $column_id = $this->dataModel->getColumnId();
      $data = $this->dataModel->getNews($column_id);
      $this->assign([
          'title' => '新闻',
          'data' => $data
      ]);
      return $this->fetch();
    }  
    /**
     * 新闻详情
     */
    public function pre(){
      $params = $this->request->param();
      $data = $this->dataModel->getNewInfo($params['id']);
      $this->assign([
          'title' => '新闻详情',
          'action' => 'news',
          'data' => $data
      ]);
      return $this->fetch();
    }  



    /**
     * 加盟
     */
    public function join(){
      if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new InfoValidate();
            if($validate->scene('add')->check($params))
            {   
                $infoModel=new InfoModel();
                $res=$infoModel->addInfo($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
              'title' => '招商加盟',
            ]);
            return $this->fetch();
        }
      
    }

    /**
     * 野嘀生态系统
     */
    public function ydst(){
      $this->assign([
          'title' => '生态系统',
          'action' => 'about'
      ]);
      return $this->fetch();
    }






}
