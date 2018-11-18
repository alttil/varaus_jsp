<%@include file="header.jsp" %>
<%@ page import="model.Halli"%> 
<%
Halli halli = null;
if( request.getAttribute("halli")!=null){
	halli = (Halli)request.getAttribute("halli");	
}
%>
<fieldset id="halliTiedot">
	<legend>Hallinn tiedot:</legend>
	<form action="Servlet_MuokkaaHalli" method="post" id="uusiLomake">
		<label>Nimi:</label>
			<input type="text" name="nimi" id="nimi" value="<%out.print(halli.getNimi());%>" size="40"><br>
		<label>Puhelin:</label>
			<input type="text" name="puhelin" id="puhelin" value="<%out.print(halli.getPuhelin());%>"><br>
		<label>Sähköposti:</label>
			<input type="text" name="sahkoposti" id="sahkoposti" value="<%out.print(halli.getSahkoposti());%>" size="40"><br>
		<label>Katuosoite:</label>
			<input type="text" name="osoite" id="osoite" value="<%out.print(halli.getOsoite());%>" size="40"><br>			
		<label></label>	
			<input type="submit" value="Vahvista muutos" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi halli on lisätty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Hallin muokkaaminen epäonnistui.");	
				}
			}
			%>
		<input type="hidden" name="halli_id" value="<%out.print(halli.getHalli_id());%>">
	</form>
</fieldset>
<script>
$(document).ready(function(){
	
	$("#halliTiedot").css({
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
			puhelin:  {				
				minlength: 3				
			},
			sahkoposti:  {
				required: true,
				email: true			
			},
			katuosoite:  {
				required: true,
				minlength: 4
			},
						
		},
		messages: {
			nimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"			
			},
			puhelin:  {				
				minlength: "Liian lyhyt"				
			},
			sahkoposti: {
				required: "Puuttuu",
				email: "Ei kelpaa"			
			},
			katuosoite: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			
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
	//Käynnistetään postitoimipaikan haku ajaxilla käymällä postinumero -kentässä ja poistumalla sieltä
	//$("#postinumero").focus();
	$("#nimi").focus();
});

</script>
</body>
</html>









