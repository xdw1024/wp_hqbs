<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-5-2
 * Time: 下午5:16
 */

namespace app\admin\validate;

use think\Validate;


class User extends Validate
{
    protected $rule = [
        ['mobile_num','require|max:12','手机号码不能为空'],
        ['name', 'require', '姓名不能为空'],
        ['party_org_id', 'require','组织不能为空'],
        ['user_name', 'require|max:25', '帐号名不能为空'],
    ];
}