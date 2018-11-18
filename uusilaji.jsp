<%@include file="header.jsp" %>

<fieldset id="lajiTiedot">
	<legend>Lajitiedot:</legend>
	<form action="Servlet_UusiLaji" method="post" id="uusiLomake">
		<label>Nimi:</label>
			<input type="text" name="nimi" id="nimi" value="" size="40"><br>
		<label>Halli:</label>
			<input type="text" name="halli_id" id="halli_id" value="" size="40"><br>		
		<label></label>	
			<input type="submit" value="Lisää uusi" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi laji on lisätty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Lajin lisäys epäonnistui.");	
				}
			}
			%>
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
	    */
	});
	
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









