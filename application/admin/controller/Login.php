<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-22
 * Time: 上午10:56
 */

namespace app\admin\controller;

use think\Config;
use think\Controller;
use think\Request;
use think\Db;
use org\Verify;
use think\Validate;

class Login extends Controller
{
    public function index()
    {
        if(lw_is_login())
        {
           $this->redirect('index/');
        }
        $this->view->engine->layout('login');
        return $this->fetch();
    }

    /**
     * @return string
     */
    public function login()
    {
        if (!input('post.phone_number') || !input('post.user_password'))
        {
            return zw_sprint_result('用户名或者密码不允许为空', '', FAIL_CODE);
        }
        $postData = Request::instance()->post();
        $post_data = [
            'maccount_name' => $postData['phone_number'],
            'mpassword'     => $postData['user_password'],
            'verify'        => $postData['verify'],
        ];

        //校验验证码
        $verify = new Verify();
        if (!$verify->check($post_data['verify'])) {
            return zw_sprint_result('验证码错误', '', FAIL_CODE);
        }

        //调用验证器验证
        $validate = $this->validate($postData,'Login');
        if (true != $validate) {
            return zw_sprint_result('输入有误，'.$validate,'',FAIL_CODE);
        }

        //管理员登录验证
        $has_user = Db::name('manage_account')->field('*')->where(['maccount_name' => $post_data['maccount_name'], 'is_use' => TRUE_STATUS])->find();
        if (is_array($has_user) && count($has_user) != 0) {
            //校验密码
            if (zw_compare_password($post_data['mpassword'], $has_user['mpassword'])) // zw_compare_password
            {
                //更新写入此次登录信息（访问端ip、登录时间等）
                zw_set_session_in_login($has_user);
                $data = array(
                    // 'last_login_time' =>time(),
                    'last_ip' => request()->ip()
                );
                Db::name('manage_account')->where(['maccount_id' => $has_user['maccount_id']])->setField($data);
                //检查的密码有效期
                $limit_tiem = (time() - strtotime($has_user['mpassword_change_time']))/3600/24;
                if( $limit_tiem > 90){
                    return zw_sprint_result('此帐号密码过期，请联系超级管理员修改','',FAIL_CODE);
                }
                //登录成功后重定向
                return zw_sprint_result('登陆成功', zw_build_url('index/index'));
            }
        }
        //如果是普通用户登录
        $has_user = Db::name('party_member')->field('*')->where(['user_name' => $postData['phone_number'], 'status' => TRUE_STATUS])->find();
        if (is_array($has_user) && count($has_user) != 0) {
            //校验密码
            if (zw_compare_password($postData['user_password'], $has_user['password'])) // zw_compare_password
            {
                //更新写入此次登录信息（访问端ip、登录时间等）
                zw_set_session_in_login($has_user);
                $data = array(
                     'last_login_time' => date('Y-m-d H:i:s', time()),
                );
                Db::name('party_member')->where(['party_member_id' => $has_user['party_member_id']])->setField($data);
                //登录成功后重定向
                return zw_sprint_result('登陆成功', zw_build_url('index/index'));
            }
        }
        return zw_sprint_result('此帐号不存在或密码错误或者已经被限制使用，请联系超级管理员','',FAIL_CODE);
    }

    /**
     *
     * 退出登录
     *
     * @author  nlw
     * @date  20170412
     */
    public function logout()
    {
        if (zw_clear_session_in_logout())
        {
            $this->redirect(zw_build_url('login/index'));
        }

    }
    /**
     *
     * 验证码显示
     *
     * @author  nlw
     * @date  20170329
     */
    public function checkVerify()
    {
        $verify = new Verify();
        $verify->imageH = 60;
        $verify->imageW = 270;
        $verify->length = 4;
        $verify->useNoise = false;
        $verify->bg = [247,247,247];
        $verify->entry();
        return;
    }
}