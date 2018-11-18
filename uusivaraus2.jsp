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
<label>Kalenteri:</label>
			<input type="text" name="kalenteri" id="kalenteri" value=""><br>	
<!-- Varaustaulukko alkaa.************************************************************************** -->
	<table class="ajat">
		<tr>
			<th class="paivat">Maanantai</th>
			<th class="paivat">Tiistai</th>
			<th class="paivat">Keskiviikko</th>
			<th class="paivat">Torstai</th>
			<th class="paivat">Perjantai</th>
			<th class="paivat">Lauantai</th>
			<th class="paivat">Sunnuntai</th>
		</tr>	
		<tr>
		<!-- 1. rivi -->
			<th><button id="ma_06">06.00</button></th>
			<th><button id="ti_06">06.00</button></th>
			<th><button id="ke_06">06.00</button></th>
			<th><button id="to_06">06.00</button></th>
			<th><button id="pe_06">06.00</button></th>
			<th><button id="la_06">06.00</button></th>
			<th><button id="su_06">06.00</button></th>
		</tr>
		<tr>	
		<!-- 2. rivi -->
			<th><button id="ma_07">07.00</button></th>
			<th><button id="ti_07">07.00</button></th>
			<th><button id="ke_07">07.00</button></th>
			<th><button id="to_07">07.00</button></th>
			<th><button id="pe_07">07.00</button></th>
			<th><button id="la_07">07.00</button></th>
			<th><button id="su_07">07.00</button></th>
		</tr>
		<tr>
		<!-- 3. rivi -->
			<th><button id="ma_08">08.00</button></th>
			<th><button id="ti_08">08.00</button></th>
			<th><button id="ke_08">08.00</button></th>
			<th><button id="to_08">08.00</button></th>
			<th><button id="pe_08">08.00</button></th>
			<th><button id="la_08">08.00</button></th>
			<th><button id="su_08">08.00</button></th>
		</tr>
		<tr>
		<!-- 4. rivi -->
			<th><button id="ma_09">09.00</button></th>
			<th><button id="ti_09">09.00</button></th>
			<th><button id="ke_09">09.00</button></th>
			<th><button id="to_09">09.00</button></th>
			<th><button id="pe_09">09.00</button></th>
			<th><button id="la_09">09.00</button></th>
			<th><button id="su_09">09.00</button></th>
		</tr>
		<tr>
		<!-- 5. rivi -->
			<th><button id="ma_10">10.00</button></th>
			<th><button id="ti_10">10.00</button></th>
			<th><button id="ke_10">10.00</button></th>
			<th><button id="to_10">10.00</button></th>
			<th><button id="pe_10">10.00</button></th>
			<th><button id="la_10">10.00</button></th>
			<th><button id="su_10">10.00</button></th>
		</tr>
		<tr>
		<!-- 6. rivi -->
			<th><button id="ma_11">11.00</button></th>
			<th><button id="ti_11">11.00</button></th>
			<th><button id="ke_11">11.00</button></th>
			<th><button id="to_11">11.00</button></th>
			<th><button id="pe_11">11.00</button></th>
			<th><button id="la_11">11.00</button></th>
			<th><button id="su_11">11.00</button></th>
		</tr>
		<tr>
		<!-- 7. rivi -->
			<th><button id="ma_12">12.00</button></th>
			<th><button id="ti_12">12.00</button></th>
			<th><button id="ke_12">12.00</button></th>
			<th><button id="to_12">12.00</button></th>
			<th><button id="pe_12">12.00</button></th>
			<th><button id="la_12">12.00</button></th>
			<th><button id="su_12">12.00</button></th>
		</tr>
		<tr>
		<!-- 8. rivi -->
			<th><button id="ma_13">13.00</button></th>
			<th><button id="ti_13">13.00</button></th>
			<th><button id="ke_13">13.00</button></th>
			<th><button id="to_13">13.00</button></th>
			<th><button id="pe_13">13.00</button></th>
			<th><button id="la_13">13.00</button></th>
			<th><button id="su_13">13.00</button></th>
		</tr>
		<tr>
		<!-- 9. rivi -->
			<th><button id="ma_14">14.00</button></th>
			<th><button id="ti_14">14.00</button></th>
			<th><button id="ke_14">14.00</button></th>
			<th><button id="to_14">14.00</button></th>
			<th><button id="pe_14">14.00</button></th>
			<th><button id="la_14">14.00</button></th>
			<th><button id="su_14">14.00</button></th>
		</tr>
		<tr>	
		<!-- 10. rivi -->
			<th><button id="ma_15">15.00</button></th>
			<th><button id="ti_15">15.00</button></th>
			<th><button id="ke_15">15.00</button></th>
			<th><button id="to_15">15.00</button></th>
			<th><button id="pe_15">15.00</button></th>
			<th><button id="la_15">15.00</button></th>
			<th><button id="su_15">15.00</button></th>
		</tr>
		<tr>	
		<!-- 11. rivi -->
			<th><button id="ma_16">16.00</button></th>
			<th><button id="ti_16">16.00</button></th>
			<th><button id="ke_16">16.00</button></th>
			<th><button id="to_16">16.00</button></th>
			<th><button id="pe_16">16.00</button></th>
			<th><button id="la_16">16.00</button></th>
			<th><button id="su_16">16.00</button></th>
		</tr>
		<tr>	
		<!-- 12. rivi -->
			<th><button id="ma_17">17.00</button></th>
			<th><button id="ti_17">17.00</button></th>
			<th><button id="ke_17">17.00</button></th>
			<th><button id="to_17">17.00</button></th>
			<th><button id="pe_17">17.00</button></th>
			<th><button id="la_17">17.00</button></th>
			<th><button id="su_17">17.00</button></th>
		</tr>
		<tr>	
		<!-- 13. rivi -->
			<th><button id="ma_18">18.00</button></th>
			<th><button id="ti_18">18.00</button></th>
			<th><button id="ke_18">18.00</button></th>
			<th><button id="to_18">18.00</button></th>
			<th><button id="pe_18">18.00</button></th>
			<th><button id="la_18">18.00</button></th>
			<th><button id="su_18">18.00</button></th>
		</tr>
		<tr>	
		<!-- 14. rivi -->
			<th><button id="ma_19">19.00</button></th>
			<th><button id="ti_19">19.00</button></th>
			<th><button id="ke_19">19.00</button></th>
			<th><button id="to_19">19.00</button></th>
			<th><button id="pe_19">19.00</button></th>
			<th><button id="la_19">19.00</button></th>
			<th><button id="su_19">19.00</button></th>
		</tr>
		<tr>	
		<!-- 15. rivi -->
			<th><button id="ma_20">20.00</button></th>
			<th><button id="ti_20">20.00</button></th>
			<th><button id="ke_20">20.00</button></th>
			<th><button id="to_20">20.00</button></th>
			<th><button id="pe_20">20.00</button></th>
			<th><button id="la_20">20.00</button></th>
			<th><button id="su_20">20.00</button></th>
		</tr>
		<tr>	
		<!-- 16. rivi -->
			<th><button id="ma_21">21.00</button></th>
			<th><button id="ti_21">21.00</button></th>
			<th><button id="ke_21">21.00</button></th>
			<th><button id="to_21">21.00</button></th>
			<th><button id="pe_21">21.00</button></th>
			<th><button id="la_21">21.00</button></th>
			<th><button id="su_21">21.00</button></th>
		</tr>
		<tr>	
		<!-- 17. rivi -->
			<th><button id="ma_22">22.00</button></th>
			<th><button id="ti_22">22.00</button></th>
			<th><button id="ke_22">22.00</button></th>
			<th><button id="to_22">22.00</button></th>
			<th><button id="pe_22">22.00</button></th>
			<th><button id="la_22">22.00</button></th>
			<th><button id="su_22">22.00</button></th>
		</tr>	
	</table>
<!-- Varaustaulukko loppuu.************************************************************************** -->

<script>
$(document).ready(function(){
	$("#kalenteri").datepicker({ dateFormat: 'dd.mm.yy' });
}

</script>

</body>
</html>