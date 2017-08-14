<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-3-29
 * Time: 上午10:38
 */
namespace app\admin\validate;

use think\Validate;


class Login extends Validate
{
    protected $rule = [
        'phone_number'  =>  'require|max:25',
        'user_password'  =>  'require',
        'verify'  =>  'require|max:4',
    ];
}