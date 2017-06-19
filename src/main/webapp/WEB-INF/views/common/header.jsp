<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<html>
<head>	
<meta charset="utf-8">
	<link rel="stylesheet" href="${ctx}/css/bootstrap.css"> 
	<script src="${ctx}/js/jquery.min.js"></script>
 	<script src="${ctx}/js/bootstrap.min.js"></script>
 	<script src="${ctx}/js/popModal.min.js"></script>
 	<link rel="stylesheet" href="${ctx}/css/hello.css"> 
 	<script type="text/javascript">
 		//写导航栏的激活状态变化
 	</script>
</head>

	<body>
		<nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="brand"><a class="navbar-brand" href="#"><img alt="" src="${ctx}/image/exam.png">在线考试系统</a></div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li class="active"><a href="${ctx}/login?id=${sessionScope.student.id}&password=${sessionScope.student.password}">首页</a></li>
          	<c:choose>
	          	<c:when test="${sessionScope.student.flag=='1'}">
			      	  <li><a href="#">考生信息管理</a></li>
				      <li><a href="${ctx}/examPage/examList">考生成绩查询</a></li>
				      <li><a href="${ctx}/paper/paperList">试卷管理</a></li>
				      <li><a href="${ctx}/question/questionList?curPageNum=1">题目管理</a></li>
	      		</c:when>
	          	<c:otherwise>
		            <li><a href="${ctx}/examPage/selectPaper">在线考试</a></li>
		            <li><a href="${ctx}/examPage/examList?id=${sessionScope.student.id}&curPageNum=1&name=${sessionScope.student.name}">我的成绩</a></li>
		            <li><a href="${ctx}/updatePassword">修改密码</a></li>
	          	</c:otherwise>
	          </c:choose>
	          <li><a href="${ctx}/logout">退出系统</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href='<c:if test="${sessionScope.student.name==null}">${ctx}</c:if>
	            	<c:if test="${sessionScope.student.name!=null}">#</c:if>'>
	            	<img src="${ctx}/image/home.png" style="display:inline;width:2rem">&nbsp;&nbsp;您好,
	            	<c:if test="${sessionScope.student.name==null}">请先登录!</c:if>${sessionScope.student.name}
            	</a>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav> 
   <!--  <div class="container-fluid">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div> -->
	</body>
</html>

	 
       

    	
	