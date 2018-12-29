$(function(){
	$("#payla-btn-action").on('click', function(){
		data = $("#billing-form").serialize()
		console.log(data)
		$.ajax({
			method: "post",
			url: "/checkouts",
			data: data,
			complete: function(req){
				token = req.responseJSON.token
				console.log(token)
				window.open('http://localhost:3000/payments?token='+token, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=500,width=1000,height=600")
			}
		})
	})
})