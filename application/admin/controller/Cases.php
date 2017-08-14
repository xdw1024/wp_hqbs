<?php
/**
 * Created by PhpStorm.
 * User: mamba
 * Date: 2017/5/15
 * Time: 15:28
 */
namespace app\admin\controller;

use think\Request;
use think\Db;
use think\Cache;

class Cases extends Adminbase
{
    /**
     * 刑事案件
     * @author  SY
     * @date  20170515
     */
    public function index()
    {
        if (zw_get_user_role_prototype()) {
                $list = Db::view('hq_bg_criminal_case','*')
                    ->view('hq_bg_case_type','type_name','hq_bg_criminal_case.case_type_id = hq_bg_case_type.id','left')
                    ->view('hq_party_org','party_org_name','hq_bg_criminal_case.org_id = hq_party_org.party_org_id', 'left')
                    ->order('hq_bg_criminal_case.id', 'desc')
                    ->paginate(10);
        }
        else {
            $map = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $map['hq_bg_criminal_case.org_id'] = ['in', $party_org_ids];
            }
            $list = Db::view('hq_bg_criminal_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_criminal_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_criminal_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('hq_bg_criminal_case.id', 'desc')
                ->paginate(10);
            if (Request::instance()->has('id', 'get'))
            {
                $list = $list->where(['status' => Request::instance()->get('id')]);
            }
        }
        $res = Db::view('hq_bg_case_type','*')
            ->where('type_category','1')
            ->select();
        $this->assign('res',$res);
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 保存刑事案件
     **/
    public function saveCriminal(){
        if((input('post.detection_time')) != null){
            $data = [
                'case_name' => input('post.case_name'),
                'case_type_id' => input('post.type_id'),
                'status' => input('post.status'),
                'filing_time' => input('post.filing_time'),
                'detection_time' => input('post.detection_time'),
                'flag' => input('post.flag'),
                'create_time' => date('Y-m-d H:i:s', time()),
                'content' => input('post.content'),
            ];
            if($data['status'] == '0'){
                return zw_sprint_result('信息不正确', '', FAIL_CODE);
            }
            if($data['filing_time'] >= $data['detection_time']){
                return zw_sprint_result('立案时间和破案时间不匹配', '', FAIL_CODE);
            }
        }
        else{
            $data = [
                'case_name' => input('post.case_name'),
                'case_type_id' => input('post.type_id'),
                'status' => input('post.status'),
                'filing_time' => input('post.filing_time'),
                'detection_time' => null,
                'flag' => input('post.flag'),
                'create_time' => date('Y-m-d H:i:s', time()),
                'content' => input('post.content'),
            ];
        }
        if(($data['case_type_id'] == '2') || ($data['case_type_id'] == '6') || ($data['case_type_id'] == '11')){
            return zw_sprint_result('案件类型不可选请重新选择', '', FAIL_CODE);
        }
        $year_month = date('Y-m',strtotime($data['create_time']));
        $time = $year_month."-01";
        if(($data['filing_time'] >= $time) && ($data['flag'] == '1')){
            return zw_sprint_result('立案时间和立案状态不匹配', '', FAIL_CODE);
        }
        if(($data['filing_time'] <= $time) && ($data['flag'] == '0')){
            return zw_sprint_result('立案时间和立案状态不匹配', '', FAIL_CODE);
        }
       if($data['case_type_id'] == null){
           return zw_sprint_result('请添加案件类型', '', FAIL_CODE);
       }
        if ('insert' === Request::instance()->post('action_status')){
            $data['org_id'] =zw_get_current_user_party_org_id();
            $result = Db::name('bg_criminal_case')->insertGetId($data);
        }
       else{
           $result = Db::name('bg_criminal_case')
               ->where(['id' => Request::instance()->post('case_id')])
               ->update($data);
       }
        Cache::clear();
        return $result ? zw_sprint_result('添加成功', zw_build_url('cases/index')) : zw_sprint_result('添加失败', '', FAIL_CODE);
    }

    /**
     * 修改刑事案件
     **/
    public function editCriminal(){
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::view('hq_bg_criminal_case','*')
            ->view('hq_bg_case_type','type_name','hq_bg_criminal_case.case_type_id = hq_bg_case_type.id','left')
            ->where(['hq_bg_criminal_case.id' => Request::instance()->post('id')])
            ->find();
        Cache::clear();
        return (is_array($result) && count($result) !== 0 ) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', '', FAIL_CODE);
    }

    /**
     * 删除刑事案件
     **/
    public function deleteCriminal()
    {
        if (!input('post.id')) {
            return zw_sprint_result('无法删除', '', FAIL_CODE);
        }
        $result = Db::name('bg_criminal_case')
            ->where(['id' => Request::instance()->post('id')])
            ->delete();
        Cache::clear();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 刑事案件搜索
     **/
    public function searchmenu()
    {
        $map['party_org_name|case_name|type_name']  = ['like','%'.Request::instance()->get('search_info').'%'];
        if (zw_get_user_role_prototype()) {
            $result = Db::view('hq_bg_criminal_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_criminal_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_criminal_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        } else {
            $maps = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $maps['hq_bg_criminal_case.org_id'] = ['in', $party_org_ids];
            }
            $result = Db::view('hq_bg_criminal_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_criminal_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_criminal_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->where($maps)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);

        }
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }

    /**
     * 行政案件
     * @author  SY
     */
    public function administration()
    {
        if (zw_get_user_role_prototype()) {
            $list = Db::view('hq_bg_administrative_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_administrative_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_administrative_case.org_id = hq_party_org.party_org_id', 'left')
                ->order('hq_bg_administrative_case.id', 'desc')
                ->paginate(10);
        } else {
            $map = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $map['hq_bg_administrative_case.org_id'] = ['in', $party_org_ids];
            }
            $list = Db::view('hq_bg_administrative_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_administrative_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_administrative_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('hq_bg_administrative_case.id', 'desc')
                ->paginate(10);

        }
        $res = Db::view('hq_bg_case_type','*')
            ->where('type_category','2')
            ->select();
        $this->assign('res',$res);
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 保存行政案件
     **/
    public function saveAdministration(){
        if((input('post.investigate_time')) != null){
            if((input('post.accept_time')) == null){
                return zw_sprint_result('请添加受理时间', '', FAIL_CODE);
            }
            $data = [
                'case_name' => input('post.case_name'),
                'case_type_id' => input('post.type_id'),
                'option' => input('post.option'),
                'accept_time' => input('post.accept_time'),
                'investigate_time' => input('post.investigate_time'),
                'create_time' => date('Y-m-d H:i:s', time()),
                'content' => input('post.content'),
            ];
            if($data['option'] == '0'){
                return zw_sprint_result('信息不正确', '', FAIL_CODE);
            }
            if($data['accept_time'] >= $data['investigate_time']){
                return zw_sprint_result('受理时间和查处时间不匹配', '', FAIL_CODE);
            }
        }
        else{
            if((input('post.option')) == '1'){
                return zw_sprint_result('信息不正确', '', FAIL_CODE);
            }
            $data = [
                'case_name' => input('post.case_name'),
                'case_type_id' => input('post.type_id'),
                'option' => input('post.option'),
                'accept_time' => input('post.accept_time'),
                'investigate_time' => null,
                'create_time' => date('Y-m-d H:i:s', time()),
                'content' => input('post.content'),
            ];
        }
        if($data['case_type_id'] == null){
            return zw_sprint_result('请添加案件类型', '', FAIL_CODE);
        }
        if ('insert' === Request::instance()->post('action_status')){
            $data['org_id'] =zw_get_current_user_party_org_id();
            $result = Db::name('bg_administrative_case')->insertGetId($data);
        }
        else{
            $result = Db::name('bg_administrative_case')
                ->where(['id' => Request::instance()->post('case_id')])
                ->update($data);
        }
        Cache::clear();
        return $result ? zw_sprint_result('添加成功', zw_build_url('cases/administration')) : zw_sprint_result('添加失败', '', FAIL_CODE);
    }

    /**
     * 修改刑事案件
     **/
    public function editAdministration(){
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::view('hq_bg_administrative_case','*')
            ->view('hq_bg_case_type','type_name','hq_bg_administrative_case.case_type_id = hq_bg_case_type.id','left')
            ->where(['hq_bg_administrative_case.id' => Request::instance()->post('id')])
            ->find();
        Cache::clear();
        return (is_array($result) && count($result) !== 0 ) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', '', FAIL_CODE);
    }

    /**
     * 删除行政案件
     **/
    public function deleteAdministration()
    {
        if (!input('post.id')) {
            return zw_sprint_result('无法删除', '', FAIL_CODE);
        }
        $result = Db::name('bg_administrative_case')
            ->where(['id' => Request::instance()->post('id')])
            ->delete();
        Cache::clear();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 行政案件搜索
     **/
    public function searchAdministration()
    {
        $map['party_org_name|case_name|type_name']  = ['like','%'.Request::instance()->get('search_info').'%'];
        if (zw_get_user_role_prototype()) {
            $result = Db::view('hq_bg_administrative_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_administrative_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_administrative_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        } else {
            $maps = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $maps['hq_bg_administrative_case.org_id'] = ['in', $party_org_ids];
            }
            $result = Db::view('hq_bg_administrative_case','*')
                ->view('hq_bg_case_type','type_name','hq_bg_administrative_case.case_type_id = hq_bg_case_type.id','left')
                ->view('hq_party_org','party_org_name','hq_bg_administrative_case.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->where($maps)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);

        }
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }

    /**
     * 打击处理情况
     * @author  SY
     */
    public function combat(){
        if (zw_get_user_role_prototype()) {
            $list = Db::view('hq_bg_combat_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_combat_situation.org_id = hq_party_org.party_org_id', 'left')
                ->order('hq_bg_combat_situation.id', 'desc')
                ->paginate(10);
        } else {
            $map = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $map['hq_bg_combat_situation.org_id'] = ['in', $party_org_ids];
            }
            $list = Db::view('hq_bg_combat_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_combat_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('hq_bg_combat_situation.id', 'desc')
                ->paginate(10);
        }
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 保存打击处理情况
     **/
    public function saveCombat(){
        $data = [
            'case_name' => input('post.case_name'),
            'suspect_criminal_count' => input('post.suspect_criminal_count'),
            'fled' => input('post.fled'),
            'unfled' => input('post.unfled'),
            'total_count' => input('post.total_count'),
            'involved_num' => input('post.involved_num'),
            'time' => date('Y-m-d H:i:s', time()),
            'case_time' => input('post.case_time'),
            'ts_criminal_custody' => input('post.criminal_custody'),
            'ts_administrative_detention' => input('post.administrative_detention'),
            'ts_arrest' => input('post.arrest'),
            'ts_imprisonment' => input('post.imprisonment'),
            'ts_fine' => input('post.fine'),
            'ts_drug' => input('post.drug'),
            'ts_other' => input('post.other'),
        ];
        if($data['case_time'] > $data['time']){
            return zw_sprint_result('处理时间有误', '', FAIL_CODE);
        }
        if($data['case_time'] == null){
            return zw_sprint_result('请添加处理时间', '', FAIL_CODE);
        }
        if ('insert' === Request::instance()->post('action_status')){
            $data['org_id'] =zw_get_current_user_party_org_id();
            $result = Db::name('bg_combat_situation')->insertGetId($data);
        }
        else{
            $result = Db::name('bg_combat_situation')
                ->where(['id' => Request::instance()->post('case_id')])
                ->update($data);
        }
        Cache::clear();
        return $result ? zw_sprint_result('添加成功', zw_build_url('cases/administration')) : zw_sprint_result('添加失败', '', FAIL_CODE);
    }

    /**
     * 修改打击处理情况
     **/
    public function editCombat(){
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::view('hq_bg_combat_situation','*')
            ->where(['id' => Request::instance()->post('id')])
            ->find();
        Cache::clear();
        return (is_array($result) && count($result) !== 0 ) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', '', FAIL_CODE);
    }

    /**
     * 删除打击处理情况
     **/
    public function deleteCombat(){
        if (!input('post.id')) {
            return zw_sprint_result('无法删除', '', FAIL_CODE);
        }
        $result = Db::name('bg_combat_situation')
            ->where(['id' => Request::instance()->post('id')])
            ->delete();
        Cache::clear();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 打击处理情况搜索
     **/
    public function searchCombat(){
        $map['party_org_name|case_name']  = ['like','%'.Request::instance()->get('search_info').'%'];
        if (zw_get_user_role_prototype()) {
            $result = Db::view('hq_bg_combat_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_combat_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        } else {
            $maps = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $maps['hq_bg_combat_situation.org_id'] = ['in', $party_org_ids];
            }
            $result = Db::view('hq_bg_combat_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_combat_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->where($maps)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        }
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }

    /**
     * 收缴情况
     * @author  SY
     */
    public function collection(){
        if (zw_get_user_role_prototype()) {
            $list = Db::view('hq_bg_collection_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_collection_situation.org_id = hq_party_org.party_org_id', 'left')
                ->order('hq_bg_collection_situation.id', 'desc')
                ->paginate(10);
        } else {
            $map = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $map['hq_bg_collection_situation.org_id'] = ['in', $party_org_ids];
            }
            $list = Db::view('hq_bg_collection_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_collection_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('hq_bg_collection_situation.id', 'desc')
                ->paginate(10);
        }
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     * 保存收缴情况
     **/
    public function saveCollection(){
        $data = [
            'case_name' => input('post.case_name'),
            'discounts' => input('post.discounts'),
            'cs_car' => input('post.cs_car'),
            'cs_motocycle' => input('post.cs_motocycle'),
            'cs_electric' => input('post.cs_electric'),
            'cs_gun_military' => input('post.cs_gun_military'),
            'cs_gun_other' => input('post.cs_gun_other'),
            'cs_bullet' => input('post.cs_bullet'),
            'cs_explosive' => input('post.cs_explosive'),
            'cs_detonator' => input('post.cs_detonator'),
            'cs_narcotics_heroin' => input('post.cs_narcotics_heroin'),
            'cs_narcotics_other' => input('post.cs_narcotics_other'),
            'cs_money' => input('post.cs_money'),
            'time' => date('Y-m-d H:i:s', time()),
            'case_time' => input('post.case_time'),
        ];
        if($data['case_time'] > $data['time']){
            return zw_sprint_result('处理时间有误', '', FAIL_CODE);
        }
        if($data['case_time'] == null){
            return zw_sprint_result('请添加处理时间', '', FAIL_CODE);
        }
        if ('insert' === Request::instance()->post('action_status')){
            $data['org_id'] =zw_get_current_user_party_org_id();
            $result = Db::name('bg_collection_situation')->insertGetId($data);
        }
        else{
            $result = Db::name('bg_collection_situation')
                ->where(['id' => Request::instance()->post('case_id')])
                ->update($data);
        }
        Cache::clear();
        return $result ? zw_sprint_result('添加成功', zw_build_url('cases/collection')) : zw_sprint_result('添加失败', '', FAIL_CODE);
    }

    /**
     * 修改收缴情况
     **/
    public function editCollection(){
        if (!input('post.id'))
        {
            return zw_sprint_result('无法识别的菜单，请使用正确途径操作', '', FAIL_CODE);
        }
        $result = Db::view('hq_bg_collection_situation','*')
            ->where(['id' => Request::instance()->post('id')])
            ->find();
        Cache::clear();
        return (is_array($result) && count($result) !== 0 ) ? zw_sprint_result('获取成功', $result) : zw_sprint_result('获取失败', '', FAIL_CODE);
    }

    /**
     * 删除收缴情况
     **/
    public function deleteCollection(){
        if (!input('post.id')) {
            return zw_sprint_result('无法删除', '', FAIL_CODE);
        }
        $result = Db::name('bg_collection_situation')
            ->where(['id' => Request::instance()->post('id')])
            ->delete();
        Cache::clear();
        return $result ? zw_sprint_result('删除成功', $result) : zw_sprint_result('删除失败', '', FAIL_CODE);
    }

    /**
     * 收缴情况搜索
     **/
    public function searchCollection(){
        $map['party_org_name|case_name']  = ['like','%'.Request::instance()->get('search_info').'%'];
        if (zw_get_user_role_prototype()) {
            $result = Db::view('hq_bg_collection_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_collection_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        } else {
            $maps = [];
            $party_org_ids = zw_get_current_user_party_org_id();
            if ($party_org_ids) {
                $sub_party_orgs = zw_get_content_org_subordinate();
                if ($sub_party_orgs) {
                    $party_org_ids .= ',' . implode(',', array_column($sub_party_orgs, 'party_org_id'));
                }
                $maps['hq_bg_collection_situation.org_id'] = ['in', $party_org_ids];
            }
            $result = Db::view('hq_bg_collection_situation','*')
                ->view('hq_party_org','party_org_name','hq_bg_collection_situation.org_id = hq_party_org.party_org_id', 'left')
                ->where($map)
                ->where($maps)
                ->order('id', 'desc')
                ->paginate(10, false, [
                    'type'=> 'app\admin\driver\ZzwuAjaxPage',
                    'var_page' => 'page',
                    'query' => Request::instance()->param()
                ]);
        }
        $page = $result->render();
        $result = $result->all();
        return  zw_sprint_result('获取成功', ['data' => $result, 'page' => $page]);
    }

    /**
     * 刑事案件统计(月)
     **/
    public function statisticsCriminal(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = date('Y-m-01', strtotime($sy_time));;
            $thismonth_end = date('Y-m-d', strtotime("$sy_time +1 month -0 day"));
        } else {
            $thismonth_start = date('Y-m-d', mktime(0,0,0,date('m'),1,date('Y')));
            $thismonth_end = date("Y-m-d",strtotime("$thismonth_start +1 month -0 day"));
//            $thismonth_end = date('Y-m-d H:i:s',mktime(23,59,59,date('m'),date('t'),date('Y')));
        }
        $time = [
            'ym' => date('Y-m',strtotime($thismonth_start)),
            'year' => date('Y',strtotime($thismonth_start)),
            'month' => date('m',strtotime($thismonth_start)),
        ];
        $list_data = [];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
           return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
//            's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org)
            $list[] =[
                'name' => $p_org['party_org_name'],
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'criminal','place'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$org['party_org_id'])
                    ->select();
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'criminal','special_bridge'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_criminal($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'criminal','place');
                }
                $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','criminal','bridge');
//                $subtotal = sy_criminal_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'month_total_la' => $subtotal['month_total_la'],
                    'month_flag_la' => $subtotal['month_flag_la'],
                    'month_no_flag_la' => $subtotal['month_no_flag_la'],
                    'flag_la_data' => $subtotal['flag_la_data'],
                    'last_yaer_month_data' => $subtotal['last_yaer_month_data'],
                    'decrease_ratio' => $subtotal['decrease_ratio'],
                    'month_total_pa' => $subtotal['month_total_pa'],
                    'pa_this_year_data' => $subtotal['pa_this_year_data'],
                    'pa_last_total_data' => $subtotal['pa_last_total_data'],
                    'last_yaer_month_pa' => $subtotal['last_yaer_month_pa'],
                    'this_month_figures' => $subtotal['this_month_figures'],
                    'last_month_figures' => $subtotal['last_month_figures'],
                    'pa_ratio' => $subtotal['pa_ratio'],
                    'type_id'=> $subtotal['type_id'],
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'criminal','special_bridge'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_statistics_criminal($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'criminal','place');
                    }
//                    $subtotal = sy_criminal_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','criminal','bridge');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'month_total_la' => $subtotal['month_total_la'],
                        'month_flag_la' => $subtotal['month_flag_la'],
                        'month_no_flag_la' => $subtotal['month_no_flag_la'],
                        'flag_la_data' => $subtotal['flag_la_data'],
                        'last_yaer_month_data' => $subtotal['last_yaer_month_data'],
                        'decrease_ratio' => $subtotal['decrease_ratio'],
                        'month_total_pa' => $subtotal['month_total_pa'],
                        'pa_this_year_data' => $subtotal['pa_this_year_data'],
                        'pa_last_total_data' => $subtotal['pa_last_total_data'],
                        'last_yaer_month_pa' => $subtotal['last_yaer_month_pa'],
                        'this_month_figures' => $subtotal['this_month_figures'],
                        'last_month_figures' => $subtotal['last_month_figures'],
                        'pa_ratio' => $subtotal['pa_ratio'],
                        'type_id'=> $subtotal['type_id'],
                    ];
                }
//                $list_data = sy_criminal_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','criminal','detachment');
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('listtotal',$list_data);
        $this->assign('level',$level);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 行政案件统计(月)
     **/
    public function statisticsAdministration(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = date('Y-m-01', strtotime($sy_time));;
            $thismonth_end = date('Y-m-d', strtotime("$sy_time +1 month -0 day"));
        } else {
            $thismonth_start = date('Y-m-d', mktime(0,0,0,date('m'),1,date('Y')));
            $thismonth_end = date("Y-m-d",strtotime("$thismonth_start +1 month -0 day"));
        }
        $time = [
            'ym' => date('Y-m',strtotime($thismonth_start)),
            'year' => date('Y',strtotime($thismonth_start)),
            'month' => date('m',strtotime($thismonth_start)),
        ];
//        Cache::clear();
        $list_data = [];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'administration','place'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'administration','special_bridge'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_administration($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'administration','place');
                }
//                $subtotal = sy_administration_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','administration','bridge');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'month_total_acceptance' => $subtotal['month_total_acceptance'],
                    'last_month_total_acceptance' => $subtotal['last_month_total_acceptance'],
                    'accept_decrease_ratio' => $subtotal['accept_decrease_ratio'],
                    'month_total_investigation' => $subtotal['month_total_investigation'],
                    'last_month_total_investigation' => $subtotal['last_month_total_investigation'],
                    'this_month_investigation_rate' => $subtotal['this_month_investigation_rate'],
                    'last_month_investigation_rate' => $subtotal['last_month_investigation_rate'],
                    'investigation_rate' => $subtotal['investigation_rate'],
                    'type_id' => $subtotal['type_id'],
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'administration','special_bridge'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'administration','place');
//                        $s_data[] = sy_statistics_administration($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                    }
//                    $subtotal = sy_administration_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','administration','bridge');
//                    var_dump($subtotal);
//                    die();
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'month_total_acceptance' => $subtotal['month_total_acceptance'],
                        'last_month_total_acceptance' => $subtotal['last_month_total_acceptance'],
                        'accept_decrease_ratio' => $subtotal['accept_decrease_ratio'],
                        'month_total_investigation' => $subtotal['month_total_investigation'],
                        'last_month_total_investigation' => $subtotal['last_month_total_investigation'],
                        'this_month_investigation_rate' => $subtotal['this_month_investigation_rate'],
                        'last_month_investigation_rate' => $subtotal['last_month_investigation_rate'],
                        'investigation_rate' => $subtotal['investigation_rate'],
                        'type_id' => $subtotal['type_id'],
                    ];
                }
//                $list_data = sy_administration_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','administration','detachment');
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('listtotal',$list_data);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 打击处理情况统计(月)
     **/
    public function statisticsCombat(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = date('Y-m-01', strtotime($sy_time));;
            $thismonth_end = date('Y-m-d', strtotime("$sy_time +1 month -0 day"));
        } else {
            $thismonth_start = date('Y-m-d', mktime(0,0,0,date('m'),1,date('Y')));
            $thismonth_end = date("Y-m-d",strtotime("$thismonth_start +1 month -0 day"));
        }
        $time = [
            'ym' => date('Y-m',strtotime($thismonth_start)),
            'year' => date('Y',strtotime($thismonth_start)),
            'month' => date('m',strtotime($thismonth_start)),
        ];
        $listtotal=[];
        $month = intval($time['month']);
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_Combat($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'combat','place'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_Combat($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'combat','special_bridge'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_Combat($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'combat','place');
                }
//                $vs_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','combat','bridge');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'sccount'               =>$vs_data[0]['sccount'],
                    'fled'                  =>$vs_data[0]['fled'],
                    'unfled'                =>$vs_data[0]['unfled'],
                    'totalcount'            =>$vs_data[0]['totalcount'],
                    'involvednum'           =>$vs_data[0]['involvednum'],
                    'ts_c_custody'          =>$vs_data[0]['ts_c_custody'],
                    'ts_a_detention'        =>$vs_data[0]['ts_a_detention'],
                    'ts_arrest'             =>$vs_data[0]['ts_arrest'],
                    'ts_imprisonment'       =>$vs_data[0]['ts_imprisonment'],
                    'ts_fine'               =>$vs_data[0]['ts_fine'],
                    'ts_drug'               =>$vs_data[0]['ts_drug'],
                    'ts_other'              =>$vs_data[0]['ts_other']
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_Combat($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'combat','special_bridge'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_Combat($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'combat','place');
                    }
//                    $vs_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','combat','bridge');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'sccount'               =>$vs_data[0]['sccount'],
                        'fled'                  =>$vs_data[0]['fled'],
                        'unfled'                =>$vs_data[0]['unfled'],
                        'totalcount'            =>$vs_data[0]['totalcount'],
                        'involvednum'           =>$vs_data[0]['involvednum'],
                        'ts_c_custody'          =>$vs_data[0]['ts_c_custody'],
                        'ts_a_detention'        =>$vs_data[0]['ts_a_detention'],
                        'ts_arrest'             =>$vs_data[0]['ts_arrest'],
                        'ts_imprisonment'       =>$vs_data[0]['ts_imprisonment'],
                        'ts_fine'               =>$vs_data[0]['ts_fine'],
                        'ts_drug'               =>$vs_data[0]['ts_drug'],
                        'ts_other'              =>$vs_data[0]['ts_other']
                    ];
                }
//                $list_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','combat','detachment');
                $listtotal = $list_data[0];
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('list',$list);
        $this->assign('listtotal',$listtotal);
        $this->assign('time',$time);
        $this->assign('month',$month);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 收缴情况统计(月)
     **/
    public function statisticsCollection(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = date('Y-m-01', strtotime($sy_time));;
            $thismonth_end = date('Y-m-d', strtotime("$sy_time +1 month -0 day"));
        } else {
            $thismonth_start = date('Y-m-d', mktime(0,0,0,date('m'),1,date('Y')));
            $thismonth_end = date("Y-m-d",strtotime("$thismonth_start +1 month -0 day"));
        }
        $time = [
            'ym' => date('Y-m',strtotime($thismonth_start)),
            'year' => date('Y',strtotime($thismonth_start)),
            'month' => date('m',strtotime($thismonth_start)),
        ];
        $listtotal=[];
        $month = intval($time['month']);
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_statistics_Collection($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'collection','place'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_Collection($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'collection','special_bridge'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_Collection($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'collection','place');
                }
//                $vs_data = sy_statistics_Collection_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','collection','bridge');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'car'               =>$vs_data['car'],
                    'motocycle'         =>$vs_data['motocycle'],
                    'electric'          =>$vs_data['electric'],
                    'gun_military'      =>$vs_data['gun_military'],
                    'gun_other'         =>$vs_data['gun_other'],
                    'bullet'            =>$vs_data['bullet'],
                    'explosive'         =>$vs_data['explosive'],
                    'detonator'         =>$vs_data['detonator'],
                    'narcotics_heroin'  =>$vs_data['narcotics_heroin'],
                    'narcotics_other'   =>$vs_data['narcotics_other'],
                    'money'             =>$vs_data['money'],
                    'discounts'         =>$vs_data['discounts']
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_Collection($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'collection','special_bridge'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_statistics_Collection($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'collection','place');
                    }
//                    $vs_data = sy_statistics_Collection_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','collection','bridge');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'car'               =>$vs_data['car'],
                        'motocycle'         =>$vs_data['motocycle'],
                        'electric'          =>$vs_data['electric'],
                        'gun_military'      =>$vs_data['gun_military'],
                        'gun_other'         =>$vs_data['gun_other'],
                        'bullet'            =>$vs_data['bullet'],
                        'explosive'         =>$vs_data['explosive'],
                        'detonator'         =>$vs_data['detonator'],
                        'narcotics_heroin'  =>$vs_data['narcotics_heroin'],
                        'narcotics_other'   =>$vs_data['narcotics_other'],
                        'money'             =>$vs_data['money'],
                        'discounts'         =>$vs_data['discounts']
                    ];
//                    $list_data = sy_statistics_Collection_subtotal($thismonth_start,$thismonth_end,$org_id);
                    $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','collection','detachment');
                    $listtotal = $list_data;
                }
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('listtotal',$listtotal);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('month',$month);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 累计刑事案件
     **/
    public function cumulativeStatisticsCriminal(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = $sy_time."-01-01";
//            $thismonth_end = date('Y')."-01-01";
            $thismonth_end =  ($sy_time+1)."-01-01";
        } else {
            $thismonth_start = date('Y')."-01-01";
            $thismonth_end =date("Y-m-01",strtotime("+1 month"));
        }
        $time = [
            'year' => date('Y',strtotime($thismonth_start)),
        ];
        $list_data = [];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'criminal','place_statistics'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'criminal','special_bridge_statistics'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_criminal($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'criminal','place_statistics');
                }
//                $subtotal = sy_criminal_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','criminal','bridge_statistics');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'month_total_la' => $subtotal['month_total_la'],
                    'month_flag_la' => $subtotal['month_flag_la'],
                    'month_no_flag_la' => $subtotal['month_no_flag_la'],
                    'flag_la_data' => $subtotal['flag_la_data'],
                    'last_yaer_month_data' => $subtotal['last_yaer_month_data'],
                    'decrease_ratio' => $subtotal['decrease_ratio'],
                    'month_total_pa' => $subtotal['month_total_pa'],
                    'pa_this_year_data' => $subtotal['pa_this_year_data'],
                    'pa_last_total_data' => $subtotal['pa_last_total_data'],
                    'last_yaer_month_pa' => $subtotal['last_yaer_month_pa'],
                    'this_month_figures' => $subtotal['this_month_figures'],
                    'last_month_figures' => $subtotal['last_month_figures'],
                    'pa_ratio' => $subtotal['pa_ratio'],
                    'type_id'=> $subtotal['type_id'],
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_criminal($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'criminal','special_bridge_statistics'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_statistics_criminal($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'criminal','place_statistics');
                    }
//                    $subtotal = sy_criminal_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','criminal','bridge_statistics');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'month_total_la' => $subtotal['month_total_la'],
                        'month_flag_la' => $subtotal['month_flag_la'],
                        'month_no_flag_la' => $subtotal['month_no_flag_la'],
                        'flag_la_data' => $subtotal['flag_la_data'],
                        'last_yaer_month_data' => $subtotal['last_yaer_month_data'],
                        'decrease_ratio' => $subtotal['decrease_ratio'],
                        'month_total_pa' => $subtotal['month_total_pa'],
                        'pa_this_year_data' => $subtotal['pa_this_year_data'],
                        'pa_last_total_data' => $subtotal['pa_last_total_data'],
                        'last_yaer_month_pa' => $subtotal['last_yaer_month_pa'],
                        'this_month_figures' => $subtotal['this_month_figures'],
                        'last_month_figures' => $subtotal['last_month_figures'],
                        'pa_ratio' => $subtotal['pa_ratio'],
                        'type_id'=> $subtotal['type_id'],
                    ];
                }
