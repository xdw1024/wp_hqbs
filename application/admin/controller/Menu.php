<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-27
 * Time: 上午11:56
 */


namespace app\admin\controller;

use think\Db;
use think\Request;

class Menu extends Adminbase
{
    /**
     * 功能：显示前台菜单栏目设置（节点树）
     * @time 20170410
     * @author zzwu
     */
    public function index()
    {
        //判断根结点存在与否
        ($this->getRootNodeId() === False) ? $this->addRootNode("root") : $this->getRootNodeId();

        // 获取 $root_id 节点的所有子孙节点
        $trees = Db::view('app_menu', '*')
            ->order('sort_num', 'desc')
            ->select();
        $tree_result = [];
        if (is_array($trees) && count($trees) !== 0)
        {
            foreach($trees as $key=>$row)
            {
                $tree_result[] = ['id' => $row['app_menu_id'], 'pId' => $row['parent_menu_id'], 'name' => $row['menu_name'], 'open' => true];
            }
        }

        $app_menu_type = Db::view('app_menu_type', '*')->select();
        $this->assign('menu_tree', json_encode($tree_result));
        $this->assign('app_menu_type', $app_menu_type);
        return $this->fetch();
    }

    /**
     * 功能：显示后台菜单栏目（增删查改）
     * @time 20170410
     * @author zzwu
     */
    public function admin()
    {
        $menu_select = zw_build_url('menu/admin');
        $result = Db::view('admin_menu', '*');
        if (Request::instance()->has('id', 'get'))
        {
            $menu_select .= '?id=' . Request::instance()->get('id');
            $result = $result->where(['status' => Request::instance()->get('id')]);
        }
        $result = $result->order('sort_num', 'desc')
            ->paginate(15, false, ['query' => Request::instance()->param()]);
        $this->assign('menus', $result);
        $this->assign('menu_select', $menu_select);
        return $this->fetch();
    }

