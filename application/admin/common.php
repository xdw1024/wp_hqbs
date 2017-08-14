<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use \think\Session;
use \think\Cookie;
use think\Config;
use \think\Db;
use think\Cache;

if (!function_exists('zw_set_password'))
{
    /**
     * 密码加密方法
     * @param string $password 要加密的字符串
     * @param string $auth_code 干扰字符串
     * @return string
     */
    function zw_set_password($password, $auth_code = AUTH_CODE){
        if (PHP_VERSION_ID >= 50500) {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            if ($hash === false) {
                $hash = hash('sha512', hash('sha512', hash('sha512', $password, $auth_code), $auth_code), $auth_code);
                $hash = base64_encode($hash);
            }
        } else {
            $hash = hash('sha512', hash('sha512', hash('sha512', $password, $auth_code), $auth_code), $auth_code);
            $hash = base64_encode($hash);
        }
        return $hash;
    }
}

if (!function_exists('zw_compare_password'))
{
    /**
     * 密码比较方法,所有涉及密码比较的地方都用这个方法
     * @param string $password 要比较的密码
     * @param string $password_in_db 数据库保存的已经加密过的密码
     * @return boolean 密码相同，返回true
     */
    function zw_compare_password($password, $password_in_db){
        if (PHP_VERSION_ID >= 50500) {
            if (password_verify($password, $password_in_db)) {
                return true;
            }
        }
        return zw_set_password($password) == $password_in_db;
    }
}

if (!function_exists('zw_sprint_result'))
{
    /**
     * 作者：zzwu
     * 功能：格式化返回数据
     * @param $data string | array 格式化的数据
     * @param $message string 需要返回的提示信息
     * @param $status  string  需要返回的状态
     * @param $type string 格式化数据类型，默认json
     * @return  string 返回序列化的字符串
     */
    function zw_sprint_result($message, $data = null, $status = SUCCESS_CODE, $type = 'json')
    {
        $result = [
            'message' => $message,
            'data'    => $data
        ];
        switch ($status)
        {
            case SUCCESS_CODE:
                $result['status']  = SUCCESS_CODE;
                break;
            default:
                $result['status']  = FAIL_CODE;
                break;
        }

        switch ($type)
        {
            case 'json':
                $result = json($result);
                break;
            case 'xml':
                $result = xml($result);
                break;
            default:
                break;
        }

        return $result;
    }
}

if (!function_exists('zw_sprint_date'))
{
    /**
     * 作者   ：zzwu
     * 功能   ：格式化时间
     * @param string $type 格式化的格式
     * @param int $time 需要格式化的时间戳
     * @return  string 空 或者 时间格式
     */
    function zw_sprint_date($type = 'Y/m/d', $time)
    {
        if (isset($time))
        {
            return date($type, $time);
        }
        return '';
    }
}

if (!function_exists('zw_get_admin_user_name'))
{
    /**
     * 获取当前登陆用户id 未完成 20170329
     * @return string | boolean 获取成功，返回管理员用户名（即id） 失败false
     */
    function zw_get_admin_user_name()
    {
        return Session::has(Config::get('session_setting')['admin_name']) ? Session::get(Config::get('session_setting')['admin_name']) : '';
    }
}

if(!function_exists('zw_authentication_current_user'))
{
    /**
     * 作者   ：zzwu
     * 功能   ：判断当前用户是否有权限操作（后台菜单）
     * @param $controller string 控制器
     * @param $method string 方法
     * @return string | false  如果当前有管理员帐号处于登录状态，返回当前管理员帐号名，否则返回false
     */
    function zw_authentication_current_user($controller, $method = 'index')
    {
        $authentication = [];
        if (Cache::has('authentication_'.zw_get_admin_user_name()))
        {
            $authentication = unserialize(Cache::get('authentication_'.zw_get_admin_user_name()));
        }
        else {
            $result = Db::view('admin_menu', 'menu_id,controller,method')
                ->view('sys_role_menu', 'sys_role_id', 'sys_role_menu.menu_id=admin_menu.menu_id')
                ->view('sys_user_role', ['sys_role_id' => 's_r_id'], 'sys_role_menu.sys_role_id=sys_role_menu.sys_role_id')
                ->where(['sys_user_role.maccount_id' => lw_get_current_admin_id()])
                ->select();
            if (is_array($result) && count($result) != 0)
            {
                foreach ($result as $value)
                {
                    $authentication[] = strtolower($value['controller'].$value['method']);
                }
                Cache::set('authentication_'.zw_get_admin_user_name(), serialize($authentication));
            }
        }
        return (in_array(strtolower($controller.$method), $authentication))? true : false;
    }
}

if (!function_exists('zw_set_session_in_login'))
{
    /**
     * 管理员|普通用户 登陆成功，设置session
     * @param array $user 要设置session的用户
     * @return boolean 设置成功，返回true
     */
    function zw_set_session_in_login($user){
        if (is_array($user) && (count($user) != 0))
        {
            //存session
            if (!empty($user['maccount_id']))
            {
                Session::set(Config::get('session_setting')['admin_id'],$user['maccount_id']);
                /** 存用户角色等级 1：超级管理员； 2：普通管理员*/
                $result = Db::view('sys_role','role_prototype')
                    ->view('sys_user_role', 'maccount_id', 'sys_user_role.sys_role_id=sys_role.sys_role_id')
                    ->where(['sys_user_role.maccount_id' => $user['maccount_id']])
                    ->find();
                (is_array($result) && count($result) != 0) ? Session::set(Config::get('session_setting')['role_prototype'],$result['role_prototype']) : null;
            }
            if (!empty($user['maccount_name']))
            {
                $user['mreal_name'] = empty($user['mreal_name']) ? $user['maccount_name'] : $user['mreal_name'];
                Session::set(Config::get('session_setting')['admin_name'],$user['mreal_name']);
                (!empty($user['party_org_id'])) ? Session::set('party_org_id', $user['party_org_id']) : null;
                Cookie::set(Config::get('session_setting')['admin_name'], $user['mreal_name'], 3600 * 24 * 7);
            }
            //如果是普通用户登录
            if (!empty($user['party_member_id']))
            {   Session::set(Config::get('session_setting')['user_id'],$user['party_member_id']);
                $user['user_name'] = empty($user['name']) ? $user['user_name'] : $user['name'];
                Session::set(Config::get('session_setting')['admin_name'],$user['user_name']);
                //(!empty($user['party_org_id'])) ? Session::set('party_org_id', $user['party_org_id']) : null;
                Cookie::set(Config::get('session_setting')['admin_name'], $user['user_name'], 3600 * 24 * 7);
            }
            return true;
        }
        return false;
    }
}

if (!function_exists('zw_get_current_user_party_org_id'))
{
    /**
     * 获取当前管理员的所在党组织
     * @return boolean 获取成功，返回id，获取失败，返回空
     */
    function zw_get_current_user_party_org_id()
    {
       return Session::has('party_org_id') ? Session::get('party_org_id') : null;
    }
}

if (!function_exists('zw_clear_session_in_logout'))
{
    /**
     * 用户退出成功，清除Session和Cookie
     * @return boolean 清除成功，返回true
     */
    function zw_clear_session_in_logout()
    {
        Session::clear();
        Cookie::clear();
        return true;
    }
}

