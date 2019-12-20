<?php /*a:3:{s:52:"D:\project\yd\application\admin\view\index\main.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\head.html";i:1576813117;s:53:"D:\project\yd\application\admin\view\public\foot.html";i:1576813117;}*/ ?>
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
<link rel="stylesheet" href="<?php echo htmlentities(__MY__STATIC__); ?>/admin/css/main.css" />
<body>
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">  
		<div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎管理员：
                        <span style="color:#a94442;"><?php echo $username; ?> </span>
                        <span id="nowTime"></span>		          
                    </blockquote>
                </div>
            </div>
      	</div>
      	<!-- 日访问量 -->
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
			  <div class="layui-card-header">
			    访问量
			    <span class="layui-badge layui-bg-blue layuiadmin-badge">天</span>
			  </div>
			  <div class="layui-card-body layuiadmin-card-list">
			    <p class="layuiadmin-big-font">50</p>
			    <p>
			      总计访问量 
			      <span class="layuiadmin-span-color">1万 <i class="layui-inline layui-icon layui-icon-flag"></i></span>
			    </p>
			  </div>
			</div>
		</div>
		<!-- 下载 -->
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
			  <div class="layui-card-header">
			    下载
			    <span class="layui-badge layui-bg-cyan layuiadmin-badge">总</span>
			  </div>
			  <div class="layui-card-body layuiadmin-card-list">
			    <p class="layuiadmin-big-font"><?php echo $download_info['download_count']; ?></p>
			    <p>
			      本周下载 
			      <span class="layuiadmin-span-color"><?php echo $download_info['download_week_count']; ?> <i class="layui-inline layui-icon layui-icon-download-circle"></i></span>
			    </p>
			  </div>
			</div>
		</div>
		<!-- 文章数 -->
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
			  <div class="layui-card-header">
			    文章数
			    <span class="layui-badge layui-bg-green layuiadmin-badge">总</span>
			  </div>
			  <div class="layui-card-body layuiadmin-card-list">
			    <p class="layuiadmin-big-font"><?php echo $article_info['article_count']; ?></p>
			    <p>
			      本周新增
			      <span class="layuiadmin-span-color"><?php echo $article_info['article_week_count']; ?> <i class="layui-inline iconfont icon-rizhi"></i></span>
			    </p>
			  </div>
			</div>
		</div>
		<!-- 待审核 -->
		<div class="layui-col-sm6 layui-col-md3">
			<div class="layui-card">
			  <div class="layui-card-header">
			    待审核
			    <span class="layui-badge layui-bg-red layuiadmin-badge">月</span>
			  </div>
			  <div class="layui-card-body layuiadmin-card-list">

			    <p class="layuiadmin-big-font">0</p>
			    <p>
			      最近一个月 
			      <span class="layuiadmin-span-color">0% <i class="layui-inline layui-icon layui-icon-about"></i></span>
			    </p>
			  </div>
			</div>
		</div>   
		<!-- 访问量图表 -->
		<div class="layui-col-sm12">
			<div class="layui-card">
			    <div class="layui-card-header">
				    访问量
				    <!-- <div class="layui-btn-group layuiadmin-btn-group">
				      <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">去年</a>
				      <a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs">今年</a>
				    </div> -->
			    </div>
			    <div class="layui-card-body">
				    <div class="layui-row">
				    	<!-- 图表 -->
				        <div class="layui-col-sm8">
					        <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-pagetwo">
					            <div id="fwl" style="width: 100%;height:100%;">
					              	<i class="layui-icon layui-icon-loading1 layadmin-loading"></i>
					            </div>
					        </div>
				        </div>
				        <!-- 月访问数 -->
				        <div class="layui-col-sm4">
					        <div class="layuiadmin-card-list">
					          <p class="layuiadmin-normal-font">月访问数</p>
					          <span>同上期增长</span>
					          <div class="layui-progress layui-progress-big" lay-showPercent="yes">
					            <div class="layui-progress-bar" lay-percent="30%"></div>
					          </div>
					        </div>
					        <div class="layuiadmin-card-list">
					          <p class="layuiadmin-normal-font">月下载数</p>
					          <span>同上期增长</span>
					          <div class="layui-progress layui-progress-big" lay-showPercent="yes">
					            <div class="layui-progress-bar" lay-percent="20%"></div>
					          </div>
					        </div>
					        <div class="layuiadmin-card-list">
					          <p class="layuiadmin-normal-font">月下载数</p>
					          <span>同上期增长</span>
					          <div class="layui-progress layui-progress-big" lay-showPercent="yes">
					            <div class="layui-progress-bar" lay-percent="10%"></div>
					          </div>
					        </div>
				        </div>
				    </div>
			    </div>
			</div>
		</div>
		<!-- 系统信息 -->
		<div class="layui-col-sm12">
			<div class="layui-card">
			  <div class="layui-card-header">系统基本参数</div>
			  <div class="layui-card-body">
			    <div class="layui-card-body ">
	                <table class="layui-table">
	                    <tbody>
	                        <tr>
	                            <th>后台版本</th>
	                            <td>1.0</td>
	                        </tr>
	                        <tr>
	                            <th>操作系统</th>
	                            <td><?php echo PHP_OS; ?></td>
	                        </tr>
	                        <tr>
	                            <th>域名</th>
	                            <td><?php echo $_SERVER['SERVER_NAME']; ?></td>
	                        </tr>
	                        <tr>
	                            <th>运行环境</th>
	                            <td><?php echo htmlentities($_SERVER['SERVER_SOFTWARE']); ?></td>
	                        </tr>
	                        <tr>
	                            <th>PHP版本</th>
	                            <td><?php echo PHP_VERSION; ?></td>
	                        </tr>
	                        <tr>
	                            <th>ThinkPHP</th>
	                            <td><?php echo htmlentities(app()->version()); ?></td>
	                        </tr> 
	                        <tr>
	                            <th>上传附件限制</th>
	                            <td><?php echo get_cfg_var("upload_max_filesize"); ?></td>
	                        </tr>
	                    </tbody>
	                </table>
                </div>
			  </div>
			</div>
		</div>
        
      </div>
    </div>
  </div>