//                $list_data = sy_criminal_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','criminal','detachment_statistics');
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('listtotal',$list_data);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 累计行政案件
     **/
    public function cumulativeStatisticsAdministration(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = $sy_time."-01-01";
            $thismonth_end = date('Y')."-01-01";
            $thismonth_end =  ($sy_time+1)."-01-01";
        } else {
            $thismonth_start = date('Y')."-01-01";
            $thismonth_end =date("Y-m-01",strtotime("+1 month"));
        }
        $time = [
            'year' => date('Y',strtotime($thismonth_start)),
        ];
        $list_data = [];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'administration','place_statistics'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'administration','special_bridge_statistics'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_administration($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'administration','place_statistics');
                }
//                $subtotal = sy_administration_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','administration','bridge_statistics');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'month_total_acceptance' => $subtotal['month_total_acceptance'],
                    'last_month_total_acceptance' => $subtotal['last_month_total_acceptance'],
                    'accept_decrease_ratio' => $subtotal['accept_decrease_ratio'],
                    'month_total_investigation' => $subtotal['month_total_investigation'],
                    'last_month_total_investigation' => $subtotal['last_month_total_investigation'],
                    'this_month_investigation_rate' => $subtotal['this_month_investigation_rate'],
                    'last_month_investigation_rate' => $subtotal['last_month_investigation_rate'],
                    'investigation_rate' => $subtotal['investigation_rate'],
                    'type_id' => $subtotal['type_id'],
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_administration($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'administration','special_bridge_statistics'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_statistics_administration($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'administration','place_statistics');
                    }
