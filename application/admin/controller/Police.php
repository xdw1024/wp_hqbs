<?php
/**
 * Created by PhpStorm.
 * User: mamba
 * Date: 2017/6/8
 * Time: 15:40
 */
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Session;

class Police extends Adminbase
{
    public function index()
    {
        return $this->fetch();
    }

    public function forceManagement()
    {
        return $this->fetch();
    }

}