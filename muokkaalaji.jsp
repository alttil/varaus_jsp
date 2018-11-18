<%@include file="header.jsp" %>
<%@ page import="model.Laji"%> 
<%
Laji laji = null;
if( request.getAttribute("laji")!=null){
	laji = (Laji)request.getAttribute("laji");	
}
%>
<fieldset id="lajiTiedot">
	<legend>Lajitiedot:</legend>
	<form action="Servlet_MuokkaaLaji" method="post" id="uusiLomake">
		<label>Nimi:</label>
			<input type="text" name="nimi" id="nimi" value="<%out.print(laji.getNimi());%>" size="40"><br>
		<label>Halli:</label>
			<input type="text" name="halli_id" id="halli_id" value="<%out.print(laji.getHalli_id());%>" size="40"><br>	
		
		<label></label>	
			<input type="submit" value="Vahvista muutos" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Lajin muokkaaminen onnistui.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Lajin muokkaaminen ep‰onnistui.");	
				}
			}
			%>
		<input type="hidden" name="laji_id" value="<%out.print(laji.getLaji_id());%>">
	</form>
</fieldset>
<script>
$(document).ready(function(){
	
	$("#lajiTiedot").css({
		"width": "500px", 
		"border-radius": "15px"
	});	
	/*
	$("#postinumero").blur(function(){
	    $.ajax({url: "Servlet_Postitoimi_Ajax?postinumero="+$("#postinumero").val(), success: function(result){
	        $("#postitoimipaikka").html(result);
	    }});
	});
	*/
	$("#uusiLomake").validate({						
		rules: {
			nimi:  {
				required: true,
				minlength: 2				
			},
			halli:  {
				required: true,
				minlength: 10				
			}
		},
		messages: {
			nimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"			
			},
			halli:  {
				required: true,
				minlength: 10				
			}
		
		},
		/*
		submitHandler: function (form) {	
			if ($("#postitoimipaikka").html()!=""){
				document.forms["uusiLomake"].submit();
			}else{
				$("#postitoimipaikka").html("<label class='error'>Puuttuu</label>");
			}			
		}
		*/
	});   
	//K‰ynnistet‰‰n postitoimipaikan haku ajaxilla k‰ym‰ll‰ postinumero -kent‰ss‰ ja poistumalla sielt‰
	//$("#postinumero").focus();
	$("#nimi").focus();
});

</script>
</body>
</html>









