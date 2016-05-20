<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="<%=path%>/css/remodal.css" rel="stylesheet">
    <link href="<%=path%>/css/remodal-default-theme.css" rel="stylesheet">
    <link href="<%=path%>/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/css/parsley.css" rel="stylesheet">
    <link href="<%=path%>/css/responsive-nav/responsive-nav.css" rel="stylesheet">
    <link href="<%=path%>/css/responsive-nav/styles.css" rel="stylesheet">
    <link href="<%=path%>/css/bootstrap-table.min.css" rel="stylesheet">
    <style type="text/css">
        html {
            /*padding-right: 300px;*/
            /*background-color: ghostwhite;*/
        }

        .custom-bar {
            font-size: 30px;
            line-height: 50px;
        }

        h1 {
            font-size: 3em;
            line-height: 1;
            color: #222;
            float: left;
            width: 100%;
            text-align: center;
            padding-top: 1em;
        }
    </style>
    <title>个人中心</title>
</head>
<body>
<div role="navigation" id="foo" class="nav-collapse">
    <ul>
        <li id="loanLi" class="active"><a href="javascript:void(0);"
                                          onclick="goLoanProcess();">贷款进度</a></li>
        <li id="userLi"><a href="javascript:void(0);" onclick="goUserInfo();">个人信息</a></li>
        <li id="passwordLi"><a href="javascript:void(0);" onclick="goModifyPwd();">修改密码</a></li>
        <li id="feedbackLi"><a href="javascript:void(0);" onclick="goFeedback();">意见反馈</a></li>
        <li><a href="javascript:void(0);" onclick="goBack();">返回</a></li>
    </ul>
</div>

