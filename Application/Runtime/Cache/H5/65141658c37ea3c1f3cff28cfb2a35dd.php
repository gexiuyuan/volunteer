<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="/xiangyi/js/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet" href="/xiangyi/css/XiangYi.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_831267_w87r6kbthrf.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_831267_ycv5dmyyqf.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_831267_acuwfleafpa.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_831267_2fzosq54oej.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_831267_m9nprmurm9h.css">
    <style>
        body{
            overflow-x: hidden;
            background-color: #efefef;
        }
        .wrap{
            width: 100vw;
            padding-bottom: 8.5vh;
        }
        .teacher-sex{
            float: left;
        }
        .sex-img{
            float: left;
            margin-left: 1vw;
            width: 3.2vw;
            height: 3.2vw;
        }
        img{
            width: 100%;
            height: 100%;
        }
        @media screen and (min-device-height:1024px) and (max-device-height:1366px){
            .sex-img{
                margin-top: 0.7vh!important;
            }
        }
        @media screen and (min-device-height:568px) and (max-device-height:568px){
            .sex-img{
                margin-top: -0.3vh!important;
            }
        }
        @media screen and (min-width:315px) and (max-width:320px){
            .teacher-sex1{
               width: 20vw!important;
            }
        }
        @media screen and (min-width:360px) and (max-width:412px){
            .teacher-sex1{
                width: 18vw!important;
            }
        }
        @media screen and (min-width:412px) and (max-width:414px){
            .teacher-sex1{
                width: 17vw!important;
            }
        }
        @media screen and (min-width:414px) and (max-width:768px){
            .teacher-sex1{
                width: 17vw!important;
            }
        }
        @media screen and (min-width:768px) and (max-width:1024px){
            .teacher-sex1{
                width: 17vw!important;
            }
        }

        .student-foot{
            display: flex;
        }
        .student-foot li{
            float: left;
            flex-grow: 1;
            border-right: 1px solid #eeeeee;
            height: 8.5vh;
            padding: 0 2.5vw;
            overflow: hidden;
        }
        .student-foot li  .iconfont{
            float: left;
            font-size:4.5vw;
            margin-top: 2.8vh; 
         }
       .student-foot li img{
            height: 2vh;
            margin-top: 2.8vh;
            padding-left: 1vw;
        }
        .student-foot li p{
            font-size: 3.5vw;
            float: left;
            text-align: center;
        }
        .div{
            width: 2.5rem;
            height: 2.5rem;
            right: 0rem;            
            position:fixed;
            z-index: 99999;

        }
    </style>
</head>
<body>
<div class="div" id="div" >
    <img src="/xiangyi/img/jiahao.png" alt="">
</div>
<script>
    var isClick=true;
    var ofLeftAfter;
    var ofTopAfter;
    var ofLeft;
    var ofTop;
    var sum;
    var isMove;
        $('.div').each(function(index){
        $(this).on('touchstart', function(evt) {
            ofLeft = $(this).position().left;
            ofTop = $(this).position().top;
            var e = event || evt;
            e.preventDefault();//阻止其他事件
            isClick=true;
            isMove=false;
        }).on('touchmove', function(evt) {
            
            var e = event || evt;
            e.preventDefault();//阻止其他事件
            // 如果这个元素的位置内只有一个手指的话
            //console.log(e.targetTouches)
            if (e.targetTouches.length == 1) {
                var touch = e.targetTouches[0];  // 把元素放在手指所在的位置
                var ofLeftAfter = $(this).position().left;
                var ofTopAfter = $(this).position().top;
                var absLeft = ofLeft-ofLeftAfter;
                var absTop = ofTop-ofTopAfter;
                sum = Math.sqrt(absLeft*absLeft+absTop*absTop);
                $(this).css("left",(touch.pageX- parseInt($(this).width())/2 + 'px'));
                $(this).css("top",(touch.pageY- parseInt($(this).height())/2 + 'px'));
                isMove=true;
            }
        }).on('touchend', function(evt) {
            if(isMove==true){
                (sum <=13)?isClick=true:isClick=false;
                }
            var e = event || evt;
            e.preventDefault();//阻止其他事件
            if(isClick==true){
            window.location.href='/h5/student/release_wish.html';
            }
        })
    });
</script>