if (!function_exists('lw_can_login'))
{
    /**
     * 作者   ：nlw
     * 判断用户帐号是否有权限登录
     * @param  string $username 要判断的用户帐号
     * @return boolean 清除成功，返回true
     */
    function lw_can_login($username)
    {
        if (is_string($username))
        {
            $has_user = Db::name('party_member')->field('*')->where(['maccount_name' => $username])->find();
            if (is_array($has_user) && count($has_user) != 0)
            {
                return ($has_user['is_use'] == TRUE_STATUS) ? true : false;
            }
        }
        return false;
    }
}

if (!function_exists('lw_is_login'))
{

    /**
     * 作者   ：nlw
     * 检查用户是否已登录
     * @return boolean
     */
    function lw_is_login()
    {
        return Session::has(Config::get('session_setting')['admin_id']) || Session::has(Config::get('session_setting')['user_id']);
    }
}

if (!function_exists('zw_get_admin_menu'))
{
    /**
     * 功能：生成后台菜单
     * 作者：zzwu
     * 时间：20170413
     * @return string
     */
    function zw_get_admin_menu()
    {
        $html = '';
        $result = Db::view('admin_menu', '*')
            ->view('sys_role_menu', ['menu_id' => 'm_id'], 'sys_role_menu.menu_id=admin_menu.menu_id')
            ->view('sys_user_role', 'maccount_id', 'sys_user_role.sys_role_id=sys_role_menu.sys_role_id')
            ->where(['sys_user_role.maccount_id' => lw_get_current_admin_id(), 'admin_menu.status' => 1])
            ->order('admin_menu.sort_num', 'desc')
            ->select();
        if (is_array($result) && count($result) != 0)
        {
            foreach ($result as $item) {
                $html .= '<li><a href="' . zw_build_url($item['controller'] . '/' . $item['method']) . '"><i class="fa ' . $item['icon'] . '"></i>' . $item['menu_name'] . '</a></li>';
            }
        }
        return $html;
    }
}

if (!function_exists('zw_build_url'))
{
    /**
     * 功能：生成url
     * 作者：zzwu
     * 时间：20170413
     * @param string        $url 路由地址
     * @param string|array  $vars 变量
     * @param bool|string   $suffix 生成的URL后缀
     * @param bool|string   $domain 域名
     * @return string
     */
    function zw_build_url($url = '', $vars = '', $suffix = false, $domain = false)
    {
        return url($url, $vars, $suffix, $domain);
    }
}

if(!function_exists('lw_get_current_admin_id'))
{
    /**
     * 作者   ：nlw
     * 获取当前登录的管理员帐号id
     * @return string | false  如果当前有管理员帐号处于登录状态，返回当前管理员帐号名，否则返回false
     */
    function lw_get_current_admin_id()
    {
        return (Session::has(Config::get('session_setting')['admin_id'])) ? Session::get(Config::get('session_setting')['admin_id']) : false;
    }
}

if(!function_exists('zw_get_user_role_prototype'))
{
    /**
     * 作者   ：zzwu
     * 获取当前登录的管理员帐号的角色等级（true：超级管理员， false：普通管理员）
     * @return bool 返回当前管理员等级（true：超级管理员， false：普通管理员）
     **/
    function zw_get_user_role_prototype()
    {
//        return (Session::has(Config::get('session_setting')['role_prototype'])) ? Session::get(Config::get('session_setting')['role_prototype']) : false;
        if ((Session::has(Config::get('session_setting')['role_prototype'])))
        {
            return (Session::get(Config::get('session_setting')['role_prototype']) == 1) ? true : false;
        }
        return false;
    }
}

if (!function_exists('lw_menu_left'))
{

    /**作者  ：nlw
     * 返回按层级加前缀的菜单数组
     * @author  rainfer
     * @param array|mixed $menu 待处理菜单数组
     * @param string $id_field 主键id字段名
     * @param string $pid_field 父级字段名
     * @param string $lefthtml 前缀
     * @param int $pid 父级id
     * @param int $lvl 当前lv
     * @param int $leftpin 左侧距离
     * @return array
     */
    function lw_menu_left($menu,$id_field='id',$pid_field='pid',$lefthtml = '─' , $pid=0 , $lvl=0, $leftpin=0)
    {
        $arr=array();
        foreach ($menu as $v){
            if($v[$pid_field]==$pid){
                $v['lvl']=$lvl + 1;
                $v['leftpin']=$leftpin;
                $v['lefthtml']='├'.str_repeat($lefthtml,$lvl);
                $arr[]=$v;
                $arr= array_merge($arr,lw_menu_left($menu,$id_field,$pid_field,$lefthtml,$v[$id_field], $lvl+1 ,$leftpin+20));
            }
        }
        return $arr;
    }
}

if (!function_exists('zw_get_content_org_subordinate'))
{

    /**作者  ：zzwu
     * 功能：获取当前管理用户所属的下级组织
     * @return array
     */
    function zw_get_content_org_subordinate()
    {
        $org_result = Db::view('party_org', '*')
            ->view('manage_account', 'maccount_id', 'manage_account.party_org_id=party_org.party_org_id')
            ->where(['maccount_id' => lw_get_current_admin_id()])
            ->find();
        $result = zw_get_org_subordinate($org_result);
        return is_array($result) && count($result) != 0 ? $result : [];
    }
}

if (!function_exists('zw_get_content_org_higher_ups'))
{

    /**作者  ：zzwu
     * 功能：获取当前管理用户上级组织
     * @return array
     */
    function zw_get_content_org_higher_ups()
    {
        $org_result = Db::view('party_org', '*')
            ->view('manage_account', 'maccount_id', 'manage_account.party_org_id=party_org.party_org_id')
            ->where(['maccount_id' => lw_get_current_admin_id()])
            ->find();
        $result = zw_get_org_higher_ups($org_result);
        return is_array($result) && count($result) != 0 ? $result : [];
    }
}
//1 select * from tree where lft between 1 and 6 and rgt between 7 and 20 order by lft desc

if (!function_exists('zw_get_org_higher_ups'))
{
    /**作者  ：zzwu
     * 功能：根据组织id获取直隶上级组织
     * @param $org array 组织节点
     * @return boolean array
     */
    function zw_get_org_higher_ups($org)
    {
        $result = false;
        if (is_array($org) && count($org) != 0)
        {
            $result = Db::view('party_org', '*')
                ->where('lft', '<=', $org['lft'])
                ->where('rgt', '>=', $org['rgt'])
//                ->where('level', '<=', 4)
                ->order('party_org_number')
                ->select();
        }
        return $result;
    }
}

if (!function_exists('zw_get_org_subordinate'))
{
    /**作者  ：zzwu
     * 功能：根据组织id获取下级组织
     * @param $org array 组织节点
     * @return boolean array
     */
    function zw_get_org_subordinate($org)
    {
        $result = false;
        if (is_array($org) && count($org) != 0)
        {
            $result = Db::view('party_org', '*')
                ->where('lft', '>=', $org['lft'])
                ->where('rgt', '<=', $org['rgt'])
//                ->where('level', '<=', 4)
                ->order('party_org_number')
                ->select();
        }
        return $result;
    }
}

if (!function_exists('zw_get_org_name'))
{

    /**作者  ：zzwu
     * 功能：获取组织名称
     * @param $org_id int 组织id
     * @return string
     */
    function zw_get_org_name($org_id)
    {
        if (!isset($org_id)) return '';
        $org_result = Db::view('party_org', 'party_org_id,party_org_name')
            ->where(['party_org_id' => $org_id])
            ->find();
        return (is_array($org_result) && count($org_result) != 0) ? $org_result['party_org_name'] : '';
    }
}

