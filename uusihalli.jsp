<%@include file="header.jsp" %>

<fieldset id="halliTiedot">
	<legend>Hallin tiedot:</legend>
	<form action="Servlet_UusiHalli" method="post" id="uusiLomake">
		<label>Nimi:</label>
			<input type="text" name="hnimi" id="hnimi" value="" size="40"><br>
		<label>Puhelin:</label>
			<input type="text" name="hpuhelin" id="hpuhelin" value=""><br>
		<label>Sähköposti:</label>
			<input type="text" name="hsahkoposti" id="hsahkoposti" value="" size="40"><br>	
		<label>Osoite:</label>
			<input type="text" name="hosoite" id="hosoite" value="" size="40"><br>
		<label></label>	
			<input type="submit" value="Lisää uusi" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi halli on lisätty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Hallin lisäys epäonnistui.");	
				}
			}
			%>
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
	    */
	});
	
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
			osoite:  {
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
			osoite: {
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
		
		submitHandler: function (form) {
			document.forms["uusiLomake"].submit();
		}
		/*
		submitHandler: function (form) {	
			if ($("#postitoimipaikka").html()!=""){
				document.forms["uusiLomake"].submit();
			}else{
				$("#postitoimipaikka").html("<label class='error'>Puuttuu</label>");
			}			
		}	*/	
	});   


</script>
</body>
</html>









