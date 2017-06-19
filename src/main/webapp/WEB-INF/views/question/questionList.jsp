<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<html>
<head>
	<meta charset="utf8"/>
	<script type="text/javascript" src="${ctx}/js/jqPaginator.min.js"></script>
</head>
<body>
	<form id="myForm" action="${ctx}/question/questionList" >
	<input type="hidden" id="curPageNum" name="curPageNum">
	<div class="data_content">
		<table class="table table-bordered table-hover">
			<tr>
				<th>序号</th>
				<th>考试题目</th>
				<th>加入时间</th>
				<th>题目类型</th>
				<th>所属试卷</th>
				<th>操作</th>
			</tr>
			<c:forEach var="question" items="${map.questionList}" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${question.subject }</td>
				<td><fmt:formatDate value="${question.joinTime }" type="date" pattern="yyyy-MM-dd"/></td>
				<c:choose>
					<c:when test="${question.type==1 }">
						<td>单选题</td>
					</c:when>
					<c:otherwise>
						<td>多选题</td>
					</c:otherwise>
				</c:choose>
				<td>${question.paper.paperName }</td>
				<td><button class="btn btn-mini btn-info" type="button" >查看试题</button>&nbsp;&nbsp;<button class="btn btn-mini btn-info" type="button" >修改</button>&nbsp;&nbsp;<button class="btn btn-mini btn-danger" type="button" >删除</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
		<div id="page" style="float:right;" class="pagination pagination-centered"></div>
	</form>
</body>

<script>
if(${map.questionList.size()>0}){
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