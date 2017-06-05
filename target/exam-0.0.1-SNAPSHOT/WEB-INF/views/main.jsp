<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="./css/bootstrap.css"> 
	<script src="./js/jquery.min.js"></script>
 	<script src="./js/bootstrap.min.js"></script>
 	<script src="./js/popModal.min.js"></script>
 	<link rel="stylesheet" href="./css/hello.css"> 
</head>
<%
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null || mainPage.equals("")){
		mainPage="common/default.jsp";
	}
%>
<body>

<table align="center">
 	
	<tr>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<td style="width:1024px"></td>
	</tr>
	<tr>
		<td>
			<%-- <jsp:include page="common/menu.jsp"></jsp:include> --%>
		</td>
	</tr>
	<tr>
		<td >
			<jsp:include page="<%=mainPage%>"></jsp:include>
	</td>
	</tr>
	<tr>
		<td style="height:800px">
			 <jsp:include page="/WEB-INF/views/common/foot.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>