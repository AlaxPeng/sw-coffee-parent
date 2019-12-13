<%--
Created by IntelliJ IDEA.
User: Alex
Date: 2019/12/11
Time: 15:22
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>饮料 | SW_COFFEE</title>

    <meta charset='utf-8'>
    <meta name='theme-color' content='#ffffff'>

    <link rel='stylesheet' href='/static/css/menu.css'>
</head>

<body class='lang-zh page-menu-beverages' ontouchstart=''>
    <div id='app-view-wrapper'>
<!-- Navigation panel -->
    <nav id='nav'>
        <div class='container'>
            <header class='header'>
                <a class='logo' href='/shop'>
                    <img src='/static/img/login/assets/images/logo.svg' alt='sw_coffee'>
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
                        <a id='menu-primary' href='/menu'>
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
                    <a href='/menu' class='back'>
                        <img src='/static/img/menu/assets/icon/icon-chevron-left.svg'>
                            菜单
                        </a>
                    <div class='display-1'>${commodityTypeVos.get(0).commodityParentType.commodityTypeName}</div>
                    <div class='tabs-wrapper'>
                        <ul class='subcategories'>
                            <li>
                                <a href='/menu/msg?commodityTypeSelfNo=${commodityTypeVos.get(0).commodityParentType.commodityTypeNo}'>
                                    全部
                                </a>
                            </li>
                            <c:forEach var="commodityTypeVo" items="${commodityTypeVos}">
                                <li>
                                    <a href='/menu/msg?commodityTypeSelfNo=${commodityTypeVo.commodityType.commodityTypeSelfNo}&&commodityTypeNo=${commodityTypeVo.commodityType.commodityTypeNo}'>
                                        ${commodityTypeVo.commodityType.commodityTypeName}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </nav>

    <section id='content'>
        <div class='wrapper fluid margin page-menu-list'>
            <c:forEach var="commodityTypeVo" items="${commodityTypeVos}" begin="0" step="1">
                <hr>
                <h3 class='caption'>${commodityTypeVo.commodityType.commodityTypeName}</h3>
                <ul class='grid padded-3 product'>
                    <c:forEach items="${commodityTypeVo.commodityMessages}" var="commodityMessage">
                    <li>
                        <a href='/menu/details?commodityMessageNo=${commodityMessage.commodityMessageNo}' class='thumbnail'>
                            <div class='preview circle' style='background-image: url("/static/img${commodityMessage.commodityMessageImg}")'></div>
                            <strong>${commodityMessage.commodityMessageName}</strong>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </c:forEach>
        </div>

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
