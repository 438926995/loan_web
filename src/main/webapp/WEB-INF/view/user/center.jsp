<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style type="text/css">
	html{
		padding-right:300px;
		background-color: ghostwhite;
	}
	.custom-bar{
		font-size:30px;
		line-height:50px;
	}
</style>
<title>个人中心</title>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>贷款详情</h1>
		<ol class="breadcrumb">
			<li class="active"><a href="/account/index"><i
					class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="/loan/list">贷款管理</a></li>
			<li class="active">贷款详情</li>
		</ol>
		</section>
		<section class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">贷款详情</h3>
			</div>
		</div>
		<div class="box-body">
			<div class="panel panel-default">
				<div class="panel-heading">
					<label>当前进度</label>
				</div>
				
				<div class="panel-body">
				<c:if test="${! empty nowProcess}">
					<div class="progress" style="height:50px;">
						<div class="progress-bar progress-bar-info custom-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
							审核中</div>
							
						<c:if test="${'nowProcess.appStatus' == 'P'} ">
							<div class="progress-bar custom-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
							</div>
						</c:if>
						<c:if test="${nowProcess.appStatus == 'D'} ">
							<div class="progress-bar progress-bar-danger custom-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
							${nowProcess.appStatusName }
							</div>
						</c:if>
						<c:if test="${'nowProcess.appStatus' == 'C'} ">
							<div class="progress-bar progress-bar-success custom-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
							${nowProcess.appStatusName }
						</c:if>
					</div>
				</c:if>
				</div>
			</div>
			
			<div class="panel panel-default">
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
									<td><fmt:formatDate value="${al.submitTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td><fmt:formatNumber value="${al.loanAmount }" pattern=",###元" /></td>
									<td>${al.appStatusName }</td>
									<td>${al.apvRemark }</td>
									<td><fmt:formatDate value="${al.apvTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<label>个人信息</label>
				</div>
				<div class="panel-body">
					
				</div>
			</div>
			
		</div><!-- box -->
		</section>
	</div>
</body>
<script src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/template.js"></script>
<script src="<%=path%>/js/remodal.js"></script>
<script src="<%=path%>/js/parsley/parsley.min.js"></script>
<script src="<%=path%>/js/parsley/i18n/zh_cn.js"></script>
</html>