<div role="main" class="main">
    <a href="#nav" class="nav-toggle">Menu</a>
    <h1>贷款进度</h1>

    <span id="loanSpan">
    <div class="panel panel-default"><!-- panel-1 -->
        <div class="panel-heading">
            <label></label>
        </div>

        <div class="panel-body">
            <c:if test="${! empty nowProcess}">
            <div class="progress" style="height:50px;">
                <div class="progress-bar progress-bar-info custom-bar" role="progressbar"
                     aria-valuenow="60"
                     aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                    审核中
                </div>

                <c:if test="${nowProcess.appStatus == 'P'}">
                    <div class="progress-bar custom-bar" role="progressbar"
                         aria-valuenow="60"
                         aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                    </div>
                </c:if>
                <c:if test="${nowProcess.appStatus == 'D'}">
                    <div class="progress-bar progress-bar-danger custom-bar"
                         role="progressbar" aria-valuenow="60"
                         aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                            ${nowProcess.appStatusName }
                    </div>
                </c:if>
                <c:if test="${nowProcess.appStatus == 'C'}">
                <div class="progress-bar progress-bar-success custom-bar" role="progressbar"
                     aria-valuenow="60"
                     aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                        ${nowProcess.appStatusName }
                </div>
                </c:if>
            </div>
            </c:if>
        </div>
    </div><!-- panel-1 -->

    <div class="panel panel-default"><!-- panel-2 -->
        <div class="panel-heading">
            <label>贷款历史</label>
        </div>
        <div class="panel-body">
            <table class="table table-bordered table-hover">
                <thead>
                <th>订单号</th>
                <th>贷款产品</th>
                <th>贷款时间</th>
                <th>贷款金额</th>
                <th>审批状态</th>
                <th>审批意见</th>
                <th>审批时间</th>
                </thead>
                <tbody>
                <c:forEach items="${loan}" var="al">
                    <tr>
                        <td>${al.docNo }</td>
                        <td>${al.fpName }</td>
                        <td><fmt:formatDate value="${al.submitTime }"
                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatNumber value="${al.loanAmount }"
                                              pattern=",###元"/></td>
                        <td>${al.appStatusName }</td>
                        <td>${al.apvRemark }</td>
                        <td><fmt:formatDate value="${al.apvTime }"
                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div><!-- panel-2 -->
    </span>

    <span id="userSpan">
    <div class="panel panel-default"><!-- panel-3 -->
        <div class="panel-heading">
            <label></label>
        </div>
        <div class="panel-body">
            <form action="<%=path%>/user/editUser" method="post" data-parsley-validate="">
            <label>用户名:</label>&emsp;
                <input type="text" class="form-control" readonly value="${martUser.userName}">
            <label>真实姓名:</label>&emsp;
                <input type="text" class="form-control" name="realName" value="${martUser.realName}"
                       required data-parsley-trigger="change" data-parsley-length="[2, 10]">
            <label>手机号码:</label>&emsp;
                <input type="text" class="form-control" name="mobilePhone"
                       value="${martUser.mobilePhone}" required
                       data-parsley-trigger="change"
                       data-parsley-pattern="^1[3|4|5|8][0-9]\d{4,8}$">
            <label>年龄:</label>&emsp;
                <input type="number" class="form-control" name="userAge" value="${martUser.userAge}"
                       required
                       data-parsley-trigger="change" data-parsley-type="integer"
                       data-parsley-max="100" data-parsley-min="0">
            <label>身份证号:</label>&emsp;
                <input type="text" class="form-control" name="userSid" value="${martUser.userSid}"
                       required
                       data-parsley-trigger="change"
                       data-parsley-pattern="(^\d{15}$)|(^\d{17}([0-9]|X)$)">
            <label>地址:</label>&emsp;
                <textarea type="text" class="form-control" name="userAddr" required
                          data-parsley-trigger="change"
                          data-parsley-maxlength="2000">${martUser.userAddr}</textarea>
                <br>
                <input type="submit" class="btn btn-success" value="修改">
                <input type="reset" class="btn btn-danger" value="恢复">
            </form>
        </div>
    </div><!-- panel-3 -->
    </span>

    <span id="feedbackSpan">
    <div class="panel panel-default"><!-- panel-4 -->
        <div class="panel-heading">
            <label></label>
        </div>
        <div class="panel-body">
            <label>您的宝贵意见是我们进步的动力</label>
            <textarea rows="4" class="form-control" id="feedbackContent" required></textarea>
            <br>
            <input type="button" class="btn btn-success" onclick="saveFeedback();" value="提交">
        </div>
    </div><!-- panel-4 -->
    <div class="panel panel-default"><!-- panel-5 -->
        <div class="panel-heading">
            <label>反馈历史记录</label>
        </div>
        <div class="panel-body">
            <table id="tableSellers" class="table table-bordered table-hover"></table>
        </div>
    </div><!-- panel-5 -->
    </span>

    <!-- 修改密码 -->
    <span id="passwordSpan">
        <div class="panel panel-default"><!-- panel-6 -->
            <div class="panel-heading">
                <label></label>
            </div>
            <div class="panel-body">
                <form data-parsley-validate="">
                    <label>旧密码</label>
                    <input type="password" id="oldPwd" value="" class="form-control" required
                           placeholder="Your Old Password" data-parsley-trigger="change"
                           data-parsley-length="[6, 20]">
                    <label>新密码</label>
                    <input type="password" id="newPwd" value="" class="form-control" required
                           placeholder="Your New Password" data-parsley-trigger="change"
                           data-parsley-length="[6, 20]">
                    <label>确认新密码</label>
                    <input type="password" id="newPwd2" value="" class="form-control" required
                           placeholder="Confirm New Password Again" data-parsley-trigger="change"
                           data-parsley-length="[6, 20]"
                           data-parsley-equalto="#newPwd">
                    <br>
                    <input type="button" onclick="changeUserPwd();" class="btn btn-success"
                           value="修改密码">
                </form>
            </div>
        </div><!-- panel-6 -->
    </span>

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

<script src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/template.js"></script>
<script src="<%=path%>/js/remodal.js"></script>
<script src="<%=path%>/js/parsley/parsley.min.js"></script>
<script src="<%=path%>/js/parsley/i18n/zh_cn.js"></script>
<script src="<%=path%>/js/bootstrap-table.min.js"></script>
<script src="<%=path%>/js/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/js/bootstrap-select.min.js"></script>
<script src="<%=path%>/js/responsive-nav/responsive-nav.min.js"></script>

