<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/examList.css">
<script type="text/javascript" src="${ctx}/js/jqPaginator.min.js"></script>
<title>成绩查询</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#navbar").find(".active").removeClass("active");
		$("#navbar").find("a[href$='examList']").parent("li").addClass("active");
		$('#page').jqPaginator({
		    totalPages: 10,
		    visiblePages: 3,
		    currentPage: 1,
		    first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
		    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
		    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
		    last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
		    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
	 	    onPageChange: function (num, type) {
		        $('#curPageNum').html('当前第' + num + '页');
		        $('#curPageNum').val(num);
		    } 
		});
	});
	
	
	
	
</script>
</head>
	<body>
		<div>
			<form action="${ctx}/examPage/examList" method="post">
			<input id="curPageNum" name="curPageNum" style="display:none">
				<div class="container">
								<label for="s.id">准考证号:
									<input id="s.id" name="id" class="form-control" placeholder="准考证号" >
								</label>
								<label for="s.name">姓名：
									<input id="s.name" name="name" class="form-control" placeholder="姓名">
								</label>
								<label style="width:15%">
									<input type="submit" class="btn btn-primary form-control" value="查询">
								</label>
								
				</div>
			</form>	
			<div>
			<br>
			<br>
				<table align="center">
					<thread>
						<tr>
							<th>序号</th>
							<th>准考证号</th>
							<th>考生姓名</th>
							<th>试卷名称</th>
							<th>考试日期</th>
							<th>单选题得分</th>
							<th>多选题得分</th>
							<th>总分</th>
						</tr>
					</thread>
					<tbody>
						<c:forEach var="exam" items="${examList}" varStatus="status">
							<tr>
								<td>${status.index+1}</td>																
								<td>${exam.student.id}</td>																
								<td>${exam.student.name}</td>																
								<td>${exam.paper.paperName}</td>																
								<td><fmt:formatDate value="${exam.examDate}" pattern="yyyy-MM-dd" /></td>																
								<td>${exam.singleScore}</td>																
								<td>${exam.moreScore}</td>																
								<td>${exam.score}</td>																
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
			<div>
                <ul id="page" class="pagination pagination-centered"></ul>
            </div>
			
		</div>
	</body>
</html>