<div class="wrap">
    <div class="teacher-head">
        <img src="/xiangyi/img/teacher-pic1_03.png" alt="">
        <p>个人中心</p>
    </div>
    <div class="teacher-top">
        <div class="teacher-bg">
            <img src="<?php echo ($data['headimgurl']); ?>" alt="" class="teach-hi">
        </div>
        <p class="teacher-name"><?php echo ($data['name']); ?></p>
        <div class="teacher-sex1">
             <?php if($data['sex'] == 1): ?><div class="teacher-sex">性别：<span>男</span></div>
                <div class="sex-img">
                    <img src="/xiangyi/img/man_03.png" alt="" class="tc-pic">
                </div>
            <?php elseif($data['sex'] == 2): ?>
                <div class="teacher-sex">性别：<span>女</span></div>
                <div class="sex-img">
                    <img src="/xiangyi/img/teach-sex_07.png" alt="" class="tc-pic">
                </div>
            <?php else: ?>
                <div class="teacher-sex">性别：<span>未知</span>
                </div><?php endif; ?>
        </div>
    </div>
    <ul class="teacher-cent" >
        <li>
            <div class="teacher-left">
                <img src="/xiangyi/img/teacher-pics_05.jpg" alt="" class="tc_pic">
                <p>学院</p>
            </div>
            <p class="teacher-right"><?php echo ($data['a_name']); ?></p>
        </li>
        <li>
            <div class="teacher-left">
                <img src="/xiangyi/img/teacher-pics_08.jpg" alt="" class="tc_pic">
                <p>电话</p>
            </div>
            <p class="teacher-right"><?php echo ($data['mobile']); ?></p>
        </li>
        <li>
            <div class="teacher-left">
                <img src="/xiangyi/img/teacher-pics_10.jpg" alt="" class="tc_pic">
                <p>学号</p>
            </div>
            <p class="teacher-right"><?php echo ($data['school_number']); ?></p>
        </li>
        <li>
            <div class="teacher-left">
                <img src="/xiangyi/img/teacher-pics_12.png" alt="" class="tc_pic">
                <p>志愿总时长</p>
            </div>
            <p class="teacher-right"><?php echo ($data['m_a_time']); ?></p>
        </li>
    </ul>
    <ul class="teacher-foot student-foot">
   <!--  <li onclick="jumpPage(this)" data-href="/h5/student/release_wish">
            <img src="/xiangyi/img/foot-white2_03.png" alt="" class="foot-pic">
            <p class="foot-p">发布心愿</p>
        </li> -->
        <li onclick="jumpPage(this)" data-href="/h5/student/wish_Release">
            <i class="iconfont icon-jiaolian1"></i>
            <p class="foot-p">我的发布</p>
        </li>
        <li onclick="jumpPage(this)" data-href="/h5/student/wish_list">
            <i class="iconfont icon-xin"></i>
            <p class="foot-p">我的接受</p>
        </li>
        <li onclick="jumpPage(this)" data-href="/h5/student/wish_pool">
            <i class="iconfont icon-liwu1"></i>
            <p class="foot-p">心愿之池</p>
        </li>
        <li class="foot-style" data-href="/h5/student/index">
            <i class="iconfont icon-ren"></i>
            <p class="foot-p">个人中心</p>
        </li>
    </ul>
</div>
</body>
</html>
<script>
    // 跳页
    function jumpPage(e) {
        var href=$(e).attr("data-href")
        window.location.href=href
    }
    function goBack() {
        window.history.go(-1)
    }
</script>
<!-- <script>
        var isClick=true;
         $('.div').each(function(index){
        $(this).on('touchstart', function(evt) {
            var e = event || evt;
            e.preventDefault();//阻止其他事件
            isClick=true;
        }).on('touchmove', function(evt) {
            var e = event || evt;
            e.preventDefault();//阻止其他事件
            // 如果这个元素的位置内只有一个手指的话
            //console.log(e.targetTouches)
            if (e.targetTouches.length == 1) {
                var touch = e.targetTouches[0];  // 把元素放在手指所在的位置
                $(this).css("left",(touch.pageX- parseInt($(this).width())/2 + 'px'));
                $(this).css("top",(touch.pageY- parseInt($(this).height())/2 + 'px'));
            }
            isClick=false;
        })
// .on('touchend', function(evt) {
//             var e = event || evt;
//             e.preventDefault();//阻止其他事件
//             if(isClick==true){window.location.href='/h5/teacher/release_wish.html'
//             }
//         })
    });

       </script> -->