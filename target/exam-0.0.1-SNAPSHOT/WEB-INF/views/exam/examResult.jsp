<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#navbar").find(".active").removeClass("active");
		$("#navbar").find("a[href$='selectPaper']").parent("li").addClass("active");
	});
</script>
</head>
<body>
<p class="examResult" align="center">
	试卷已提交，您本次考试的成绩为：<br>
	单选得分：<font color="red">${singleScore}</font>分;<br>
	多选得分：<font color="red">${mulScore}</font>分;<br>
	总分：<font color="red">${totalScore}</font>分。
</p>
</body>
</html>