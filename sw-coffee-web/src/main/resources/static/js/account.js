function privilege(){
	$(".privilege").click(
		function () {
			$(".privilege-detail").append(
				"<div class=\"dialog-scroller\"><div class=\"dialog-container\">" +
				"<div class=\"dialog-box\"><header class=\"header\">" +
				"<button id=\"close-transaction-details-icon\" id='' class=\"icon close privilegeClose\">×</button><h3><span>玉星晋级饮品券</span></h3>" +
				"</header><div class=\"body\">" +
				"<ul>" +
				"<li>"+$(this).val().split(',')[0]+"</li>" +
				"<li>此礼卷可以优惠的额度为："+$(this).val().split(',')[1]+"</li>" +
				"</ul>" +
				"</div>" +
				"<footer class=\"footer\">" +
				"<button class=\"button buttonClose\"><span>知道了</span></button>" +
				"</footer></div></div></div>");
			$(".privilege-detail").addClass("active");
			$(".privilegeClose,.buttonClose").click(function () {
				$(".privilege-detail").removeClass("active").html("");
			});
		}
	)
}

privilege();

$(".scroll-arrow-my").click(function () {
	var page = $(this).val();
	$.ajax({
		url:"/account/membershipGiftsPageInfo/"+page,
		type:"GET",
		async:false,
		success:function (data) {
			if(data.code === "200"){
				$.ajax({
					url:"/account/userMembershipDTO",
					type:"GET",
					async:false,
					success:function (childData) {
						if (childData.code === "200"){
							var st = "";
							$.each(data.data.list, function (index, element) {
								st += "<button class=\"privilege privilege--green\" value=\"" + element.giftsBasicRules + "," + element.giftsDepreciate + "\">";
								st += "<div class=\"badge\"><img src=\"/static/img/account/assets/icons/icon-coupon-white.svg\">"
								if (childData.data.membershipTime == null) {
									st += "<div class=\"lock\"><img src=\"/static/img/account/assets/icons/icon-lock-white.svg\">\n" +
										"                                                                </div>";
								} else if (childData.data.membershipGrade < childData.data.gradeNo) {
									st += "<div class=\"lock\"><img src=\"/static/img/account/assets/icons/icon-lock-white.svg\">\n" +
										"                                                                    </div>"
								}
								st += "</div>\n" +
									"                                                        <span>"+element.giftsName+"</span></button>";
								$("#giftsParent").html(st);
							});
							privilege();
						}else {
							alert(childData.msg);
						}
					}
				})
			}else {
				alert(data.msg);
			}
		}
	})
})

$("#my_preserve").click(function () {
	var formData = new FormData($("#form-save"));
	alert(formData)
	console.log(formData)
	formData.append("_method","PUT")
	$.ajax({
		url:"/account/profile/updateUser",
		contentType:false,
		type:"POST",
		data:formData,
		success:function (data) {
			alert(data.code)
		}
	})
});

