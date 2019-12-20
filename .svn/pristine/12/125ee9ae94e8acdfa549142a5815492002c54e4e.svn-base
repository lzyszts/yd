<?php
// 应用公共函数
error_reporting(E_ALL & ~E_NOTICE);

/**
 * [GetNumberCode 随机数生成生成]
 * @param    [int] $length [生成位数]
 * @return   [int]         [生成的随机数]
 */
function GetNumberCode($length = 6)
{
    $code = '';
    for($i=0; $i<intval($length); $i++) 
    	$code .= rand(0, 9);
    return $code;
}
/**
 * [LoginPwdEncryption 登录密码加密]
 * @param    [string] $pwd  [需要加密的密码]
 * @param    [string] $salt [配合密码加密的随机数]
 * @return   [string]       [加密后的密码]
 */
function LoginPwdEncryption($pwd, $salt)
{
    return md5($salt.trim($pwd));
}
/**
 * 去掉字符串中间的空格
 * @return [type] [description]
 */
function _trim(&$str){
   $str=preg_replace('# #','',$str);
}

/**
 * 后台公共数据返回
 * 记录日志
 * 返回数据
 * @param      string   $msg    The message
 * @param      integer  $code   The code
 * @param      string   $data   The data
 * @param      string   $type   The type
 */
function return_data($msg='',$code=1,$data="",$type="json"){ 
    //记录日志
    \app\server\Log::addLog($code,$msg);
    //返回数据
    $res=[
        'message' => $msg,
        'code' => $code,
        'data' => $data,
    ];
    switch ($type) {
        case 'text':
            return $res;
            break;
        case 'json':
            return json_encode($res);
            break;
        default:
            # code...
            break;
    }
}
/**
 * 前台公共数据返回
 * 记录日志
 * 返回数据
 * @param      string   $msg    The message
 * @param      integer  $code   The code
 * @param      string   $data   The data
 * @param      string   $type   The type
 */
function home_data($msg='',$code=1,$data="",$type="json"){ 
    //记录日志
    \app\server\Log::addUserLog($code,$msg);
    //返回数据
    $res=[
        'message' => $msg,
        'code' => $code,
        'data' => $data,
    ];
    switch ($type) {
        case 'text':
            return $res;
            break;
        case 'json':
            return json_encode($res);
            break;
        default:
            # code...
            break;
    }
}



/**
 * 封装layui返回格式
 */
function layui_data($data,$count,$code=0,$msg=""){
    $json['code']=$code;
    $json['msg']=$msg;
    $json['count']=$count;
    $json['data']=$data;
    return json_encode($json);
}


/*
 *  array_column 函数
 */

function i_array_column($input, $columnKey, $indexKey=null){
    if(!function_exists('array_column')){
        $columnKeyIsNumber  = (is_numeric($columnKey))?true:false;
        $indexKeyIsNull            = (is_null($indexKey))?true :false;
        $indexKeyIsNumber     = (is_numeric($indexKey))?true:false;
        $result                         = array();
        foreach((array)$input as $key=>$row){
            if($columnKeyIsNumber){
                $tmp= array_slice($row, $columnKey, 1);
                $tmp= (is_array($tmp) && !empty($tmp))?current($tmp):null;
            }else{
                $tmp= isset($row[$columnKey])?$row[$columnKey]:null;
            }
            if(!$indexKeyIsNull){
                if($indexKeyIsNumber){
                    $key = array_slice($row, $indexKey, 1);
                    $key = (is_array($key) && !empty($key))?current($key):null;
                    $key = is_null($key)?0:$key;
                }else{
                    $key = isset($row[$indexKey])?$row[$indexKey]:0;
                }
            }
            $result[$key] = $tmp;
        }
        return $result;
    }else{
        return array_column($input, $columnKey, $indexKey);
    }
}

/**
 * 用表数据生成layui的下拉框
 * @param  [type]  $tableName      [表名]
 * @param  [type]  $selectName     [select的name属性]
 * @param  [type]  $valueFieldName [value的值是哪个字段]
 * @param  [type]  $textFieldName  [option显示哪个字段]
 * @param  boolean $isDefault      [是否有请选择选项]
 * @param  string  $selectedValue  [默认被选择的值]
 * @return [string]                [字符串]
 */
function createLayuiSelect($tableName, $selectName, $valueFieldName, $textFieldName,$isDefault=false, $selectedValue = '')
{
    $model = db($tableName);
    $data = $model->field("$valueFieldName,$textFieldName")->where('delete_time','NULL')->select();
    $select = "<select name='$selectName' lay-filter='$selectName' >";
    if($isDefault)
    {
        $select .= "<option value=''>请选择</option>";
    }
    foreach ($data as $k => $v)
    {
        $value = $v[$valueFieldName];
        $text = $v[$textFieldName];
        if($selectedValue && $selectedValue==$value)
            $selected = 'selected="selected"';
            else
                $selected = '';
                $select .= "<option ".$selected." value='$value'>".$text."</option>";
    }
    $select .= '</select>';
    echo $select;
}
/**
 * 用配置文件生成layui的下拉框
 * @param  boolean $isDefault      [是否有请选择选项]
 * @param  string  $selectedValue  [默认被选择的值]
 * @return [string]                [字符串]
 */
function createConfigSelect($config,$selectName,$isDefault=false, $selectedValue = '')
{
    $config=config($config);
    $data=explode('|',$config);
    $select = "<select name='$selectName' lay-filter='$selectName' >";
    if($isDefault)
    {
        $select .= "<option value=''>无分组</option>";
    }
    foreach ($data as $value)
    {
        if($selectedValue && $selectedValue==$value)
            $selected = 'selected="selected"';
            else
                $selected = '';
                $select .= "<option ".$selected." value='$value'>".$value."</option>";
    }
    $select .= '</select>';
    echo $select;
}


/**
 * type转换为出金入金申请中文
 * @Author   lzy
 * @DateTime 2019-08-26
 * @param    [type]     $type [description]
 * @return   [type]           [description]
 */
function crj($type){
    switch ($type) {
        case '0':
            return "入金申请";
            break;
        case '1':
            return "出金申请";
            break;
        default:
            # code...
            break;
    }
}
/**
 * 出入金状态转中文
 * @Author   lzy
 * @DateTime 2019-08-26
 * @return   [type]     [description]
 */
function order_state($state){
    switch ($state) {
        case '0':
            return '<span class="f30 color-g">已完结</span>';
            break;
        case '1':
            return '<span class="f30 color-v">待审核</span>';
            break; 
        case '2':
            return '<span class="f30 color-r">被驳回</span>';
            break;
        case '3':
            return '<span class="f30 color-bl">已废弃</span>';
            break;
        default:
            # code...
            break;
    }
}