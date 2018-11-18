<%@include file="header.jsp" %>

<fieldset id="tuntiTiedot">
	<legend>Tunnin tiedot:</legend>
	<form action="Servlet_UusiTunti" method="post" id="uusiLomake">
		<label>Alkuaika:</label>
			<select name="alkuaika" id="alkuaika">
				<option value="06:00:00">06:00:00</option>
				<option value="07:00:00">07:00:00</option>
				<option value="08:00:00">08:00:00</option>
				<option value="09:00:00">09:00:00</option>
				<option value="10:00:00">10:00:00</option>
				<option value="11:00:00">11:00:00</option>
				<option value="12:00:00">12:00:00</option>
				<option value="13:00:00">13:00:00</option>
				<option value="14:00:00">14:00:00</option>
				<option value="15:00:00">15:00:00</option>
				<option value="16:00:00">16:00:00</option>
				<option value="17:00:00">17:00:00</option>
				<option value="18:00:00">18:00:00</option>
				<option value="19:00:00">19:00:00</option>
				<option value="20:00:00">20:00:00</option>
				<option value="21:00:00">21:00:00</option>
				<option value="22:00:00">22:00:00</option>
			</select>
		<label>Loppuaika:</label>
			<select name="loppuaika" id="loppuaika">
				<option value="07:00:00">07:00:00</option>
				<option value="08:00:00">08:00:00</option>
				<option value="09:00:00">09:00:00</option>
				<option value="10:00:00">10:00:00</option>
				<option value="11:00:00">11:00:00</option>
				<option value="12:00:00">12:00:00</option>
				<option value="13:00:00">13:00:00</option>
				<option value="14:00:00">14:00:00</option>
				<option value="15:00:00">15:00:00</option>
				<option value="16:00:00">16:00:00</option>
				<option value="17:00:00">17:00:00</option>
				<option value="18:00:00">18:00:00</option>
				<option value="19:00:00">19:00:00</option>
				<option value="20:00:00">20:00:00</option>
				<option value="21:00:00">21:00:00</option>
				<option value="22:00:00">22:00:00</option>
				<option value="23:00:00">23:00:00</option>
			</select>	
		<label></label>	
			<input type="submit" value="Lisää uusi" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi asiakas on lisätty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Asiakkaan lisäys epäonnistui.");	
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
			alkuaika:  {
				required: true
								
			},	
			loppuaika:  {
				required: true
								
			}			
		},
		messages: {
			alkuaika: {     
				required: "Puuttuu"
							
			},
			loppuaika: {
				required: "Puuttuu"
				
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









