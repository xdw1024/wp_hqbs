<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-21
 * Time: 上午8:59
 */

namespace app\admin\driver;

use think\paginator\driver\Bootstrap;

class ZzwuPage extends Bootstrap
{
    /**
     * 获取总数据条数 html代码
     * @return string
     */
    protected function getTotal(){
        $html = '<li class="disabled"><span>共<strong>'.ceil($this->total()/$this->listRows()).'</strong>页</span></li>';
        return $html;
    }

    /**
     * 设置输入跳转 html代码
     * @return string
     */
    protected function setInputJump()
    {
        $html = '<li><input class="form-control" style="float: left;width: 80px;height: 32px;" onkeypress="if(event.keyCode==13) {if(parseInt($(this).val()) > 0){window.location.href = \'?page=\' + $(this).val();} return false;}" type="number" placeholder="页码"></li>';
        return $html;
    }

    /**
     * 获取一共有多少页, 跳转相对应页面
     * @author zzwu
     */
    protected function getTotalPage()
    {
        $html = '';
        $count = ceil($this->total() / $this->listRows());
        for ($i = 1; $i <= $count; $i ++)
        {
            if ($this->currentPage() == $i)
            {
                $select = 'selected="selected"';
            }
            else
            {
                $select = '';
            }
            $html .= '<option value="'.htmlentities($this->url($i)).'" '.$select.'>第'.$i.'页</option>';
        }
        $html = '<li><span class="select_box"><select onchange="javascript:location.href=this.value;">'.$html.'</select></span></li>';
        return $html;
    }

    /**
     * 渲染分页html
     * @return mixed
     */
    public function render()
    {
        if ($this->hasPages()) {
            if ($this->simple) {
                return sprintf(
                    '<ul class="pager">%s %s</ul>',
                    $this->getPreviousButton(),
                    $this->getNextButton()
                );
            } else {
                return sprintf(
                    '<ul class="pagination">%s %s %s %s %s %s %s</ul>',
                    $this->getPreviousButton(),
                    $this->getFirstPage(),
                    $this->getLinks(),
                    $this->getLastPage(),
                    $this->getNextButton(),
                    $this->setInputJump(),
                    $this->getTotal()
                );
            }
        }
    }

    /**
     * 上一页按钮
     * @param string $text
     * @return string
     */
    protected function getPreviousButton($text = "上一页")
    {
        return parent::getPreviousButton($text);
    }

    /**
     * 下一页按钮
     * @param string $text
     * @return string
     */
    protected function getNextButton($text = '下一页')
    {
        return parent::getNextButton($text);
    }

    /**
     * 尾页按钮
     * @return string
     */
    public function getLastPage()
    {
        return $this->getPageLinkWrapper($this->url($this->lastPage()), '尾页');
    }

    /**
     * 首页按钮
     * @return string
     */
    public function getFirstPage()
    {
        return $this->getPageLinkWrapper($this->url(1), '首页');
    }
}