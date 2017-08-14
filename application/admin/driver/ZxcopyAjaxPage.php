<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-21
 * Time: 上午9:58
 */

namespace app\admin\driver;

/*
 * 拷贝自ZzwuAjaxPage
 *
 *
 * */
class ZxcopyAjaxPage extends ZzwuAjaxPage
{
    /**
     * 生成一个可点击的按钮
     *
     * @param  string $url
     * @param  int    $page
     * @return string
     */
    protected function getAvailablePageWrapper($url, $page)
    {
        return '<li><a href="javascript:void(0);" onclick="ajaxResultMember(\'' . htmlentities($url) . '\')">' . $page . '</a></li>';
    }
}