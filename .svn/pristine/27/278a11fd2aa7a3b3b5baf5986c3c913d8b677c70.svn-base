<?php
namespace app\admin\controller;
use app\admin\validate\FileValidate;
use app\admin\model\ConfigModel;
use app\admin\model\DownloadModel;
use app\server\Img;
use app\server\FileOp;
use app\server\Cache;
use think\Db;
/**
 * 文件控制器
 */

class File extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = [
        'download'=>['getDownloadList','downloadSwitch'],
        'downloadAdd'=>['uploadDownloadLogo','uploadFile'],
        'downloadEdit'=>['uploadDownloadLogo'],
        'video'=>['getVideoList','videoSwitch'],
        'videoAdd'=>['uploadVideoLogo','uploadVideo'],
        'videoEdit'=>['uploadVideoLogo'],
    ];


    public function initialize(){
        parent::initialize();
        $this->configModel=new ConfigModel;
        $this->downloadModel=new DownloadModel;
    }


/****************文件下载*********************/

   /**
     * 下载配置展示/添加
     */
    public function download()
    {
        $this->assign([
            'title' => '下载设置',
        ]);
        return $this->fetch();
    }
    /**
     * 下载添加
     * @return [type] [description]
     */
    public function downloadAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new FileValidate();
            if($validate->scene('download')->check($params))
            {   
                //模型插入
                $res=$this->downloadModel->downloadAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '添加下载信息',
            ]);
            return $this->fetch();
        }
    }

   /**
    *下载编辑/展示   
    */
    public function downloadEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new FileValidate();
            if($validate->scene('downloadEdit')->check($params))
            {   
                //模型编辑
                $res=$this->downloadModel->downloadEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');         
            $download_info=$this->downloadModel->getdownload($params['id']);
            $this->assign([
                'title' => '下载编辑',
                'download_info' => $download_info,
            ]);
            return $this->fetch();
        }
    }
    /**
     * 下载删除
     * @return [type] [description]
     */             
    public function downloadDel(){
        $params=$this->request->post();
        $res=$this->downloadModel->downloadDel($params['id']);
        echo $res;
    }

    /**
     * 下载启用禁用
     */
    public function downloadSwitch(){
        $params=$this->request->post();
        $res=$this->downloadModel->downloadSwitch($params);
        echo $res;
    }
    /**
     * 下载信息缩略图上传
     */
    public function uploadDownloadLogo(){
        // 获取表单上传文件
        $file = $this->request->file();
        $file = $file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadImgSize']*1024,
            'ext'=>$config['imgType']
        ];
        //处理图片
        $res=Img::layImg($file,$validate,0,1,170,170);
        echo $res;
    }
    /**
     * 上传文件
     */
    public function uploadFile(){
        $file = $this->request->file();
        $file =$file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadFileSize']*1024,
            'ext'=>$config['fileType']
        ];
        //处理文件
        $res=FileOp::layFile($file,$validate);
        echo $res;
    }
    /**
     * ajax
     * 下载列表信息
     * @return [type] [description]
     */
    public function getDownloadList(){
        $layui_data=$this->downloadModel->getDownloadList(['pc','phone']);
        echo $layui_data;
    }

    /****************视频管理*********************/

   /**
     * 视频配置展示/添加
     */
    public function video()
    {
        $this->assign([
            'title' => '视频设置',
        ]);
        return $this->fetch();
    }
    /**
     * 视频添加
     * @return [type] [description]
     */
    public function videoAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new FileValidate();
            if($validate->scene('download')->check($params))
            {   
                //模型插入
                $res=$this->downloadModel->downloadAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '添加视频信息',
            ]);
            return $this->fetch();
        }
    }

   /**
    *视频编辑/展示   
    */
    public function videoEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new FileValidate();
            if($validate->scene('downloadEdit')->check($params))
            {   
                //模型编辑
                $res=$this->downloadModel->downloadEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');         
            $video_info=$this->downloadModel->getdownload($params['id']);
            $this->assign([
                'title' => '视频编辑',
                'video_info' => $video_info,
            ]);
            return $this->fetch();
        }
    }
    /**
     * 视频删除
     * @return [type] [description]
     */             
    public function videoDel(){
        $params=$this->request->post();
        $res=$this->downloadModel->DownloadDel($params['id']);
        echo $res;
    }

    /**
     * 视频启用禁用
     */
    public function videoSwitch(){
        $params=$this->request->post();
        $res=$this->downloadModel->downloadSwitch($params);
        echo $res;
    }
    /**
     * 视频信息缩略图上传
     */
    public function uploadVideoLogo(){
        // 获取表单上传文件
        $file = $this->request->file();
        $file = $file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadImgSize']*1024,
            'ext'=>$config['imgType']
        ];
        //处理图片
        $res=Img::layImg($file,$validate,0,1,392,220);
        echo $res;
    }
    /**
     * 上传视频文件
     */
    public function uploadVideo(){
        $file = $this->request->file();
        $file =$file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadVideoSize']*1024,
            'ext'=>$config['videoType']
        ];
        //处理文件
        $res=FileOp::layFile($file,$validate);
        echo $res;
    }
    /**
     * ajax
     * 视频列表信息
     * @return [type] [description]
     */
    public function getVideoList(){
        $layui_data=$this->downloadModel->getDownloadList('video');
        echo $layui_data;
    }











}
