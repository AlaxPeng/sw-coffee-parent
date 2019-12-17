<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/13
  Time: 11:55
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
    <link href="/static/css/register.css" rel="stylesheet">
</head>
<body>
<div class="container" style="margin-left: 0px;width: 100%">
    <div id="nav" style="width: 30%">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="tabbable">
                    <a class="shopPrimaryImg" href="account">
                        <img src="/static/img/login/assets/images/logo.svg" class="img-circle">
                    </a>
                    <ul id="ul" class="nav nav-tabs">
                        <li class="active" id="myAccount">
                            <a href="/">我的账户</a>
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
                    <div style="height: 647px">
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
                                        <li>
                                            <a href="/login">
                                                <span>登陆</span>
                                            </a>
                                        </li>
                                        <li class="active">
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
    <div style="width: 100%; height: 393.5px">
        <img style="width: 100%; height: 100%" alt="" src="/static/img/login/assets/images/account/header_cn.jpg">
    </div>
    <div style="width: 100%; height: 50px"></div>
    <div style="width: 100%; height: 212.5px">
        <div class="login">
            <div class="ok input-group input-group-lg">
                <input type="text" class="form-control" id="phone" value="${phone}" name="phone" placeholder="手机号码"/>
                <span style="color: red;margin-left: 20px" id = "phonespan"></span>
            </div>
            <div class="ok input-group input-group-lg">
                <input style="float: left;" type="text" class="form-control" id="code" name="code" placeholder="验证码"/>
                <div class="gainCode">
                    获取验证码
                </div>
            </div>
            <div>
                <button id="alogins" class="button button-large alogin" disabled="disabled">
						<span>
							注册
						</span>
                </button>
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 254px;" class="foot">
        <div style="width:70%;height:70%;margin-left: 20%;padding-top: 25px;color:white;">
            <h2 class="logo">
                <span>进去星享俱乐部</span>
            </h2>
            <p class="logo">
                <span>只需几分钟，便可成功注册星享俱乐部帐户，成为“星”会员，立即开启集星之旅。</span>
            </p>
            <a href="/login" style="text-decoration: none;" type="button" class="button-reg">
					<span>
						登陆
					</span>
            </a>
        </div>
    </div>
</div>
<script src="/static/js/register.js"></script>
</body>
</html>