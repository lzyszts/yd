<?php
namespace app\admin\controller;
use app\admin\validate\ConfigValidate;
use app\admin\validate\AuthValidate;
use app\admin\model\ConfigModel;
use app\admin\model\LinkModel;
use app\admin\model\ColumnModel;
use app\admin\model\SlideModel;
use app\admin\model\DownloadModel;
use app\server\Img;
use app\server\FileOp;
use app\server\Tree;
use app\server\Cache;
use think\Db;
/**
 * 配置控制器
 */

class Config extends Base
{

    //不需要登陆的方法
    protected $no_login = [];
    //登录后不需要权限认证的方法
    protected $no_auth = [
        'website'=>['sendEmail'],
        'link'=>['getLinkList'],
        'linkAdd'=>['uploadLogo','linkSwitch'],
        'linkEdit'=>['uploadLogo','linkSwitch'],
        'column'=>['columnList'],
        'columnAdd'=>['getColumnList'],
        'columnEdit'=>['columnSwitch'],
        'slide'=>['getSlideList'],
        'slideAdd'=>['uploadSlide','slideSwitch'],
        'slideEdit'=>['uploadSlide','slideSwitch'],
        'download'=>['getDownloadList'],
        'downloadAdd'=>['uploadDownloadLogo','downloadSwitch','uploadFile'],
        'downloadEdit'=>['uploadDownloadLogo','downloadSwitch'],
    ];


    public function initialize(){
        parent::initialize();
        $this->configModel=new configModel;
        $this->linkModel=new LinkModel;
        $this->columnModel=new ColumnModel;
        $this->slideModel=new SlideModel;
        $this->downloadModel=new DownloadModel;
    }


	/**
	 * 网站后台配置展示/添加
	 */
    public function website()
    {
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('config')->check($params))
            {   
                //模型插入
                $res=$this->configModel->websiteEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $configList=$this->configModel->configList();
            $this->assign([
                'title' => '网站后台基础信息设置',
                'config'=>$configList
            ]);
            return $this->fetch();
        }
    }   
    /**
     * 网站前台配置展示/添加
     */
    public function info()
    {
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('info')->check($params))
            {   
                //模型插入
                $res=$this->configModel->infoEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $configList=$this->configModel->configList();
            $this->assign([
                'title' => '网站前台信息设置',
                'config'=>$configList
            ]);
            return $this->fetch();
        }
    }   
    /**
     * 邮箱配置展示/添加
     */
    public function email()
    {
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('email')->check($params))
            {   
                //模型修改
                $res=$this->configModel->websiteEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $configList=$this->configModel->configList();
            $this->assign([
                'title' => '邮箱信息设置',
                'config'=>$configList
            ]);
            return $this->fetch();
        }
    }    
    /**
     * 链接配置展示/添加
     */
    public function link()
    {
        $this->assign([
            'title' => '链接设置',
        ]);
        return $this->fetch();
    }
    /**
     * 链接添加
     * @return [type] [description]
     */
    public function linkAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            isset($params['is_new'])?"":$params['is_new']="0";
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('link')->check($params))
            {   
                //模型插入
                $res=$this->linkModel->linkAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '添加链接',
            ]);
            return $this->fetch();
        }
    }

   /**
    *链接编辑/展示   
    */
    public function linkEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('LinkEdit')->check($params))
            {   
                //模型编辑
                $res=$this->linkModel->linkEdit($params,$content);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');         
            $link_info = $this->linkModel->getlink($params['id']);
            $this->assign([
                'title' => '链接编辑',
                'link_info' => $link_info,
            ]);
            return $this->fetch();
        }
    }


    /**
     * 链接删除
     * @return [type] [description]
     */             
    public function linkDel(){
        $params=$this->request->post();
        $res=$this->linkModel->linkDel($params['id']);
        echo $res;
    }

    /**
     * 链接启用禁用
     */
    public function linkSwitch(){
        $params=$this->request->post();
        $res=$this->linkModel->linkSwitch($params);
        echo $res;
    }

    /**
     * 链接缩略图上传
     */
    public function uploadLogo(){
        // 获取表单上传文件
        $file = $this->request->file();
        $file = $file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadImgSize']*1024,
            'ext'=>$config['imgType']
        ];
        //处理图片
        $res=Img::layImg($file,$validate,0,1,100,100);
        echo $res;
    }

    /**
     * ajax
     * 链接列表信息
     * @return [type] [description]
     */
    public function getLinkList(){
        $layui_data=$this->linkModel->getLinkList();
        echo $layui_data;
    }

    /**
     * 栏目管理
     */
    public function column(){
        $this->assign([
            'title' => '栏目管理',
        ]);
        return $this->fetch();
    }
    /**
     * 新增栏目
     * 表单展示/新增
     */
    public function columnAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证(用权限表的验证规则)    
            $validate=new AuthValidate();
            isset($params['state'])?"":$params['state']="0";
            isset($params['is_new'])?"":$params['is_new']="0";
            if($validate->scene('columnAdd')->check($params))
            {   
                //模型插入
                $res=$this->columnModel->columnAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '栏目添加',
            ]);
            return $this->fetch();
        }
    }


    /**
     * 修改栏目 
     * 表单展示/修改
     */
    public function columnEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->post();
            //表单验证    
            $validate=new AuthValidate();
            isset($params['is_show'])?"":$params['is_show']="0";
            isset($params['is_new'])?"":$params['is_new']="0";
            if($validate->scene('columnEdit')->check($params))
            {   
                //模型修改
                $res=$this->columnModel->columnEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');   
            $column_info=$this->columnModel->getColumnInfo($params['id']);
            $this->assign([
                'title' => '栏目编辑',
                'column_info' => $column_info
            ]);
            return $this->fetch();
        }
    }

    /**
     * 栏目删除
     * 删除子分类
     */
    public function columnDel(){
        $id=$this->request->param('id');
        $res=$this->columnModel->columnDel($id);
        echo $res;
    }

    /**
     *  栏目启用禁用
     */
    public function columnSwitch(){
        $params=$this->request->post();
        $res=$this->columnModel->columnSwitch($params);
        echo $res;
    }


    /**
     * ajax
     * 栏目首页列表信息
     * @return [type] [description]
     */
    public function columnList(){
        $layui_data=$this->columnModel->getColumnList();
        echo $layui_data;
    }
    /**
     * ajax
     * 栏目列表eleTree格式信息
     */
    public function getColumnList(){
        $data=$this->columnModel->getColumnList('eleTree');
        echo $data;
    }

