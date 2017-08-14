<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/** 网站根目录*/
define('WEB_ROOT', \think\Request::instance()->server('REQUEST_SCHEME') . '://' . \think\Request::instance()->server('HTTP_HOST') . '/hqbs/public/');
define('AUTH_CODE', 'WisdomPB');
define('SUCCESS_CODE', '200');
define('FAIL_CODE', '403');
/** 普通文件上传路径文件夹*/
define('UPLOAD_FOLDER', DS . 'shareDisk' . DS);

/** 视频路径暂时文件夹*/
define('UPLOAD_VIDEO_FOLDER', ROOT_PATH . 'public' . DS);

define('VIDEO_UPLOAD_FOLDER', DS . 'shareDiskDash' . DS);
/** 系统状态约定*/
define('TRUE_STATUS',1);
define('FALSE_STATUS',0);

/** 远教点播层级约定*/
define('LEVEL_ONE',1);
define('LEVEL_TWO',2);
return [
    // +----------------------------------------------------------------------
    // | 应用设置
    // +----------------------------------------------------------------------
    // 模板设置
    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => '',
        // 模板后缀
        'view_suffix'  => 'html',
        // 模板文件名分隔符
        'view_depr'    => DS,
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}',
        // 标签库标签开始标记
        'taglib_begin' => '{',
        // 标签库标签结束标记
        'taglib_end'   => '}',

        'layout_on'     =>  true,
        'layout_name'   =>  'layout',
    ],

    // 视图输出字符串内容替换
    'view_replace_str' => [
        '__CSS__'             => WEB_ROOT .'static/css/',
        '__JS__'              => WEB_ROOT .'static/js/',
        '__ROUTE__'           => WEB_ROOT .'index.php/',
        '__STATIC__'          => WEB_ROOT .'static/',
        '__IMAGES__'            => WEB_ROOT .'static/images/',
        '__FONT__'            => WEB_ROOT .'static/fonts/',
    ],

    // 后台json数据返回状态码
    'status_code' =>[
        'success' => SUCCESS_CODE, // 成功获取数据状态码
        'fail'    => FAIL_CODE,    // 失败获取数据状态码
        'web_root'    => WEB_ROOT,    // 失败获取数据状态码
    ],

    // 默认跳转页面对应的模板文件
    'dispatch_success_tmpl'  => THINK_PATH . 'tpl' . DS . 'wisdom_jump.tpl',
    'dispatch_error_tmpl'    => THINK_PATH . 'tpl' . DS . 'wisdom_jump.tpl',

    // +----------------------------------------------------------------------
    // | 异常及错误设置
    // +----------------------------------------------------------------------

    // 异常页面的模板文件
    'exception_tmpl'         => THINK_PATH . 'tpl' . DS . 'think_exception.tpl',

    // 错误显示信息,非调试模式有效
    'error_message'          => '页面错误！请稍后再试～',

    // 默认的空控制器名
    'empty_controller'       => 'Emptys',

    // +----------------------------------------------------------------------
    // | 缓存设置
    // +----------------------------------------------------------------------

    'cache'                  => [
//        'DATA_CACHE_TYPE' => 'Memcached',
//        'MEMCACHED_HOST' => array('127.0.0.1','127.0.0.1'),
//        'MEMCACHED_PORT' => array('11211','11212'),
        // 驱动方式
        'type'   => 'File',
//        'type'   => 'Memcache',
        // 缓存保存目录
        'path'   => CACHE_PATH,
        // 缓存前缀
        'prefix' => '',
        // 缓存有效期 0表示永久缓存
        'expire' => 0,
    ],

    // +----------------------------------------------------------------------
    // | 会话设置
    // +----------------------------------------------------------------------

    'session'                => [
        'id'             => '',
        // SESSION_ID的提交变量,解决flash上传跨域
        'var_session_id' => '',
        // SESSION 前缀
        'prefix'         => 'think',
        // 驱动方式 支持redis memcache memcached
        'type'           => '',
//        'type'           => 'Memcache',
        // 是否自动开启 SESSION
        'auto_start'     => true,
    ],

    //分页配置
    'paginate'               => [
        'type'      => 'app\admin\driver\ZzwuPage',
        'var_page'  => 'page',
        'list_rows' => 15,
    ],

    // 缩略图大小
    'image_thumb' => [
        'imageW' => 640,
        'imageH' => 300,
    ],

	'session_setting' => [
        'admin_id'          => 'admin_id',  //管理员用户认证session标志
        'admin_name'        => 'admin_name',
        'role_prototype'    => 'role_prototype', //管理员用户角色等级标记（1：超级管理员， 2：普通管理员）

        'user_id'          => 'user_id',  //普通用户认证session标志
        'user_name'        => 'user_name',
        'user_role_prototype'    => 'user_role_prototype', //普通用户角色等级标记
    ],

	// 退出url
	"logout_url"        => WEB_ROOT .'index.php/admin/login/logout',
];