<script>
    var navigation = responsiveNav("foo", {customToggle: ".nav-toggle"});

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

    function goLoanProcess() {
        $('h1').text("贷款进度");
        $('#loanSpan').show();
        $('#userSpan').hide();
        $('#feedbackSpan').hide();
        $('#passwordSpan').hide();
        $('#loanLi').addClass('active');
        $('#userLi').removeClass('active');
        $('#feedbackLi').removeClass('active');
        $('#passwordLi').removeClass('active');
    }

    function goUserInfo() {
        $('h1').text("个人信息");
        $('#loanSpan').hide();
        $('#userSpan').show();
        $('#feedbackSpan').hide();
        $('#passwordSpan').hide();
        $('#loanLi').removeClass('active');
        $('#userLi').addClass('active');
        $('#feedbackLi').removeClass('active');
        $('#passwordLi').removeClass('active');
    }

    function goModifyPwd() {
        $('h1').text("修改密码");
        $('#loanSpan').hide();
        $('#userSpan').hide();
        $('#feedbackSpan').hide();
        $('#passwordSpan').show();
        $('#loanLi').removeClass('active');
        $('#userLi').removeClass('active');
        $('#feedbackLi').removeClass('active');
        $('#passwordLi').addClass('active');
    }

    function goFeedback() {
        $('h1').text("意见反馈");
        $('#loanSpan').hide();
        $('#userSpan').hide();
        $('#feedbackSpan').show();
        $('#passwordSpan').hide();
        $('#loanLi').removeClass('active');
        $('#userLi').removeClass('active');
        $('#feedbackLi').addClass('active');
        $('#passwordLi').removeClass('active');
    }

    $(function () {
        $('#userSpan').hide();
        $('#feedbackSpan').hide();
        $('#passwordSpan').hide();

        $("select.selectpicker").selectpicker("render");
        <!--添加时间 Date range picker -->
        var sellers_page_num = 0;
        var limit = 10;
        $('#tableSellers').bootstrapTable({
            columns: [
                {
                    field: 'feedbackTimeStr',
                    title: '反馈时间',
                    width: "120px"
                }, {
                    field: 'feedbackContent',
                    title: '反馈内容',
                    width: "120px"
                }, {
                    field: "replyTimeStr",
                    title: "回复时间",
                    width: "120px"
                }, {
                    field: "replyContent",
                    title: "回复内容",
                    width: "120px"
                }],
            rowStyle: function(row, index){
//                for(i = 0; i < row.length(); i++){
//                    if(i = 2){
//                        return {
//                            classes: 'info'
//                        };
//                    }
//                    return {};
//                }
//                console.log(row.feedbackContent);
//                console.log(index);
//                console.log(row);
                return {
                    classes: 'info'
                };
            },
            method: 'GET',
            url: "<%=path%>/user/getUserFeedbackHistory",
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            responseHandler: function (res) {
                var data = {
                    total: 0,
                    rows: []
                };
                if (res.isSuccess) {
                    data.total = res.datas.total;
                    data.rows = res.datas.rows;
                }
                return data;
            },
            queryParams: function (params) {
                // 添加分页参数
                params["pageSize"] = params.limit;
                params["currentPage"] = params.offset / params.limit;
                // 分页没做完
                return params;
            },
            height: 430,
            pageNumber: 1,
            pageSize: limit,
            pagination: true,
            sidePagination: "server",
            paginationFirstText: "首页",
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            paginationLastText: "末页",
            select: true,
            clickToSelect: true,
            onLoadError: function (status) {
                console.log("onLoadError:" + status);
            }
        });
    })

    function goBack() {
        window.location.href = "<%=path%>/index";
    }

    function saveFeedback() {
        var feedbackContent = $('#feedbackContent').val();
        $.ajax({
            type: "POST",
            url: "<%=path %>/user/saveUserFeedback",
            data: {
                feedbackContent: feedbackContent
            },
            dataType: "json",
            success: function (resultObj) {
                if (resultObj.isSuccess) {
                    normalAlertMessageBox("意见反馈", resultObj.message, function () {
                        $('#tableSellers').bootstrapTable('refresh');
                        $('#feedbackContent').val('');
                    });
                } else {
                    normalAlertMessageBox("意见反馈", resultObj.failReason);
                }
            },
            error: function (resultObj) {
                normalAlertMessageBox("意见反馈", "出现异常，请稍后重试！");
            }
        });
    }

    function changeUserPwd() {
        var oldPwd = $('#oldPwd').val();
        var newPwd = $('#newPwd').val();
        var newPwd2 = $('#newPwd2').val();
        if (newPwd === newPwd2) {
            $.ajax({
                type: "POST",
                url: "<%=path %>/user/changePassword",
                data: {
                    oldPwd: oldPwd,
                    newPwd: newPwd
                },
                dataType: "json",
                success: function (resultObj) {
                    if (resultObj.isSuccess) {
                        normalAlertMessageBox("修改密码", resultObj.message, function () {
                            window.location.href = "<%=path %>/index?open=1";
                        });
                    } else {
                        normalAlertMessageBox("修改密码", resultObj.failReason);
                    }
                },
                error: function (resultObj) {
                    normalAlertMessageBox("修改密码", "出现异常，请稍后重试！");
                }
            });
        } else {
            normalAlertMessageBox("修改密码", "2次密码输入不一致");
        }
    }

</script>
</body>

</html>
