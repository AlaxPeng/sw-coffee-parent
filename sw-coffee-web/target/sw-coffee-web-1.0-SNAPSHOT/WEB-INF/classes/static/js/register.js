$(function (){
	function codeLogin(){
		$.getJSON("/register/begin",{"phone":$("#phone").val(),"code":$("#code").val()},function (data) {
			if(data == "0"){
				alert("验证码错误");
			}else{
				location.href = "/register/end?accountNumber="+data;
			}
		});
	}
	function codeLanding(){
		$.getJSON("/register/begin",{"code":$("#code").val()},function (data) {
			if(data == "0"){
				alert("验证码错误");
			}else{
				location.href = "/account";
			}
		});
	}
	$(".gainCode").click(function(){
		$(this).text("获取中...");
		$.getJSON("/register/gainCode",{"phone":$("#phone").val()},function (data) {
			$(".gainCode").text("获取成功");
		});
	})
	$("#alogins").click(function(){codeLogin()});
	$("#phone").keyup(function () {
		if(!($(this).val().match(/^0?1[3|4|5|8][0-9]\d{8}$/))){
			$("#phonespan").text("请输入正确的手机号码");
			$(".button-large").attr("disabled","disabled").addClass("alogin");
		}else{
			$.getJSON("/register/phoneKeyUp",{"phone":$("#phone").val()},function (data) {
				$("#phonespan").text("");
				$(".button-large").removeAttr("disabled").css("color","#00A862").removeClass("alogin");
				if(data){
					$(".button-large").attr("id","landing");
					$(".button-large").find("span:first").text("登陆");
					$("#landing").click(function(){codeLanding()});
				}else{
					$(".button-large").attr("id","alogins");
					$(".button-large").find("span:first").text("注册");
					$("#alogins").click(function(){codeLogin()});
				}
			});
		}
	})
})