//                    $subtotal = sy_administration_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $subtotal = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','administration','bridge_statistics');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'month_total_acceptance' => $subtotal['month_total_acceptance'],
                        'last_month_total_acceptance' => $subtotal['last_month_total_acceptance'],
                        'accept_decrease_ratio' => $subtotal['accept_decrease_ratio'],
                        'month_total_investigation' => $subtotal['month_total_investigation'],
                        'last_month_total_investigation' => $subtotal['last_month_total_investigation'],
                        'this_month_investigation_rate' => $subtotal['this_month_investigation_rate'],
                        'last_month_investigation_rate' => $subtotal['last_month_investigation_rate'],
                        'investigation_rate' => $subtotal['investigation_rate'],
                        'type_id' => $subtotal['type_id'],
                    ];
                }
//                $list_data = sy_administration_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','administration','detachment_statistics');
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('listtotal',$list_data);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 累计打击处理情况
     **/
    public function cumulativeStatisticsCombat(){
        if (input('year')) {
            $sy_time = input('year');
            $thismonth_start = $sy_time.'-01-01';
            $thismonth_end = ($sy_time+1).'-01-01';
        } else {
            $thismonth_start = date('Y')."-01-01";
            $thismonth_end =date("Y-m-01",strtotime("+1 month"));
        }
        $time = [
            'year' => date('Y',strtotime($thismonth_start)),
        ];
        $listtotal=[];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_Combat($thismonth_start,$thismonth_end,$org_id,$org),
                's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'combat','place_statistics'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_Combat($thismonth_start,$thismonth_end,$org_id,$org),
                    's_data' => sy_get_cache($thismonth_start,$thismonth_end,$org_id,$org,'combat','special_bridge_statistics'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_Combat($thismonth_start,$thismonth_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'combat','place_statistics');
                }
//                $vs_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$org['party_org_id']);
                $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$org['party_org_id'],'bridge','combat','bridge_statistics');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'sccount'               =>$vs_data[0]['sccount'],
                    'fled'                  =>$vs_data[0]['fled'],
                    'unfled'                =>$vs_data[0]['unfled'],
                    'totalcount'            =>$vs_data[0]['totalcount'],
                    'involvednum'           =>$vs_data[0]['involvednum'],
                    'ts_c_custody'          =>$vs_data[0]['ts_c_custody'],
                    'ts_a_detention'        =>$vs_data[0]['ts_a_detention'],
                    'ts_arrest'             =>$vs_data[0]['ts_arrest'],
                    'ts_imprisonment'       =>$vs_data[0]['ts_imprisonment'],
                    'ts_fine'               =>$vs_data[0]['ts_fine'],
                    'ts_drug'               =>$vs_data[0]['ts_drug'],
                    'ts_other'              =>$vs_data[0]['ts_other']
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_Combat($thismonth_start,$thismonth_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],$v,'combat','special_bridge_statistics'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_Combat($thismonth_start,$thismonth_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($thismonth_start,$thismonth_end,$value['party_org_id'],$value,'combat','place_statistics');
                    }
