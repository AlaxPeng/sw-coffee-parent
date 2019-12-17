function logins(){
	$.getJSON("/login/landing",{"accountNumber":$("#username").val(),"password":$("#password").val()},function (data) {
		if(!data){
			alert("密码错误！！！");
			$("#username").val($("#username").val());
			$("#password").val($("#password").val());
			$("#aForgetPassword").css("visibility","visible");
		}else{
			location.href = "/account";
		}
	});
}
$("#btnlogin").click(function(){
	logins();
})
$("#username").keyup(function(){
	if(!($(this).val().match(/^[a-z]?[a-z]?1[3|4|5|8][0-9]\d{8}$/))){
		$("#usernamespan").text("请输入有效的账户名");
		$(".button-large").attr("disabled","disabled").addClass("alogin");
		$("#aForgetPassword").css("visibility","hidden");
	}else{
		$.getJSON("/login/usernameKeyup",{"accountNumber":$("#username").val()},function (data) {
			if(!data){
				$("#usernamespan").text("请输入有效的账户名");
				$(".button-large").attr("disabled","disabled").addClass("alogin");
				$("#aForgetPassword").css("visibility","hidden");
			}else{
				$("#usernamespan").text("");
				$(".button-large").removeAttr("disabled").css("color","#00A862").removeClass("alogin");
			}
		});
	}
});
$(".hides").click(function(){
	$(".hides").css("display","none");
	$(".shows").css("display","block");
	$("#password").attr("type","text");
});
$(".shows").click(function(){
	$(".hides").css("display","block");
	$(".shows").css("display","none");
	$("#password").attr("type","password");
});
$(".gaincode").click(function(){
	$(this).text("获取中...");
	$.getJSON("/login/gainCode",{"phone":$("#modalPhone").val()},function (data) {
		alert(data)
		if(data === "1"){
			$(".gaincode").text("获取成功");
		}else if(data === "0"){
			$(".gaincode").text("获取失败");
			alert("当前手机号与绑定号码不符！！！");
		}else {
			$(".gaincode").text("获取失败");
			alert("服务异常，请联系管理员！！！");
		}
	});
})
$("#newmodal1password").keyup(function(){
	if($("#oldmodal1password").val()!=$(this).val()){
		$("#btnmodal1").attr("disabled","disabled").css("cursor","not-allowed").css("color","black");
	}else{
		$("#btnmodal1").removeAttr("disabled").css("cursor","pointer").css("color","white");
	}
});
$("#oldmodal1password").keyup(function(){
	if($("#newmodal1password").val()!=$(this).val()){
		$("#btnmodal1").attr("disabled","disabled").css("cursor","not-allowed").css("color","black");
	}else{
		$("#btnmodal1").removeAttr("disabled").css("cursor","pointer").css("color","white");
	}
});
$("#btnmodal1").click(function(){
	$.getJSON("/login/updatePassword",{"password":$("#newmodal1password").val()},function (data) {
		if(data){
			alert("密码修改成功");
		}else{
			alert("密码修改失败");
		}
	});
})
$("#modalcode").keyup(function(){
	$.getJSON("/login/modalCode",{"code":$(this).val()},function (data) {
		if(data){
			$("#btnmodal").removeAttr("disabled").css("cursor","pointer").css("color","white");
		}else{
			$("#btnmodal").attr("disabled","disabled").css("cursor","not-allowed").css("color","black");
		}
	});
});
$("#imageVC").attr('src','/kaptcha?'+Math.floor(Math.random()*100))