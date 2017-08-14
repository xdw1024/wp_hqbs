<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-5-4
 * Time: 上午9:29
 */
namespace app\admin\validate;

use think\Validate;


class Teachcategory extends Validate
{
    protected $rule = [
        ['category_name','require|chsDash','分类名称或模块名称不能为空|分类名称或模块名称仅能包含汉字、字母、数字和下划线_及破折号-'],
        ['category_level;', 'require', '分类等级不能为空'],
        ['status', 'require','状态不能为空'],
        ['sort_num', 'require|min:1', '排序不能为空'],
    ];

    protected $scene = [
        'category_post' => ['category_name'],
    ];
}