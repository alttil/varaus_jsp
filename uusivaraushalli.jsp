<%@include file="header.jsp" %> 
<%@ page import="model.Asiakas"%> 
 
<%
Asiakas asiakas = null;
if( request.getAttribute("asiakas")!=null){
	asiakas = (Asiakas)request.getAttribute("asiakas");	
}
%>
<fieldset id="varaushalliTiedot">
	<legend>Varauksen tiedot:</legend>
	<form action="Servlet_UusiVaraushalli" method="post" id="uusiLomake">
		
		<div id="asiakasTiedot">
			<label>Nimi:</label>
			<input type="text" name="asiakas_id" id="asiakas_id" value="" size="40"><br>
		</div>	
	<div id="varauksenLisays">
		
		<div class="valitsePaiva">
    		<label>P‰iv‰m‰‰r‰:</label>
    		<!--  <input type="text" name="paiva" id="paiva" value=""><br> -->
			<input type="text" name="paivamaara" id="paivamaara">  				 
    			<select name="paiva_id" id="paiva_id">
    				<option value="0"></option>
        			<option value="1">1</option>
        			<option value="2">2</option>
        			<option value="3">3</option>
        			<option value="4">4</option>
        			<option value="5">5</option>
        			<option value="6">6</option>
        			<option value="7">7</option>
        			<option value="8">8</option>
        			<option value="9">9</option>
        			<option value="10">10</option>
        			<option value="11">11</option>
        			<option value="12">12</option>
        			<option value="13">13</option>
        			<option value="14">14</option>
        			<option value="15">15</option>
        			<option value="16">16</option>
        			<option value="17">17</option>
        			<option value="18">18</option>
        			<option value="19">19</option>
        			<option value="20">20</option>
        			<option value="21">21</option>
        			<option value="22">22</option>
        			<option value="23">23</option>
        			<option value="24">24</option>
        			<option value="25">25</option>
        			<option value="26">26</option>
        			<option value="27">27</option>
        			<option value="28">28</option>
        			<option value="29">29</option>
        			<option value="30">30</option>
        			<option value="31">31</option>
    			</select>
    			<select name="kuukausi_id" id="kuukausi_id">
    				<option value="0"></option>
       				<option value="1">Tammikuu</option> 
       				<option value="2">Helmikuu</option>
      				<option value="3">Maaliskuu</option>
        			<option value="4">Huhtikuu</option>
        			<option value="5">Toukokuu</option>
        			<option value="6">Kes‰kuu</option>
        			<option value="7">Hein‰kuu</option>
        			<option value="8">Elokuu</option>
        			<option value="9">Syyskuu</option>
       				<option value="10">Lokakuu</option>
        			<option value="11">Marraskuu</option>
        			<option value="12">Joulukuu</option>
    			</select>
    			<select name="vuosi_id" id="vuosi_id">
        			<option value="0"></option>
        			<option value="1">2018</option>
        			<option value="2">2019</option>
        			<option value="3">2020</option>
        			<option value="4">2021</option>
        			<option value="5">2022</option>
        			<option value="6">2023</option>
        			<option value="7">2024</option>
        			<option value="8">2025</option>
        			<option value="9">2026</option>
        			<option value="10">2027</option>
    			</select>
    		<input type="hidden" id="datepicker" />	
		</div>
		
		<!--  <div id="valitsePaiva">
			<label>P‰iv‰:</label>
			<input type="text" name="paiva" id="paiva" value=""><br>
			</div>
			-->
	</div>
		<div id="valitseTunti">
			<label>Tunti:</label>
				<select name="tunti_id" id="tunti_id">
					<option value="0">Valitse aika</option>
					<option value="1">06.00-07.00</option>
					<option value="2">07.00-08.00</option>
					<option value="3">08.00-09.00</option>
					<option value="4">09.00-10.00</option>
					<option value="5">10.00-11.00</option>
					<option value="6">11.00-12.00</option>
					<option value="7">12.00-13.00</option>
					<option value="8">13.00-14.00</option>
					<option value="9">14.00-15.00</option>
					<option value="10">15.00-16.00</option>
					<option value="11">16.00-17.00</option>
					<option value="12">17.00-18.00</option>
					<option value="13">18.00-19.00</option>
					<option value="14">19.00-20.00</option>
					<option value="15">20.00-21.00</option>
					<option value="16">21.00-22.00</option>
					<option value="17">22.00-23.00</option>	
				</select><br>
		</div>
			
		<div id="valitseHalli">
		 	<label>Halli:</label>
				<select name="kentta_id" id="kentta_id">
					<option value="0">Valitse halli</option>
					<option value="1">Talin Tenniskeskus</option>
					<option value="2">Meilahti Tennis</option>
					<option value="3">Myllypuron Tenniskeskus</option>
					<option value="4">Taivanlahden Tenniskeskus</option>
			</select>
			<br>
		</div>
		<label></label>	
			<input type="submit" value="Lis‰‰ uusi" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi varaushalli on lis‰tty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Varaushallin lis‰ys ep‰onnistui.");	
				}
			}
			%>
			<!-- 
			<input type="hidden" name="varaus_id" value="< %out.print(varaushalli.getVaraus_id());%>">
			
			 -->
	</form>
