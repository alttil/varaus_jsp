<%@include file="header.jsp" %>
<%@ page import="model.Asiakas"%> 
<%
Asiakas asiakas = null;
if( request.getAttribute("asiakas")!=null){
	asiakas = (Asiakas)request.getAttribute("asiakas");	
}
%>
<fieldset id="asiakasTiedot">
	<legend>Asiakkaan tiedot:</legend>
	<form action="Servlet_MuokkaaAsiakas" method="post" id="uusiLomake">
		<label>Etunimi:</label>
			<input type="text" name="etunimi" id="etunimi" value="<%out.print(asiakas.getEtunimi());%>" size="40"><br>	
		<label>Sukunimi:</label>
			<input type="text" name="sukunimi" id="sukunimi" value="<%out.print(asiakas.getSukunimi());%>" size="40"><br>
		<label>Nimimerkki:</label>
			<input type="text" name="nimimerkki" id="nimimerkki" value="<%out.print(asiakas.getNimimerkki());%>" size="40"><br>		
		<label>Katuosoite:</label>
			<input type="text" name="osoite" id="osoite" value="<%out.print(asiakas.getOsoite());%>" size="40"><br>	
		<label>Sähköposti:</label>
			<input type="text" name="sahkoposti" id="sahkoposti" value="<%out.print(asiakas.getSahkoposti());%>" size="40"><br>	
		<label>Salasana:</label>
			<input type="password" name="salasana" id="salasana" value="<%out.print(asiakas.getSalasana());%>"><br>	
		<label>Toista salasana:</label>
			<input type="password" name="salasana2" id="salasana2" value="<%out.print(asiakas.getSalasana());%>"><br>	
		<label>Puhelin:</label>
			<input type="text" name="puhelin" id="puhelin" value="<%out.print(asiakas.getPuhelin());%>"><br>
		<label></label>	
			<input type="submit" value="Vahvista muutos" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Asiakkaan muokkaus onnistui.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Asiakkaan muokkaaminen epäonnistui.");	
				}
			}
			%>
		<input type="hidden" name="asiakas_id" value="<%out.print(asiakas.getAsiakas_id());%>">
	</form>
</fieldset>
<script>
$(document).ready(function(){
	
	$("#asiakasTiedot").css({
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
			etunimi:  {
				required: true,
				minlength: 2				
			},	
			sukunimi:  {
				required: true,
				minlength: 2				
			},
			nimimerkki:  {
				required: true,
				minlength: 2				
			},
			katuosoite:  {
				required: true,
				minlength: 4
			},				
			sahkoposti:  {
				required: true,
				email: true			
			},
			puhelin:  {				
				minlength: 3				
			},
			salasana:  {
				required: true,
				minlength: 8				
			},
			salasana2:  {
				required: true,
				minlength: 8,
				equalTo: salasana
			}			
		},
		messages: {
			etunimi: {     
				required: "Puuttuu",
				minlength: "Liian lyhyt"			
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			nimimerkki: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},
			katuosoite: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"
			},	
			sahkoposti: {
				required: "Puuttuu",
				email: "Ei kelpaa"			
			},
			puhelin:  {				
				minlength: "Liian lyhyt"				
			},
			salasana: {
				required: "Puuttuu",
				minlength: "Liian lyhyt"				
			},
			salasana2: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				equalTo: "Ei kelpaa"
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
	//Käynnistetään postitoimipaikan haku ajaxilla käymällä postinumero -kentässä ja poistumalla sieltä
	//$("#postinumero").focus();
	$("#etunimi").focus();
});

</script>
</body>
</html>









