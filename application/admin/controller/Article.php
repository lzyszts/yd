<?php
namespace app\admin\controller;
use app\admin\validate\ArticleValidate;
use app\admin\validate\ArticleCategoryValidate;
use app\admin\model\ArticleCategoryModel;
use app\admin\model\ArticleModel;
use app\admin\model\InfoModel;
use app\server\Img;
use app\server\Cache;
use app\api\UEeditor;
use think\Db;
/**
 * 文章管理控制器
 */

class Article extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = [
        'articleCategory'=>['getCategoryList'],
        'articleList'=>['getArticleList','preview'],
        'articleAdd'=>['uploadHeadImg','ueEditorImg'],//添加文章的上传图片权限
        'articleEdit'=>['articleSwitch','uploadHeadImg','uploadHeadImg'],//启用禁用
        'infoList' => ['getInfoList'],
    ];
    private $articleModel;

    public function initialize(){
        parent::initialize();
        $this->articleModel=new ArticleModel;
    }


    /**
     * 文章列表页
     */
    public function articleList(){
        $this->assign([
            'title' => '文章列表',
        ]);
        return $this->fetch();
    }


    /**
     * 文章添加/展示
     */
    public function articleAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //没格式化的content
            $content = $this->request->post('content','',null);
            //表单验证    
            $validate=new ArticleValidate();
            if($validate->check($params))
            {   
                //模型插入
                $res=$this->articleModel->articleAdd($params,$content);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '文章添加',
            ]);
            return $this->fetch();
        }
    }    
    /**
    * 文章编辑/展示   
    */
    public function articleEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //没格式化的content
            $content = $this->request->post('content','',null);
            //表单验证    
            $validate=new ArticleValidate();
            if($validate->scene('edit')->check($params))
            {   
                //模型编辑
                $res=$this->articleModel->articleEdit($params,$content);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');         
            $article_info=$this->articleModel->getArticle($params);
            $this->assign([
                'title' => '文章编辑',
                'article_info' => $article_info,
            ]);
            return $this->fetch();
        }
    }
    /**
     * 文章删除
     * @return [type] [description]
     */             
    public function articleDel(){
        $params=$this->request->post();  
        $res=$this->articleModel->articleDel($params['id']);
        echo $res;
    }
    /**
     * 文章预览页面
     * @return [type] [description]
     */
    public function preview(){
        $params=$this->request->param();
        $data=$this->articleModel->getArticle($params);
        $this->assign([
            'title' => '文章预览',
            'data' => $data,
        ]);
        return $this->fetch();
    }


    /**
     * 文章启用禁用
     * @return [type] [description]
     */
    public function articleSwitch(){
        $params=$this->request->post();
        $res=$this->articleModel->articleSwitch($params);
        echo $res;
    }
    /**
     * 分类列表页
     */
    public function articleCategory()
    {
        $this->assign([
            'title' => '分类列表',
        ]);
        return $this->fetch();
    }
    /**
     * 添加分类/展示
     */
    public function categoryAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ArticleCategoryValidate();
            if($validate->check($params))
            {   
                //模型插入
                $category_model=new articleCategoryModel();
                $res=$category_model->categoryAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            // 取栏目树
            $category_model = new ArticleCategoryModel;
            $tree = $category_model->getColum();
            // 转换为layui的数据格式
            $tree = \app\server\Tree::layuiTree_data($tree);
            $this->assign([
                'title' => '分类添加',
                'tree' => json_encode($tree)
            ]);
            return $this->fetch();
        }
    }    
    /**
     * 编辑分类/展示
     */
    public function categoryEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ArticleCategoryValidate();
            if($validate->scene('edit')->check($params))
            {   
                //模型修改
                $category_model=new articleCategoryModel();
                $res=$category_model->categoryEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            // 取栏目树
            $category_model = new ArticleCategoryModel;
            $tree = $category_model->getColum();
            // 转换为layui的数据格式
            $tree = \app\server\Tree::layuiTree_data($tree);
            $this->assign([
                'title' => '分类修改',
                'tree' => json_encode($tree)
            ]);
            return $this->fetch();
        }
    }

    /**
    * 分类删除
    */
    public function categoryDel(){
        $id=$this->request->param('id');
        $category_model=new articleCategoryModel(); 
        $res=$category_model->categoryDel($id);
        echo $res;
    } 

    /**
     * 招聘
     */
    public function zp(){
         return '还在考虑单独出来不'; 
    }



    /**
     * 加盟信息列表
     * @Author   lzy
     * @DateTime 2019-09-10
     * @return   [type]     [description]
     */
    public function infoList(){
        $this->assign([
            'title' => '信息列表',
        ]);
        return $this->fetch();
    }

    /**
    * 加盟信息删除
    */
    public function infoDel(){
        $id=$this->request->param('id');
        $infoModel = new InfoModel;
        $res = $infoModel->infoDel($id);
        echo $res;
    } 

    /**********************************************/
    /**
     * layui文章缩略图上传
     */
    public function uploadHeadImg(){
        // 获取表单上传文件
        $file = $this->request->file();
        $file = $file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadImgSize']*1024,
            'ext'=>$config['imgType']
        ];
        //处理图片 生成缩略图
        $res=Img::layImg($file,$validate,0,1,400,268);
        echo $res;      
    }


    /**
     * UEeditor编辑器文章内容图片上传接口
     * @return [type] [description]
     */
    public function ueEditorImg(){
        $params=$this->request->param();
        switch ($params['action']) {
            case 'config':
                $config=Img::ueConfig();
                echo json_encode($config);
                break;
                /* 上传图片 */
            case 'uploadimage':
                // 获取表单上传文件
                $file = $this->request->file('upfile');
                $config=Cache::configInit();
                $validate=[
                    'size'=>$config['uploadImgSize']*1024,
                    'ext'=>$config['imgType']
                ];
                //处理图片
                $res=Img::ueImg($file,$validate);
                echo json_encode($res);
                break;
            default:
                # code...
                break;
        }
    }

    /**
     * ajax
     * 文章列表数据
     * @return [json] [layui的table数据]
     */
    public function getArticleList(){
        $layui_data=$this->articleModel->getArticleList();
        echo $layui_data;
    }

    /**
     * ajax
     * 分类列表数据
     * @return [json] [layui的table数据]
     */
    public function getCategoryList(){
        $category_model=new ArticleCategoryModel;
        $layui_data=$category_model->getCategoryList();
        echo $layui_data;
    }

    /**
     * ajax
     * 信息列表数据
     * @return [json] [layui的table数据]
     */
    public function getInfoList(){
        $infoModel = new InfoModel;
        $layui_data=$infoModel->getInfoList();
        echo $layui_data;
    }




    /**
     * wangEditor编辑器文章内容图片上传接口
    public function wangEditorImg(){
        // 获取表单上传文件
        $file = $this->request->file('content_img');
        $validate=[
            'size'=>3*1024*1024,
            'ext'=>'jpg,png,gif'
        ];
        $info = $file->validate($validate)->move(UPLOAD_PATH);
        //图片大小
        $size=$file->getInfo()['size'];
        if($info)
        {
            $filename = $info->getFileName();
            $src = $info->getSaveName();
            $realPath = $info->getRealPath();
            //信息插入临时表
            $id=Img::imgInfoAdd($filename,$src,$realPath);
            //压缩图片
            Img::imgCompress(UPLOAD_PATH.$src,$size); 
            if(!$id)
            {
                echo return_data('图片信息保存错误',-1);die;
            }
            echo return_data('上传成功',1,["id"=>$id,"src"=>$src]);die;
        }else{
            echo return_data($file->getError(),-1);die;
        }
    }
    */











}
