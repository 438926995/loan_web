<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    Object user = session.getAttribute("user");
    boolean isLogin = false;
    if (user != null) {
        isLogin = true;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>贷款平台</title>
    <meta name="description"
          content="Dragonfruit is one of the free HTML5 Templates from templatemo. It is a parallax layout with jQuery slider, events, and timeline."/>
    <meta name="author" content="templatemo">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<%=path%>/favicon.png"/>
    <!-- Font Awesome -->
    <link href="<%=path%>/css/font-awesome.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Camera -->
    <link href="<%=path%>/css/camera.css" rel="stylesheet">
    <!-- Template  -->
    <link href="<%=path%>/css/templatemo_style.css" rel="stylesheet">
    <link href="<%=path%>/css/remodal.css" rel="stylesheet">
    <link href="<%=path%>/css/remodal-default-theme.css" rel="stylesheet">
    <link href="<%=path%>/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="<%=path%>/css/parsley.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .stopwatch {
            position: absolute;
            bottom: 23px;
            width: 100%;
            min-height: 30px;
            padding: 20px;
            margin-bottom: -24px;
            text-align: center;
            background-color: rgba(142, 152, 160, .4);
        }

        .number {
            dispaly: inline-block;
            min-width: 25%;
            max-width: 30%;
            height: 100%;
            color: #fff;
        }

        .number span {
            font-size: 4em;
            font-weight: 100px;
        }

        p label {
            color: pink;
        }
    </style>
</head>
<body>
<div class="banner" id="templatemo_banner_slide">
    <ul>
        <li class="templatemo_banner_slide_02">
            <div class="stopwatch">
                <div class="number">
                    累计<span>${number }</span>个申请
                </div>
            </div>
        </li>
    </ul>
</div>

<div id="templatemo_mobile_menu">
    <ul class="nav nav-pills nav-stacked">
        <li><a href="#templatemo_banner_slide"><i
                class="glyphicon glyphicon-home"></i> &nbsp; 主页</a></li>
        <li><a href="#templatemo_about"><i
                class="glyphicon glyphicon-briefcase"></i> &nbsp; 关于</a></li>
        <li><a href="#templatemo_events"><i
                class="glyphicon glyphicon-bullhorn"></i> &nbsp; 产品</a></li>
        <li><a href="#templatemo_timeline"><i
                class="glyphicon glyphicon-calendar"></i> &nbsp; test</a></li>
        <li><a href="#templatemo_contact"><i
                class="glyphicon glyphicon-phone-alt"></i> &nbsp; 登录1</a></li>
    </ul>
</div>
<div class="container_wapper">
    <div id="templatemo_banner_menu">
        <div class="container-fluid">
            <div class="col-xs-4 templatemo_logo">
                <!-- <a rel="nofollow" href="http://www.cssmoban.com/preview/templatemo_411_dragonfruit"> -->
                <img src="images/templatemo_logo.jpg" id="logo_img"
                     alt="dragonfruit free html5 template"/>
                <h1 id="logo_text">
                    dragon<span>fruit</span>
                </h1>
                <!-- </a> -->
            </div>
            <div class="col-sm-8 hidden-xs">
                <ul class="nav nav-justified">
                    <li><a href="#templatemo_banner_slide">主页</a></li>
                    <li><a href="#templatemo_about">关于</a></li>
                    <li><a href="#templatemo_events">产品</a></li>
                    <!-- <li><a href="#templatemo_timeline">ss</a></li> -->
                    <c:choose>
                        <c:when test="${user != null }">
                            <li><a href="javascript:void(0);" onclick="goUserCenter();"
                                   title="个人中心"><span
                                    class="glyphicon glyphicon-user"/>&emsp;${user}</a></li>
                            <li><a href="javascript:void(0);" title="注销" onclick="logout()"><span
                                    class="glyphicon glyphicon-off"/></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#templatemo_contact">注册</a></li>
                            <li><a href="javascript:void(0);" onclick="login()">登录</a></li>
                        </c:otherwise>
                    </c:choose>
                    <%-- <c:if test="${!isLogin }">
                        <li>欢迎: ${user}</li>
                    </c:if> --%>
                    <!-- <li><a href="javascript:void(0);" onclick="login()">登录</a></li> -->
                </ul>
            </div>
            <div class="col-xs-8 visible-xs">
                <a href="#" id="mobile_menu"><span
                        class="glyphicon glyphicon-th-list"></span></a>
            </div>
        </div>
    </div>
</div>
<div class="copyrights">
    Collect from <a href="http://www.cssmoban.com/">网页模板</a>
</div>
<div id="templatemo_about" class="container_wapper">
    <div class="container-fluid">
        <h1>About Our Organization</h1>
        <div class="col-sm-6 col-md-3 about_icon">
            <div class="imgwap mission">
                <i class="fa fa-rocket"></i>
            </div>
            <h2>Revenues</h2>
            <p>Sed do eiusmod tempor incididunt ut labore et.</p>
        </div>
        <div class="col-sm-6 col-md-3 about_icon">
            <div class="imgwap product">
                <i class="fa fa-cubes"></i>
            </div>
            <h2>Opportunities</h2>
            <p>Tempor incididunt ut labore et dolore magna.</p>
        </div>
        <div class="col-sm-6 col-md-3 about_icon">
            <div class="imgwap testimonial">
                <i class="fa fa-bar-chart-o"></i>
            </div>
            <h2>Growth</h2>
            <p>Dolore magna aliqua. Ut enim ad minim veniam.</p>
        </div>
        <div class="col-sm-6 col-md-3 about_icon">
            <div class="imgwap statistic">
                <i class="fa fa-comments"></i>
            </div>
            <h2>Social Media</h2>
            <p>Aliqua. Ut enim ad minim veniam, quis nostrud aliqua.</p>
        </div>
        <div class="clearfix testimonial_top_bottom_spacer"></div>
        <div class="col-xs-1 pre_next_wap" id="prev_testimonial">
            <a href="#"><span
                    class="glyphicon glyphicon-chevron-left pre_next"></span></a>
        </div>

        <div id="testimonial_text_wap" class="col-xs-9 col-sm-10">
            <div class="testimonial_text">
                <div class="col-sm-3">
                    <img src="images/templatemo_member_01.jpg" class="img-responsive"
                         alt="Business Development Manager"/>
                </div>
                <div class="col-sm-9">
                    <h2>Tracy Mya</h2>
                    <h3>Business Development Manager</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
                        aute irure dolor in reprehenderit in voluptate velit esse cillum
                        dolore eu fugiat nulla pariatur.</p>
                </div>
            </div>
            <!--.testimonial_text-->
            <div class="testimonial_text">
                <div class="col-sm-3">
                    <img src="images/templatemo_member_02.jpg" class="img-responsive"
                         alt="Chief Public Relation Officer"/>
                </div>
                <div class="col-sm-9">
                    <h2>Mary Kas</h2>
                    <h3>Chief Public Relation Officer</h3>
                    <p>Fusce et orci mollis, congue lorem vitae, semper erat.
                        Curabitur quis pellentesque nisl, at adipiscing libero. Integer
                        at sem dui. Fusce posuere aliquet dolor, at viverra odio accumsan
                        sed. Sed pharetra vel risus a convallis. Maecenas in adipiscing
                        libero, id molestie odio. Phasellus id pharetra mauris, sit amet
                        varius velit. Aliquam non dapibus libero.</p>
                </div>
            </div>
            <!--.testimonial_text-->
            <div class="testimonial_text">
                <div class="col-sm-3">
                    <img src="images/templatemo_member_03.jpg" class="img-responsive"
                         alt="Marketing Executive"/>
                </div>
                <div class="col-sm-9">
                    <h2>Julia Pan</h2>
                    <h3>Marketing Executive</h3>
                    <p>Maecenas nec rhoncus orci. Morbi tempus ut leo ac varius.
                        Cras convallis sagittis dignissim. Aenean diam libero, venenatis
                        eu risus eu, tincidunt porttitor orci. Nulla consequat mi et
                        lectus vehicula condimentum. Nulla ullamcorper dolor vehicula
                        dolor interdum, eget fermentum ligula bibendum. Sed vel dolor
                        libero.</p>
                </div>
            </div>
            <!--.testimonial_text-->
            <div class="testimonial_text">
                <div class="col-sm-3">
                    <img src="images/templatemo_member_04.jpg" class="img-responsive"
                         alt="Chief Executive Officer"/>
                </div>
                <div class="col-sm-9">
                    <h2>Linda Von</h2>
                    <h3>Chief Executive Officer</h3>
                    <p>Donec lacinia erat quis venenatis varius. Suspendisse non
                        turpis vitae libero interdum lacinia. Nulla in nibh arcu. Donec
                        quam neque, porta at pellentesque at, imperdiet ut velit.
                        Pellentesque luctus ac nunc et hendrerit. Aliquam eu scelerisque
                        eros. Vestibulum scelerisque mi nec augue condimentum rhoncus.</p>
                </div>
            </div>
            <!--.testimonial_text-->
        </div>
        <!--#testimonial_text_wap-->
        <div class="col-xs-1 pre_next_wap" id="next_testimonial">
            <a href="#"><span
                    class="glyphicon glyphicon-chevron-right pre_next"></span></a>
        </div>
        <div class="clearfix testimonial_top_bottom_spacer"></div>
    </div>
</div>
<!--templatemo_about-->
<div id="templatemo_events" class="container_wapper">
    <div class="container-fluid">
        <h1>产品</h1>
        <!-- 产品信息for 从数据库读 -->
        <c:forEach items="${productList}" var="product" varStatus="id">
            <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-0">
                <div class="event_box_wap event_animate_left">
                    <div class="event_box_img">
                        <img src="images/${product.imageUrl }" class="img-responsive"
                             alt="Web Design Trends"/>
                    </div>
                    <div class="event_box_caption">
                        <h1>
                            <a href="javascript:void(0)"
                               onclick="appLoan('${product.fpId}')">${product.fpName }</a>
                        </h1>
                        <p>
                            <span class="glyphicon glyphicon-map-marker"></span> 申请条件
                            &nbsp;&nbsp; <span class="glyphicon glyphicon-thumbs-up"></span>
                            <a href="javascript:void(0)" onclick="appLoan('${product.fpId}')">
                                申请贷款</a>
                        </p>
                        <p>
                            <c:forEach items="${product.productRuleList}" var="rule"
                                       varStatus="rlueIndex">
                                ${rlueIndex.index + 1}.${rule.ruleName}:&emsp;${rule.ruleContent }<br>
                            </c:forEach>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--<div id="templatemo_timeline" class="container_wapper">--%>
    <%--<h1>Timeline</h1>--%>
    <%--<div class="container-fluid">--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">10 days ago</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Lorem ipsum dolor sit amet</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">George</a>--%>
                    <%--&nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span> <a--%>
                        <%--href="#">Web Design</a>, <a href="#">Responsive</a> &nbsp;&nbsp;--%>
                    <%--<span class="glyphicon glyphicon-edit"></span> <a href="#">3--%>
                    <%--comments</a>--%>
                <%--</p>--%>
                <%--<p>Aliquam adipiscing nibh sem, vitae aliquet ipsum rutrum nec.--%>
                    <%--Nulla nec fermentum libero. Duis quis fermentum libero. Nunc--%>
                    <%--facilisis ultrices fringilla. Nullam sed ligula ac libero--%>
                    <%--venenatis pellentesque vitae nec mauris.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">2 weeks ago</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Excepteur sint occaecat cupidatat</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">Kyor--%>
                    <%--Kyor</a> &nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span>--%>
                    <%--<a href="#">HTML5</a>, <a href="#">Mobile</a> &nbsp;&nbsp; <span--%>
                        <%--class="glyphicon glyphicon-edit"></span> <a href="#">2--%>
                    <%--comments</a>--%>
                <%--</p>--%>
                <%--<p>Vestibulum pellentesque leo mi, non adipiscing odio--%>
                    <%--tristique in. Aliquam suscipit magna nisi, non dapibus purus--%>
                    <%--cursus in. Sed vitae quam bibendum mauris vehicula pretium.--%>
                    <%--Curabitur ac ornare magna. Vestibulum dapibus dolor porttitor urna--%>
                    <%--pretium euismod. Aliquam lobortis enim at lacinia mollis.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">one month ago</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Doloremque laudantium</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">Cooker</a>--%>
                    <%--&nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span> <a--%>
                        <%--href="#">Web Design</a>, <a href="#">CSS3</a> &nbsp;&nbsp; <span--%>
                        <%--class="glyphicon glyphicon-edit"></span> <a href="#">3--%>
                    <%--comments</a>--%>
                <%--</p>--%>
                <%--<p>Fusce feugiat sem dolor. Curabitur a consectetur quam.--%>
                    <%--Maecenas ut purus rutrum, bibendum eros eu, suscipit diam.--%>
                    <%--Praesent semper bibendum gravida. Praesent eget leo ac arcu--%>
                    <%--aliquet pellentesque sit amet at tortor. Cras sagittis nec tellus--%>
                    <%--nec imperdiet.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">15 May 2084</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Neque porro quisquam</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">Brain</a>--%>
                    <%--&nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span> <a--%>
                        <%--href="#">HTML5</a>, <a href="#">Animation</a> &nbsp;&nbsp; <span--%>
                        <%--class="glyphicon glyphicon-edit"></span> <a href="#">6--%>
                    <%--comments</a>--%>
                <%--</p>--%>
                <%--<p>Ut varius nibh adipiscing sagittis lobortis. Sed imperdiet--%>
                    <%--risus enim, sit amet tempus nisi lobortis a. Etiam in gravida leo,--%>
                    <%--non interdum sapien. Sed mi odio, pharetra at tellus ac,--%>
                    <%--adipiscing pulvinar dolor. Nulla quis suscipit urna. Integer--%>
                    <%--congue non nunc a luctus.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">20 April 2084</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Sed do eiusmod tempor</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">John--%>
                    <%--West</a> &nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span>--%>
                    <%--<a href="#">3D Effect</a>, <a href="#">CSS3</a> &nbsp;&nbsp; <span--%>
                        <%--class="glyphicon glyphicon-edit"></span> <a href="#">4--%>
                    <%--comments</a>--%>
                <%--</p>--%>
                <%--<p>Maecenas in ipsum pulvinar, dapibus leo ut, adipiscing--%>
                    <%--neque. Phasellus tincidunt arcu eleifend placerat posuere. Nullam--%>
                    <%--nec eros in leo facilisis blandit id in neque. Proin varius, neque--%>
                    <%--in eleifend porta, neque arcu dapibus risus, vel congue ante nibh--%>
                    <%--varius nisi.</p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="time_line_wap">--%>
            <%--<div class="time_line_caption">5 April 2084</div>--%>
            <%--<div class="time_line_paragraph">--%>
                <%--<h1>Ut enim ad minim veniam</h1>--%>
                <%--<p>--%>
                    <%--<span class="glyphicon glyphicon-user"></span> <a href="#">Moon--%>
                    <%--Plus</a> &nbsp;&nbsp; <span class="glyphicon glyphicon-bookmark"></span>--%>
                    <%--<a href="#">Web Design</a>, <a href="#">Responsive</a>--%>
                    <%--&nbsp;&nbsp; <span class="glyphicon glyphicon-edit"></span> <a--%>
                        <%--href="#">5 comments</a>--%>
                <%--</p>--%>
                <%--<p>--%>
                    <%--Duis lacinia leo erat, eu tincidunt mauris congue ut. Ut auctor--%>
                    <%--turpis a sapien commodo, ac ultrices dui vehicula. Etiam in--%>
                    <%--tristique felis. Sed eleifend turpis sed purus venenatis--%>
                    <%--fringilla. <br> <br> Vestibulum ante ipsum primis in--%>
                    <%--faucibus orci luctus et ultrices posuere cubilia Curae;--%>
                    <%--Pellentesque habitant morbi tristique senectus et netus et--%>
                    <%--malesuada fames ac turpis egestas. Suspendisse vel sollicitudin--%>
                    <%--eros, vel vulputate leo.--%>
                <%--</p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<!-- 注册 -->
<div id="templatemo_contact" class="container_wapper">
    <div class="container-fluid">
        <h1 style="margin-top:100px;">注册</h1>
        <form id="regist-form" action="<%=path %>/user/regist" method="post" class="col-md-8"
              data-parsley-validate="">
            <div class="row">
                <div class="col-md-6">
                    <p>用户名&emsp;<label id="userNameError"></label></p>
                    <input type="text" name="userName" id="userName" placeholder="Your Name"
                           required data-parsley-trigger="change" data-parsley-length="[6, 20]"
                           data-parsley-errors-container="#userNameError"/>
                </div>
                <div class="col-md-6">
                    <p>真实姓名&emsp;<label id="realNameError"></label></p>
                    <input type="text" name="realName" id="realName" required
                           data-parsley-errors-container="#realNameError"
                           placeholder="Your Real Name" data-parsley-trigger="change"
                           data-parsley-length="[2, 10]"/>
                </div>
                <div class="col-md-6">
                    <p>密码&emsp;<label id="passwordError"></label></p>
                    <input type="password" name="userPswd" id="userPswd" placeholder="Your Password"
                           required data-parsley-trigger="change" data-parsley-length="[6, 20]"
                           data-parsley-errors-container="#passwordError"/>
                </div>
                <div class="col-md-6">
                    <p>再次确认密码&emsp;<label id="password2Error"></label></p>
                    <input type="password" name="userPswd2" id="userPswd"
                           placeholder="Confirm Your Password Again" data-parsley-trigger="change"
                           data-parsley-length="[6, 20]" data-parsley-equalto="#userPswd"
                           data-parsley-errors-container="#password2Error"/>
                </div>
                <div class="col-md-6">
                    <p>邮箱&emsp;<label id="emailError"></label></p>
                    <input type="email" name="email" placeholder="Your E-mail" required
                           data-parsley-trigger="change" data-parsley-type="email"
                           data-parsley-errors-container="#emailError">
                </div>
                <div class="col-md-6">
                    <p>手机号码&emsp;<label id="mobilePhoneError"></label></p>
                    <input type="text" name="mobilePhone" id="mobilePhone"
                           data-parsley-trigger="change"
                           data-parsley-pattern="^1[3|4|5|8][0-9]\d{4,8}$"
                           placeholder="Your MobilePhone"
                           data-parsley-errors-container="#mobilePhoneError"/>
                </div>
                <div class="col-md-6">
                    <p>年龄&emsp;<label id="userAgeError"></label></p>
                    <input type="number" name="userAge" id="userAge" data-parsley-trigger="change"
                           placeholder="Your Age" required
                           data-parsley-errors-container="#userAgeError" data-parsley-type="integer"
                           data-parsley-max="100" data-parsley-min="0"/>
                </div>
                <div class="col-md-6">
                    <p>身份证号码&emsp;<label id="userSidError"></label></p>
                    <input type="text" name="userSid" id="userSid" data-parsley-trigger="change"
                           data-parsley-pattern="(^\d{15}$)|(^\d{17}([0-9]|X)$)"
                           placeholder="Your Identity Card"
                           data-parsley-errors-container="#userSidError"/>
                </div>
                <div class="col-md-12">
                    <p>家庭地址&emsp;<label id="userAddrError"></label></p>
                    <textarea name="userAddr" id="userAddr" placeholder="Write your address here..."
                              required data-parsley-trigger="change" data-parsley-maxlength="2000"
                              data-parsley-errors-container="#userAddrError"></textarea>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-offset-6">
                    <button class="btn btn-success" type="submit">注册</button>
                </div>
                <div class="col-xs-6 col-sm-3">
                    <button class="btn btn-primary" type="reset">重填</button>
                </div>
            </div>
        </form>
    </div>
    <div id="templatemo_footer">
        <div>
            <p>
                Copyright &copy; 2020 文文 | Collect from <a
                    href="javascript:void(0)" onclick="showAuthor()" target="_blank">wenwen.hu</a>
                - <a href="javascript:void(0)">eleme</a>
            </p>
        </div>
    </div>

    <div class="remodal" data-remodal-id="messageBox" role="dialog"
         aria-labelledby="messageTitle" aria-describedby="messageBody">
        <button data-remodal-action="close" class="remodal-close"
                aria-label="Close"></button>
        <div>
            <h2 id="messageTitle"></h2>
            <p id="messageBody"></p>
        </div>
        <br>
        <button onclick="userLogin();" class="remodal-confirm">登录</button>
        <!-- <button data-remodal-action="cancel" onclick="register();" class="remodal-overlay">注册</button> -->
        <button data-remodal-action="cancel" class="remodal-cancel">关闭</button>
    </div>

    <div class="loan-remodal" data-remodal-id="messageBoxApp" role="dialog"
         aria-labelledby="messageTitleApp" aria-describedby="messageBodyApp" max-width="400">
        <button data-remodal-action="close" class="remodal-close"
                aria-label="Close"></button>
        <div>
            <h2 id="messageTitleApp"></h2>
            <p id="messageBodyApp"></p>
        </div>
        <br>
    </div>

    <!-- 消息提示弹层 -->
        <div class="remodal" data-remodal-id="messageBoxNormal" role="dialog"
             aria-labelledby="messageTitleNormal"
             aria-describedby="messageBodyNormal">
            <button data-remodal-action="close" class="remodal-close" aria-label="Close"></button>
            <div>
                <h2 id="messageTitleNormal"></h2>
                <div id="messageBodyNormal">
                </div>
            </div>
            <br>
            <button data-remodal-action="cancel" class="remodal-cancel">关闭</button>
        </div>
        <input type="hidden" id="open" value="${open}">
        <script src="<%=path%>/js/jquery.js"></script>
        <script src="<%=path%>/js/jquery-ui.min.js"></script>
        <script src="<%=path%>/js/bootstrap.min.js"></script>
        <script src="<%=path%>/js/jquery.singlePageNav.min.js"></script>
        <script src="<%=path%>/js/unslider.min.js"></script>
        <script src="<%=path%>/js/templatemo_script.js"></script>
        <script src="<%=path%>/js/template.js"></script>
        <script src="<%=path%>/js/remodal.js"></script>
        <script src="<%=path%>/js/parsley/parsley.min.js"></script>
        <script src="<%=path%>/js/parsley/i18n/zh_cn.js"></script>

        <script type="text/javascript">
            $(function () {
                var open = $('#open').val();
                if(open == 1){
                    var messBody = template('loginPage', null);
                    alertMessageBox("", messBody);
                }
            })
            /* <!-- 登录页面 --> */
            function login() {
                var messBody = template('loginPage', null);
                alertMessageBox("", messBody);
            }

            function alertMessageBox(messTitle, messBody, callback) {
                $("#messageTitle").html(messTitle);
                $("#messageBody").html(messBody);
                var messBox = $('[data-remodal-id=messageBox]').remodal();
                messBox.open();
                $(document).on('closed', '.remodal', function (e) {
                    if (typeof callback == "function") {
                        callback();
                    }
                });
            }

            function appAlertMessageBox(messTitle, messBody, callback) {
                $("#messageTitleApp").html(messTitle);
                $("#messageBodyApp").html(messBody);
                var messBox = $('[data-remodal-id=messageBoxApp]').remodal();
                messBox.open();
                $(document).on('closed', '.remodal', function (e) {
                    if (typeof callback == "function") {
                        callback();
                    }
                });
            }

            function normalAlertMessageBox(messTitle, messBody, callback) {
                $("#messageTitleNormal").html(messTitle);
                $("#messageBodyNormal").html(messBody);
                var messBox = $('[data-remodal-id=messageBoxNormal]').remodal();
                messBox.open();
                $(document).on('closed', '.remodal', function (e) {
                    if (typeof callback == "function") {
                        callback();
                    }
                });
            }
            /* <!-- 登录 --> */
            function userLogin() {
                var userName = $('#username').val();
                var userPswd = $('#password').val();
                if (userName == '') {
                    $('#nameLabel').removeClass('hidden');
                    return;
                } else {
                    $('#nameLabel').addClass('hidden');
                }
                if (userPswd == '') {
                    $('#passwordLabel').removeClass('hidden');
                    return;
                } else {
                    $('#passwordLabel').addClass('hidden');
                }
                $.ajax({
                            url: '<%=path %>/user/login',
                            type: 'post',
                            dataType: 'json',
                            data: {userName: userName, userPswd: userPswd},
                        })
                        .done(function (data) {
                            console.log(data);
                            if (data.isSuccess) {
                                window.location.href = "<%=path %>/index";
                            } else {
                                $('#failLoginLabel').removeClass('hidden');
                            }
                        })
                        .fail(function () {
                            console.log("error");
                        })
            }

            /* <!-- 注册 --> */
            function register() {
                window.location.href = "<%=path %>/index#templatemo_contact";
            }

            /* <!-- 退出 --> */
            function logout() {
                $.ajax({
                            url: '<%=path %>/user/logout',
                            type: 'post',
                            dataType: 'json',
                            data: {},
                        })
                        .done(function () {
                            window.location.reload();
                        })
                        .fail(function () {
                            window.location.reload();
                        });

            }

            /* <!-- 注册判断用户是否唯一 --> */
            $(function () {
                $('#userName').blur(function () {
                    var userName = $('#userName').val();
                    $.ajax({
                                url: '<%=path %>/user/judgeUerNameSame',
                                type: 'POST',
                                dataType: 'json',
                                data: {userName: userName},
                            })
                            .done(function (data) {
                                if (data.isSuccess) {
                                    return;
                                } else {
                                    alert("用户名已存在");
                                    $('#userName').addClass('parsley-error');
                                }
                            })
                            .fail(function () {
                                console.log("error");
                            })
                });
            })

            /* <!-- 贷款申请页面 --> */
            function appLoan(fpId) {
                $.ajax({
                    type: "GET",
                    url: "<%=path %>/loan/getProductInfo/" + fpId,
                    data: {},
                    dataType: "json",
                    success: function (resultObj) {
                        var messBody = template('applyLoan', resultObj);
                        appAlertMessageBox("申请贷款", messBody);
                    },
                    error: function (resultObj) {
                        normalAlertMessageBox("贷款申请", "出现异常，请稍后重试！");
                    }
                });
            }
            /* <!-- 贷款申请提交 --> */
            function appLoanSave() {
                var fpId = $("#fpId").val();
                var loanAmount = $("#loanAmount").val();
                $.ajax({
                    type: "POST",
                    url: "<%=path %>/loan/appLoan",
                    data: {
                        fpId: fpId,
                        loanAmount: loanAmount
                    },
                    dataType: "json",
                    success: function (resultObj) {
                        if (resultObj.isSuccess) {
                            normalAlertMessageBox("申请贷款", resultObj.message, function () {
                                window.location.href = "<%=path %>/index";
                            });
                        } else {
                            normalAlertMessageBox("申请贷款", resultObj.failReason);
                        }
                    },
                    error: function (resultObj) {
                        normalAlertMessageBox("贷款申请", "出现异常，请稍后重试！");
                    }
                });
            }

            function goUserCenter() {
                window.location.href = "<%=path%>/user/center"
            }

            function showAuthor () {
                console.log("--------------------------");
                console.log("作者:胡文文");
                console.log("微信:vip438926995");
                console.log("邮箱:wenwen.hu@ele.me");
                console.log("--------------------------");
            }

        </script>

        <script id="loginPage" type="text/html">
            <div class="input-group input-group-lg">
                <span class="input-group-addon" id="sizing-addon1"><span
                        class="glyphicon glyphicon-user"/>用户名</span>
                <input id="username" type="text" class="form-control" placeholder="Username"
                       aria-describedby="sizing-addon1">
                <div id="nameLabel" style="color:red; display:table-caption" class="hidden">
                    用户名不能为空
                </div>
                <div id="failLoginLabel" style="color:red; display:table-caption" class="hidden">
                    用户名或密码错误
                </div>
            </div>
            <br>
            <div class="input-group input-group-lg">
                <span class="input-group-addon" id="sizing-addon1"><span
                        class="glyphicon glyphicon-lock"/>密&emsp;码</span>
                <input id="password" type="password" class="form-control" placeholder="Password"
                       aria-describedby="sizing-addon1">
                <div id="passwordLabel" style="color:red; display:table-caption" class="hidden">
                    密码不能为空
                </div>
            </div>
        </script>

        <script id="applyLoan" type="text/html">
            <ul class="list-group">
                <li class="list-group-item list-group-item-success">
                    利率:&emsp;{{minRaitRatio}}%/月
                </li>
                <li class="list-group-item list-group-item-info">
                    支持还款期限:&emsp;{{payLimit}}个月
                </li>
                <li class="list-group-item list-group-item-warning">
                    额度范围:&emsp;{{minLoanAmount}}元~{{maxLoanAmount}}元
                </li>
            </ul>
            <form action="<%=path %>/loan/appLoan" method="post" class="navbar-form navbar-left"
                  role="search">
                <div class="form-group">
                    <input type="number" name="loanAmount" id="loanAmount" class="form-control"
                           placeholder="贷款金额" required>
                </div>
                <input type="hidden" name="fpId" id="fpId" value="{{fpId}}">
                <input type="button" style="margin-left:3em;" class="btn btn-success" value="申请"
                       onclick="appLoanSave();">
                <form>
        </script>

</body>
</html>
