<?php
/**
 * Created by PhpStorm.
 * User: zzwu
 * Date: 17-3-23
 * Time: 下午4:03
 */

namespace app\admin\controller;

use function Couchbase\defaultDecoder;
use phpseclib\Net\SFTP;
use think\Config;
use think\Image;
use think\Request;
use think\Db;

class Filemanager extends Adminbase
{
    public function index()
    {
        return 'ddd';
    }

    /**
     * 作者     ：zzwu
     * 时间     ：20170322
     * 功能     ：保存文件
     */
    public function saveFile()
    {
        // 获取表单上传文件
        $file = request()->file('upload');

        $info = $file->move(UPLOAD_FOLDER . 'upload');
        if($info){
            // 成功上传后 获取上传信息
            $ext = $info->getExtension(); //文件扩展名
            $filename = $info->getFilename();  // 文件名
            $name = $info->getInfo('name');
            $size = $info->getSize();

            $fileData = [
                'maccount_id'           => lw_get_current_admin_id(),
                'resource_type'         => $ext,
                'resource_path'         => DS . 'upload' . DS . $info->getSaveName(),
                'resource_name'         => $name,
                'upload_time'           => date('Y/m/d H:i:s', time()),
                'resource_hash_name'    => $filename,
                'size' => $size
            ];

            $fullName = $info->getRealPath();
            if (in_array(strtolower($ext), ['gif', 'jpg', 'jpeg', 'bmp', 'png'])) {
                $thumb_path = $info->getPath() . DS.'thumb' . DS;
                if (!is_dir($thumb_path)) mkdir($thumb_path, 0755);
                $thumb_path = $thumb_path . $filename;
                $image = Image::open($fullName);
                if (input('get.icon')) {
                    /** 缩略图控制 20170404 zzwu */
//                $image->water(ROOT_PATH . 'public' . DS . 'favicon.ico', Image::WATER_SOUTHEAST) // 水印
                    $image->thumb(100, 100) // 缩略图
                    ->save($thumb_path);
                } else {
                    $image_thumb = Config::get('image_thumb');
                    /** 缩略图控制 20170404 zzwu */
                    $image->thumb($image_thumb['imageW'], $image_thumb['imageH']) // 缩略图
                    ->save($thumb_path);
                }
//                $fileData['resource_thumb_path'] = DS . 'upload' . DS . date('Ymd', time()) .DS .'thumb' . DS . $filename;
                $fileData['resource_thumb_path'] = str_replace(UPLOAD_FOLDER, DS, $thumb_path);
            }

            $result = Db::name('resource_library')->insertGetId($fileData);
            return input('get.CKEditorFuncNum') ? "<script>window.parent.CKEDITOR.tools.callFunction('" . Request::instance()->get('CKEditorFuncNum') . "','" . WEB_ROOT . $fileData['resource_path'] . "','')</script>" : json_encode([
                    'fileName'      => $name,
                    'url'           => WEB_ROOT . $fileData['resource_path'],
                    'uploaded'      => 'ok',
                    'resource_id'   => $result,
                    'message'       => '上传成功']
            );
        }else{
            return $file->getError();
        }
    }


    /**
     * 作者     ：zzwu
     * 时间     ：20170322
     * 功能     ：保存多文件
     */
    public function saveFiles()
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

            $fileData = [
                'maccount_id'           => lw_get_current_admin_id(),
                'resource_type'         => $ext,
                'resource_path'         => DS . 'upload' . DS . $info->getSaveName(),
                'resource_name'         => $name,
                'upload_time'           => date('Y/m/d H:i:s', time()),
                'resource_hash_name'    => $filename,
                'size' => $size
            ];

            $fullName = $info->getRealPath();
            if (in_array(strtolower($ext), ['gif', 'jpg', 'jpeg', 'bmp', 'png'])) {
                $thumb_path = $info->getPath() . DS.'thumb' . DS;
                if (!is_dir($thumb_path)) mkdir($thumb_path, 0755);
                $thumb_path = $thumb_path . $filename;
                $image = Image::open($fullName);
                if (input('get.icon')) {
                    /** 缩略图控制 20170404 zzwu */
//                $image->water(ROOT_PATH . 'public' . DS . 'favicon.ico', Image::WATER_SOUTHEAST) // 水印
                    $image->thumb(100, 100) // 缩略图
                    ->save($thumb_path);
                } else {
                    $image_thumb = Config::get('image_thumb');
                    /** 缩略图控制 20170404 zzwu */
                    $image->thumb($image_thumb['imageW'], $image_thumb['imageH']) // 缩略图
                    ->save($thumb_path);
                }
//                $fileData['resource_thumb_path'] = DS . 'upload' . DS . date('Ymd', time()) .DS .'thumb' . DS . $filename;
                $fileData['resource_thumb_path'] = str_replace(UPLOAD_FOLDER, DS, $thumb_path);
            }

