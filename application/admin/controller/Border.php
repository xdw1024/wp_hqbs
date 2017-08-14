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

class Border extends Adminbase
{
    public function index()
    {
        return $this->fetch();
    }

}