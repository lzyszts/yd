<?php
namespace app\server;
use think\Db;
/**
 * 统计数据处理类
 */
class Access
{	
    private $year;
    private $month;
    private $day;
    private $date;
    private $insertData;

    public function __construct(){
        $this->year=date('Y');
        $this->month=date('m');
        $this->day=date('d');
        $this->date=date('Ymd');
        $this->insertData=[
            'date'=>$this->date,
            'date_y'=>$this->year,
            'date_m'=>$this->month,
            'date_d'=>$this->day,
        ];
    }


    /**
     * 文章+1
     * 不存在则新增一条
     */
    public static function atricle_add(){
        $self=new self();
        $res=Db::name('article_access_log')->where('date',$self->date)->find();
        if($res)
        {
            Db::name('article_access_log')->where('date',$self->date)->setInc('count');
        }else{
            //插入今天数据
            Db::name('article_access_log')->insert($self->insertData);
        }
    }  
    /**
     * 文章-1
     */
    public static function atricle_del(){
        $self=new self();
        $res=Db::name('article_access_log')->where('date',$self->date)->find();
        if($res['count']>0)
        {
            Db::name('article_access_log')->where('date',$self->date)->setDec('count');
        }
    }

    /**
     * 下载次数+1
     */
    public static function donw_add(){
        $self=new self();
        $res=Db::name('download_access_log')->where('date',$self->date)->find();
        if($res)
        {   //有当天数据
            Db::name('download_access_log')->where('date',$self->date)->setInc('count');
            //总数+1
            Db::name('download_access_log')->where('date',$self->date)->setInc('total_count');
        }else{
            //插入今天数据
            $id=Db::name('download_access_log')->insertGetId($self->insertData);
            //取昨天数据
            $yesterday_data=Db::name('download_access_log')->field('total_count')->where('id',$id-1)->find();
            //更新今天数据并且总数=昨天总数+1
            $self->insertData['total_count']=$yesterday_data['total_count']+1;
            Db::name('download_access_log')->where('id',$id)->setInc($self->insertData);
            
        }
    }


    /**
     * 文章总数
     */
    public static function article_count(){
        $article_count=Db::name('article')->count();
        $one=self::this_monday();
        $seven=self::this_sunday();
        $article_week_count=Db::name('article_access_log')->field('SUM(count) count')->where('date','between',$one.','.$seven)->select();
        return [
            'article_count' => $article_count,
            'article_week_count' => $article_week_count[0]['count']==null?0:$article_week_count[0]['count'],
        ];
    }
    /**
     * 下载总数
     * @return [type] [description]
     */
    public static function download_count(){
        $download_count=Db::name('download_access_log')->order('id desc')->find();
        $download_count=$download_count['total_count'];
        $one=self::this_monday();
        $seven=self::this_sunday();
        $download_week_count=Db::name('download_access_log')->field('SUM(count) count')->where('date','between',$one.','.$seven)->select();
        return [
            'download_count' => $download_count,
            'download_week_count' => $download_week_count[0]['count']
        ];
    }

    /**
     * 折线图数据
     * @return [type] [description]
     */
    public static function echarts_data(){
        //下载数据
        $y=date('Y');
        $total_count=[];
        $data=Db::name('download_access_log')->where('date_y',$y)->select();
        $total_count=[];
        for($i=1;$i<=12;$i++)
        {
            $total_count[$i]="";
            //补0
            $i<10?($m="0".$i):$m=$i; 
            foreach ($data as $v) {
                if($v['date_m']==$m)
                {
                    $total_count[$i]=(int)$total_count[$i];
                    $total_count[$i]+=$v['count'];
                }
            }
        }
        return $total_count;

    }



            


    /********************************/

    /**
     * 返回本周1时间
     * @param  integer $timestamp           [某个星期的某一个时间戳，默认为当前时间]
     * @param  boolean $is_return_timestamp [返回时间戳还是日期]
     * @return [type]                       [description]
     */
    public static function this_monday($timestamp=0,$is_return_timestamp=false){ 
        static $cache ; 
        $id = $timestamp.$is_return_timestamp; 
        if(!isset($cache[$id])){ 
            if(!$timestamp) $timestamp = time(); 
            $monday_date = date('Ymd', $timestamp-86400*date('w',$timestamp)+(date('w',$timestamp)>0?86400:-/*6*86400*/518400)); 
            if($is_return_timestamp){ 
                $cache[$id] = strtotime($monday_date); 
            }else{ 
                $cache[$id] = $monday_date; 
            } 
        } 
        return $cache[$id]; 
    } 

    /**
     * 这个星期的星期天 
     * @param  integer $timestamp           [某个星期的内的一个时间戳，默认为当前时间]
     * @param  boolean $is_return_timestamp [是否返回时间戳，否则返回时间格式]
     * @return [type]                       [description]
     */
    public static function this_sunday($timestamp=0,$is_return_timestamp=false){ 
        static $cache; 
        $id = $timestamp.$is_return_timestamp; 
        if(!isset($cache[$id])){ 
            if(!$timestamp) $timestamp = time(); 
            $sunday = self::this_monday($timestamp,true) + 518400; //6*86400
            if($is_return_timestamp){ 
                $cache[$id] = $sunday; 
            }else{ 
                $cache[$id] = date('Ymd',$sunday); 
            } 
        } 
        return $cache[$id]; 
    } 




}
