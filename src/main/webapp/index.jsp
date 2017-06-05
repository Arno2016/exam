<%@ page language="java" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%> 
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>在线考试</title>
<link rel="stylesheet" href="./css/bootstrap.css"> 
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/popModal.min.css">
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/popModal.min.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
			async: false,
			url: "${ctx}/getCode",
			contentType: 'application/json', 
			dataType: "json",  
			data:{
				name:"harvey"
			},
			success: function(data){
				$("#imgCode").attr("src","./code.jsp"); 
				$("#inputCode2").val(data.code);
			}
		});	
		
		//将提示框的提示内容隐藏
		$(".dialogModal_content").find("div").css("display","none");
		
		
		
	});


</script>

</head>
<body>
	
	<div id="content"  style="display:none;">
	<div class="dialogModal_header">提示框</div>

	<div class="dialogModal_content">
		<div id="error_message1">验证码错误</div>
		<div id="error_message2">账号或密码错误!</div>
	</div>
	
	<div class="dialogModal_footer" style="text-align:center">

		<button type="button" class="btn" data-dialogModalBut="ok">确认</button>

		<button type="button" class="btn" data-dialogModalBut="cancel">取消</button>

	</div>
	

	</div>
	

	<!-- <div id="register" ><button id="bn1" class="btn btn-lg btn-primary" type="button" "><img alt="无法加载图片" src="./image/add.png" style="width:3rem">&nbsp;&nbsp;register</button></div> -->
	<div class="container">

      <form class="form-signin" id="myForm" action="${ctx}/login" method="post" >
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="username" class="sr-only">Email address</label>
        <input type="text" id="userID"  name="id" class="form-control" placeholder="ID" required autofocus>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="password" required>
        <div>验证码：
        	<input type="text" id="inputCode" name="inputCode" style="width:20%"/>&nbsp;&nbsp;&nbsp;
        	<input type="text" id="inputCode2" name="inputCode2" style="display:none"/>&nbsp;&nbsp;&nbsp;
        	<a href="#"><img id="imgCode" alt="" src="./code.jsp?'<%=new Date()%>>'" onclick="getCode()" /></a>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font size="0.1"><a href="#" onclick="getCode()">换一张</a></font>  
        </div>
        <br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <label>
           <a href="#">Forget password ?</a>
          </label>
        </div>
        <div>
        	<button class="btn btn-lg btn-primary btn-block" type="button" onclick="checkForm()">Sign in</button>
        </div>
        
      </form>
      
    </div>
    
    <script type="text/javascript">
    
	function getCode(){
		$.ajax({
			type: "POST",
			async: false,
			url: "${ctx}/getCode",
			contentType: 'application/json', 
			dataType: "json",  
			data:{
				
			},
			success: function(data){
				$("#imgCode").attr("src","./code.jsp?asktime="+new Date()); 
				$("#inputCode2").val(data.code);
			}
		});		
	}
	
	function checkForm(){
		//检查验证码
		if($("#inputCode2").val()!=$("#inputCode").val()){
			$(".dialogModal_content").find("div").css("display","none");
			$("#error_message1").css("display","inline");
			$("#content").dialogModal({
				
				placement : 'center',

				showCloseBut : true,

				onDocumentClickClose : true,

				onOkBut : function(){
					
				},

				onCancelBut : function(){},

				onLoad : function(){},

				onClose : function(){}

			});

		}
		
		else{
			$.ajax({
				type:"GET",
				async: false,
				url: "${ctx}/login?id="+$("#userID").val()+"&password="+$("#password").val(),
				success:function(data,textStatus,request){
					if(request.getResponseHeader("msg")=='fail'){
						$(".dialogModal_content").find("div").css("display","none");
						$("#error_message2").css("display","inline");
						$("#content").dialogModal({
							
							placement : 'center',

							showCloseBut : true,

							onDocumentClickClose : true,

							onOkBut : function(){
								
							},

							onCancelBut : function(){},

							onLoad : function(){},

							onClose : function(){}

						});

					}else{
						$("#myForm").submit();
					}
				}
			});
			
			
		}
	}
	
	
	
	


</script>
	
</body>
</html>