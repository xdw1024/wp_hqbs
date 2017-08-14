<?php
/**
 * 普通用户管理
 *
 * @author  韦鲲鹏
 * @date  20170104
 */

namespace app\admin\controller;

use app\admin\model\PartyMemberOrg;
use think\Controller;
use think\Db;
use think\Request;
use app\admin\model\SysRoleMenu;

class User extends Adminbase
{
    /**
     * 用户关联组织
     * @author  zzwu
     * @date  20170414
     */
    public function linkOrg()
    {
        $tree_result = [];
//        $node = Db::view('party_org', '*')->where(['parent_org_id' => '-1'])->find();
//        if (is_array($node) && count($node) !== 0)
//        {
//            //显示本节点
//            $tree_result[] = ['id' => $node['party_org_id'], 'pId' => $node['parent_org_id'], 'name' => $node['party_org_name'], 'open' => true];
//
//            // 获取 $root_id 节点的所有子孙节点
//            $trees = Db::view('party_org', '*')
//                ->where('lft', '>', $node['lft'])
//                ->where('rgt', '<', $node['rgt'])
//                ->order('rank', 'desc')
//                ->select();
//            if (is_array($trees) && count($trees) !== 0)
//            {
//                foreach($trees as $key=>$row)
//                {
//                    $tree_result[] = ['id' => $row['party_org_id'], 'pId' => $row['parent_org_id'], 'name' => $row['party_org_name'], 'open' => true];
//                }
//            }
//        }

        if (!zw_get_user_role_prototype())
        {
            $trees = zw_get_content_org_subordinate();
        }
        else
        {
            // 获取 $root_id 节点的所有子孙节点
            $trees = Db::view('party_org', '*')
                ->where('level', '<=', 3)
                ->order('party_org_number')
                ->select();
        }

        if (is_array($trees) && count($trees) !== 0)
        {
            foreach($trees as $key=>$row)
            {
                // 默认展开两级 Mao 20170427
                $is_open = ($row['level'] > 2) ? false : true;
                // 判断是否有子节点
                $is_parent = ($row['rgt'] == $row['lft'] + 1) ? false : true;
                $tree_result[] = [
                    'id' => $row['party_org_id'],
                    'pId' => $row['parent_org_id'],
                    'name' => $row['party_org_name'],
                    'open' => $is_open,
                    'isParent' => $is_parent
                ];
            }
        }

        $this->assign('org', json_encode($tree_result));
        return $this->fetch();

    }

    /**
     * 获取某个节点的下一层子节点
     *
     * @author  Mao
     * @date  20170427
     */
    public function getChildNodes()
    {
        $level = input('post.level/d');
        $node_id = input('post.node_id/d');
        // 当前节点
        $current_node = Db::name('party_org')->where('party_org_id', $node_id)->find();
        // print_r($current_node);
        // 获取当前节点的下一层子节点
        $next_level = ($level == 0) ? ($current_node['level'] + 1) : $level;
        $node_list = Db::name('party_org')
            ->where('level', 'between',array($current_node['level'], $next_level))
            ->where('lft', '>', $current_node['lft'])
            ->where('rgt', '<', $current_node['rgt'])
            ->select();
        $childNodes = array();
        foreach ($node_list as $key => $node) {
            $childNodes[] = array(
                'id' => $node['party_org_id'],
                'pId' => $node['parent_org_id'],
                'name' => $node['party_org_name'],
                'open' => false,
                'isParent' => $node['lft'] + 1 != $node['rgt'],
                'level' => $node['level']
            );
        }
        // print_r($childNodes);
        return zw_sprint_result('获取成功', $childNodes);
    }

