{__NOLAYOUT__}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>正在跳转</title>
    <link href="__CSS__bootstrap.min.css" rel="stylesheet">
    <style>
        .main {text-align:center;font-family: "微软雅黑";width: 500px; height: 100px; position: absolute;top: 0px; right: 0px; left: 0px; bottom: 0px; margin: auto; border: 0px solid #000000;}
        .title {font-size: 30px;font-weight: bold; text-align: center; margin-top: -50px; }
        .title img {width: 30px; margin-top: -5px; margin-right: 20px;}
        .info {font-size: 16px; color: #C9C9C9;}
        .info img {width: 16px; margin-right: 10px; margin-top: -2px;}
    </style>
</head>
<body>
<div class="main">
    <?php switch ($code) {?>
    <?php case 1:?>
    <p class="title"><img src="__IMAGES__ok.jpg" /><?php echo(strip_tags($msg));?></p>
    <?php break;?>
    <?php case 0:?>
    <p class="title"><img src="__IMAGES__no.jpg" /><?php echo(strip_tags($msg));?></p>
    <?php break;?>
    <?php } ?>
    <p class="info"><img src="__IMAGES__waiting.jpg" /></p>
    <p style="text-align: center">正在为您<a id="href" href="<?php echo($url);?>">跳转</a>...</p>
    <p style="text-align: center"><b id="wait"><?php echo($wait);?></b></p>
</div>
<script type="text/javascript">
    (function(){
        var wait = document.getElementById('wait'),
                href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                location.href = href;
                clearInterval(interval);
            };
        }, 1000);
    })();
</script>
</body>
</html>

