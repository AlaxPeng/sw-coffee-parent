<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/20
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SW_COFFEE | 给生活带更多快乐</title>

    <meta name="theme-color" content="#ffffff">

    <link rel="stylesheet" href="/static/css/menu.css">
    <link rel="stylesheet" href="/static/css/cropper.min.css">
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
                    <nav data-reactroot="" class="container middle secondary"><a class="back" href="/account/profile"><img
                            src="/static/img/account/assets/icons/icon-chevron-left.svg"><span>管理我的帐户</span></a>
                        <div class="display-1"><span>个人资料</span></div>
                        <div class="tabs-wrapper">
                            <ul class="subcategories"></ul>
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
                                    src="/static/img/account/assets/icons/icon-account.svg"><span>登出</span></a></span></div>
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
                    <div>
                        <form id="form-save">
                            <div class="profile profile_personal">
                                <div class="wrapper small"><h2><span>个人资料</span></h2>
                                    <div class="field floating">
                                        <div class="ok"><img name = "file" id="portrait" style="width: 150px;height: 150px" src="${ user.portrait != null ? user.portrait : '/static/img/account/images/careers-cup.png'  }"/><label>头像</label></div>
                                    </div>
                                    <div class="field floating">
                                        <div class="ok"><input type="text" name="surname" placeholder="姓"
                                                               value="${user.surname}"><label>姓</label></div>
                                    </div>
                                    <div class="field floating">
                                        <div class="ok"><input type="text" name="name" placeholder="名"
                                                               value="${user.name}"><label>名</label></div>
                                    </div>
                                    <div class="select"><label for="gender-select">性别</label><select id="gender-select"
                                                                                                     name="sex">
                                        <c:if test="${user.sex}">
                                            <option value="1"><span>男</span></option>
                                            <option value="0"><span>女</span></option>
                                        </c:if>
                                        <c:if test="${!user.sex}">
                                            <option value="0"><span>女</span></option>
                                            <option value="1"><span>男</span></option>
                                        </c:if>

                                    </select></div>
                                    <br><br>
                                    <h2><span>帐户日期</span></h2>
                                    <div class="card"><h4 class="caption"><span>您的生日</span></h4><strong>${user.birthday}</strong>
                                        <p class="light margin-t-2"><span>这是您注册时提供的生日信息，注册后不能修改。铂金会员另有生日好礼哦。</span></p>
                                    </div>
                                    <div class="actions">
                                        <button id="my_preserve" class="button large">保存</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
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
</div>

<script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/static/js/personal.js"></script>
<script type="text/javascript" src="/static/js/img-cropping.js"></script>
<script type="text/javascript" src="/static/js/cropper.min.js"></script>

<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>
</body>
</html>