/**
 * 记录日志
 * @param $content
 * @param string $file
 */
function my_logger($content,$file="log.txt") {
    $content = json_encode($content,JSON_UNESCAPED_UNICODE);
    $base_path = rtrim($_SERVER['DOCUMENT_ROOT'],'/')."/hqbs/logs/";
    $myfile = $base_path.$file;
    //echo $myfile;
    $times = date('Y-m-d H:i:s', time());
    $string = $times.'======>'.$content."\n\r";
    file_put_contents($myfile, $string , FILE_APPEND);
}

if (!function_exists('sy_isset_count'))
{
    /**作者
     * 功能：
     * @param $data
     */
    function sy_isset_count($data)
    {
        if(empty($data)){
            $data['count'] = '0';
            return $data;
        }
        if(count($data) == count($data,1)){
            if (!isset($data['count'])){
                $data['count'] = '0';
            };
        }else{
            foreach ($data as $key => $value){
                if (!isset($value['count'])){
                    $value['count'] = '0';
                }
            }
        };
        return $data;
    }
}

if (!function_exists('sy_statistics_criminal'))
{
    /**作者
     * 功能：统计刑事案件
     * @param $data
     */
    function sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org)
    {
        $year_month = date('Y-m',strtotime($thismonth_start));
        $thisyear = date('Y',strtotime($thismonth_start));
        $last_year = $thisyear -1;
        $next_year = $thisyear +1;
        $thismonth = date('m-d',strtotime($thismonth_start));
        $thismonth_end_day = date('m-d',strtotime($thismonth_end));
        $thisyear_start = $thisyear."-01-01";
        $thisyear_end = $next_year."-01-01";
        $lastmongth_start = $last_year."-$thismonth";
        $lastmongth_end = $last_year."-$thismonth_end_day";

        $data = Db::query("SELECT bc.case_type_id,bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.case_type_id,bc.status");
        $this_month_data = Db::query("SELECT bc.flag,bc.status,bc.filing_time,bc.detection_time,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.status,bc.flag,bc.filing_time,bc.detection_time");
        //统计补立年前案
        $flag_la_data = sy_isset_count(Db::query("SELECT bc.flag,bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (filing_time <= '$thisyear_start') AND (bc.status = '0') AND (org_id = '$org_id') GROUP BY bc.status,bc.flag"));
        //统计去年同期立案（起）
        $last_yaer_month_data =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '0') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计当月破当月立案（起）
        $this_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time >= '$thismonth_start') AND (filing_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计去年当月破当月立案（起）
        $last_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (filing_time >= '$lastmongth_start') AND (filing_time <= '$lastmongth_end') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计去年当月共破案（起）
        $last_month_total_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计去年同期破案（起）
        $last_yaer_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计破年内案（起）
        $pa_this_year_data = sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time <= '$thisyear_end') AND (filing_time >= '$thisyear_start') AND (org_id = '$org_id') GROUP BY bc.status"));
        //统计破年前按（起）
        $pa_last_total_data = sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time <= '$thisyear_start') AND (org_id = '$org_id') GROUP BY bc.status"));
        //判断当月是否立,破案
        if(empty($this_month_data)){
            //统计共立案（起）
            $month_total_la = '0';
            //统计共破案（起）
            $month_total_pa = '0';
            //统计补立月前案
            $month_no_flag_la = '0';
            //统计立月内案
            $month_flag_la = '0';
        }
        else{
            $la = '0';
            $pa = '0';
            foreach ($this_month_data as $k => $c){
                if($c['filing_time'] != null){
                    $la = $la+1;
                }
                if($c['detection_time'] != null){
                    $pa = $pa+1;
                }
                if(($c['flag'] == '0') && ($c['filing_time'] >= $thismonth_start)){
                    $flag_count[] = $c['count'];
                }
                if (($c['flag'] == '1')){
                    $no_flag_count[] = $c['count'];
                }
            }
           if(!isset($flag_count)){
               $month_flag_la = '0';
           }
           else{
               //统计立月内案
               $month_flag_la = array_sum($flag_count);
           }
            if(!isset($no_flag_count)){
                $month_no_flag_la = '0';
            }
            else{
                //统计补立月前案
                $month_no_flag_la = array_sum($no_flag_count);
            }
            //统计共立案（起）
            $month_total_la = $la;
            //统计共破案（起）
            if(empty($pa)){
                $month_total_pa = '0';
            }
            else{
                $month_total_pa = $pa;
            }
        }
        //统计立案增减比
        if($last_yaer_month_data['count'] == '0'){
            $decrease_ratio = round($month_total_la*100).'%';
        }
        else{
                $decrease_ratio = round((($month_total_la - $last_yaer_month_data['count'])/$last_yaer_month_data['count'])*100).'%';
        }
        //统计当月破案率
        if(!isset($this_month_pa['count'])){
            $this_month_pa = $this_month_pa[0];
        }
        if($month_total_pa == '0'){
            $this_month_figures = round(0*100).'%';
        }
        else{
            $this_month_figures = round(($this_month_pa['count']/$month_total_pa)*100).'%';
        }
        //统计去年当月破案率
        if($last_month_total_pa['count'] == '0'){
            $last_month_figures = round(0*100).'%';
        }
        else{
            $last_month_figures = round(($last_month_pa['count']/$last_month_total_pa['count'])*100).'%';
        }
        //统计破案与去年同期相比增减（百分点）
        if($last_month_figures == '0%'){
            $pa_ratio = round($this_month_figures);
        }
        else{
            $pa_ratio = round(($this_month_figures - $last_month_figures)/$last_month_figures);
        }
        $type_id = Db::view('hq_bg_case_type','*')
            ->where('type_category','1')
            ->order('id')
            ->select();
        foreach ($type_id as $key => $value){
            foreach ($data as $k => $v){
                if(($value['id'] == $v['case_type_id']) && ($v['status'] == '0')){
                    $value['la_sum'] = $v['count'];
                }
                elseif(($value['id'] == $v['case_type_id']) && ($v['status'] == '1')){
                    $value['pa_sum'] = $v['count'];
                }
            }
            if(array_key_exists('la_sum',$value)){
                $value['la_sum'] = $value['la_sum'];
            }
            else{
                $value['la_sum'] = '0';
            }
            if(array_key_exists('pa_sum',$value)){
                $value['pa_sum'] = $value['pa_sum'];
            }
            else{
                $value['pa_sum'] = '0';
            }
            $type_id[$key] = $value;
        }
        foreach ($type_id as $key => $value){
            $la_sum = null;
            $pa_sum = null;
            foreach($type_id as $k => $v){
                if($value['id'] == $v['parent_id']){
                    $la_sum[] = $v['la_sum'];
                    $pa_sum[] = $v['pa_sum'];
                }
            }
            if (isset($la_sum)){
                $value['la_sum'] = array_sum($la_sum);
            }
            else{
                $value = $value;
            }
            if (isset($pa_sum)){
                $value['pa_sum'] = array_sum($pa_sum);
            }
            else{
                $value = $value;
            }
            $type_id[$key] = $value;
        }
        if(!isset($flag_la_data['count'])){
            $flag_la_data = $flag_la_data[0];
        }
        if(!isset($pa_this_year_data['count'])){
            $pa_this_year_data = $pa_this_year_data[0];
        }
        if(!isset($pa_last_total_data['count'])){
            $pa_last_total_data = $pa_last_total_data[0];
        }
        $lp_data = [
            'party_org_name' => $org['party_org_name'],
            'month_total_la' =>$month_total_la,
            'month_flag_la' =>$month_flag_la,
            'month_no_flag_la' =>$month_no_flag_la,
            'flag_la_data' =>$flag_la_data['count'],
            'last_yaer_month_data' =>$last_yaer_month_data['count'],
            'decrease_ratio' =>$decrease_ratio,
            'month_total_pa' =>$month_total_pa,
            'pa_this_year_data' =>$pa_this_year_data['count'],
            'pa_last_total_data' =>$pa_last_total_data['count'],
            'last_yaer_month_pa' =>$last_yaer_month_pa['count'],
            'this_month_figures' =>$this_month_figures,
            'last_month_figures' =>$last_month_figures,
            'pa_ratio' =>$pa_ratio,
            'type_id'=>$type_id,
        ];
        $list[] = $lp_data;
        return $list;
    }
}

