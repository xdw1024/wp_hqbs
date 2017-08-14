<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-3-30
 * Time: 下午3:04
 */
namespace app\admin\validate;

use think\Validate;


class News extends Validate
{
    protected $rule = [
        ['title','require','标题不能为空'],
        ['app_menu_id', 'require', '栏目不能为空'],
        ['maccount_id', 'require','发布人不能为空'],
        ['send_name', 'require', '发布组织不能为空'],
        ['content','require','文章内容不能为空'],
        //['fabulous_integral','require','点赞积分不能为空'],
        //['read_integral','require','阅读积分不能为空']
    ];

    protected $scene = [
        'affairs_post' => ['title','send_name','content'],
        'affair_save' => ['title','content'],
    ];
}