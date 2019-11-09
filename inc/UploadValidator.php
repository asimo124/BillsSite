<?php

class UploadValidator {

    public static $error;

    public static function fileUploaded($file)
    {
        if (isset($file["tmp_name"])) {
            if ($file["tmp_name"] != "") {
                return true;
            }
        }
        return false;
    }

    public static function validateImage($file)
    {
        $uploaded_size = $file['size'];
        if ($uploaded_size > 20000000) {
            self::$error = "The file size you have tried to upload is too large.";
            return -2;
        }


        return 1;
    }

    public static function checkExtWhiteList($file, $white_list)
    {
        if (count($white_list) == 0) {
            return -1;
        }

        $fileArr = explode(chr(46), $file["name"]);
        $lastIndex = count($fileArr) - 1;
        $fileExt = chr(46) . $fileArr[$lastIndex];

        if (!in_array(strtolower($fileExt), $white_list)) {
            self::$error = "This file type is not allowed on this server.";
            return -2;
        }
        return 1;
    }

    public static function checkExtBlackList($file, $black_list)
    {
        if (count($black_list) == 0) {
            return -1;
        }
        $fileArr = explode(chr(46), $file["name"]);
        $lastIndex = count($fileArr) - 1;
        $fileExt = chr(46) . $fileArr[$lastIndex];

        if (!in_array(strtolower($fileExt), $black_list)) {
            return 1;
        }
        else {
            self::$error = "This file type is not allowed on this server.";
            return -2;
        }

    }
    public static function saveThumb($original_path, $thumb_path, $width, $height) {

        try {
            $thumb = PhpThumbFactory::create($original_path);
        }
        catch (Exception $e) {
            echo "Could not thumbnail file. Please contact Site Admin.";
            exit;
        }
        $thumb->resize($width, $height);
        $thumb->save($thumb_path);
    }

}