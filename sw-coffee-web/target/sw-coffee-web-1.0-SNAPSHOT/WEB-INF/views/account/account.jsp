<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 2019/12/17
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="theme-color" content="#ffffff">
    <title>SW_COFFEE</title>
    <link rel="stylesheet" href="/static/css/menu.css">
</head>

<body class="lang-zh page-account chrome logged-in" ontouchstart="">


<div id="app-view-wrapper">
    <!-- Navigation panel -->

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
                        <div class="display-1"><span>早上好! <img style="width: 25px;height: 25px;" src="${ user.portrait != null ? user.portrait : '/static/img/account/images/careers-cup.png'  }"> ${user.surname} &nbsp;☕</span></div>
                        <div class="tabs-wrapper">
                            <ul class="subcategories">
                                <li><a class="active" href="/account/"><span>帐户一览</span></a></li>
                                <li><a class="false" href="/account/activity"><span>消费记录</span></a></li>
                                <li><a class="false" href="/account/rewards"><span>星享好礼</span></a></li>
                                <li><a class="false" href="/account/profile"><span>管理我的帐户</span></a></li>
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
                    <section class="wrapper section dashboard submit-box">
                        <div class="box margin msr welcome-level">
                            <header class="header"><img src="/static/img/account/assets/icons/icon-rewards-white.svg" class="icon">
                                <h2 class="headline">${userMembershipVo.membershipGrade.gradeName != null ? userMembershipVo.membershipGrade.gradeName : '您还不是会员哦' }</h2></header>
                            <div class="body flex flex-column tablet-flex-row">
                                <div class="summary flex2 padded-r1">
                                    <div class="account-info account-info-welcome">
                                        <div class="tier-progress-wrapper">
                                            <div class="tier-progress">
                                                    <div class="tier tier-green">
                                                        <span>普通用户</span>
                                                    </div>
                                                <c:forEach items="${membershipGradeList}" var="membershipGrade">
                                                    <div class="tier tier-green" style="left: ${membershipGrade.gradeStarNumber/membershipStarMax*100}%;">
                                                        <span>${membershipGrade.gradeName}</span>
                                                    </div>
                                                </c:forEach>
                                                <div class="fill" style="width: ${membershipGrade.gradeStarNumber/membershipStarMax*100}%;"></div>
                                                <div class="star-count" style="left: ${membershipGrade.gradeStarNumber/membershipStarMax*100}%;">
                                                    <span>0
                                                        <img src="/static/img/account/assets/icons/icon-star-black.svg">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="next">
                                            <div>目前星星数：${user.starsNumber}
                                            </div>
                                            <div class="privilege-title"><span>会员权益：</span></div>
                                            <div class="privileges flex flex-row flex-wrap items-start">
                                                <button class="scroll-arrow-my scroll-arrow-left" style="margin-right: 20px;" value="${membershipGiftsPageInfo.prePage}">
                                                    <img src="/static/img/account/assets/icons/icon-scroll-left.svg">
                                                </button>
                                                <div id="giftsParent">
                                                <c:forEach items="${membershipGiftsPageInfo.list}" var="membershipGifts">
                                                    <button class="privilege privilege--green" value="${membershipGifts.giftsBasicRules},${membershipGifts.giftsDepreciate}">
                                                        <div class="badge"><img src="/static/img/account/assets/icons/icon-coupon-white.svg">
                                                            <c:if test="${userMembershipVo.membershipTime == null}">
                                                                <div class="lock"><img src="/static/img/account/assets/icons/icon-lock-white.svg">
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${userMembershipVo.membershipTime != null}">
                                                                <c:if test="${userMembershipVo.membershipGrade < membershipGifts.gradeNo}">
                                                                    <div class="lock"><img src="/static/img/account/assets/icons/icon-lock-white.svg">
                                                                    </div>
                                                                </c:if>
                                                            </c:if>
                                                        </div>
                                                        <span>${membershipGifts.giftsName}</span>
                                                    </button>
                                                </c:forEach>
                                                </div>
                                                <button class="scroll-arrow-my scroll-arrow-right" value="${membershipGiftsPageInfo.nextPage}">
                                                    <img src="/static/img/account/assets/icons/icon-scroll-right.svg">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="corner">
                                        <div>
                                            <c:if test="${userMembershipVo.membershipTime != null}">
                                                <strong><span>会员到期日：</span></strong>${userMembershipVo.membershipTime.memberShipTimeEnd}
                                            </c:if>
                                            <c:if test="${userMembershipVo.membershipTime == null}">
                                                <strong><span>您还不是会员哦！</span></strong>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box margin my-rewards">
                            <header class="header"><img src="/static/img/account/assets/icons/icon-gift.svg" class="icon"><span
                                    class="h2 count"><strong>4</strong></span>
                                <h2 class="headline"><span>星享好礼</span></h2></header>
                            <div class="body">
                                <ul class="list">
                                    <li><img src="/static/img/account/assets/icons/icon-reward-gold.svg"><h4>指定烘焙产品85折</h4><small>2019/12/22</small>
                                    </li>
                                    <li><img src="/static/img/account/assets/icons/icon-reward-gold.svg"><h4>指定蛋糕立减5元</h4>
                                        <small>2019/12/22</small></li>
                                    <li><img src="/static/img/account/assets/icons/icon-reward-gold.svg"><h4>4片及以上蛋糕立减25元（4/5/6片装）</h4>
                                        <small>2019/12/22</small></li>
                                </ul>
                            </div>
                            <footer class="footer"><a id="view-all-rewards-text" href="/account/#/rewards" class="link"><span>查看好礼详情</span></a>
                            </footer>
                        </div>
                        <div class="box activity">
                            <header class="header"><img src="/static/img/account/assets/icons/icon-receipt.svg" class="icon">
                                <h2 class="headline"><span>消费记录</span></h2></header>
                            <div class="body">
                                <div class="empty-message-wrapper"><span>您目前没有任何的消费记录，到邻近的星巴克消费吧。</span></div>
                            </div>
                            <footer class="footer"><a id="view-activity" href="/account/#/activity" class="link"><span>查看更多</span></a>
                            </footer>
                        </div>
                    </section>
                    <div class="loading"></div>
                    <div></div>
                    <div></div>
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
        <div class="dialog privilege-detail"></div>
    </section>
    <div id="app-loading">
        <div data-reactroot="" class="loading"></div>
    </div>
    <div id="app-auth"><span data-reactroot=""></span></div>


</div>

<!-- Javascript -->


<script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/static/js/scripts.js"></script>
<script type="text/javascript" src="/static/js/account.js">
</script>

<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>
</body>
</html>