    /**
     * 功能：删除后台菜单
     * @time 20170410
     * @author zzwu
     */
    public function deleteAdminMenu()
    {
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::name('admin_menu')
            ->where(['menu_id' => Request::instance()->post('id')])
            ->delete();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 功能：获取后台菜单编辑
     * @time 20170410
     * @author zzwu
     */
    public function editAdminMenu()
    {
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::view('admin_menu', '*')
            ->where(['menu_id' => Request::instance()->post('id')])
            ->find();
        return (is_array($result) && count($result) !== 0 ) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', '', FAIL_CODE);
    }

    /**
     * 功能：保存后台菜单（新增或者修改）
     * @time 20170410
     * @author zzwu
     */
    public function saveAdminMenu()
    {
        if (!input('post.menu_name'))
        {
            return zw_sprint_result('请输入菜单名字', '', FAIL_CODE);
        }
        $role_data = [
            'menu_name'      => Request::instance()->post('menu_name'),
            'sort_num'       => Request::instance()->post('sort_num'),
//            'action'        => Request::instance()->post('menu_action'),
            'controller'    => Request::instance()->post('menu_controller'),
            'method'        => Request::instance()->post('menu_method'),
            'icon'          => Request::instance()->post('menu_icon'),
            'status'        => Request::instance()->post('menu_status')
        ];
        if ('insert' === Request::instance()->post('action_status'))
        {
            $result = Db::name('admin_menu')->insertGetId($role_data);
        }else{
            $result = Db::name('admin_menu')
                ->where(['menu_id' => Request::instance()->post('menu_id')])
                ->update($role_data);
        }
        return $result ? zw_sprint_result('操作成功') : zw_sprint_result('操作失败', '', FAIL_CODE);

    }

    /**
     * 根据节点ID获取当前节点的信息
     * @param $node_id int 节点id
     * @return array | bool 节点信息(不存在则返回空)
     */
    private function getNode($node_id)
    {
        $result = Db::view('app_menu', '*')->where(['app_menu_id' => $node_id])->select();
        if (is_array($result) && count($result) != 0)
        {
            return reset($result);
        }
        return false;
    }

    /**
     * 添加根节点
     * @param $name string 节点的名称
     * @return int | bool 参数错误返回false(注意0和false的区别)
     */
    private function addRootNode($name)
    {
        $result = Db::name('app_menu')->insertGetId([
            'parent_menu_id' => '-1',
            'menu_name' => $name,
            'level' => '1',
            'lft' => '1',
            'rgt' => '2',
        ]);
        return $result ? $result : false;
    }

    /**
     * 获取根节点
     * @return bool | array 存在返回节点，不存在则返回False
     */
    private function getRootNodeId()
    {
        $result = Db::view('app_menu', 'app_menu_id')->where(['parent_menu_id' => '-1'])->select();
        if (is_array($result) && count($result) != 0)
        {
            return reset($result)['app_menu_id'];
        }
        return false;
    }

    /**
     * 插入一个新的节点
     * @return string 修改状态
     */
    public function insertNode()
    {
        if (!input('post.treeNodeId'))
        {
            return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $node_id = Request::instance()->post('treeNodeId');
        $name = Request::instance()->post('treeNodeName');
        $pos = Request::instance()->post('pos'); //  $pos: 位置，有兄弟节点（right），子节点（down）
        $pre_node = $this->getNode($node_id);
        if($pos == 'right') //添加平行节点,目前无法添加rank
        {
            Db::name('app_menu')->where('lft', '>', $pre_node['rgt'])->update(['lft' => ['exp', 'lft+2']]);
            Db::name('app_menu')->where('rgt', '>', $pre_node['rgt'])->update(['rgt' => ['exp', 'rgt+2']]);
            $result = Db::name('app_menu')->insertGetId([
                'parent_menu_id' => $pre_node['parent_menu_id'],
                'menu_name' => $name,
                'level' => $pre_node['level'],
                'lft' => $pre_node['rgt']+1,
                'rgt' => $pre_node['rgt']+2,
            ]);
        } else {  //添加子节点
            Db::name('app_menu')->where('lft', '>', $pre_node['lft'])->update(['lft' => ['exp', 'lft+2']]);
            Db::name('app_menu')->where('rgt', '>', $pre_node['lft'])->update(['rgt' => ['exp', 'rgt+2']]);
            $result = Db::name('app_menu')->insertGetId([
                'parent_menu_id' => $pre_node['app_menu_id'],
                'menu_name' => $name,
                'level' => $pre_node['level'] + 1,
                'lft' => $pre_node['lft']+1,
                'rgt' => $pre_node['lft']+2,
            ]);
        }
        return $result ? zw_sprint_result('插入成功', $result) : zw_sprint_result('插入失败', '', FAIL_CODE);
    }

    /**
     * 根据ID获取当前节点的信息修改名字
     * @return string 修改状态
     */
    public function renameNode()
    {
        if (!input('post.treeNodeId'))
        {
            zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $node_id = Request::instance()->post('treeNodeId');
        $name = Request::instance()->post('treeNodeName');
        $result = Db::name('app_menu')->where(['app_menu_id' => $node_id])->update(['menu_name' => $name]);
        return $result ? zw_sprint_result('重命名成功') : zw_sprint_result('重命名失败', '', FAIL_CODE);
    }

    /**
     * 删除节点
     * $nodeId: 节点的ID
     * 返回值：无
     */
    public function deleteNode()
    {
        if (!input('post.treeNodeId'))
        {
            zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $node_id = Request::instance()->post('treeNodeId');

        $node = $this->getNode($node_id);
        if(empty($node))
        {
            return zw_sprint_result('无法获取节点信息，删除失败', '', FAIL_CODE);
        }
        //删除所有子节点
        Db::name('app_menu')->where('lft', '>=', $node['lft'])->where('rgt', '<=', $node['rgt'])->delete();
        //中间缺少的数
        $number = $node['rgt'] - $node['lft'] + 1;
        //后续节点lft减中间缺少的数
        Db::name('app_menu')->where('lft', '>', $node['rgt'])->update(['lft' => ['exp', "lft-$number"]]);
        //后续节点rgt减中间缺少的数
        $result = Db::name('app_menu')->where('rgt', '>', $node['rgt'])->update(['rgt' => ['exp', "rgt-$number"]]);

        return $result ? zw_sprint_result('删除成功') : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 保存栏目附加属性，如icon，类型
     **/
    public function saveMenuAttribute()
    {
        if (!input('post.app_menu_id'))
        {
            zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $data = [
            'app_menu_type_id' => Request::instance()->post('app_menu_type'),
            'sort_num' => Request::instance()->post('sort_num'),
            'menu_name' => Request::instance()->post('menu_name')
        ];
        (!empty(Request::instance()->post('image_id'))) ? $data['icon_id'] = Request::instance()->post('image_id') : null;
        $result = Db::name('app_menu')
            ->where(['app_menu_id' => Request::instance()->post('app_menu_id')])
            ->update($data);
        return $result ? zw_sprint_result('保存成功') : zw_sprint_result('保存失败', '', FAIL_CODE);
    }

    /**
     * 获取节点信息进行设置
     **/
    public function getAppMenu()
    {
        if (!input('post.menu_id'))
        {
            zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $result = Db::view('app_menu', '*')
            ->view('resource_library', 'resource_path,resource_id', 'resource_library.resource_id=app_menu.icon_id', 'left')
            ->where([
                'app_menu_id' => Request::instance()->post('menu_id')
            ])
            ->find();
        return (is_array($result) && count($result) != 0) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', $result, FAIL_CODE);
    }

    /**
     * 菜单搜索
     **/
    public function searchmenu()
    {
        //if (!input('get.search_info'))
        //{
        //    return zw_sprint_result('请输入搜索内容', '', FAIL_CODE);
        //}
        $map['menu_name|controller|method']  = ['like','%'.Request::instance()->get('search_info').'%'];
        $result = Db::view('admin_menu', '*')
            ->where($map)
            ->order('sort_num', 'desc')
            ->paginate(15, false, [
                'type'=> 'app\admin\driver\ZzwuAjaxPage',
                'var_page' => 'page',
                'query' => Request::instance()->param()
            ]);
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }
}