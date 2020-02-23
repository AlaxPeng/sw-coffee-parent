var load = "/static/img/shop/assets/icon-pin-solid-grey.svg";
var greenLoad = "/static/img/shop/assets/icon-pin-solid-green.svg";
var map,geolocation;
var myPosition;
map = new AMap.Map('containerTu', {
	resizeEnable: true,
	zoom : 10
});
var markers = [];

AMap.plugin('AMap.Geolocation', function() {
	geolocation = new AMap.Geolocation({
		enableHighAccuracy: true,//是否使用高精度定位，默认:true
		timeout: 10000,          //超过10秒后停止定位，默认：5s
		buttonPosition:'RB',    //定位按钮的停靠位置
		buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
		showMarker: true        //定位成功后在定位到的位置显示点标记，默认：true
	});
	map.addControl(geolocation);
	geolocation.getCurrentPosition(function(status,result){
		if(status === 'complete'){
			onComplete(result)
		}else{
			onError(result)
		}
	});
});

//解析定位结果
function onComplete(data) {
	myPosition = data.position;
}
//解析定位错误信息
function onError(data) {
	alert('定位失败')
	alert('失败原因排查信息:'+data.message);
}
function mapMove(){
	var i=0;
	var bounds = map.getBounds();

	var walking = new AMap.Walking({
		autoFitView: true,
		map: map,
		panel: "panel"
	});
	$.getJSON("/shop/map",
		{"xmin":bounds.southwest.lng,"xmax": bounds.northeast.lng,
			"ymin":bounds.southwest.lat,"ymax":bounds.northeast.lat},
		function (data) {
		$("#shupMap").html("");
		clearMarker();
		for (var i = 0; i < data.length; i++) {
			var marker;//实例化marker
			var center = [];
			center[0]=data[i].coordinateX;
			center[1]=data[i].coordinateY;
			marker = new AMap.Marker({
				position: center,
				title: data[i].name,
				map: map,
				clickable: true,
			});
			var markerContent = document.createElement("div");
			$(markerContent).val(center);
			var markerHidden = document.createElement("input")
			markerHidden.type = "hidden";;
			$(markerHidden).val(data[i].shopNo);
			markerContent.appendChild(markerHidden);
			var markerNum = document.createElement("span");
			var $markerNum = $(markerNum);
			$markerNum.css("position","relative").css("left","18px")
				.css("top","-3px").css("color","white").css("font-weight","bold");
			markerNum.className = 'marker-number';
			markerNum.innerHTML = i+1;
			markerContent.appendChild(markerNum);
			var markerImg = document.createElement("img");
			var $markerImg = $(markerImg);
			markerImg.className = "markerlnglat";
			markerImg.src = load;
			$markerImg.attr("msg",i+1);
			$markerImg.css("width","30px").css("height","30px");
			markerContent.appendChild(markerImg);
			marker.setContent(markerContent);

			marker.on('click',function () {
				markerClick(this.getPosition());
			} );
			markers.push(marker);
			var $tr = $("<li value="+data[i].shopNo+" class='liImgmsg'><div class='imgspan'><span class='spanSize'>"
				+(i+1)+"</span><img class='imgSize' src="+load+"></div><div class='imgshopmsg'><strong>"+data[i].shopName+
				"</strong></br><small>"+data[i].city+" "+data[i].detailedAddress+
				"</small></div><img class='imglast' src='/static/img/shop/assets/icon-info-green.svg'></li>")
			$("#shupMap").append($tr);
		}
		imgHover();
		$(".imglast").click(function () {
			$(".shop").css("display","none");
			$(".shopMsg").css("display","block");
			var c = $(this).parent().find("div:first").find("span:first").text();
			var number = $(".markerlnglat[msg="+c+"]").parent().val();
			markerClick(number);
			var shopId = $(this).parents("li").val();
			$.getJSON("/shop/msg",{shopId:shopId},function (data) {
					$(".shopMsg").html(createShopMsgChild(data));
					$(".icon-close").click(function () {
						$(".shopMsg").css("display", "none");
						$(".shop").css("display", "block");
						map.clearMap();
						map.zoom = 8;
					});
				}
			);
		});
	});
}


function imgHover(){
	$(".liImgmsg").hover(function(){
		var c = $(this).find("div:first").find("span:first").text();
		$(this).find("div:first").find("img:first").attr("src",greenLoad);
		$(".markerlnglat[msg="+c+"]").attr("src",greenLoad);
	},function(){
		var c = $(this).find("div:first").find("span:first").text();
		$(this).find("div:first").find("img:first").attr("src",load);
		$(".markerlnglat[msg="+c+"]").attr("src",load);
	});
}

function clearMarker() {
	for (var i = 1;i<markers.length;i++){
		markers[i].setMap(null);
	}
}
var walking = new AMap.Walking({
	map: map,
	panel: "panel"
});
function markerClick(number) {
	//根据起终点坐标规划步行路线
	map.clearMap();
	walking.search(myPosition, number, function(status, result) {
		if (status === 'complete') {
			map.setCenter(number);
			// map.setZoom(18);
		} else {
			alert('步行路线数据查询失败' + result)
		}
	});
}
mapMove()

map.on('moveend', mapMove);

function createShopMsgChild(data) {
	var child = "<div class=\"icon-close\"></div><br>";
	child+="<h2 class=\"fn-org\">"+data.shop.shopName+"</h2>";
	child+="<div class=\"adr\">" +
				"<div class=\"street-address\">"+data.shop.detailedAddress+"</div>" +
				"<span class=\"locality\">"+data.shop.city+"</span>," +
				"<span class=\"postal-code\">"+data.shop.zipCode+"</span>" +
			"</div>";
	child+="<h3 class=\"caption\">" +
				"<span>营业时间</span>" +
			" </h3>";
	child+="<div class=\"captionTime\">";
	$.each(data.shopDates,function (index,shopDate){
		if(shopDate.wed === "今天"){
			child+="<div class=\"activeTime\">";
		}else {
			child+="<div>"
		}
		child+=		"<span class=\"day\">"+shopDate.wed+"</span>" +
			"<span class=\"hours\">" +
			"<span class=\"startTime\">"+shopDate.startTime+"</span>" +
			"<span>至</span>\n" +
			"<span class=\"startTime\">"+shopDate.endTime+"</span>" +
			"</span>" +
			"</div>";
	})
	return child;
}
