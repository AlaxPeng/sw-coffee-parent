<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/13
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>星巴克 | 用每一杯咖啡传递星巴克独特的咖啡体验</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <link href="/static/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container" style="margin-left: 0px">
    <div id="nav" style="width: 30%">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="tabbable">
                    <a class="shopPrimaryImg" href="account">
                        <img src="/static/img/login/assets/images/logo.svg" class="img-circle">
                    </a>
                    <ul id="ul" class="nav nav-tabs">
                        <li class="active" id="myAccount">
                            <a href='/account'>我的账户</a>
                        </li>
                        <li>
                            <a href="/shop">门店</a>
                        </li>
                        <li>
                            <a href="/menu">菜单</a>
                        </li>
                        <li>
                            <a href="/set">
                                <img alt="" src="/static/img/login/assets/icon/icon-hamburger.svg">
                            </a>
                        </li>
                    </ul>
                    <div class="login-msg">
                        <div class="row clearfix">
                            <div class="col-md-12 column" style="top:200px">
                                <div>
                                    <div class="display-1">
											<span>
												登录或创建一个新帐户
												<br>🌟
											</span>
                                    </div>
                                    <ul class="nav nav-pills nav-stacked" style="width: 20%;">
                                        <li class="active">
                                            <a href="/login">
                                                <span>登陆</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/register">
                                                <span>注册</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="width: 70%;height: 900px;float:right;">
    <div style="height: 393.5px">
        <img style="width: 100%; height: 100%" alt="" src="/static/img/login/assets/images/account/header_cn.jpg">
    </div>
    <div style=" height: 50px"></div>
    <div style=" height: 212.5px">
        <div class="login">
            <div class="ok input-group input-group-lg">
                <input type="text" class="form-control" id="username" name="username" placeholder="用户名"/>
            </div>
            <a class="aPhoneRegister" href="/login/register">使用手机号登录或注册</a>
            <span id = "usernamespan"></span>
            <div class="ok input-group input-group-lg">
                <input type="password" class="form-control" id="password" name="password" placeholder="密码"/>
            </div>
            <div class="hides"></div>
            <div class="shows"></div>
            <div id="aForgetPassword" data-toggle="modal" data-target="#myModal">忘记密码</div>
            <div>
                <button type="button" id="btnlogin" class="button-large alogin" disabled="disabled">
						<span>
							登陆
						</span>
                </button>
            </div>
        </div>
    </div>
    <div style="height: 254px;" class="foot">
        <div style="width:70%;height:70%;margin-left: 20%;padding-top: 25px;color:white;">
            <h2 class="logo">
                <span>加入星享俱乐部</span>
            </h2>
            <p class="logo">
                <span>只需几分钟，便可成功注册星享俱乐部帐户，成为“星”会员，立即开启集星之旅。</span>
            </p>
            <a href="/register" style="text-decoration: none;" type="button" class="button-reg">
					<span>
						注册
					</span>
            </a>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    手机验证
                </h4>
            </div>
            <div class="modal-body">
                <input type="text" id="modalPhone" class="form-control" placeholder="手机号码"/>
                <input type="text" id="modalcode" class="form-control" placeholder="验证码"/>
                <div class="gaincode">
                    获取验证码
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnmodal" type="button" data-toggle="modal" data-target="#myModal1" data-dismiss="modal" class="btn btn-primary">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    密码确认
                </h4>
            </div>
            <div class="modal-body">
                <input type="password" id="oldmodal1password" class="form-control" placeholder="新密码"/>
                <input type="password" id="newmodal1password" class="form-control" placeholder="确认新密码"/>
            </div>
            <div class="modal-footer">
                <button id="btnmodal1" type="button" data-dismiss="modal" class="btn btn-primary">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script src="/static/js/login.js"></script>
</body>
</html>