    /**
     * 保存党员角色绑定
     */
    public function saveAppRoleMember(){
        if (!input('post.role_id')){
            return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $party_members = Request::instance()->post('party_members/a');
        $role_members = [];
        foreach ($party_members as $v) {
            $role_members[] = [
                'party_member_id' => intval($v),
                'role_id' => intval(Request::instance()->post('role_id')),
            ];
        }
        $result = Db::name('party_member_role')->insertAll($role_members);
        return $result?zw_sprint_result('关联成功', $result): zw_sprint_result('关联失败', $result, FAIL_CODE);
    }

    /**
     * 获取节点关联用户信息
     **/
    public function getMember()
    {
        if (!input('get.org_id'))
        {
            return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        //$data = Db::view('party_org', 'party_org_id')
        //    ->join('party_member_org','party_member_org.party_org_id=party_org.party_org_id')
        //    ->join('party_member','party_member.party_member_id=party_member_org.party_member_id')
        //    ->field('party_member.party_member_id,party_member.user_name,party_member.name,party_member.sex,party_member.mobile_num')
        //    ->where(['party_org.party_org_id' => Request::instance()->get('org_id')])
        //    ->paginate(10, false, [
        //        'type'=> 'app\admin\driver\ZzwuAjaxPage',
        //        'query' => Request::instance()->param()
        //    ]);
        $data = Db::view('party_org', 'party_org_id')
            ->view('party_member_org','party_org_id','party_member_org.party_org_id=party_org.party_org_id')
            ->view('party_member','party_member_id,user_name,name,sex,mobile_num','party_member.party_member_id=party_member_org.party_member_id')
            ->where('party_org.party_org_id',intval(Request::instance()->get('org_id')))
            ->paginate(10, false, [
                'type'=> 'app\admin\driver\ZzwuAjaxPage',
                'query' => Request::instance()->param()
            ]);

        $page = $data->render();
        $data = $data->all();
        return (is_array($data) && count($data) != 0) ? zw_sprint_result('获取成功', ['data'=>$data,'page'=>$page]) : zw_sprint_result('获取失败', $data, FAIL_CODE);
    }

    /**
     * 添加关联用户
     **/
    public function linkUser(){
        if (!input('get.org_id')){
            return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $org = Db::view('party_org', 'party_org_name')->where(['party_org_id' => Request::instance()->get('org_id')])->find();
        if (is_array($org) && count($org) != 0)
        {
            $data = Db::view('party_member', '*')->where('party_member_id', 'not in',
                function($query){
                    $query->view('party_member_org', 'party_member_id');
                },'exists'
            )
                ->paginate(15, false, [
                    'type'=> 'app\admin\driver\ZxcopyAjaxPage',
                    'query' => Request::instance()->param()
                ]);
            $page = $data->render();
            $data = $data->all();
//            var_dump($data);die();
            return (is_array($data) && count($data) != 0) ? zw_sprint_result('获取成功', ['org_name' => $org['party_org_name'], 'party_member' => $data,'page'=>$page]) : zw_sprint_result('获取成功', ['org_name' => $org['party_org_name'], 'party_member' => [],'page'=>$page]);
        }
        return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
    }

    public function saveLinkUser(){

        if (!input('post.org_id')){
            return zw_sprint_result('无法获取节点信息，请刷新后重试', '', FAIL_CODE);
        }
        $party_members = Request::instance()->post('party_member/a');
        $link_user = [];
        foreach ($party_members as $v) {
            $link_user[] = [
                'party_member_id' => $v,
                'party_org_id' => Request::instance()->post('org_id'),
            ];
        }
        $PartyMemberOrg = new PartyMemberOrg();
        $result = $PartyMemberOrg->saveAll($link_user, false);
        return $result?zw_sprint_result('关联成功', $result): zw_sprint_result('关联失败', $result, FAIL_CODE);

    }

    public function deleteLinkUser()
    {
        if (!input('post.party_member_id'))
        {
            return zw_sprint_result('无法获取用户信息，请刷新后重试', '', FAIL_CODE);
        }
        $result = Db::name('party_member_org')
            ->where(['party_member_id' => Request::instance()->post('party_member_id')])
            ->delete();
        return $result ? zw_sprint_result('取消成功', $result) : zw_sprint_result('取消失败', '', FAIL_CODE);
    }

    /**
     * 党员信息列表
     **/
    public function index()
    {
        if (zw_get_user_role_prototype())
        {
            $party = Db::view('party_member', '*')
                ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id','left')
                ->view('party_org b', 'party_org_name', 'b.party_org_id=party_member_org.party_org_id','left')
                ->view('party_org c', 'party_org_name as view_org_name', 'c.party_org_id=party_member.view_org_id','left')
                ->order('sort_num', 'desc')->paginate(15);
            $partyname=Db::view('party_org', '*')->order('party_org_number')->select();
        }
        else
        {
            $map=[];
            $party_org_ids = zw_get_current_user_party_org_id();
            if($party_org_ids){
                $sub_party_orgs = zw_get_content_org_subordinate();
                if($sub_party_orgs){
                    $party_org_ids .= ','.implode(',',array_column($sub_party_orgs,'party_org_id'));
                }
                $map['party_member_org.party_org_id'] = ['in',$party_org_ids];
            }
            $party = Db::view('party_member', '*')
                ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id')
                ->view('party_org b', 'party_org_name', 'b.party_org_id=party_member_org.party_org_id','left')
                ->view('party_org c', 'party_org_name as view_org_name', 'c.party_org_id=party_member.view_org_id','left')
                ->where($map)
                ->order('sort_num', 'desc')->paginate(15);
            $partyname = zw_get_content_org_subordinate();
        }
        $org_result = [];
        if (is_array($partyname) && count($partyname) !== 0)
        {
            foreach($partyname as $key=>$row)
            {
                // 默认展开两级 Mao 20170427
                $is_open = ($row['level'] > 2) ? false : true;
                // 判断是否有子节点
                $is_parent = ($row['rgt'] == $row['lft'] + 1) ? false : true;
                $org_result[] = [
                    'id'        => $row['party_org_id'],
                    'pId'       => $row['parent_org_id'],
                    'name'      => $row['party_org_name'],
                    'open'      => $is_open,
                    'isParent'  => $is_parent
                ];
            }
        }
        $this->assign('partyname', json_encode($org_result));
        $this->assign('party', $party);
        return $this->fetch();
    }


    /**
     * 功能：删除党员信息
     * @time 20170417
     * @author yxf
     */
    public function delete()
    {
        if (!input('post.id'))
        {
            return zw_sprint_result('无法获取用户信息，请刷新后重试', '', FAIL_CODE);
        }
        $result = Db::name('party_member')
            ->where(['party_member_id' => Request::instance()->post('id')])
            ->delete();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 功能：获取党员信息
     * @time 20170417
     * @author yxf
     */
    public function edit()
    {
        $parid=input('id');
        if (!input('id'))
        {
            return zw_sprint_result('无法获取用户信息，请刷新后重试', '', FAIL_CODE);
        }
        $result = Db::view('party_member', '*')
            ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id','left')
            ->view('party_org', 'party_org_name,party_org_id', 'party_org.party_org_id=party_member_org.party_org_id','left')
            ->where(['party_member.party_member_id' => $parid])
            ->find();

        if(zw_get_user_role_prototype())
        {
            $partyname=Db::view('party_org', '*')->order('party_org_number')->select();
        }else{
            //当为普通管理员时，调用函数获取当前管理员所在组织下的所有组织
            $partyname = zw_get_content_org_subordinate();
        }
        $this->assign('partyname', $partyname);
        $this->assign('result', $result);
        $this->assign('parid', $parid);
        return $this->fetch();
    }

    /**
     * 功能：快速编辑党员信息
     * @time 20170417
     * @author yxf
     */
    public function addedit(){
        if(zw_get_user_role_prototype())
        {
            $partyname=Db::view('party_org', '*')->order('party_org_number')->select();
        }else{
            //当为普通管理员时，调用函数获取当前管理员所在组织下的所有组织
            $partyname = zw_get_content_org_subordinate();
        }
        $this->assign('partyname', $partyname);
        return $this->fetch();
    }

    /**
     * 功能：快速添加党员信息
     * @time 20170417
     * @author yxf
     */
    public function addPartyMember(){
        $validate = $this->validate(Request::instance()->post(),'Partymember');
        //验证器判断
        if($validate !== true)
        {
            return zw_sprint_result('提交失败, '.$validate, '', FAIL_CODE);
        }
        else if(!empty(Db::view('party_member', '*')->where(['user_name' => input('post.user_name')])->find())){
            return zw_sprint_result('用户名已存在，请重新输入', '', FAIL_CODE);
        }
        else{
            $password =  ("" === Request::instance()->post('password')) ? "123456" : Request::instance()->post('password');
            $sex =  ("1" === Request::instance()->post('sex')) ? 1 : 0;
            $partymember_data = [
                'user_name'     => Request::instance()->post('user_name'),
                'name'          => Request::instance()->post('name'),
                'sex'           =>$sex,
                'status'           =>1,
                'mobile_num'    => Request::instance()->post('mobile_num'),
                'sort_num'      => Request::instance()->post('sort_num'),
                'password'      => zw_set_password($password),
                'view_org_id'                => Request::instance()->post('view_org_id'),
                'create_time'   =>date("Y-m-d H:i:s")
            ];
            if ('insert' === Request::instance()->post('action_status'))
            {
                $result = Db::name('party_member')->insertGetId($partymember_data);
            }
            $member_org = Db::view('party_member_org', 'id')->where('party_member_id', Request::instance()->post('party_member_id'))->find();
            if (is_array($member_org) && count($member_org) != 0)
            {
                Db::name('party_member_org')->where('id', $member_org['id'])->update(['party_member_id' => Request::instance()->post('party_member_id'), 'party_org_id' => Request::instance()->post('party_org_id')]);
            }
            else
            {
                Db::name('party_member_org')->insertGetId(['party_member_id' => $result, 'party_org_id' => Request::instance()->post('party_org_id')]);
            }
            return $result ? zw_sprint_result('操作成功') : zw_sprint_result('操作失败', '', FAIL_CODE);
        }
    }

    /**
     * 功能：保存党员信息
     * @time 20170417
     * @author yxf
     */
    public function save()
    {
        //if(empty(Request::instance()->post('face_img_id'))){
        //    $face_img_id=null;
        //}else{
        //    $face_img_id=Request::instance()->post('face_img_id');
        //}
        $birthday = (null === Request::instance()->post('birthday')) ? '' : Request::instance()->post('birthday');
        $face_img_id = ('' === Request::instance()->post('face_img_id')) ? null : Request::instance()->post('face_img_id');
        $sex = ('1' === Request::instance()->post('sex')) ? 1 : 0;
        $updata=[
            'user_name'             => Request::instance()->post('user_name'),
            'face_img_id'           => $face_img_id,
            'name'                  => Request::instance()->post('name'),
            'sex'                   => $sex,
            'mobile_num'            => Request::instance()->post('mobile_num'),
            'birthday'              => $birthday,
            'sort_num'              => Request::instance()->post('sort_num')
        ];
        $member_org = Db::view('party_member_org', 'id')->where('party_member_id', Request::instance()->post('party_member_id'))->find();
        if (is_array($member_org) && count($member_org) != 0)
        {
            Db::name('party_member_org')->where('id', $member_org['id'])->update(['party_member_id' => Request::instance()->post('party_member_id'), 'party_org_id' => Request::instance()->post('party_org_id')]);
        }
        else
        {
            Db::name('party_member_org')->insertGetId(['party_member_id' => Request::instance()->post('party_member_id'), 'party_org_id' => Request::instance()->post('party_org_id')]);
        }
        $result = Db::name('party_member')->where('party_member_id', Request::instance()->post('party_member_id'))->update($updata);
        return $result ? zw_sprint_result('操作成功', zw_build_url('user/index')) : zw_sprint_result('操作失败', '', FAIL_CODE);
    }

    /**
     * 功能：获取党员详细信息
     * @time 20170417
     * @author yxf
     */
    public function editmemberinfo()
    {
        if (!input('id'))
        {
            return zw_sprint_result('无效的操作', '', FAIL_CODE);
        }
        $parid=input('id');
        $result = Db::view('party_member', '*')
            ->view('party_member_org', 'party_org_id,id', 'party_member_org.party_member_id=party_member.party_member_id','left')
            ->view('party_org b', 'party_org_name', 'b.party_org_id=party_member_org.party_org_id','left')
            ->view('party_org c', 'party_org_name as view_org_name', 'c.party_org_id=party_member.view_org_id','left')
            ->view('party_member_role', 'role_id', 'party_member_role.party_member_id=party_member.party_member_id','left')
            ->where(['party_member.party_member_id' => $parid])
            ->find();
        if(zw_get_user_role_prototype())
        {
            $partyname=Db::view('party_org', '*')->order('party_org_number')->select();
        }else{
            //当为普通管理员时，调用函数获取当前管理员所在组织下的所有组织
            $partyname = zw_get_content_org_subordinate();
        }
        $org_result = [];
        if (is_array($partyname) && count($partyname) !== 0)
        {
            foreach($partyname as $key=>$row)
            {
                // 默认展开两级 Mao 20170427
                $is_open = ($row['level'] > 2) ? false : true;
                // 判断是否有子节点
                $is_parent = ($row['rgt'] == $row['lft'] + 1) ? false : true;
                $org_result[] = [
                    'id'        => $row['party_org_id'],
                    'pId'       => $row['parent_org_id'],
                    'name'      => $row['party_org_name'],
                    'open'      => $is_open,
                    'isParent'  => $is_parent
                ];
            }
        }
        $this->assign('partyname', json_encode($org_result));
        $party_role=Db::view('party_role', 'role_id,role_name')->where(['role_status' => 1])->select();
        $this->assign('party_role', $party_role);
        $this->assign('result', $result);
        $this->assign('parid', $parid);
        return $this->fetch();
    }

    /**
     * 功能：保存党员信息
     * @time 20170417
     * @author yxf
     */
    public function saveMemberInfo()
    {
        if (!input(''))
        {
            return zw_sprint_result('无效的操作', '', FAIL_CODE);
        }
        $validate = $this->validate(Request::instance()->post(), 'User');
        if (true !== $validate)
        {
            return zw_sprint_result('输入有误，'.$validate, '', FAIL_CODE);
        }else{
            $birthday = ('' === Request::instance()->post('birthday')) ? null : Request::instance()->post('birthday');
            $face_img_id = ('' === Request::instance()->post('face_img_id')) ? null : Request::instance()->post('face_img_id');
            $updata=[
                'user_name'                 => Request::instance()->post('user_name'),
                'face_img_id'               => $face_img_id,
                'name'                      => Request::instance()->post('name'),
                'sex'                       => Request::instance()->post('sex'),
                'mobile_num'                => Request::instance()->post('mobile_num'),
                'birthday'                  => $birthday,
                'sort_num'                  => Request::instance()->post('sort_num'),
                'identity_card'             => Request::instance()->post('identity_card'),
                'salary'                    => Request::instance()->post('salary'),
                'weixin_account'            => Request::instance()->post('weixin_account'),
                'personal_integration'      => Request::instance()->post('personal_integration'),
                'party_membership_dues'     => Request::instance()->post('party_membership_dues'),
                'baidu_channel_id'          => Request::instance()->post('baidu_channel_id'),
                'best_pay_account'          => Request::instance()->post('best_pay_account'),
                'alipay_account'            => Request::instance()->post('alipay_account'),
                'view_org_id'                => Request::instance()->post('view_org_id')
            ];
            $party_member_id = Request::instance()->post('party_member_id');
            $member_org = Db::view('party_member_org', 'id')->where(['party_member_id' => $party_member_id])->find();
            if (is_array($member_org) && count($member_org) != 0)
            {
                Db::name('party_member_org')
                    ->where('id', $member_org['id'])
                    ->update([
                        'party_member_id' => $party_member_id,
                        'party_org_id' => Request::instance()->post('party_org_id')
                    ]);
            }
            else
            {
                Db::name('party_member_org')
                    ->insertGetId([
                        'party_member_id' => $party_member_id,
                        'party_org_id' => Request::instance()->post('party_org_id')
                    ]);
            }
            if (!empty(Request::instance()->post('party_role_id')))
            {
                $party_role = Db::view('party_member_role', 'id')
                    ->where(['party_member_id' => $party_member_id])
                    ->find();
                $party_tole_data = ['role_id' => Request::instance()->post('party_role_id'), 'party_member_id' => $party_member_id];
                if (is_array($party_role) && count($party_role) != 0)
                {
                    Db::name('party_member_role')->where(['id' => $party_role['id']])->update($party_tole_data);
                }else
                {
                    Db::name('party_member_role')->insertGetId($party_tole_data);
                }
            }

            $result = Db::name('party_member')->where('party_member_id', Request::instance()->post('party_member_id'))->update($updata);
            return $result ? zw_sprint_result('操作成功', zw_build_url('user/index')) : zw_sprint_result('操作失败', '', FAIL_CODE);
        }
    }
    /**
     * 功能：选择要导入的表格
     * @time 20170418
     * @author yxf
     */
    public function uploadfile()
    {
        return $this->fetch('user/uploadfile');
    }

    /**
     * 功能：党员注册导入
     * @time 20170418
     * @author yxf
     */
    public function userimport()
    {
        // 获取表单上传文件
        $file = request()->file('file');

        $info = $file->move(UPLOAD_FOLDER . 'upload');
        if($info){
            // 成功上传后 获取上传信息
            $ext = $info->getExtension(); //文件扩展名
            $filename = $info->getFilename();  // 文件名
            $name = $info->getInfo('name');
            $size = $info->getSize();


            $filePath = $info->getRealPath();

        }else{
            return $file->getError();
        }


//        if(isset($_FILES["fileurl"]))
//        {
//            if ($_FILES["fileurl"]["error"] > 0) {
//                failure('上传文件失败！');
//                die();
//            } else {//判断文档上传类型
//                $urlfilestr = strrchr($_FILES['fileurl']['name'], '.');//url后缀名
//                $urlfilestr = strtolower($urlfilestr);
//
//                $docmatch = array('.xls', '.xlsx');
//                $filePath=$_FILES["fileurl"]["tmp_name"];
//            }
//        }else{
//            return zw_sprint_result('无效的操作', '', FAIL_CODE);
//        }

        import('PHPExcel/PHPExcel', EXTEND_PATH);
        $increase=array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');
        /**默认用excel2007读取excel，若格式不对，则用之前的版本进行读取*/
        $PHPReader = new \PHPExcel_Reader_Excel2007();
        if(!$PHPReader->canRead($filePath)){
            $PHPReader = new \PHPExcel_Reader_Excel5();
            if(!$PHPReader->canRead($filePath)){
                echo 'no Excel';
                return ;
            }
        }

        $PHPExcel = $PHPReader->load($filePath);
        /**读取excel文件中的第一个工作表*/
        $currentSheet = $PHPExcel->getSheet(0);
        /**取得最大的列号*/
        $allColumn = $currentSheet->getHighestColumn();
        $info=array(array());
        /**取得一共有多少行*/
        $allRow = $currentSheet->getHighestRow();// echo "maxline=".$allRow;echo "<br>";
        /**从第3行开始输出，因为excel表中前2行为列名*/
        for($currentRow = 3;$currentRow <= $allRow;$currentRow++)
        {
            /**从第A列开始输出*/
            for($currentColumn=0;$currentColumn< count($increase); $currentColumn++)
            {
                $val = $currentSheet->getCellByColumnAndRow(ord($increase[$currentColumn]) - 65,$currentRow)->getValue();/**ord()将字符转为十进制数*/
                //$val = $currentSheet->getCellByColumnAndRow(ord($currentColumn) - 65,$currentRow)->getFormattedValue();/**ord()将字符转为十进制数*/
                $info[$currentRow-3][$increase[$currentColumn]]=$val;
                //$val = $currentSheet->getCellByColumnAndRow($currentColumn, $currentRow)->getValue();
                //$res[$currentRow-2][$currentColumn] = $val;
            }
        }

        for ($i = 0; $i < $allRow - 2; $i++) {
            $mobile = ''.$info[$i]['B'].'';
            $sel_mobile = Db::name('party_member')->where('mobile_num' , $mobile)->find();
            $sex = ''.$info[$i]['C'].'';
            if($sex == "男"){
                $sex = 1;
            }elseif($sex == "女"){
                $sex=0;
            }else{
                $sex=null;
            }

            //$birthday = \PHPExcel_Shared_Date::ExcelToPHP($info[$i]['F']);
            if(empty($info[$i]['F'])){
                $birthday=null;
            }else{
                $birthday=''.$info[$i]['F'].'';
                $birthday=($birthday-25569) * 24*60*60;
                $birthday=date('Y-m-d',$birthday);
            }
            $data = [
                'name'                      =>   ''.$info[$i]['A'].'',
                'mobile_num'                =>   ''.$info[$i]['B'].'',
                'sex'                       =>   $sex,
                'user_name'                 =>   ''.$info[$i]['D'].'',
                'identity_card'             =>   ''.$info[$i]['E'].'',
                'birthday'                  =>   $birthday,
                'salary'                    =>   ''.$info[$i]['G'].'',
                'party_membership_dues'     =>   ''.$info[$i]['H'].'',
                'alipay_account'            =>   ''.$info[$i]['I'].'',
                'weixin_account'            =>   ''.$info[$i]['J'].'',
                'baidu_channel_id'          =>   ''.$info[$i]['K'].'',
                'best_pay_account'          =>   ''.$info[$i]['L'].'',
                'sort_num'                  =>   ''.$info[$i]['M'].'',
                'password'                  =>   ''.zw_set_password("123456").''
            ];
            if(empty($sel_mobile)){
                $result = Db::name('party_member')->insertGetId($data);
            }elseif (!empty($sel_mobile)){
                $result = Db::name('party_member')->where('mobile_num',$mobile)->update($data);
            }
        }
        return $result ? zw_sprint_result('操作成功', zw_build_url('User/index')) : zw_sprint_result('操作失败', '', FAIL_CODE);
    }

    /**
     * 搜索党员
     * */
    public function searchuser()
    {
        //if (!input('get.search_info'))
        //{
        //    return zw_sprint_result('请输入搜索内容', '', FAIL_CODE);
        //}
        $map['party_member.name|party_member.user_name|b.party_org_name|c.party_org_name|mobile_num']  = ['like','%'.Request::instance()->get('search_info').'%'];
        if (zw_get_user_role_prototype())
        {
            $result = Db::view('party_member', '*')
                ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id','left')
                ->view('party_org b', 'party_org_name', 'b.party_org_id=party_member_org.party_org_id','left')
                ->view('party_org c', 'party_org_name as view_org_name', 'c.party_org_id=party_member.view_org_id','left')
                ->where($map)
                ->order('sort_num', 'desc')
                ->paginate(15, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        }
        else
        {
            $maps=[];
            $party_org_ids = zw_get_current_user_party_org_id();
            if($party_org_ids){
                $sub_party_orgs = zw_get_content_org_subordinate();
                if($sub_party_orgs){
                    $party_org_ids .= ','.implode(',',array_column($sub_party_orgs,'party_org_id'));
                }
                $maps['party_member_org.party_org_id'] = ['in',$party_org_ids];
            }
            $result = Db::view('party_member', '*')
                ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id')
                ->view('party_org', 'party_org_name,party_org_id', 'party_org.party_org_id=party_member_org.party_org_id')
                ->where($maps)
                ->where($map)
                ->order('sort_num', 'desc')
                ->paginate(15, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        }
        //$result = Db::view('party_member', '*')
        //    ->view('party_member_org', 'id', 'party_member_org.party_member_id=party_member.party_member_id','left')
        //    ->view('party_org', 'party_org_name', 'party_org.party_org_id=party_member_org.party_org_id','left')
        //    ->where($map)
        //    ->order('sort_num', 'desc')
        //    ->paginate(15, false, [
        //        'type'=> 'app\admin\driver\ZzwuAjaxPage',
        //        'var_page' => 'page',
        //        'query' => Request::instance()->param()
        //    ]);
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }
}
