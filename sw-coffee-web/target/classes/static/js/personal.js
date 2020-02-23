$(".large").click(function (){
	convert_base64_url_to_blob($("#portrait").attr('src'))
})

$("#portrait").click(function () {
	picture_clipping_tool($(this));
})