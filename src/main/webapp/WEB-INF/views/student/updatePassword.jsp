<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>在线考试系统</title>
<meta charset="utf-8">
</head>
<script type="text/javascript">

	$(document).ready(function(){
		$("#navbar").find(".active").removeClass("active");
		$("#navbar").find("a[href$='updatePassword']").parent("li").addClass("active");
	});
	
	
	function checkForm(){
		if($("#oldPassword").val()!=null){
			$.ajax({
				type:"GET",
				async:false,
				url:"${ctx}/login?id=${student.id}&password="+$("#oldPassword").val(),
				success:function(data,textStatus,request){
					//判断旧密码
					if(request.getResponseHeader("msg")=="fail"){
						$("#oldPassword").next("span").css("display","inline");
					}else{
						$("#oldPassword").next("span").css("display","none");
						//判断新密码是否符合规范
						if($("#newPassword").val().match(/^[a-zA-Z0-9]{6,20}$/)){
							$("#errorMsg1").css("display","none");
							//判断新密码是否相同
							if($("#newPassword").val()==$("#newPassword2").val()){
								$("#errorMsg2").css("display","none");
								
								//异步提交
								$.ajax({
									type:"POST",
									async:false,
									url:"${ctx}/updatePassword?newPassword="+$("#newPassword").val(),
									success:function(){
										$('#contentMsg0').notifyModal({  
											duration : 25000,  
											placement : 'center',  
											overlay : true,  }); 
									},
									fail:function(){
										$('#contentMsg1').notifyModal({  
											duration : 25000,  
											placement : 'center',  
											overlay : true,  });
									}
								})
								
								}else{
									//两次密码不一致
									$("#newPassword").nextAll().css("display","none");
									$("#errorMsg2").css("display","inline");
								}
							}else{
								//密码不符合规范
								$("#newPassword").nextAll().css("display","none");
								$("#errorMsg1").css("display","inline");
							}
						}
						
					
				}
			});
		}
	}

</script>


<body >
	<div class="data_list">
	<div class="data_info">
		<p style="text-align:center"><strong>修改个人密码</strong></p>
	</div>
	<br>
	<br>
	<div class="data_content">
		<form id="updatePasswordForm" action="${ctx}/updatePassword" method="post">
			<table width="60%" align="center">
				<tr>
					<td><label>用户ID：</label></td>
					<td>
						<input type="text" value="${student.id}" name="id" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td><label>原密码：</label></td>
					<td>
						<input type="password" id="oldPassword"/>&nbsp;&nbsp;<span  style="color:red;display:none">密码错误</span>
					</td>
				</tr>
				<tr>
					<td><label>新密码：</label></td>
					<td>
						<input type="password" id="newPassword" name="newPassword"/>&nbsp;&nbsp;<span id="errorMsg1" style="color:red;display:none">密码不符合规范!</span>
						&nbsp;&nbsp;<span  style="color:grey;display:inline">(密码至少6位，其中只能包含字母，数字)</span>
					</td>
				</tr>
				<tr>
					<td><label>确认新密码：</label></td>
					<td>
						<input type="password" id="newPassword2" />&nbsp;&nbsp;<span  id="errorMsg2" style="color:red;display:none">两次密码不一致!</span>
						&nbsp;&nbsp;<span  style="color:grey;display:inline">(两次密码必须一致)</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-primary" type="button" onclick="checkForm()">修改密码</button>
						<div style="display:none"><span id="contentMsg0">密码修改成功!</span><span id="contentMsg1">密码修改失败!</span></div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
	
		
		
	
	
	
</body>
</html>