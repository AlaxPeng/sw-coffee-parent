<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/2
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <title>地图显示</title>
    <title>星巴克 | 用每一杯咖啡传递星巴克独特的咖啡体验</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static/js/jquery-3.3.1.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <link href="/static/css/shop.css" rel="stylesheet">
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
                        <li id="myAccount">
                            <a href='/account'>我的账户</a>
                        </li>
                        <li class="active">
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
                    <div class="shop" >
                        <ul id="shupMap">
                        </ul>
                    </div>
                    <div class="shopMsg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="width: 70%;height:695px;float:right;">
    <div id = "containerTu"></div>
    <div id="panel"></div>
</div>
<!-- 加载地图JSAPI脚本 -->
<script src="http://webapi.amap.com/maps?v=1.3&key=131e8d0567e60c7789ba81b8c6204058&plugin=AMap.Walking"></script>
<script src="/static/js/shop.js"></script>
</body>
</html>

