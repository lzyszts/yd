<?php
namespace app\admin\validate;
use think\Validate;
/**
 * 配置验证类
 */

class ConfigValidate extends Validate
{
	protected $rule = [
		'sitename' =>'require',
		'domain' => 'url',
		'uploadImgSize' => 'require|integer|between:100,3072',
		'imgType' => 'require',
		'uploadFileSize' => 'require|integer|between:100,40960',
		'fileType' => 'require',
		'uploadVideoSize' => 'require|integer|between:100,40960',
		'videoType' => 'require',
	];
	protected $message  = [
		'sitename.require' =>'站点名不能为空',
		'domain.activeUrl' =>'域名地址错误',
		'uploadImgSize.require' =>'上传图片大小不能为空',
		'uploadImgSize.integer' =>'上传图片大小必须为整数',
		'uploadImgSize.between' =>'上传图片大小必须为100-3072KB之间',
		'imgType.require'=>'上传图片类型不能为空',
		'uploadFileSize.require' =>'上传文件大小不能为空',
		'uploadFileSize.integer' =>'上传文件大小必须为整数',
		'uploadFileSize.between' =>'上传文件大小必须为100-40960KB之间',
		'fileType.require' =>'上传文件类型不能为空',
		'uploadVideoSize.require' =>'上传视频大小不能为空',
		'uploadVideoSize.integer' =>'上传视频大小必须为整数',
		'uploadVideoSize.between' =>'上传视频大小必须为100-40960KB之间',
		'VideoType.require' =>'上传视频类型不能为空',
		//前台配置
		'phone.require' =>'站点名不能为空',
		'workTime.require' =>'服务时间时间不能为空',
		'qq.require' =>'客服QQ号不能为空',
		//邮件
		'mailSmtpServer.require' =>'SMTP服务器不能为空',
		'mailSmtpPort.require' =>'SMTP端口号不能为空',
		'mailSmtpPort.integer' =>'SMTP端口号必须为整数',
		'mailSmtpPort.between' =>'SMTP端口号错误',
		'mailSendUsername.require' =>'发件人邮箱不能为空',
		'mailSendName.require' =>'发件人昵称不能为空',
		'mailSendPwd.require' =>'发件人邮箱登录密码不能为空',
		//链接
		'link_name.require'=>'网站名不能为空',
		'type.require'=>'分组标识不能为空',
		'type.length'=>'分组标识长度为2-32字符',
		'thumb_id.integer'=>'缩略图id异常',
		'url.require'=>'网站地址不能为空',
		//'url.url'=>'网站地址格式错误',
		'sort.require'=>'排序不能为空',
		'sort.integer'=>'排序必须为整数',
		'is_new.in'=>'新页面字段数据异常',
		'describe.length'=>'描述信息必须60长度以内',
		'id.require' =>'链接id异常',
		'id.integer' =>'链接id类型异常',
		//轮播图
		'name.require' =>'轮播图名称不能为空',
		'img_id.require' =>'轮播图不能为空',
		'img_id.integer' =>'轮播图id异常',
		'state.in' =>'状态id异常',
		//下载信息
		'download_name.require'=>'名称为空',
		'logo_id.integer'=>'logo的id异常',
		'file_id.integer'=>'上传文件id异常',
	];

	//后台配置时验证的
	public function sceneConfig(){
		return $this->only(['sitename','domain','uploadImgSize','imgType','uploadFileSize','fileType','uploadVideoSize','videoType']);
	}	
	//前台配置时验证的
	public function sceneInfo(){
		return $this->only(['phone','workTime','qq'])
		->append('phone','require')
		->append('workTime','require')
		->append('qq','require');
	}	
	//邮箱时验证的
	public function sceneEmail(){
		return $this->only(['mailSmtpServer','mailSmtpPort','mailSendUsername','mailSendName','mailSendPwd'])
		->append('mailSmtpServer','require')
		->append('mailSmtpPort','require|integer|between:1,65535')
		->append('mailSendUsername','require')
		->append('mailSendName','require')
		->append('mailSendPwd','require');
	}
	//链接添加
	public function sceneLink(){
		return $this->only(['link_name','type','thumb_id','url','sort','is_new','describe'])
		->append('link_name','require')
		->append('type','require|length:1,32')
		->append('thumb_id','integer')
		->append('url','require')
		->append('sort','integer')
		->append('is_new','in:0,1')
		->append('describe','length:0,60');
	}	
	//链接编辑
	public function sceneLinkEdit(){
		return $this->only(['id','link_name','type','thumb_id','url','sort','is_new','describe'])
		->append('id','require|integer')
		->append('type','require|length:1,32')
		->append('link_name','require')
		->append('thumb_id','integer')
		->append('url','require')
		->append('sort','integer')
		->append('is_new','in:0,1')
		->append('describe','length:0,60');
	}
	//轮播图添加
	public function sceneSlide(){
		return $this->only(['name','type','img_id','sort','state'])
		->append('name','require')
		->append('type','require|length:1,32')
		->append('img_id','require|integer')
		->append('sort','require|integer')
		->append('state','in:0,1');
	}	
	//轮播图编辑
	public function sceneSlideEdit(){
		return $this->only(['id','name','type','img_id','sort','state'])
		->append('id','require|integer')
		->append('type','require|length:1,32')
		->append('name','require')
		->append('img_id','require|integer')
		->append('sort','require|integer')
		->append('state','in:0,1');
	}
	//下载信息添加
	public function sceneDownload(){
		return $this->only(['download_name','type','logo_id','file_id','sort','describe'])
		->append('download_name','require')
		->append('type','length:1,32')
		->append('logo_id','integer')
		->append('file_id','integer')
		->append('sort','integer')
		->append('is_new','in:0,1')
		->append('describe','length:0,60');
	}	
	//下载信息编辑
	public function sceneDownloadEdit(){
		return $this->only(['id','download_name','type','logo_id','file_id','sort','describe'])
		->append('id','require|integer')
		->append('download_name','require')
		->append('type','length:1,32')
		->append('logo_id','integer')
		->append('file_id','integer')
		->append('sort','integer')
		->append('is_new','in:0,1')
		->append('describe','length:0,60');
	}


}