            $result = Db::name('resource_library')->insertGetId($fileData);
            return input('get.CKEditorFuncNum') ? "<script>window.parent.CKEDITOR.tools.callFunction('" . Request::instance()->get('CKEditorFuncNum') . "','" . WEB_ROOT . $fileData['resource_path'] . "','')</script>" : json_encode([
                    'fileName'      => $name,
                    'url'           => WEB_ROOT . $fileData['resource_path'],
                    'uploaded'      => 'ok',
                    'resource_id'   => $result,
                    'message'       => '上传成功']
            );
        }else{
            return $file->getError();
        }
    }

    public function showFile()
    {

        $CKEditorFuncNum = Request::instance()->get('CKEditorFuncNum');
        $this->view->engine->layout(false);
        $this->assign('CKEditorFuncNum', $CKEditorFuncNum);
        return $this->fetch();
    }

    /**
     * 作者   ：zzwu
     * 时间   ：201700323
     * 功能   ：获取服务器文件
     * !!!!!!!!!!!!!!!!!!!!!!弃 用
     * @param  $id string 资源id
     * @return  string 结果字符串
     */
    public function getFile($id)
    {
        if (isset($id))
        {
//            $id = Request::instance()->get('id');
            $file = DB::view('resource_library', '*')
                ->where(['resource_id' => $id])
                ->find();
            if (is_array($file) && count($file) != 0)
            {
                $fileName = UPLOAD_FOLDER . $file['resource_path'];
                if (file_exists($fileName))
                {
                    set_time_limit(0);
                    ini_set('memory_limit', '512M');
                    header('Content-Type: application/octet-stream');
                    header('Content-Disposition: attachment; filename='.basename($file['resource_name']));
                    header('Content-Transfer-Encoding: binary');
                    ob_end_clean();
                    @readfile($fileName);
                }
            }
        }
        return '无法识别资源路径';
    }

    /**
     * 作者   ：zzwu
     * 时间   ：201700323
     * 功能   ：删除上传服务器文件
     * @return  bool true 成功 false 不成功
     */
    public function removeFile()
    {
        // 超级管理员
        $where = (zw_get_user_role_prototype()) ? [] : ['maccount_id' => lw_get_current_admin_id()];

        $id = Request::instance()->post('id');
        $type = Request::instance()->post('type');
        switch ($type)
        {
            case 'video': //删除视频文件
                $where['id'] = $id;
                $file = DB::view('teach_video_content', '*')
                    ->where($where)
                    ->find();
                if (is_array($file) && count($file) != 0)
                {
                    $fileName = UPLOAD_VIDEO_FOLDER . $file['real_path'];
                    if (file_exists($fileName))
                        @unlink($fileName);
                    DB::name('teach_video_content')
                        ->where($where)
                        ->delete();
                    return zw_sprint_result('删除成功');
                }
                break;
            case 'resource': // 删除图片附件资源
                $where['resource_id'] = $id;
                $file = DB::view('resource_library', '*')
                    ->where($where)
                    ->find();
                if (is_array($file) && count($file) != 0)
                {
                    $fileName = UPLOAD_FOLDER . $file['resource_path'];
                    if (file_exists($fileName))
                        @unlink($fileName);
                    $fileName = UPLOAD_FOLDER . $file['resource_thumb_path'];
                    if (file_exists($fileName))
                        @unlink($fileName);
                    DB::name('resource_library')
                        ->where($where)
                        ->delete();
                    return zw_sprint_result('删除成功');
                }
                break;
            default: // 不删除任何
                break;
        }
        return zw_sprint_result('删除失败，文件不存在或者您没有此权限删除文件', '', FAIL_CODE);
    }


    /**
     * 功能：保存视频文件到服务器
     * 修改：修改视频文件上传方式，改成共享存储（不需要sftp方式传输）
     * 时间：20170428
     * 作者：zzwu
     * */
    public function saveVideoFile()
    {
        // 获取表单上传文件
        $file = request()->file('file');

        $info = $file->move(UPLOAD_VIDEO_FOLDER . 'dash');
        if($info){
            // 成功上传后 获取上传信息
            $ext = $info->getExtension(); //文件扩展名
            $filename = $info->getFilename();  // 文件名
            $name = $info->getInfo('name');
            $fullName = $info->getRealPath();
            if (!in_array(strtolower($ext), ['mp4', 'mkv', 'flv']))
            {
                @unlink($fullName);
                return zw_sprint_result('上传失败，当前服务器不允许上传其他格式视频文件，请上传MP4，mkv，flv文件格式视频', '', FAIL_CODE);
            }

            $video_url = WEB_ROOT . 'dash' . DS . $info->getSaveName();

            $fileData = [
                'maccount_id'           => lw_get_current_admin_id(),
                'video_type'            => 1, // 内容类型，默认1：视频，2：直播
                'real_path'             => 'dash' . DS . $info->getSaveName(),
                'video_name'            => str_replace('.' . $ext, '', $name),
                'video_file_name'       => $name,
                'upload_time'           => date('Y/m/d H:i:s', time()),
                'hash_name'             => $filename,
                'status'                => 0,
                'video_suffix'          => $ext,
                'video_mp4_url'         => $video_url
            ];

            if (zw_get_user_role_prototype()) // 如果是超级管理员 直接上传流媒体服务器
            {
                if (is_file($fullName))
                    rename($fullName, VIDEO_UPLOAD_FOLDER. 'upload' . DS . $filename);
                $fileData['video_dash_url'] = 'http://222.217.61.87/dash/' . str_replace('.' . $fileData['video_suffix'], '', $fileData['hash_name']) . '/index.mpd';
                $fileData['video_mp4_url']  = 'http://222.217.61.87/' . $fileData['hash_name'];
                $fileData['status'] = 1;
            }

            //$result = Db::name('teach_video_content')->insertGetId($fileData);
            $result = Db::name('teach_video_content')->insertGetId($fileData,false,'bgxf_teach_course_section_content_id_seq');
            return $result ? zw_sprint_result('上传成功', ['fileName' => $name, 'video_url' => $fileData['video_mp4_url'], 'video_id' => $result]) : zw_sprint_result('上传失败', '', FAIL_CODE);
        }else{
            return $file->getError();
        }
    }

    /**
     * 功能：审批通过更改视频url
     * 日期：20170428
     * 作者：zzwu
     * */
    public function approveVideo()
    {
        if (!input('post.id'))
        {
           return zw_sprint_result('无法获取文件信息，请刷新后重试', '', FAIL_CODE);
        }
        $status = Request::instance()->post('status');
        $file = Db::view('teach_video_content', 'real_path,hash_name,id,video_suffix,real_path')
            ->where(['id' => Request::instance()->post('id')])
            ->find();
        $result = false;
        if (is_array($file) && count($file) != 0)
        {
            $file_name = UPLOAD_VIDEO_FOLDER . $file['real_path'];
            if (1 == $status) // 通过审核
            {
                if (is_file($file_name))
                    rename($file_name, VIDEO_UPLOAD_FOLDER. 'upload' . DS . $file['hash_name']);
                // 更新视频资源表
                $result = Db::name('teach_video_content')
                    ->where(['id' => Request::instance()->post('id')])
                    ->update([
                        'video_dash_url' => 'http://222.217.61.87/dash/' . str_replace('.' . $file['video_suffix'], '', $file['hash_name']) . '/index.mpd',
                        'video_mp4_url' => 'http://222.217.61.87/' . $file['hash_name'],
                        'status'    => 1
                    ]);
            }
            else{
                if (is_file($file_name))
                    @unlink($file_name);
//                $result = Db::name('teach_video_content')->where(['id' => Request::instance()->post('id')])->delete();
            }
        }
        return $result ? zw_sprint_result('操作成功，请等候转码视频播放', $result) : zw_sprint_result('操作失败，请检查网络或者稍后重试', '', FAIL_CODE);

    }

    /**
     * 功能：保存视频文件到服务器
     * 时间：20170417
     * 作者：zzwu
     * */
    public function saveVideoFile20170428()
    {
        // 获取表单上传文件
        $file = request()->file('file');

        $info = $file->move(UPLOAD_FOLDER . 'upload');
        if($info){
            // 成功上传后 获取上传信息
            $ext = $info->getExtension(); //文件扩展名
            $filename = $info->getFilename();  // 文件名
            $name = $info->getInfo('name');
            $fullName = $info->getRealPath();
            if (!in_array(strtolower($ext), ['mp4', 'mkv', 'flv']))
            {
                @unlink($fullName);
                return zw_sprint_result('上传失败，当前服务器不允许上传其他格式视频文件，请上传MP4，mkv，flv文件格式视频', '', FAIL_CODE);
            }

            $video_url = WEB_ROOT . 'upload' . DS . $info->getSaveName();

            $fileData = [
                'maccount_id'           => lw_get_current_admin_id(),
                'video_type'            => 1, // 内容类型，默认1：视频，2：直播
                'real_path'             => 'upload' . DS . $info->getSaveName(),
                'video_name'            => $name,
                'upload_time'           => date('Y/m/d H:i:s', time()),
                'hash_name'             => $filename,
                'status'                => 0,
                'video_suffix'          => $ext,
                'video_url'             => $video_url
            ];

            if ('admin' == input('type') && zw_get_user_role_prototype()) // 如果是超级管理员 直接上传流媒体服务器
            {
                /** START 上传的文件进行sftp传输到服务器 zzwu */
//            $sftp = new SFTP('172.22.8.9');
                $sftp = new SFTP('222.217.61.87');
                if (!$sftp->login('server', 'Huawei@123'))
                {
                    return zw_sprint_result('上传失败，无法连接流媒体服务器', '', FAIL_CODE);
                }
                $sftp->chdir('video');
                $result = $sftp->put($fileData['hash_name'], UPLOAD_FOLDER . $fileData['real_path'], 1);

                if ($result)
                    $fileData['video_url'] = 'http://222.217.61.87/dash/' . str_replace('.' . $fileData['video_suffix'], '', $fileData['hash_name']) . '/index.mpd';
                /** END 上传的文件进行sftp传输到服务器 zzwu */
            }

            //$result = Db::name('teach_video_content')->insertGetId($fileData);
            $result = Db::name('teach_video_content')->insertGetId($fileData,false,'bgxf_teach_course_section_content_id_seq');
            return $result ? zw_sprint_result('上传成功', ['fileName' => $name, 'video_url' => $fileData['video_url'], 'video_id' => $result]) : zw_sprint_result('上传失败', '', FAIL_CODE);
        }else{
            return $file->getError();
        }
    }

    /**
     * 功能：上传视频文件到流媒体服务器
     * 时间：20170417
     * 作者：zzwu
     * */
    public function uploadVideoSftp20170428()
    {
        if (!input('post.id'))
        {
            zw_sprint_result('无法获取文件信息，请刷新后重试', '', FAIL_CODE);
        }
        $file = Db::view('teach_video_content', 'real_path,hash_name,id,video_suffix')
            ->where(['id' => Request::instance()->post('id')])
            ->find();
        $result = false;
        if (is_array($file) && count($file) != 0)
        {
            /** START 上传的文件进行sftp传输到服务器 zzwu */
//            $sftp = new SFTP('172.22.8.9');
            $sftp = new SFTP('222.217.61.87');
            if (!$sftp->login('server', 'Huawei@123'))
            {
                exit('Login Failed');
            }
            $sftp->chdir('video');
            $result = $sftp->put($file['hash_name'], UPLOAD_FOLDER . $file['real_path'], 1);
            /** END 上传的文件进行sftp传输到服务器 zzwu */

            // 更新视频资源表
            Db::name('teach_video_content')
                ->where(['id' => Request::instance()->post('id')])
//                ->update(['video_url' => 'http://222.217.61.87/dash/' . $file['hash_name'] . '/index.mpd','status' => 1]);
                ->update(['video_url' => 'http://222.217.61.87/dash/' . str_replace('.' . $file['video_suffix'], '', $file['hash_name']) . '/index.mpd','status' => 1]);
        }
        return $result ? zw_sprint_result('传输成功', $result) : zw_sprint_result('传输失败，请检查网络或者稍后重试', '', FAIL_CODE);
    }
}