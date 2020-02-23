<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/20
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SW_COFFEE | 给生活带更多快乐</title>

    <meta name="theme-color" content="#ffffff">

    <link rel="stylesheet" href="/static/css/menu.css">
<body class="lang-zh page-account chrome logged-in" ontouchstart="">
<div id="app-view-wrapper">
    <nav id="nav">
        <div class="container">
            <header class="header">
                <a class="logo" href="/">
                    <img src="/static/img/login/assets/images/logo.svg" alt="SW_COFFEE">
                </a>
                <div class="primary">
                    <ul>

                        <li class="/shop">
                            <a id="stores-primary" href="/shop/">
                                门店
                            </a>
                        </li>

                        <li class="/">
                            <a id="account-primary" href="/account/" class="active">
                                <span data-reactroot="" class="">我的帐户</span>
                            </a>
                        </li>

                        <li class="/menu">
                            <a id="menu-primary" href="/menu/">
                                菜单
                            </a>
                        </li>

                    </ul>
                </div>

                <a class="icon trigger" rel="nav-overlay" id="nav-menu">
                    <img src="/static/img/account/assets/icons/icon-hamburger.svg">
                    <span>更多</span>
                </a>

            </header>

            <div class="body">
                <div id="react-account-navigation-bar" class="body">
                    <nav data-reactroot="" class="container middle secondary">
                        <div class="display-1"><span>早上好! <img style="width: 25px;height: 25px;"
                                                               src="${ user.portrait != null ? user.portrait : '/static/img/account/images/careers-cup.png'  }"> ${user.surname} &nbsp;☕</span>
                        </div>
                        <div class="tabs-wrapper">
                            <ul class="subcategories">
                                <li><a class="false" href="/account/"><span>帐户一览</span></a></li>
                                <li><a class="false" href="/account/activity"><span>消费记录</span></a></li>
                                <li><a class="false" href="/account/rewards"><span>星享好礼</span></a></li>
                                <li><a class="active" href="/account/profile"><span>管理我的帐户</span></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>

            </div>
        </div>


        <div class="overlay " id="nav-overlay">
            <div class="container">
                <header class="header">
                    <a class="logo" href="/">
                        <img src="/static/img/login/assets/images/logo.svg" alt="SW_COFFEE">
                    </a>
                    <button class="icon close">Close</button>
                </header>
                <section class="body">
                    <div class="container middle">
                        <ul>

                            <li>
                                <a id="stores-overlay" href="/stores/">
                                    门店
                                </a>
                            </li>


                            <li>
                                <a id="account-overlay" href="/account/" class="active"><span data-reactroot=""
                                                                                              class="">我的帐户</span></a>
                            </li>


                            <li>
                                <a id="menu-overlay" href="/menu/">
                                    菜单
                                </a>
                            </li>
                            <li>
                                <a id="help-overlay" href="/help/">
                                    帮助中心
                                </a>
                            </li>
                            <li>
                                <hr>
                            </li>
                        </ul>
                        <footer class="account">
                            <div id="account-logout"><span data-reactroot=""><a id="menu-login" class="sign-in"><img
                                    src="/static/img/account/assets/icons/icon-account.svg"><span>登出</span></a></span>
                            </div>
                        </footer>
                    </div>
                </section>
            </div>
        </div>

    </nav>
    <!-- Page content -->
    <section id="content">

        <div id="react-account-app">
            <div data-reactroot="">
                <div class="account_app">
                    <div><!-- react-text: 263 --> <!-- /react-text -->
                        <div class="profile_index">
                            <ul>
                                <li><a href="/account/profile/personal"><span>个人资料</span><img
                                        src="/static/img/account/assets/icons/ic_profile.svg"><br><small>修改个人资料，查看帐户周年日</small></a></li>
                                <li><a href="/account/profile/security"><span>帐户与安全</span><img
                                        src="/static/img/account/assets/icons/ic_security.svg"><br><small>管理用户名，邮箱地址，手机号和密码</small></a>
                                </li>
                                <li><a href="/account/profile/address-book"><span>邮寄地址簿</span><img
                                        src="/static/img/account/assets/icons/ic_address.svg"><br><small>添加、修改、删除地址</small></a></li>
                                <li><a href="/account/profile/setting"><span>设置</span><img
                                        src="/static/img/account/assets/icons/ic_setting.svg"><br><small>注销当前帐户</small></a>
                                </li>
                            </ul>
                        </div><!-- react-text: 302 --> <!-- /react-text --></div>
                    <div class="loading"></div>
                    <div></div>
                    <div data-gtm-vis-recent-on-screen-7406333_215="46374"
                         data-gtm-vis-first-on-screen-7406333_215="46375"
                         data-gtm-vis-total-visible-time-7406333_215="100" data-gtm-vis-has-fired-7406333_215="1"></div>
                    <div class="dialog">
                        <div class="dialog-scroller">
                            <div class="dialog-container">
                                <div class="dialog-box">
                                    <header class="header">
                                        <button class="icon close">×</button>
                                        <h3></h3></header>
                                    <div class="body center"></div>
                                    <footer class="footer"></footer>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="app-notification">
            <div data-reactroot=""></div>
        </div>
    </section>
    <div id="app-loading">
        <div data-reactroot="" class="loading"></div>
    </div>
    <div id="app-auth"><span data-reactroot=""></span></div>


</div>
<script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>


<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>
</body>
</html>