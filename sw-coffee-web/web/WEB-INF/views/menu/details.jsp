<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/11
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>

        <title> | </title>

        <meta charset='utf-8'>

        <meta name='theme-color' content='#ffffff'>

        <link rel='stylesheet' href='/static/css/menu.css'>
    </head>

    <body class='lang-zh type-products' ontouchstart=''>

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
                            <a href='/menu/msg?commodityTypeNo=${commodityMessageVo.commodityType.commodityTypeNo}' class='back'>
                            <img src='/static/img/menu/assets/icon/icon-chevron-left.svg'>
                                ${commodityMessageVo.commodityType.commodityTypeName}
                            </a>
                        </nav>

                    </div>
                </div>

            </nav>
        <section id='content'>

            <div class='tablet-flex tablet-flex-column'>
                <div class='flex flex-column tablet-flex-row product-intro bg-light-grey '>
                    <div class='order1 tablet-flex1 col-1 flex-auto items-center self-center justify-center center'>
                        <img src='/static/img${commodityMessageVo.commodityMessage.commodityMessageImg}' class='product'>
                    </div>

                    <div class='order2 tablet-flex1 flex flex-column justify-center col-2'>
                        <div class='section'>
                        <!-- basics -->
                        <p class='caption gold margin3'>${commodityMessageVo.commodityType.commodityTypeName}</p>
                        <h1 class='display-1 margin3'>${commodityMessageVo.commodityMessage.commodityMessageName}</h1></br>
                        <h2>价钱:${commodityMessageVo.commodityMessage.commodityMessageMoney}</h2>
                        <p>${commodityMessageVo.commodityMessage.commodityMessageSynopsis}</p>
                        </div>
                    </div>
                </div>

                <div class='section wrapper fluid bg-natural-grey space also' id='recommendations'>
                    <div class='wrapper fluid'>
                        <h2 class='title-2'>猜你喜欢</h2>
                    </div>
                    <div class='scroll-wrapper'>
                        <div class='scroll'>
                            <div class='wrapper fluid'>
                                <c:forEach var="commodityMessage" items="${commodityMessages}">
                                    <a id='menu-product-related-sparkling-pink-pom-cold-brew'
                                    href='/menu/details?commodityMessageNo=${commodityMessage.commodityMessageNo}' class='thumbnail'>
                                    <div class='preview circle' style='background-image: url("/static/img${commodityMessage.commodityMessageImg}")'></div>
                                    <strong>${commodityMessage.commodityMessageName}</strong>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div id='app-notification'></div>
        </section>
        <div id='app-loading'></div>
        <div id='app-auth'></div>


        </div>

        <script type='text/javascript' src='/static/js/jquery-3.3.1.js'></script>

    </body>
</html>