</body>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/layui/layui.js"></script>
<?php if(!empty($js)): foreach($js as $hook): ?>
        <script type="text/javascript" src="<?php echo htmlentities($hook); ?>" ></script>
    <?php endforeach; ?>
<?php endif; ?>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/echarts/echarts4.2.1.min.js"></script>
<script type="text/javascript" src="<?php echo htmlentities(__MY__STATIC__); ?>/common/echarts/theme.js"></script>
<script type="text/javascript">
$(function(){
	//初始化时间
	getLangDate();
});

//访问量图表
var myChart = echarts.init($("#fwl")[0],echartsTheme);
var download_data='<?php echo $echarts_data; ?>';
//转数组
download_data=download_data.split(',');

var option = 
      {
        tooltip : {
          trigger: 'axis'
        },
        calculable : true,
        legend: {
          data:['访问量','下载量']
        },
        
        xAxis : [
          {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
          }
        ],
        yAxis : [
          {
            type : 'value',
            name : '访问量',
            axisLabel : {
              formatter: '{value}'
            }
          },
          {
            type : 'value',
            name : '下载量',
            axisLabel : {
                formatter: '{value}'
            }
          }
        ],
        series : [
          {
            name:'访问量',
            type:'line',
            data:[0, 120, 180, 200, 200, 210, 240, 250, 270, 300, 310, 320]
          },
          {
            name:'下载量',
            type:'line',
            yAxisIndex: 1,
            data:download_data
          }
        ]
      }
myChart.setOption(option);
window.onresize = myChart.resize;

layui.use('element',function(){});

//值小于10时，在前面补0
function dateFilter(date){
    if(date < 10){return "0"+date;}
    return date;
}
function getLangDate(){
    var dateObj = new Date(); //表示当前系统时间的Date对象
    var year = dateObj.getFullYear(); //当前系统时间的完整年份值
    var month = dateObj.getMonth()+1; //当前系统时间的月份值
    var date = dateObj.getDate(); //当前系统时间的月份中的日
    var day = dateObj.getDay(); //当前系统时间中的星期值
    var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
    var week = weeks[day]; //根据星期值，从数组中获取对应的星期字符串
    var hour = dateObj.getHours(); //当前系统时间的小时值
    var minute = dateObj.getMinutes(); //当前系统时间的分钟值
    var second = dateObj.getSeconds(); //当前系统时间的秒钟值
    var timeValue = "" +((hour >= 12) ? (hour >= 18) ? "晚上" : "下午" : "上午" ); //当前时间属于上午、晚上还是下午
    newDate = dateFilter(year)+"年"+dateFilter(month)+"月"+dateFilter(date)+"日 "+" "+dateFilter(hour)+":"+dateFilter(minute)+":"+dateFilter(second);
    document.getElementById("nowTime").innerHTML = timeValue+"好！ 当前时间为： "+newDate+"　"+week;
    setTimeout("getLangDate()",1000);
}

</script>

</html>