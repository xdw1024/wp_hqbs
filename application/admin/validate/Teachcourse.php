<?php
/**
 * Created by PhpStorm.
 * User: nlw
 * Date: 17-5-4
 * Time: 上午11:47
 */
namespace app\admin\validate;

use think\Validate;


class Teachcourse extends Validate
{
    protected $rule = [
        ['course_name','require|chsDash','课程不能为空|课程名称仅能包含汉字、字母、数字和下划线_及破折号-'],
        ['course_desc;', 'require', '课程描述不能为空'],
        ['upload_content', 'require|chsDash','上传组织不能为空|上传组织仅能包含汉字、字母、数字和下划线_及破折号-'],
//        ['sort_num', 'require|min:1', '排序不能为空'],
    ];

    protected $scene = [
        'course_post' => ['course_name','course_desc','upload_content'],
    ];
}