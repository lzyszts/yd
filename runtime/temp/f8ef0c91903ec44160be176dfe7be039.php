<?php /*a:5:{s:52:"D:\project\yd\application\home\view\index\index.html";i:1576813116;s:52:"D:\project\yd\application\home\view\public\head.html";i:1576813116;s:51:"D:\project\yd\application\home\view\public\nav.html";i:1576813116;s:54:"D:\project\yd\application\home\view\public\footer.html";i:1576813116;s:52:"D:\project\yd\application\home\view\public\foot.html";i:1576813116;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo htmlentities($title); ?></title>
    <link rel="shortcut icon" href="<?php echo htmlentities(__MY__STATIC__); ?>/home/image/favicon.ico" />
    <link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/common/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/common/swiper/css/swiper.css"/>
    <link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/common/font/iconfont.css"/>
    <link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/home/css/main.css"/>
    <link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/home/css/mobile.css"/>
    <script src="<?php echo htmlentities(__MY__STATIC__); ?>/common/jquery/jquery.min.js" type="text/javascript"></script>
    <!--[if lt IE 10]> <script src="<?php echo htmlentities(__MY__STATIC__); ?>/home/js/html5shiv.min.js" type="text/javascript"></script> <![endif]-->
</head>
<body>
     <!-- nav -->
<div class="navbar navbar-custom sticky nav navbar-fixed-top topnav" role="navigation">
    <div class="container fluid">
        <!-- Navbar-header -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#head-nav">
                <div class="menuBtn">
                    <div class="line line1"></div>
                    <div class="line line2"></div>
                    <div class="line line3"></div>
                </div>
            </button>
            <!-- LOGO -->
            <a class="navbar-brand logo" href="#">
                <img src="<?php echo htmlentities(__MY__STATIC__); ?>/home/image/logo.png" style="height: 100%;">
            </a>
        </div>
        <!-- navbar-header -->
        <div class="navbar-collapse collapse nav-list" id="head-nav">
            <ul class="nav navbar-nav navbar-right">
                <?php foreach($cloumn as $v): if(($v['level']==0)): ?>
                <li>
                    <a href="<?php echo url($v['action']); ?>" action="<?php echo $v['action']; ?>"><?php echo $v['name']; ?></a>
                </li>
                <?php endif; ?>
                <?php endforeach; ?>
            </ul>
        </div>
        <!--/Menu -->
    </div>
</div>
<div style="height: 51px;"></div>
<script type="text/javascript">   
//nav 
//二级页面需要传来action显示在哪个nav
var action = "<?php echo htmlentities($action); ?>"!==""?"<?php echo htmlentities($action); ?>":"<?php echo htmlentities(app('request')->action()); ?>";
$(".nav li a").each(function(i,item){
    if($(this).attr('action')==action)
    {
        $(item).parent().addClass('active');
    }
})
//手机nav
$(".menuBtn").click(function(){
    $(this).toggleClass('tran');
});
</script>
    <!-- slide -->
    <div class="slide color-bank slide-pc">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <?php foreach($slide as $v): if(($v['type']=='slide')): ?>
                <div class="swiper-slide">
                    <a href="#">
                        <img src="<?php echo htmlentities($v['url']); ?>">
                    </a>
                </div>
                <?php endif; ?>
                <?php endforeach; ?>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div> 
    <!-- slide-phone -->
    <div class="slide color-bank slide-phone" style="display: none;">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <?php foreach($slide as $v): if(($v['type']=='slide-phone')): ?>
                <div class="swiper-slide">
                    <a href="#">
                        <img src="<?php echo htmlentities($v['url']); ?>">
                    </a>
                </div>
                <?php endif; ?>
                <?php endforeach; ?>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div> 
    <!-- video -->
    <div class="video color-bank1">
        <div class="container">
            <div class="row video-des">
                <h1 class="font-y">野嘀寻味记</h1>
                <p class="font-sy font-17">我们一直在路上为您寻找最美的味道</p>
            </div>
            <div class="row video-main">
              <?php foreach($video as $v): ?>
              <div class="col-lg-4 col-sm-4 col-xs-12">
                <a href="<?php echo url('video',['id'=>$v['id']]); ?>">
                    <img src="<?php echo $v['img_url']; ?>" class="video-bg">
                    <div class="video-play">
                        <img src="<?php echo htmlentities(__MY__STATIC__); ?>/home/image/play.png">
                    </div>
                    <div class="video-title">
                        <div class="font-sy font-17"><?php echo date('Y/m/d',$v['add_time']); ?></div>
                        <div class="font-y font-20"><?php echo $v['download_name']; ?></div>
                    </div>
                </a>
              </div>
              <?php endforeach; ?>
            </div>
        </div> 
    </div>
    <!-- footer -->
<div class="footer">
    <div class="footer-top">
        <img src="<?php echo htmlentities(__MY__STATIC__); ?>/home/image/top.png">
        <div class="footer-top-line"></div>
    </div>
    <script type="text/javascript">
        $(".footer-top img").click(function(){
            $('body,html').animate({scrollTop:0},500);
        });
    </script>
    <div class="footer-link color-bank">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-xs-12 footer-link-left">
                    <p class="footer-link-left-links">
                        <a target="_blank" href="<?php echo url('product'); ?>" class="font-link">关于生鲜</a><b>|</b>
                        <a target="_blank" href="<?php echo url('ydst'); ?>" class="font-link">野嘀生态体系</a><b>|</b>
                        <a target="_blank" href="<?php echo url('news'); ?>" class="font-link">新闻资讯</a>
                    </p>
                    <p class="footer-link-left-phone font-y">
                        联系电话：<?php echo htmlentities($config['phone']); ?>
                    </p>
                    <p class="footer-link-left-copyright font-link">
                        <?php echo $config['copyright']; ?>
                        
                    </p>
                </div>
                <div class="col-lg-6 col-sm-6 col-xs-12 footer-link-right">
                    <?php foreach($footer as $v): if(($v['type']=='footer')): ?>
                    <div class="col-lg-4 col-sm-4 col-xs-4">
                        <p class="font-link">
                            <?php if(($v['icon'])): ?>
                            <span class="iconfont <?php echo htmlentities($v['icon']); ?>"></span>
                            <?php endif; ?>
                            <?php echo htmlentities($v['link_name']); ?>
                        </p>
                        <img src="<?php echo $v['img_url']; ?>">
                    </div> 
                    <?php endif; ?>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>

    <div class="top" id="top">
        <a href="#top">
            <span class="iconfont icon-fanhuidingbu"></span>
        </a>
    </div>
</div>


</body>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/bootstrap/js/bootstrap.min.js"></script><script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/swiper/js/swiper.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/home/js/public.js"></script>


<script>
    var mySwiper = new Swiper('.swiper-container', {
        autoplay: true,//可选选项，自动滑动
        pagination: {
            el: '.swiper-pagination',
            clickable:true,
        },
    })
</script>
</html>