/********************轮播图**********************************/

     /**
     * 轮播图配置展示/添加
     */
    public function slide()
    {
        $this->assign([
            'title' => '轮播图设置',
        ]);
        return $this->fetch();
    }
    /**
     * 轮播图添加
     * @return [type] [description]
     */
    public function slideAdd(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            isset($params['state'])?"":$params['state']="0";
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('slide')->check($params))
            {   
                //模型插入
                $res=$this->slideModel->slideAdd($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $this->assign([
                'title' => '添加轮播图',
            ]);
            return $this->fetch();
        }
    }

   /**
    *轮播图编辑/展示   
    */
    public function slideEdit(){
        if(IS_AJAX && request()->isPost())
        {
            // 参数
            $params = $this->request->param();
            //表单验证    
            $validate=new ConfigValidate();
            if($validate->scene('slideEdit')->check($params))
            {   
                //模型编辑
                $res=$this->slideModel->slideEdit($params);
                echo $res;  
            }else{
                echo return_data($validate->getError(),-1);
            }
        }else{
            $params = $this->request->param('','','trim');         
            $slide_info = $this->slideModel->getslide($params['id']);
            $this->assign([
                'title' => '轮播图编辑',
                'slide_info' => $slide_info,
            ]);
            return $this->fetch();
        }
    }


    /**
     * 轮播图删除
     * @return [type] [description]
     */             
    public function slideDel(){
        $params=$this->request->post();
        $res=$this->slideModel->slideDel($params['id']);
        echo $res;
    }

    /**
     * 轮播图启用禁用
     */
    public function slideSwitch(){
        $params=$this->request->post();
        $res=$this->slideModel->slideSwitch($params);
        echo $res;
    }

    /**
     * 轮播图缩略图上传
     */
    public function uploadSlide(){
        // 获取表单上传文件
        $file = $this->request->file();
        $file = $file['file'];
        $config=Cache::configInit();
        $validate=[
            'size'=>$config['uploadImgSize']*1024,
            'ext'=>$config['imgType']
        ];
        //处理图片
        $res=Img::layImg($file,$validate,0,1,1920,1080);
        echo $res;
    }

    /**
     * ajax
     * 轮播图列表信息
     * @return [type] [description]
     */
    public function getslideList(){
        $layui_data=$this->slideModel->getSlideList();
        echo $layui_data;
    }

/****************下载*********************/

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
            $validate=new ConfigValidate();
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
            $validate=new ConfigValidate();
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
        echo json_encode($res);
    }


    /**
     * ajax
     * 下载列表信息
     * @return [type] [description]
     */
    public function getDownloadList(){
        $layui_data=$this->downloadModel->getDownloadList();
        echo $layui_data;
    }





/****************************************/
    /**
     * 测试用
     * 发邮件
     */
    public function sendEmail(){
        $mail = new \phpmailer\PHPMailer();
        // 是否启用smtp的debug进行调试 开发环境建议开启 生产环境注释掉即可 默认关闭debug调试模式
        $mail->SMTPDebug = 1;
        // 使用smtp鉴权方式发送邮件
        $mail->isSMTP();
        // smtp需要鉴权 这个必须是true
        $mail->SMTPAuth = true;
        // 链接qq域名邮箱的服务器地址
        $mail->Host = 'smtp.qq.com';
        // 设置使用ssl加密方式登录鉴权
        $mail->SMTPSecure = 'ssl';
        // 设置ssl连接smtp服务器的远程服务器端口号
        $mail->Port = 465;
        // 设置发送的邮件的编码
        $mail->CharSet = 'UTF-8';
        // 设置发件人昵称 显示在收件人邮件的发件人邮箱地址前的发件人姓名
        $mail->FromName = '牛教授';
        // smtp登录的账号 QQ邮箱即可
        $mail->Username = '362603286@qq.com';
        // smtp登录的密码 使用生成的授权码
        $mail->Password = 'bssoieypkcpkbgec';
        // 设置发件人邮箱地址 同登录账号
        $mail->From = '362603286@qq.com';
        // 邮件正文是否为html编码 注意此处是一个方法
        $mail->isHTML(true);
        // 设置收件人邮箱地址,添加多个收件人 则多次调用方法即可
        $mail->addAddress('306151208@qq.com');
        // 添加该邮件的主题
        $mail->Subject = '邮件主题';
        // 添加邮件正文
        $mail->Body = '<h1>Hello World 杨忠华</h1>'.$i;
        // 发送邮件 返回状态
        $status = $mail->send();
    }





}
