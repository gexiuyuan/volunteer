<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
  <head>
    <title>登录</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"
    />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script src="/xiangyi/js/index.js"></script>

    <link rel="stylesheet" href="/xiangyi/css/login.css">
    
  </head>
  <body>
    <div class="login-wrap">
      <div class="msgAlert"></div>
      <div class="wrap_top">
        <img id="login" src="/xiangyi/img/login-bg_01.png" alt=""   />
      </div>
      <div class="login-cent">
        <div class="login-cent1">
          <img src="/xiangyi/img/login-blue1_03.png" alt="" />
          <input
            type="text"
            placeholder="请输入工号/学号"
            required
            id="user"
            name="username"
          />
        </div>
        <div class="login-cent1">
          <img src="/xiangyi/img/ligin-pic_08.png" alt="" />
          <input
            type="password"
            placeholder="请输入登录密码"
            required
            id="pass"
            name="password"
          />
        </div>
      </div>
      <div class="login-butt" onclick="btnT()">登录</div>
    </div>
    <script>
      $(document).ready(function() {
        var screenHeight = document.documentElement.clientHeight;
        $("body").css("height", screenHeight);
        $(".login-wrap").css("height", screenHeight);
      });
      $("#pass").focus(function() {
        $(".login-butt").css("opacity", "1");
      });
      function btnT()
      {
        var user = $('#user').val();
        var pass = $('#pass').val();
        console.log(user);
        console.log(pass);
        if (user == "") {
            msgAlert('账号不能为空');
            $(".login-butt").css("opacity", "0.5");
            return false
        }else if (pass=="") {
            msgAlert('密码不能为空');
            $(".login-butt").css("opacity", "0.5");
            return false
      }
      else{
          $.ajax({
            url:'/h5/login/index',
                type:'post',
                dataType:'json',
                data:{
                    username:user,
                    password:pass,
                },
                success:function (res) {
                    console.log(res);
                    if(res.status == 0){
                        msgAlert("该账号未导入");
                        $(".login-butt").css("opacity", "0.5");
                    }else{
                        msgAlert('登陆成功')
                        setTimeout(function () {
                            window.location.href = res.url;
                        },2000)
                    }
                }
          })
      }
    }
      function msgAlert(res)
      {
        $(".msgAlert").show();
        var html = '';
        html += '<div >'+res+'</div>';
        $('.msgAlert').html(html);
        var width=$(".msgAlert").width();
        var height=$(".msgAlert").height();
        $(".msgAlert").css({
            "margin-left":-width / 2,
            "margin-top":height / 2,
            "left":"50vw",
            "max-width":"60vw"
        })

        setTimeout(function () {
            $(".msgAlert").hide();

        },2000);
      } 
    </script>
  </body>
</html>