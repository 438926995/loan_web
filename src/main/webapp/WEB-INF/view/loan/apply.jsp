<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  Object user = session.getAttribute("user");
  boolean isLogin = false;
  if(user != null){
  		isLogin = true;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>申请贷款</title>
</head>
<body>

<div id="templatemo_contact" class="container_wapper">
		<div class="container-fluid">
			<h1 style="margin-top:100px;">${product.fpName }</h1>
			<form id="regist-form" action="<%=path %>/user/regist" method="post" class="col-md-8" data-parsley-validate="">
							
			</form>
		</div>
	
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
	
</body>
</html>