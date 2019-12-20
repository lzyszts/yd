<?php /*a:3:{s:53:"D:\project\yd\application\admin\view\index\login.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\head.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\foot.html";i:1576813117;}*/ ?>
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
<body class="loginBody">
	<form class="layui-form">
		<div class="login_face"><img src="<?php echo htmlentities(__MY__STATIC__); ?>/admin/images/logo.jpg" class="userAvatar"></div>
		<div class="layui-form-item input-item">
			<label for="userName">用户名</label>
			<input type="text" placeholder="请输入用户名" autocomplete="off" name="username" id="userName" class="layui-input" lay-verify="">
		</div>
		<div class="layui-form-item input-item">
			<label for="password">密码</label>
			<input type="password" placeholder="请输入密码" autocomplete="off" name="login_pwd" id="password" class="layui-input" lay-verify="required|password">
		</div>
		<!-- <div class="layui-form-item input-item" id="imgCode">
			<label for="code">验证码</label>
			<input type="text" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
			<img src="../../images/code.jpg">
		</div> -->
		<div class="layui-form-item">
			<button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
		</div>
		<!-- QQ微信 -->
		<!-- <div class="layui-form-item layui-row">
			<a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
		</div> -->
	</form>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/layui/layui.js"></script>
<?php if(!empty($js)): foreach($js as $hook): ?>
        <script type="text/javascript" src="<?php echo htmlentities($hook); ?>" ></script>
    <?php endforeach; ?>
<?php endif; ?>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/crypt/jquery.base64.js"></script>
<script type="text/javascript">
	layui.config({
		base : '<?php echo __MY_PUBLIC_URL__; ?>static/admin/js/extend/'
	}).use(['form'],function(){
	    var form = layui.form;
	    //登录按钮
	    form.on("submit(login)",function(data){
	    	var _this=$(this);
	    	var data=JSON.stringify(data.field);
	        _this.text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
	        setTimeout(function(){
	        	$.post("<?php echo url('login'); ?>",{'data':$.base64.encode(data)},function(res){
	        		if(res.code==1)
	        		{
	        			window.location.href = res.data;
	        		}else{
	        			layer.alert(res.message, {icon: 5},function(){
	        				_this.text("登录").attr("disabled",false).removeClass("layui-disabled");
	        				layer.close(layer.index);
	        			});
	        		}
	        	},'json').error(function(res){
        			layer.alert("服务器请求异常,请稍后再尝试!", {icon: 5});
        			_this.text("登录").attr("disabled",false).removeClass("layui-disabled");
	        	});            
	        },100);
	        return false;
	    })
	    //表单输入效果
	    $(".loginBody .input-item").click(function(e){
	        e.stopPropagation();
	        $(this).addClass("layui-input-focus").find(".layui-input").focus();
	    })
	    $(".loginBody .layui-form-item .layui-input").focus(function(){
	        $(this).parent().addClass("layui-input-focus");
	    })
	    $(".loginBody .layui-form-item .layui-input").blur(function(){
	        $(this).parent().removeClass("layui-input-focus");
	        if($(this).val() != ''){
	            $(this).parent().addClass("layui-input-active");
	        }else{
	            $(this).parent().removeClass("layui-input-active");
	        }
	    })
	})



</script>
</body>
</html>


