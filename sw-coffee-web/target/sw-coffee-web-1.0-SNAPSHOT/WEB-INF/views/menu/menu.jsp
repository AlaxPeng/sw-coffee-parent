<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/9
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>季度精选 - 饮品、食物、咖啡豆、杯子、星享卡和礼物 | SW_COFFEE</title>
<meta charset='utf-8'>

<!-- CSS -->
    <link rel='stylesheet' href='/static/css/menu.css'>
</head>

<body class='lang-zh page-menu' ontouchstart=''>
<div id='app-view-wrapper'>

<nav id='nav'>
<div class='container'>
    <header class='header'>
    <a class='logo' href='/account'>
    <img src='/static/img/login/assets/images/logo.svg' alt='sw咖啡'>
    </a>
    <div class='primary'>
        <ul>

            <li class='stores'>
                <a id='stores-primary' href='/shop'>
                    门店
                </a>
            </li>

            <li class='account'>
                <a id='account-primary' href='/account'>
                    我的帐户
                </a>
            </li>

            <li class='menu'>
                <a id='menu-primary' href='/menu' class='active'>
                    菜单
                </a>
            </li>

        </ul>
    </div>

    <a class='icon trigger' rel='nav-overlay' id='nav-menu'>
    <img src='/static/img/login/assets/icon/icon-hamburger.svg'>
    <span>更多</span>
    </a>

    </header>

    <div class='body'>
        <nav class='container middle secondary'>
            <div class='display-1'>菜单</div>
            <div class='tabs-wrapper'>
            <ul class='subcategories'>

            <li>
                <a class='active'>
                    最新出品
                </a>
            </li>
            <c:forEach var="commodityType" items="${commodityTypeList}">
                <li>
                    <a href='/menu/msg?commodityTypeSelfNo=${commodityType.commodityTypeNo}'>
                        ${commodityType.commodityTypeName}
                    </a>
                </li>
            </c:forEach>
            </ul>
            </div>
        </nav>
    </div>
</div>

</nav>


<!-- Page content -->
    <section id='content'>
    <section class='lto-items wrapper' id='lto-items'>
    <h2>所有新品</h2>
    <div class='grid columns-3 padded-2'>

    <c:forEach var="commodityMessageVo" items="${commodityMessageVoList}">
        <div class='item'>
            <input type="hidden" value="${commodityMessageVo.commodityMessage.commodityMessageNo}"/>
            <img src='/static/img${commodityMessageVo.commodityMessage.commodityMessageImg}'>
            <p>${commodityMessageVo.commodityMessage.commodityMessageName}</p>
        </div>
    </c:forEach>
    </div>
    </section>
    <div class='overlay' id='menu-search-overlay'>
    <header class='header'>
    <button class='icon close'>Close</button>
    </header>
    <div class='body'>
    <div class='field search'>
    <img src='/static/img/menu/assets/icon/icon-search.svg' class='icon'>
    <input type='text' id='menu-search-input' placeholder='搜索菜单'>
    </div>
    <div id='menu-search-empty'>
    <div class="tag">大家都在搜</div>
    </div>
    <ul class='grid columns-4 padded-2' id='menu-search-results'>
    <c:forEach items="${commodityMessageList}" var="commodityMessage">
        <li>
        <a class="overlay-close thumbnail" href="/menu/details?commodityMessageNo=${commodityMessage.commodityMessageNo}">
        <div class="preview circle" style="background-image: url(/static/img${commodityMessage.commodityMessageImg})"></div>
        <strong>${commodityMessage.commodityMessageName}</strong>
        </a>
        </li>
    </c:forEach>
    </ul>
    </div>
    </div>
    <div class='frap'>
    <button id="featured-campaign-search" class='button primary trigger' rel='menu-search-overlay'>搜索菜单</button>
    </div>
    </section>
    </div>
<script type='text/javascript' src='/static/js/jquery-3.3.1.js'></script>
<script type='text/javascript' src='/static/js/scripts.js'></script>
</body>
</html>

