<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<html>
<head>
	<meta charset="utf8"/>
	<link rel="stylesheet" href="${ctx}/css/paperList.css" >
</head>
<body>
	<div style="text-align:center">
		<p><strong>试卷管理</strong></p>
	</div>
	<div style="width:10%;float:right">
	<button type="button" class="btn btn-primary form-control" >
		<span class="glyphicon glyphicon-plus"></span>添加试卷
	</button>
	</div>
	<div style="width:100%" class="container">
		<table class="table table-bordered table-hover">
			<thead>
				<th>序号</th>
				<th>试卷名称</th>
				<th>添加日期</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="paper" items="${paperList}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${paper.paperName}</td>
						<td>${paper.joinDate}</td>
						<td>
							<button class="btn btn-mini btn-info" type="button" >修改</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" >删除</button>
						</td>
					</tr>
					
				</c:forEach>
			</tbody>
		
		</table>
		
	</div>
</body>
</html>