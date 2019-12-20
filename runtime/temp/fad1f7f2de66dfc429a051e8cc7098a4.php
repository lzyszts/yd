<?php /*a:3:{s:53:"D:\project\yd\application\admin\view\index\index.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\head.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\foot.html";i:1576813117;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title><?php echo htmlentities($title); ?></title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="<?php echo htmlentities(__MY__STATIC__); ?>/admin/images/logo.ico">
	<link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/common/layui/css/layui.css"/>
	<link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/common/font/iconfont.css" />
	<link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/admin/css/public.css" />
	<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/jquery/jquery.cookie.js"></script>
</head>
<link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/admin/css/index.css" />
<style type="text/css">
/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/  
::-webkit-scrollbar  
{  
    width: 16px;  
    height: 16px;  
    background-color: #F5F5F5;  
}  
  
/*定义滚动条轨道 内阴影+圆角*/  
::-webkit-scrollbar-track  
{  
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);  
    background-color: #F5F5F5;  
}  
  
/*定义滑块 内阴影+圆角*/  
::-webkit-scrollbar-thumb  
{   
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);  
    background-color: #555;  
} 
.layui-tab {
	margin:0;
}
 
</style>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main mag0">
				<a href="#" class="logo">后台管理系统</a>
				<!-- 显示/隐藏菜单 -->
				<span class="seraph hideMenu icon iconfont icon-menu2"></span>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
					<li class="layui-nav-item" pc>
						<a href="javascript:;" class="clearCache"><span class="icon iconfont icon-lajitong"></span><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
					</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><span class="icon iconfont icon-suo"></span><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item" id="userInfo">
						<a href="javascript:;"><img src="<?php echo htmlentities(__MY__STATIC__); ?>/admin/images/logo.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName"><?php echo $admin['username']; ?></cite></a>
						<dl class="layui-nav-child">
						  <dd>
						    <a href="javascript:;" data-url="#">
						      <span class="icon iconfont icon-gerenziliao"></span>
						      <cite>个人资料</cite></a>
						  </dd>
						  <dd>
						    <a href="javascript:;" data-url="#">
						      <span class="icon iconfont icon-xiugaimima"></span>
						      <cite>修改密码</cite></a>
						  </dd>
						  <dd>
						    <a href="javascript:;" class="showNotice">
						      <span class="icon iconfont icon-gonggao"></span>
						      <cite>系统公告</cite>
						      <span class="layui-badge-dot"></span>
						    </a>
						  </dd>
						  <dd pc>
						    <a href="javascript:;" class="functionSetting">
						      <span class="icon iconfont icon-gongnengjianyi"></span>
						      <cite>功能设定</cite>
						      <span class="layui-badge-dot"></span>
						    </a>
						  </dd>
						  <dd pc>
						    <a href="javascript:;" class="changeSkin">
						      <span class="icon iconfont icon-pifu"></span>
						      <cite>更换皮肤</cite></a>
						  </dd>
						  <dd>
						    <a href="<?php echo url('loginOut'); ?>" class="signOut">
						      <span class="icon iconfont icon-icon-test"></span>
						      <cite>退出</cite></a>
						  </dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black" id="left" data-url="<?php echo url('userNav'); ?>">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="<?php echo htmlentities(__MY__STATIC__); ?>/admin/images/logo.jpg" class="userAvatar"></a>
				<p>你好！<span class="userName"><?php echo $admin['username']; ?></span>, 欢迎登录</p>
			</div>
			<!-- 搜索 -->
			<div class="layui-form component">
				<select name="search" id="search" lay-search lay-filter="searchPage">
					<option value="">搜索页面或功能</option>
					<!-- <option value="1">layer</option>
					<option value="2">form</option> -->
				</select>
				<i class="layui-icon">&#xe615;</i>
			</div>
			<!-- 左侧导航栏 -->
			<div class="navBar layui-side-scroll" id="navBar">
				<ul class="layui-nav layui-nav-tree" style="overflow: scroll;padding-bottom: 10px;">
					<!-- <li class="layui-nav-item layui-this">
						<a href="javascript:;" data-url="<?php echo url('main'); ?>"><i class="layui-icon" data-icon="&#xe61a;">&#xe61a;</i><cite>后台首页</cite></a>
					</li> -->
				</ul>
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="icon iconfont icon-xiazai45"></i><cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox"> 
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><span class="icon iconfont icon-shuaxin"></span> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><span class="icon iconfont icon-jinzhi"></span> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><span class="icon iconfont icon-icon-test"></span> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="<?php echo url('main'); ?>"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p><span>copyright @2019 lzy</span>
		</div>
	</div>
	<!-- 移动导航 -->
	<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>
	<!-- 右键菜单 -->
	<div class="contextMenu" id="myMenu">
	  <ul>
	    <li id="refreshThis"> 刷新当前</li>
	    <li id="closeOther"> 关闭其他</li>
	  </ul>
	</div>

<script type="text/javascript">
	var c={
		//layui扩展js目录
		layuiConfigPath:"<?php echo __MY_PUBLIC_URL__; ?>static/admin/js/extend/",
		//左侧导航json
		leftNav:"<?php echo url('getAdminNav'); ?>",
		//leftNav:"#",
		//图片
		img1:"<?php echo __MY_PUBLIC_URL__; ?>static/admin/images/logo.jpg",
	};
</script>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/layui/layui.js"></script>
<?php if(!empty($js)): foreach($js as $hook): ?>
        <script type="text/javascript" src="<?php echo htmlentities($hook); ?>" ></script>
    <?php endforeach; ?>
<?php endif; ?>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/admin/js/index.js"></script>

</body>
</html>