</fieldset>
<script>
$(document).ready(function(){
	$("#paivamaara").datepicker({
        onClose: function(dateText, inst) {
        $("#paiva_id").val(dateText.split("/")[1]);
        $("#kuukausi_id").val(dateText.split("/")[2]);
        $("#vuosi_id").val(dateText.split("/")[3]);
        }
	});
});
	$("#otsikko_1").css({
		"display":"inline-block",
		"font-size": "30px", 
		
	});


$(document).ready(function(){
	
	$("#varaushalliTiedot").css({
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
	
	$("#lisaaVaraus").click(function(event){
		$("#varauksenLisays").css({
			"width": "400px", 
			"border-radius": "15px",
			"background-color": "#4CAF50",		
			"color": "white",
			"padding": "10px",
			"border": "1px solid black",
			"position": "absolute",
			"left": event.pageX+30 +"px",
			"top": event.pageY-10 +"px"
		});	
		$("#varauksenLisays").show();	
		$("#uusiVaraus").focus();	
	});
	$("#lisaaUusiVaraus").click(function(event){	
		if($("#uusiVaraus").val().length>=1){
			var urli ="Servlet_LisaaVaraus?varaus="+$("#uusiVaraus").val() +"&varaus_id=" + $("#tunti_id option:selected").val() + $("#kentta_id option:selected").val() + $("#paiva option:selected").val();
			//alert(urli);
			$.ajax({url:urli , success: function(result){	        
				if(result==1){				
		        	$("#varausVastaus").html("Varaus lis‰tty.");	        	
		        }else{	        	
		        	$("#varausVastaus").html("Varaus on jo kannassa.");		        	
		        }	
				
				setTimeout(function(){$("#varausVastaus").html("");}, 5000);
				$("#varaus option").remove();
				$.getJSON("Servlet_VarauksetAjax?paiva=" + $("#paiva option:selected").val(), function(result){
					$.each(result, function(i, field){
			        	$("#varaus").append("<option value='"+field.varaus_id+"'>"+field.varaus_id+"</option>");            
			        });
			    });
				
		    }});	
			
		}		
		$("#varauksenLisays").hide();	
	});	
	
	$("#uusiLomake").validate({						
		rules: {
			asiakas_id:  {
				required: true				
			},	
			tunti_id:  {
				required: true
			
			},
			kentta_id:  {
				required: true

			}							
		},
		messages: {
			asiakas_id: {     
				required: "Puuttuu"
			
			},
			tunti_id: {
				required: "Puuttuu"

			},
			kentta_id: {
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









