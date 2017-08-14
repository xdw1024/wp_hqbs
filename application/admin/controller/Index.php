<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-21
 * Time: 下午3:26
 */

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Session;

class Index extends Adminbase
{
    public function index()
    {
        $result = Db::view('admin_menu', '*')->select();
        $this->assign('menu', $result);
//        print_r(Session::get());
        return $this->fetch();
    }

    public function test()
    {
        $org = Db::view('party_org', '*')->where('party_org_id', '499')->find();
        print_r(zw_get_org_subordinate($org));
        print_r(zw_get_org_higher_ups($org));
        die();
    }
}