if (!function_exists('sy_criminal_subtotal'))
{
    /**作者
     * 功能：刑事案件小计
     * @param $data
     */
    function sy_criminal_subtotal($thismonth_start,$thismonth_end,$org_id)
    {
        $org_result = Db::view('party_org', '*')
            ->where(['party_org_id'=>$org_id])
            ->find();
        $ids= zw_get_org_subordinate($org_result);
        $org_id = implode(',', array_column($ids, 'party_org_id'));

        $year_month = date('Y-m',strtotime($thismonth_start));
        $thisyear = date('Y',strtotime($thismonth_start));
        $last_year = $thisyear -1;
        $next_year = $thisyear +1;
        $thismonth = date('m-d',strtotime($thismonth_start));
        $thismonth_end_day = date('m-d',strtotime($thismonth_end));
        $thisyear_start = $thisyear."-01-01";
        $thisyear_end = $next_year."-01-01";
        $lastmongth_start = $last_year."-$thismonth";
        $lastmongth_end = $last_year."-$thismonth_end_day";

        $data = Db::query("SELECT bc.case_type_id,bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.case_type_id,bc.status");
        $this_month_data = Db::query("SELECT bc.flag,bc.status,bc.filing_time,bc.detection_time,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.status,bc.flag,bc.filing_time,bc.detection_time");
        $a = "SELECT bc.flag,bc.status,bc.filing_time,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.status,bc.flag,bc.filing_time";
        //统计补立年前案
        $flag_la_data = sy_isset_count(Db::query("SELECT bc.flag,bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (filing_time <= '$thisyear_start') AND (bc.status = '0') AND (org_id in ($org_id)) GROUP BY bc.status,bc.flag"));
        //统计去年同期立案（起）
        $last_yaer_month_data =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '0') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计当月破当月立案（起）
        $this_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time >= '$thismonth_start') AND (filing_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计去年当月破当月立案（起）
        $last_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (filing_time >= '$lastmongth_start') AND (filing_time <= '$lastmongth_end') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计去年当月共破案（起）
        $last_month_total_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计去年同期破案（起）
        $last_yaer_month_pa =  sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$lastmongth_start') AND (create_time <= '$lastmongth_end') AND (bc.status = '1') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计破年内案（起）
        $pa_this_year_data = sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time <= '$thisyear_end') AND (filing_time >= '$thisyear_start') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //统计破年前按（起）
        $pa_last_total_data = sy_isset_count(Db::query("SELECT bc.status,count(bc.status) FROM hq_bg_criminal_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (bc.status = '1') AND (filing_time <= '$thisyear_start') AND (org_id in ($org_id)) GROUP BY bc.status"));
        //判断当月是否立,破案
        if(empty($this_month_data)){
            //统计共立案（起）
            $month_total_la = '0';
            //统计共破案（起）
            $month_total_pa = '0';
            //统计补立月前案
            $month_no_flag_la = '0';
            //统计立月内案
            $month_flag_la = '0';
        }
        else{
            $la = '0';
            $pa = '0';
            foreach ($this_month_data as $k => $c){
                if($c['filing_time'] != null){
                    $la = $la+1;
                }
                if($c['detection_time'] != null){
                    $pa = $pa+1;
                }
                if(($c['flag'] == '0') && ($c['filing_time'] >= $thismonth_start)){
                    $flag_count[] = $c['count'];
                }
                if (($c['flag'] == '1')){
                    $no_flag_count[] = $c['count'];
                }
            }
            if(!isset($flag_count)){
                $month_flag_la = '0';
            }
            else{
                //统计立月内案
                $month_flag_la = array_sum($flag_count);
            }
            if(!isset($no_flag_count)){
                $month_no_flag_la = '0';
            }
            else{
                //统计补立月前案
                $month_no_flag_la = array_sum($no_flag_count);
            }
            //统计共立案（起）
            $month_total_la = $la;
            //统计共破案（起）
            if(empty($pa)){
                $month_total_pa = '0';
            }
            else{
                $month_total_pa = $pa;
            }
        }
        //统计立案增减比
        if($last_yaer_month_data['count'] == '0'){
            $decrease_ratio = round($month_total_la*100).'%';
        }
        else{
            $decrease_ratio = round((($month_total_la - $last_yaer_month_data['count'])/$last_yaer_month_data['count'])*100).'%';
        }
        //统计当月破案率
        if(!isset($this_month_pa['count'])){
            $this_month_pa = $this_month_pa[0];
        }
        if($month_total_pa == '0'){
            $this_month_figures = round(0*100).'%';
        }
        else{
            $this_month_figures = round(($this_month_pa['count']/$month_total_pa)*100).'%';
        }
        //统计去年当月破案率
        if($last_month_total_pa['count'] == '0'){
            $last_month_figures = round(0*100).'%';
        }
        else{
            $last_month_figures = round(($last_month_pa['count']/$last_month_total_pa['count'])*100).'%';
        }
        //统计破案与去年同期相比增减（百分点）
        if($last_month_figures == '0%'){
            $pa_ratio = round($this_month_figures);
        }
        else{
            $pa_ratio = round(($this_month_figures - $last_month_figures)/$last_month_figures);
        }
        $type_id = Db::view('hq_bg_case_type','*')
            ->where('type_category','1')
            ->order('id')
            ->select();
        foreach ($type_id as $key => $value){
            foreach ($data as $k => $v){
                if(($value['id'] == $v['case_type_id']) && ($v['status'] == '0')){
                    $value['la_sum'] = $v['count'];
                }
                elseif(($value['id'] == $v['case_type_id']) && ($v['status'] == '1')){
                    $value['pa_sum'] = $v['count'];
                }
            }
            if(array_key_exists('la_sum',$value)){
                $value['la_sum'] = $value['la_sum'];
            }
            else{
                $value['la_sum'] = '0';
            }
            if(array_key_exists('pa_sum',$value)){
                $value['pa_sum'] = $value['pa_sum'];
            }
            else{
                $value['pa_sum'] = '0';
            }
            $type_id[$key] = $value;
        }
        foreach ($type_id as $key => $value){
            $la_sum = null;
            $pa_sum = null;
            foreach($type_id as $k => $v){
                if($value['id'] == $v['parent_id']){
                    $la_sum[] = $v['la_sum'];
                    $pa_sum[] = $v['pa_sum'];
                }
            }
            if (isset($la_sum)){
                $value['la_sum'] = array_sum($la_sum);
            }
            else{
                $value = $value;
            }
            if (isset($pa_sum)){
                $value['pa_sum'] = array_sum($pa_sum);
            }
            else{
                $value = $value;
            }
            $type_id[$key] = $value;
        }
        if(!isset($flag_la_data['count'])){
            $flag_la_data = $flag_la_data[0];
        }
        if(!isset($pa_this_year_data['count'])){
            $pa_this_year_data = $pa_this_year_data[0];
        }
        if(!isset($pa_last_total_data['count'])){
            $pa_last_total_data = $pa_last_total_data[0];
        }
        $lp_data = [
            'month_total_la' =>$month_total_la,
            'month_flag_la' =>$month_flag_la,
            'month_no_flag_la' =>$month_no_flag_la,
            'flag_la_data' =>$flag_la_data['count'],
            'last_yaer_month_data' =>$last_yaer_month_data['count'],
            'decrease_ratio' =>$decrease_ratio,
            'month_total_pa' =>$month_total_pa,
            'pa_this_year_data' =>$pa_this_year_data['count'],
            'pa_last_total_data' =>$pa_last_total_data['count'],
            'last_yaer_month_pa' =>$last_yaer_month_pa['count'],
            'this_month_figures' =>$this_month_figures,
            'last_month_figures' =>$last_month_figures,
            'pa_ratio' =>$pa_ratio,
            'type_id'=>$type_id,
        ];
        return $lp_data;
    }
}

