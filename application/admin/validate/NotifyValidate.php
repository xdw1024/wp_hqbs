<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-4-10
 * Time: 下午6:29
 */
namespace app\admin\validate;

use think\Validate;


class NotifyValidate extends Validate
{
//    protected $rule = [
//        'MAccountName'  =>  'require|max:30',
//        'MPassword' =>  'email',
//        'RealName' => 'require|max:60',
//        'CreateTime' => 'date'
//    ];
    protected $rule = [
        ['title','require','标题不能为空'],
        ['send_time', 'require|date', '推送时间不能为空'],
        ['account_id', 'require','创建人能为空'],
        ['party_org_id', 'require', '接收组织不能为空'],
        ['content','require','通知内容不能为空'],
//        ['ContentDesc','require','摘要不能为空']
//        ['verify','require','验证码不能为空'],
    ];

    protected $scene = [
        'news_post' => ['title','create_time','view_num','status','content'],
        'news_save' => ['title','content'],
    ];
}