//                    $vs_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$v['party_org_id']);
                    $vs_data = sy_get_cache($thismonth_start,$thismonth_end,$v['party_org_id'],'bridge','combat','bridge_statistics');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'sccount'               =>$vs_data[0]['sccount'],
                        'fled'                  =>$vs_data[0]['fled'],
                        'unfled'                =>$vs_data[0]['unfled'],
                        'totalcount'            =>$vs_data[0]['totalcount'],
                        'involvednum'           =>$vs_data[0]['involvednum'],
                        'ts_c_custody'          =>$vs_data[0]['ts_c_custody'],
                        'ts_a_detention'        =>$vs_data[0]['ts_a_detention'],
                        'ts_arrest'             =>$vs_data[0]['ts_arrest'],
                        'ts_imprisonment'       =>$vs_data[0]['ts_imprisonment'],
                        'ts_fine'               =>$vs_data[0]['ts_fine'],
                        'ts_drug'               =>$vs_data[0]['ts_drug'],
                        'ts_other'              =>$vs_data[0]['ts_other']
                    ];
                }
//                $list_data = sy_Combat_subtotal($thismonth_start,$thismonth_end,$org_id);
                $list_data = sy_get_cache($thismonth_start,$thismonth_end,$org_id,'bridge','combat','detachment_statistics');
                $listtotal = $list_data[0];
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('list',$list);
        $this->assign('listtotal',$listtotal);
        $this->assign('time',$time);
        $this->assign('org',$organization);
        return $this->fetch();
    }

    /**
     * 累计收缴情况
     **/
    public function cumulativeStatisticsCollection(){
        if (input('year')) {
            $sy_time = input('year');
            $this_start = $sy_time.'-01-01';
            $this_end = ($sy_time+1).'-01-01';
        } else {
            $this_start = date('Y')."-01-01";
            $this_end =date("Y-m-01",strtotime("+1 month"));
//            $this_start = date('Y-m-d H:i:s', mktime(0,0,0,1,1,date('Y')));
//            $this_end = date('Y-m-d H:i:s',mktime(23,59,59,date('m'),date('t'),date('Y')));
        }
        $time = [
            'year' => date('Y',strtotime($this_start)),
        ];
        $listtotal=[];
        $org_id  = zw_get_current_user_party_org_id();
        if(empty($org_id)){
            return $this->error('该用户没有权限查看');
        }
        else{
            $org = Db::name('party_org')
                ->where('party_org_id',$org_id)
                ->find();
        }
        if($org['level'] == '5'){
            $p_org = Db::name('party_org')
                ->where('party_org_id',$org['parent_org_id'])
                ->find();
            $list[] =[
                'name' => $p_org['party_org_name'],
//                's_data' => sy_statistics_Collection($this_start,$this_end,$org_id,$org),
                's_data' => sy_get_cache($this_start,$this_end,$org_id,$org,'collection','place_statistics'),
                'type' => 'place'
            ];
            $organization = [
                'p_organization' => $p_org['party_org_name'],
                'organization' => $org['party_org_name'],
                'type' => 'place',
            ];
        }
        elseif ($org['level'] == '4'){
            $org_da_data = Db::name('party_org')
                ->where('parent_org_id',$org['party_org_id'])
                ->select();
            if(empty($org_da_data)){
                $list[] =[
                    'name' => $org['party_org_name'],
//                    's_data' => sy_statistics_Collection($this_start,$this,$org_id,$org),
                    's_data' => sy_get_cache($this_start,$this_end,$org_id,$org,'collection','special_bridge_statistics'),
                    'type' =>  'special_bridge'
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
            else{
                foreach ($org_da_data as $k => $v){
                    $p_org = Db::name('party_org')
                        ->where('party_org_id',$v['party_org_id'])
                        ->find();
//                    $s_data[] = sy_statistics_Collection($this_start,$this_end,$v['party_org_id'],$v);
                    $s_data[] = sy_get_cache($this_start,$this_end,$v['party_org_id'],$v,'collection','place_statistics');
                }
//                $vs_data = sy_statistics_Collection_subtotal($this_start,$this_end,$org['party_org_id']);
                $vs_data = sy_get_cache($this_start,$this_end,$org['party_org_id'],'bridge','collection','bridge_statistics');
                $list[] =[
                    's_count'=>count($org_da_data),
                    'name' =>$org['party_org_name'],
                    's_data' =>$s_data,
                    'type' => 'bridge',
                    'car'               =>$vs_data['car'],
                    'motocycle'         =>$vs_data['motocycle'],
                    'electric'          =>$vs_data['electric'],
                    'gun_military'      =>$vs_data['gun_military'],
                    'gun_other'         =>$vs_data['gun_other'],
                    'bullet'            =>$vs_data['bullet'],
                    'explosive'         =>$vs_data['explosive'],
                    'detonator'         =>$vs_data['detonator'],
                    'narcotics_heroin'  =>$vs_data['narcotics_heroin'],
                    'narcotics_other'   =>$vs_data['narcotics_other'],
                    'money'             =>$vs_data['money'],
                    'discounts'         =>$vs_data['discounts']
                ];
                $organization = [
                    'organization' => $org['party_org_name'],
                    'type' => 'bridge',
                ];
            }
        }
        elseif (($org['level'] == '1') || ($org['level'] == '2') || ($org['level'] == '3')){
            $all_data = Db::name('party_org')
                ->where('level','4')
                ->order('party_org_number desc')
                ->select();
            foreach ($all_data as $k => $v){
                $s_data = [];
                $org_da_data = Db::name('party_org')
                    ->where('parent_org_id',$v['party_org_id'])
                    ->select();
                if(empty($org_da_data)){
                    $list[] = [
                        'count' => 'special',
//                        's_data' => sy_statistics_Collection($this_start,$this_end,$v['party_org_id'],$v),
                        's_data' => sy_get_cache($this_start,$this_end,$v['party_org_id'],$v,'collection','special_bridge_statistics'),
                        'type' => 'detachment'
                    ];
                }
                else{
                    foreach ($org_da_data as $key => $value){
                        $p_org = Db::name('party_org')
                            ->where('party_org_id',$value['party_org_id'])
                            ->find();
//                        $s_data[] = sy_statistics_Collection($this_start,$this_end,$value['party_org_id'],$value);
                        $s_data[] = sy_get_cache($this_start,$this_end,$value['party_org_id'],$value,'collection','place_statistics');
                    }
//                    $vs_data = sy_statistics_Collection_subtotal($this_start,$this_end,$v['party_org_id']);
                    $vs_data = sy_get_cache($this_start,$this_end,$v['party_org_id'],'bridge','collection','bridge_statistics');
                    $list[] = [
                        'count' => count($org_da_data),
                        'name' => $v['party_org_name'],
                        's_data' => $s_data,
                        'type' => 'detachment',
                        'car'               =>$vs_data['car'],
                        'motocycle'         =>$vs_data['motocycle'],
                        'electric'          =>$vs_data['electric'],
                        'gun_military'      =>$vs_data['gun_military'],
                        'gun_other'         =>$vs_data['gun_other'],
                        'bullet'            =>$vs_data['bullet'],
                        'explosive'         =>$vs_data['explosive'],
                        'detonator'         =>$vs_data['detonator'],
                        'narcotics_heroin'  =>$vs_data['narcotics_heroin'],
                        'narcotics_other'   =>$vs_data['narcotics_other'],
                        'money'             =>$vs_data['money'],
                        'discounts'         =>$vs_data['discounts']
                    ];
//                    $list_data = sy_statistics_Collection_subtotal($this_start,$this_end,$org_id);
                    $list_data = sy_get_cache($this_start,$this_end,$org_id,'bridge','collection','detachment_statistics');
                    $listtotal = $list_data;
                }
                $organization = [
                    'type' => 'detachment',
                ];
            }
        }
        else{
            return $this->error('该用户没有权限查看');
        }
        $level=$org['level'];
        $this->assign('level',$level);
        $this->assign('listtotal',$listtotal);
        $this->assign('list',$list);
        $this->assign('time',$time);
        $this->assign('org',$organization);
        return $this->fetch();
    }
}