<%@include file="header.jsp" %>
<%@ page import="model.Laji"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String hakusana;
if(session.getAttribute("hakusanaVaraus")!=null){
	hakusana=session.getAttribute("hakusanaVaraus").toString();
}else{
	hakusana="";
}
//***ALKU TULEE header.jsp tiedostosta******************************************************************************************************
%>
<form action="Servlet_UusiVaraus" method="post" id="varausLomake">
	<div id="asiakasTiedot">
		<label>Nimi:</label>
			<input type="text" name="asiakas_id" id="asiakas_id" value="" size="40"><br>
	</div>
	<!-- SQL-lause
	select vh.paiva, tu.tunti_id, tu.alkuaika, ha.nimi
	from VJ_varaus_hallit as vh, VJ_tunnit as tu, VJ_kentat as ke, VJ_hallit as ha
	where vh.tunti_id=tu.tunti_id
	and vh.kentta_id=ke.kentta_id
	and ke.halli_id=ha.halli_id;

select paiva from VJ_varaus_hallit where paiva is not null;
	  -->
	


	<div id="valitsePaiva">
		<label>Valitse päivä:</label>
			<input type="text" name="paiva" id="paiva" value=""><br>
	</div>	
<!-- Varaustaulukko alkaa.************************************************************************** -->
	<div id="valitseTunti">
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
<!-- Varaustaulukko loppuu.************************************************************************** -->
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
			<input type="submit" value="Lisää uusi" id="lisaaBtn">
			<%
			if(request.getParameter("ok")!=null){
				if(request.getParameter("ok").equals("1")){
					out.print("Uusi varaushalli on lisätty.");	
				}else if(request.getParameter("ok").equals("0")){
					out.print("Varaushallin lisäys epäonnistui.");	
				}
			}
			%>
	
</form>


<script>
$(document).ready(function(){
	$("#paiva").datepicker({ dateFormat: 'dd.mm.yy' });
	$("#otsikko_1").css({
		"display":"inline-block",
		"font-size": "30px", 
		
	});
});
</script>

</body>
</html>