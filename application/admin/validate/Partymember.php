<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-3-28
 * Time: 下午1:17
 */
namespace app\admin\validate;

use think\Validate;


class Partymember extends Validate
{
    protected $rule = [
        ['password','require','密码不能为空'],
        ['name', 'require', '姓名不能为空'],
        ['mobile_num', 'require|max:15','手机号码不能为空'],
        ['user_name', 'require|max:25', '帐号名不能为空'],
        ['party_org_id', 'require','组织不能为空'],
    ];
}