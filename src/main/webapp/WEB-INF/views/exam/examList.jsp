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
		
	});	
</script>
</head>
	<body>
		<div>
			<form action="${ctx}/examPage/examList" method="post" id="myForm">
			<div style="display:none"><input id="curPageNum" name="curPageNum" value="1"></div> 
				<div class="container">
					<c:choose>
						<c:when test="${student.flag=='1'}">
							<label for="sid">准考证号:
										<input id="sid" name="id" class="form-control" placeholder="准考证号"  value="${s.id}">
									</label>
									<label for="sname">姓名：
										<input id="sname" name="name" class="form-control" placeholder="姓名" value="${s.name}">
									</label>
									<label style="width:15%">
										<input type="submit" class="btn btn-primary form-control" value="查询" >
									</label>
						</c:when>
						<c:otherwise>
							<div class="">
								<p>${student.name }&nbsp;成绩列表</p>
								<input type="hidden" id="sid" name="id" class="form-control" placeholder="准考证号"  value="${student.id}">
								<input type="hidden" id="sname" name="name" class="form-control" placeholder="姓名" value="${student.name}">
							</div>
						</c:otherwise>
					</c:choose>
								
								
				</div>
			</form>	
			<div>
			<br>
			<br>
				<table align="center" class="table table-bordered table-hover">
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
						<c:forEach var="exam" items="${map.examList}" varStatus="status">
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
                <ul id="page" style="float:right;" class="pagination pagination-centered"></ul>
            </div>
			
		</div>
	</body>
	<script type="text/javascript">
	if(${map.examList.size()>0}){
		if(${map.page.totalPage<3}){
			visiblePage=${map.page.totalPage};
		}else{
			visiblePage=3;
		}
		$('#page').jqPaginator({
			totalPages:${map.page.totalPage},
		    visiblePages: visiblePage,
		    currentPage: ${map.page.curPageNum},
		    first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
		    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
		    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
		    last: '<li class="last"><a href="javascript:void(0);">末页</a></li>',
		    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
		    onPageChange: function (num, type) {
		        //$('#curPageNum').html('当前第' + num + '页');
		        if(num!=${map.page.curPageNum}){
		        	$('#curPageNum').val(num);
			        $("#myForm").submit();
		        }
		        	 	
		       
		       
		    } 
		}); 
	}
	
	</script>
</html>