if (!function_exists('sy_statistics_administration')) {
    /**作者
     * 功能：统计行政案件
     * @param
     */
    function sy_statistics_administration($thismonth_start, $thismonth_end, $org_id, $org)
    {
        $thisyear = date('Y', strtotime($thismonth_start));
        $last_year = $thisyear - 1;
        $next_year = $thisyear + 1;
        $thismonth = date('m-d', strtotime($thismonth_start));
        $thismonth_end_day = date('m-d', strtotime($thismonth_end));
        $thisyear_start = $thisyear . "-01-01";
        $thisyear_end = $next_year . "-01-01";
        $lastmongth_start = $last_year . "-$thismonth";
        $lastmongth_end = $last_year . "-$thismonth_end_day";
        $data = Db::query("SELECT bc.case_type_id,bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.case_type_id,bc.option");
        //统计当月共受理
        $this_month_total_acceptance_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (accept_time >= '$thismonth_start') AND (accept_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.option"));
//        var_dump($this_month_total_acceptance_sum);
//        die();
        //统计当月共查处
        $this_month_total_investigation_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$thismonth_start') AND (investigate_time <= '$thismonth_end') AND (org_id = '$org_id') GROUP BY bc.option"));
        //统计当月查处当月受理案
        $this_month_investigation_acceptance = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$thismonth_start') AND (investigate_time <= '$thismonth_end') AND (accept_time >= '$thismonth_start') AND (accept_time <= '$thismonth_end') AND (bc.option = '1') AND (org_id = '$org_id') GROUP BY bc.option"));
        //统计去年当月查处去年当月受理案
        $last_month_investigation_acceptance = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$lastmongth_start') AND (investigate_time <= '$lastmongth_end') AND (accept_time >= '$lastmongth_start') AND (accept_time <= '$lastmongth_end') AND (bc.option = '1') AND (org_id = '$org_id') GROUP BY bc.option"));
        //统计去年同期共受理
        $last_month_total_acceptance_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (accept_time >= '$lastmongth_start') AND (accept_time <= '$lastmongth_end') AND (bc.option = '0') AND (org_id = '$org_id') GROUP BY bc.option"));
        //统计去年同期共查处
        $last_month_total_investigation_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$lastmongth_start') AND (investigate_time <= '$lastmongth_end') AND (bc.option = '1') AND (org_id = '$org_id') GROUP BY bc.option"));
        if(!isset($this_month_total_acceptance_sum['count'])){
            $this_month_total_acceptance_sum = $this_month_total_acceptance_sum[0];
        }
        if(!isset($this_month_total_investigation_sum['count'])){
            $this_month_total_investigation_sum = $this_month_total_investigation_sum[0];
        }
        if(!isset($this_month_investigation_acceptance['count'])){
            $this_month_investigation_acceptance = $this_month_investigation_acceptance[0];
        }
        //统计与去年同期相比受理增减比
        if ($last_month_total_acceptance_sum['count'] == '0') {
            $accept_decrease_ratio = round($this_month_total_acceptance_sum['count'] * 100) . '%';
        } else {
            $accept_decrease_ratio = round((($this_month_total_acceptance_sum['count'] - $last_month_total_acceptance_sum['count']) / $last_month_total_acceptance_sum['count']) * 100) . '%';
        }
        //统计当月查处率
        if ($this_month_total_investigation_sum['count'] == '0') {
            $this_month_investigation_rate = round(0 * 100) . '%';
        } else {
            $this_month_investigation_rate = round(($this_month_investigation_acceptance['count'] / $this_month_total_investigation_sum['count']) * 100) . '%';
        }
        //统计去年当月查处率
        if ($last_month_total_investigation_sum['count'] == '0') {
            $last_month_investigation_rate = round(0 * 100) . '%';
        } else {
            $last_month_investigation_rate = round(($last_month_investigation_acceptance['count'] / $last_month_total_investigation_sum['count']) * 100) . '%';
        }
        //查处率与去年同期相比这增减（百分点）
        if ($last_month_investigation_rate == '0%') {
            $investigation_rate = '0';
        } else {
            $investigation_rate = round(($this_month_investigation_rate - $last_month_investigation_rate) / $last_month_investigation_rate);
        }
        $type_id = Db::view('hq_bg_case_type', '*')
            ->where('type_category', '2')
            ->order('id')
            ->select();
        foreach ($type_id as $key => $value) {
            foreach ($data as $k => $v) {
                if (($value['id'] == $v['case_type_id']) && ($v['option'] == '0')) {
                    $value['acceptance_sum'] = $v['count'];
                } elseif (($value['id'] == $v['case_type_id']) && ($v['option'] == '1')) {
                    $value['investigation_sum'] = $v['count'];
                }
            }
            if (array_key_exists('acceptance_sum', $value)) {
                $value['acceptance_sum'] = $value['acceptance_sum'];
            } else {
                $value['acceptance_sum'] = '0';
            }
            if (array_key_exists('investigation_sum', $value)) {
                $value['investigation_sum'] = $value['investigation_sum'];
            } else {
                $value['investigation_sum'] = '0';
            }
            $type_id[$key] = $value;
        }
        foreach ($type_id as $key => $value){
            $acceptance_sum = null;
            $investigation_sum = null;
            foreach($type_id as $k => $v){
                if($value['id'] == $v['parent_id']){
                    $acceptance_sum[] = $v['acceptance_sum'];
                    $investigation_sum[] = $v['investigation_sum'];
                }
            }
            if (isset($acceptance_sum)){
                $value['acceptance_sum'] = array_sum($acceptance_sum);
            }
            else{
                $value = $value;
            }
            if (isset($investigation_sum)){
                $value['investigation_sum'] = array_sum($investigation_sum);
            }
            else{
                $value = $value;
            }
            $type_id[$key] = $value;
        }
        $as_data = [
            'party_org_name' => $org['party_org_name'],
            'month_total_acceptance' => $this_month_total_acceptance_sum['count'],
            'last_month_total_acceptance' => $last_month_total_acceptance_sum['count'],
            'accept_decrease_ratio' => $accept_decrease_ratio,
            'month_total_investigation' => $this_month_total_investigation_sum['count'],
            'last_month_total_investigation' => $last_month_total_investigation_sum['count'],
            'this_month_investigation_rate' => $this_month_investigation_rate,
            'last_month_investigation_rate' => $last_month_investigation_rate,
            'investigation_rate' => $investigation_rate,
            'type_id' => $type_id,
        ];
        $list[] = $as_data;
        return $list;
    }
}

if (!function_exists('sy_administration_subtotal')) {
    /**作者
     * 功能：刑事案件小计、总计
     * @param
     */
    function sy_administration_subtotal($thismonth_start, $thismonth_end, $org_id)
    {
        $org_result = Db::view('party_org', '*')
            ->where(['party_org_id'=>$org_id])
            ->find();
        $ids= zw_get_org_subordinate($org_result);
        $org_id = implode(',', array_column($ids, 'party_org_id'));

        $thisyear = date('Y', strtotime($thismonth_start));
        $last_year = $thisyear - 1;
        $next_year = $thisyear + 1;
        $thismonth = date('m-d', strtotime($thismonth_start));
        $thismonth_end_day = date('m-d', strtotime($thismonth_end));
        $thisyear_start = $thisyear . "-01-01";
        $thisyear_end = $next_year . "-01-01";
        $lastmongth_start = $last_year . "-$thismonth";
        $lastmongth_end = $last_year . "-$thismonth_end_day";
        $data = Db::query("SELECT bc.case_type_id,bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (create_time >= '$thismonth_start') AND (create_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.case_type_id,bc.option");
        //统计当月共受理
        $this_month_total_acceptance_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (accept_time >= '$thismonth_start') AND (accept_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.option"));
        //统计当月共查处
        $this_month_total_investigation_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$thismonth_start') AND (investigate_time <= '$thismonth_end') AND (org_id in ($org_id)) GROUP BY bc.option"));
        //统计当月查处当月受理案
        $this_month_investigation_acceptance = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$thismonth_start') AND (investigate_time <= '$thismonth_end') AND (accept_time >= '$thismonth_start') AND (accept_time <= '$thismonth_end') AND (bc.option = '1') AND (org_id in ($org_id)) GROUP BY bc.option"));
        //统计去年当月查处去年当月受理案
        $last_month_investigation_acceptance = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$lastmongth_start') AND (investigate_time <= '$lastmongth_end') AND (accept_time >= '$lastmongth_start') AND (accept_time <= '$lastmongth_end') AND (bc.option = '1') AND (org_id in ($org_id)) GROUP BY bc.option"));
        //统计去年同期共受理
        $last_month_total_acceptance_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (accept_time >= '$lastmongth_start') AND (accept_time <= '$lastmongth_end') AND (bc.option = '0') AND (org_id in ($org_id)) GROUP BY bc.option"));
        //统计去年同期共查处
        $last_month_total_investigation_sum = sy_isset_count(Db::query("SELECT bc.option,count(bc.option) FROM hq_bg_administrative_case bc where (investigate_time >= '$lastmongth_start') AND (investigate_time <= '$lastmongth_end') AND (bc.option = '1') AND (org_id in ($org_id)) GROUP BY bc.option"));
        if(!isset($this_month_total_acceptance_sum['count'])){
            $this_month_total_acceptance_sum = $this_month_total_acceptance_sum[0];
        }
        if(!isset($this_month_total_investigation_sum['count'])){
            $this_month_total_investigation_sum = $this_month_total_investigation_sum[0];
        }
        if(!isset($this_month_investigation_acceptance['count'])){
            $this_month_investigation_acceptance = $this_month_investigation_acceptance[0];
        }
        //统计与去年同期相比受理增减比
        if ($last_month_total_acceptance_sum['count'] == '0') {
            $accept_decrease_ratio = round($this_month_total_acceptance_sum['count'] * 100) . '%';
        } else {
            $accept_decrease_ratio = round((($this_month_total_acceptance_sum['count'] - $last_month_total_acceptance_sum['count']) / $last_month_total_acceptance_sum['count']) * 100) . '%';
        }
        //统计当月查处率
        if ($this_month_total_investigation_sum['count'] == '0') {
            $this_month_investigation_rate = round(0 * 100) . '%';
        } else {
            $this_month_investigation_rate = round(($this_month_investigation_acceptance['count'] / $this_month_total_investigation_sum['count']) * 100) . '%';
        }
        //统计去年当月查处率
        if ($last_month_total_investigation_sum['count'] == '0') {
            $last_month_investigation_rate = round(0 * 100) . '%';
        } else {
            $last_month_investigation_rate = round(($last_month_investigation_acceptance['count'] / $last_month_total_investigation_sum['count']) * 100) . '%';
        }
        //查处率与去年同期相比这增减（百分点）
        if ($last_month_investigation_rate == '0%') {
            $investigation_rate = '0';
        } else {
            $investigation_rate = round(($this_month_investigation_rate - $last_month_investigation_rate) / $last_month_investigation_rate);
        }
        $type_id = Db::view('hq_bg_case_type', '*')
            ->where('type_category', '2')
            ->order('id')
            ->select();
        foreach ($type_id as $key => $value) {
            foreach ($data as $k => $v) {
                if (($value['id'] == $v['case_type_id']) && ($v['option'] == '0')) {
                    $value['acceptance_sum'] = $v['count'];
                } elseif (($value['id'] == $v['case_type_id']) && ($v['option'] == '1')) {
                    $value['investigation_sum'] = $v['count'];
                }
            }
            if (array_key_exists('acceptance_sum', $value)) {
                $value['acceptance_sum'] = $value['acceptance_sum'];
            } else {
                $value['acceptance_sum'] = '0';
            }
            if (array_key_exists('investigation_sum', $value)) {
                $value['investigation_sum'] = $value['investigation_sum'];
            } else {
                $value['investigation_sum'] = '0';
            }
            $type_id[$key] = $value;
        }
        foreach ($type_id as $key => $value){
            $acceptance_sum = null;
            $investigation_sum = null;
            foreach($type_id as $k => $v){
                if($value['id'] == $v['parent_id']){
                    $acceptance_sum[] = $v['acceptance_sum'];
                    $investigation_sum[] = $v['investigation_sum'];
                }
            }
            if (isset($acceptance_sum)){
                $value['acceptance_sum'] = array_sum($acceptance_sum);
            }
            else{
                $value = $value;
            }
            if (isset($investigation_sum)){
                $value['investigation_sum'] = array_sum($investigation_sum);
            }
            else{
                $value = $value;
            }
            $type_id[$key] = $value;
        }
        $as_data = [
            'month_total_acceptance' => $this_month_total_acceptance_sum['count'],
            'last_month_total_acceptance' => $last_month_total_acceptance_sum['count'],
            'accept_decrease_ratio' => $accept_decrease_ratio,
            'month_total_investigation' => $this_month_total_investigation_sum['count'],
            'last_month_total_investigation' => $last_month_total_investigation_sum['count'],
            'this_month_investigation_rate' => $this_month_investigation_rate,
            'last_month_investigation_rate' => $last_month_investigation_rate,
            'investigation_rate' => $investigation_rate,
            'type_id' => $type_id,
        ];
        return $as_data;

    }
}

if (!function_exists('sy_statistics_Collection'))
{
    /**作者
     * 功能：收缴
     * @param $data
     */
    function sy_statistics_Collection($thismonth_start,$thismonth_end,$org_id,$org)
    {
        $data = Db::query("SELECT sum(cs_car) as car,sum(cs_motocycle) as motocycle,sum(cs_electric) as electric,sum(cs_gun_military) as gun_military,
                sum(cs_gun_other) as gun_other,sum(cs_bullet) as bullet,sum(cs_explosive) as explosive,sum(cs_detonator) as detonator,sum(cs_narcotics_heroin) as narcotics_heroin,
                sum(cs_narcotics_other) as narcotics_other,sum(cs_money) as money,sum(discounts) as discounts 
                FROM hq_bg_collection_situation where (case_time >= '$thismonth_start') 
                AND (case_time <= '$thismonth_end') 
                AND (org_id = '$org_id')");
        if(empty($data)){
            $car = 0;
            $motocycle = 0;
            $electric = 0;
            $gun_military = 0;
            $gun_other = 0;
            $bullet = 0;
            $explosive = 0;
            $detonator = 0;
            $narcotics_heroin = 0;
            $narcotics_other = 0;
            $money = 0;
            $discounts = 0;
        }else{
            $car = (null === $data[0]['car']) ? 0 : $data[0]['car'];
            $motocycle = (null === $data[0]['motocycle']) ? 0 : $data[0]['motocycle'];
            $electric = (null === $data[0]['electric']) ? 0 : $data[0]['electric'];
            $gun_military = (null === $data[0]['gun_military']) ? 0 : $data[0]['gun_military'];
            $gun_other = (null === $data[0]['gun_other']) ? 0 : $data[0]['gun_other'];
            $bullet = (null === $data[0]['bullet']) ? 0 : $data[0]['bullet'];
            $explosive = (null === $data[0]['explosive']) ? 0 : $data[0]['explosive'];
            $detonator = (null === $data[0]['detonator']) ? 0 : $data[0]['detonator'];
            $narcotics_heroin = (null === $data[0]['narcotics_heroin']) ? 0 : $data[0]['narcotics_heroin'];
            $narcotics_other = (null === $data[0]['narcotics_other']) ? 0 : $data[0]['narcotics_other'];
            $money = (null === $data[0]['money']) ? 0 : $data[0]['money'];
            $discounts = (null === $data[0]['discounts']) ? 0 : $data[0]['discounts'];
        }
        $lp_data = [
            'party_org_name'    => $org['party_org_name'],
            'car'               =>$car,
            'motocycle'         =>$motocycle,
            'electric'          =>$electric,
            'gun_military'      =>$gun_military,
            'gun_other'         =>$gun_other,
            'bullet'            =>$bullet,
            'explosive'         =>$explosive,
            'detonator'         =>$detonator,
            'narcotics_heroin'  =>$narcotics_heroin,
            'narcotics_other'   =>$narcotics_other,
            'money'             =>$money,
            'discounts'         =>$discounts
        ];
        $list[] = $lp_data;
        return $list;
    }
}

if (!function_exists('sy_statistics_Collection_subtotal'))
{
    /**作者
     * 功能：收缴小计
     * @param $data
     */
    function sy_statistics_Collection_subtotal($thismonth_start,$thismonth_end,$org_id)
    {
        $org_result = Db::view('party_org', '*')
            ->where(['party_org_id'=>$org_id])
            ->find();
        $ids= zw_get_org_subordinate($org_result);
        $org_id .= ',' . implode(',', array_column($ids, 'party_org_id'));
        $data = Db::query("SELECT sum(cs_car) as car,sum(cs_motocycle) as motocycle,sum(cs_electric) as electric,sum(cs_gun_military) as gun_military,
                sum(cs_gun_other) as gun_other,sum(cs_bullet) as bullet,sum(cs_explosive) as explosive,sum(cs_detonator) as detonator,sum(cs_narcotics_heroin) as narcotics_heroin,
                sum(cs_narcotics_other) as narcotics_other,sum(cs_money) as money,sum(discounts) as discounts FROM hq_bg_collection_situation where (case_time >= '$thismonth_start') AND (case_time <= '$thismonth_end') AND (org_id in ($org_id))");
        if(empty($data)){
            $car = 0;
            $motocycle = 0;
            $electric = 0;
            $gun_military = 0;
            $gun_other = 0;
            $bullet = 0;
            $explosive = 0;
            $detonator = 0;
            $narcotics_heroin = 0;
            $narcotics_other = 0;
            $money = 0;
            $discounts = 0;
        }else{
            $car = (null === $data[0]['car']) ? 0 : $data[0]['car'];
            $motocycle = (null === $data[0]['motocycle']) ? 0 : $data[0]['motocycle'];
            $electric = (null === $data[0]['electric']) ? 0 : $data[0]['electric'];
            $gun_military = (null === $data[0]['gun_military']) ? 0 : $data[0]['gun_military'];
            $gun_other = (null === $data[0]['gun_other']) ? 0 : $data[0]['gun_other'];
            $bullet = (null === $data[0]['bullet']) ? 0 : $data[0]['bullet'];
            $explosive = (null === $data[0]['explosive']) ? 0 : $data[0]['explosive'];
            $detonator = (null === $data[0]['detonator']) ? 0 : $data[0]['detonator'];
            $narcotics_heroin = (null === $data[0]['narcotics_heroin']) ? 0 : $data[0]['narcotics_heroin'];
            $narcotics_other = (null === $data[0]['narcotics_other']) ? 0 : $data[0]['narcotics_other'];
            $money = (null === $data[0]['money']) ? 0 : $data[0]['money'];
            $discounts = (null === $data[0]['discounts']) ? 0 : $data[0]['discounts'];
        }

        $lp_data = [
            'car'               =>$car,
            'motocycle'         =>$motocycle,
            'electric'          =>$electric,
            'gun_military'      =>$gun_military,
            'gun_other'         =>$gun_other,
            'bullet'            =>$bullet,
            'explosive'         =>$explosive,
            'detonator'         =>$detonator,
            'narcotics_heroin'  =>$narcotics_heroin,
            'narcotics_other'   =>$narcotics_other,
            'money'             =>$money,
            'discounts'         =>$discounts
        ];
        return $lp_data;
    }
}

if (!function_exists('sy_Combat'))
{
    /**作者
     * 功能：
     * @param $data
     */
    function sy_Combat($thismonth_start,$thismonth_end,$org_id,$org)
    {
        $data = Db::query("SELECT sum(suspect_criminal_count) as sccount,sum(fled) as fled,sum(unfled) as unfled,sum(total_count) as totalcount
 ,sum(involved_num) as involvednum,sum(ts_criminal_custody) as ts_c_custody,sum(ts_administrative_detention) as ts_a_detention,sum(ts_arrest) as ts_arrest
 ,sum(ts_imprisonment) as ts_imprisonment,sum(ts_fine) as ts_fine,sum(ts_drug) as ts_drug,sum(ts_other) as ts_other 
 FROM hq_bg_combat_situation where (case_time >= '$thismonth_start') AND (case_time <= '$thismonth_end') AND (org_id = '$org_id')");
        if(empty($data)){
            $sccount = 0;
            $fled = 0;
            $unfled = 0;
            $totalcount = 0;
            $involvednum = 0;
            $ts_c_custody = 0;
            $ts_a_detention = 0;
            $ts_arrest = 0;
            $ts_imprisonment = 0;
            $ts_fine = 0;
            $ts_drug = 0;
            $ts_other = 0;
        }else{
            $sccount = (null === $data[0]['sccount']) ? 0 : $data[0]['sccount'];
            $fled = (null === $data[0]['fled']) ? 0 : $data[0]['fled'];
            $unfled = (null === $data[0]['unfled']) ? 0 : $data[0]['unfled'];
            $totalcount = (null === $data[0]['totalcount']) ? 0 : $data[0]['totalcount'];
            $involvednum = (null === $data[0]['involvednum']) ? 0 : $data[0]['involvednum'];
            $ts_c_custody = (null === $data[0]['ts_c_custody']) ? 0 : $data[0]['ts_c_custody'];
            $ts_a_detention = (null === $data[0]['ts_a_detention']) ? 0 : $data[0]['ts_a_detention'];
            $ts_arrest = (null === $data[0]['ts_arrest']) ? 0 : $data[0]['ts_arrest'];
            $ts_imprisonment = (null === $data[0]['ts_imprisonment']) ? 0 : $data[0]['ts_imprisonment'];
            $ts_fine = (null === $data[0]['ts_fine']) ? 0 : $data[0]['ts_fine'];
            $ts_drug = (null === $data[0]['ts_drug']) ? 0 : $data[0]['ts_drug'];
            $ts_other = (null === $data[0]['ts_other']) ? 0 : $data[0]['ts_other'];
        }
        $lp_data = [
            'party_org_name'        => $org['party_org_name'],
            'sccount'               =>$sccount,
            'fled'                  =>$fled,
            'unfled'                =>$unfled,
            'totalcount'            =>$totalcount,
            'involvednum'           =>$involvednum,
            'ts_c_custody'          =>$ts_c_custody,
            'ts_a_detention'        =>$ts_a_detention,
            'ts_arrest'             =>$ts_arrest,
            'ts_imprisonment'       =>$ts_imprisonment,
            'ts_fine'               =>$ts_fine,
            'ts_drug'               =>$ts_drug,
            'ts_other'              =>$ts_other
        ];
        $list[] = $lp_data;
        return $list;
    }
}

if (!function_exists('sy_Combat_subtotal'))
{
    /**作者
     * 功能：
     * @param $data
     */
    function sy_Combat_subtotal($thismonth_start,$thismonth_end,$org_id)
    {
        $org_result = Db::view('party_org', '*')
            ->where(['party_org_id'=>$org_id])
            ->find();
        $ids= zw_get_org_subordinate($org_result);
        $org_id .= ',' . implode(',', array_column($ids, 'party_org_id'));

        $data = Db::query("SELECT sum(suspect_criminal_count) as sccount,sum(fled) as fled,sum(unfled) as unfled,sum(total_count) as totalcount
 ,sum(involved_num) as involvednum,sum(ts_criminal_custody) as ts_c_custody,sum(ts_administrative_detention) as ts_a_detention,sum(ts_arrest) as ts_arrest
 ,sum(ts_imprisonment) as ts_imprisonment,sum(ts_fine) as ts_fine,sum(ts_drug) as ts_drug,sum(ts_other) as ts_other 
 FROM hq_bg_combat_situation where (case_time >= '$thismonth_start') AND (case_time <= '$thismonth_end') AND (org_id in ($org_id))");
        if(empty($data)){
            $sccount = 0;
            $fled = 0;
            $unfled = 0;
            $totalcount = 0;
            $involvednum = 0;
            $ts_c_custody = 0;
            $ts_a_detention = 0;
            $ts_arrest = 0;
            $ts_imprisonment = 0;
            $ts_fine = 0;
            $ts_drug = 0;
            $ts_other = 0;
        }else{
            $sccount = (null === $data[0]['sccount']) ? 0 : $data[0]['sccount'];
            $fled = (null === $data[0]['fled']) ? 0 : $data[0]['fled'];
            $unfled = (null === $data[0]['unfled']) ? 0 : $data[0]['unfled'];
            $totalcount = (null === $data[0]['totalcount']) ? 0 : $data[0]['totalcount'];
            $involvednum = (null === $data[0]['involvednum']) ? 0 : $data[0]['involvednum'];
            $ts_c_custody = (null === $data[0]['ts_c_custody']) ? 0 : $data[0]['ts_c_custody'];
            $ts_a_detention = (null === $data[0]['ts_a_detention']) ? 0 : $data[0]['ts_a_detention'];
            $ts_arrest = (null === $data[0]['ts_arrest']) ? 0 : $data[0]['ts_arrest'];
            $ts_imprisonment = (null === $data[0]['ts_imprisonment']) ? 0 : $data[0]['ts_imprisonment'];
            $ts_fine = (null === $data[0]['ts_fine']) ? 0 : $data[0]['ts_fine'];
            $ts_drug = (null === $data[0]['ts_drug']) ? 0 : $data[0]['ts_drug'];
            $ts_other = (null === $data[0]['ts_other']) ? 0 : $data[0]['ts_other'];
        }
        $lp_data = [
            'sccount'               =>$sccount,
            'fled'                  =>$fled,
            'unfled'                =>$unfled,
            'totalcount'            =>$totalcount,
            'involvednum'           =>$involvednum,
            'ts_c_custody'          =>$ts_c_custody,
            'ts_a_detention'        =>$ts_a_detention,
            'ts_arrest'             =>$ts_arrest,
            'ts_imprisonment'       =>$ts_imprisonment,
            'ts_fine'               =>$ts_fine,
            'ts_drug'               =>$ts_drug,
            'ts_other'              =>$ts_other
        ];
        $list[] = $lp_data;
        return $list;
    }
}

if (!function_exists('sy_get_cache'))
{
    /**
     * 作者   ：
     *
     * @return
     */
    function sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,$category,$level)
    {
        if($org == 'bridge'){
            if($category == 'criminal'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_criminal_subtotal($thismonth_start,$thismonth_end,$org_id);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'administration'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_administration_subtotal($thismonth_start,$thismonth_end,$org_id);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'combat'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_Combat_subtotal($thismonth_start,$thismonth_end,$org_id);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'collection'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_statistics_Collection_subtotal($thismonth_start,$thismonth_end,$org_id);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
        }
        else{
            if($category == 'criminal'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'administration'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_statistics_administration($thismonth_start,$thismonth_end,$org_id,$org);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'combat'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_Combat($thismonth_start,$thismonth_end,$org_id,$org);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }
            elseif ($category == 'collection'){
                $key = $thismonth_start.'-'.$org_id.'-'.'get_cache'.'_'.$level.'_'.$category;
                //判断是否能获取到cache
                if(empty(Cache::get($key))){
                    //没有，查数据库等方式获取数据
                    $value = sy_statistics_Collection($thismonth_start,$thismonth_end,$org_id,$org);
                    Cache::set($key,$value,3600);
                }
                else{
                    $value = Cache::get($key);
                }
                return $value;
            }

        }

    }
}



