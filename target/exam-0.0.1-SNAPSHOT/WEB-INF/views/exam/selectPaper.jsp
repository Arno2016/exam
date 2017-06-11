<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		$("#navbar").find(".active").removeClass("active");
		$("#navbar").find("a[href$='selectPaper']").parent("li").addClass("active");
	});
</script>
</head>
<body>
<div class="data_list" style="text-align:center"">
	<div class="data_content">
		<form action="${ctx}/paper/paperDetail" method="post" >
		<label style="width:50%"><strong>请选择考试试卷：</strong>
				<select id="paperId" name="paperId" class="input-md form-control " style="display:inline ! important;width:25%;">
					<option value="">请选择...</option>
					<c:forEach var="paper" items="${paperList}">
						<option value="${paper.id}">${paper.paperName}</option>
					</c:forEach>
				</select>
		</label>
				<br>
				<br>
			<div>
				<input type="submit" class="btn btn-primary" value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.go(-1)"/>
			</div>
			
						
				
						
					
						
				
		</form>
	</div>
</div>
</body>
</html>