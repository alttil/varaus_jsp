<%@include file="header.jsp" %>
<%@ page import="model.Varaushalli"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String hakusana;
if(session.getAttribute("hakusanaVaraushalli")!=null){
	hakusana=session.getAttribute("hakusanaVaraushalli").toString();
}else{
	hakusana="";
}
//***ALKU TULEE header.jsp tiedostosta******************************************************************************************************
%>
<img src="images/add.png" title="Uusi varaushalli" class="icon" id="uusiVaraushalli">
<span class='otsikkoTeksti'>Uusi varaus</span>
<br><br>
<fieldset id="hakuAlue">
	<legend>Haku:</legend>	
	<input type="text" name="hakuSana" id="hakuSana" value="<%out.println(hakusana);%>">
	<img src="images/search.png" title="Etsi" class="icon" id="haeVaraushalli">
</fieldset>
<fieldset id="tulosAlue">
	<legend>Tulos:</legend>
	<div id="poistonVahvistus">
	<span id="poistettavaNimi"></span>
	<img src="images/accept.png" title="Poista" class="icon" id="vahvistaPoisto">
	<img src="images/delete.png" title="Peruuta" class="icon" id="peruutaPoisto">
	</div>
	<table id="tiedotTaulu">
		<thead>
			<tr>
			
				<th>Asiakas</th>
				<th>Kentt‰</th>
				<th>P‰iv‰</th>
				
				<th>Peliaika</th>
				<th>Halli</th>	
				<th></th>			
			</tr>
		</thead>
		<tbody>
		<%
		if(request.getAttribute("varaushallit")!=null){	
			ArrayList<Varaushalli> varaushallit = (ArrayList<Varaushalli>)request.getAttribute("varaushallit");
			for(int i=0;i<varaushallit.size();i++){
				out.print("\n<tr>");
				out.print("<td title='"+varaushallit.get(i).getPuhelin()+"'>"+varaushallit.get(i).getEtunimi()+" "+varaushallit.get(i).getSukunimi()+"</td>");
				out.print("<td>" + varaushallit.get(i).getKentta_id()+ "</td>");
				out.print("<td>" + varaushallit.get(i).getPaiva()+ "</td>");
				out.print("<td title='"+varaushallit.get(i).getVaraus_id()+"'>" + varaushallit.get(i).getAlkuaika()+ "-" + varaushallit.get(i).getLoppuaika() + "</td>");
				out.print("<td>" + varaushallit.get(i).getNimi()+ "</td>");
				out.print("<td>");
				out.print("\n<img src='images/modify.png' class='icon muokkaa' id='muokkaa_"+varaushallit.get(i).getVaraus_id()+"' name='"+varaushallit.get(i).getTunti_id()+" "+varaushallit.get(i).getAsiakas_id()+" "+varaushallit.get(i).getKentta_id()+"' title='Muokkaa'>");
				out.print("\n<img src='images/delete.png' class='icon poista' id='poista_"+varaushallit.get(i).getVaraus_id()+"' name='"+varaushallit.get(i).getTunti_id()+" "+varaushallit.get(i).getAsiakas_id()+" "+varaushallit.get(i).getKentta_id()+"' title='Poista'>");
				out.print("</td>");
				out.print("</tr>");
			}	
		}
		%>
		</tbody>
	</table>
</fieldset>
<script>
$(document).ready(function(){
	$("#poistonVahvistus").hide();
	
	$("#uusiVaraushalli").click(function(){
		document.location="uusivaraushalli.jsp";	
	});	
	
	$(".varaus_id").click(function(){		
		document.location="Servlet_VarausTunti?Varaus_id=" + $(this)[0].id;	
	});
	
	$("#haeVaraushalli").click(function(){
		document.location=encodeURI("Servlet_HaeVaraushallit?hakusana=" + $("#hakuSana").val());	
	});
	
	$(".muokkaa").click(function(){
		//Objektin ominaisuuksien ja arvojen l√§pik√§ynti (ei tarvita t√§ss√§ tapauksessa, vain esimerkkin√§)
		/*
		var obj = $(this)[0]; 	
		for(var key in obj) {
			console.log('key: ' + key + '\n' + 'value: ' + obj[key]);
		}
		*/	
		document.location="Servlet_MuokkaaAsiakas?asiakas_id=" + $(this)[0].id;	
	});
	var poistettava_id;	
	$(".poista").click(function(event){	//event kantaa mukanaan tapahtuman, mm. klikkauksen sijainnin	
		poistettava_id=$(this)[0].id;
		$("#poistettavaNimi").html("Poista " + $(this)[0].name + "?<br>");
		$("#poistonVahvistus").css({ 
			"width": "170px", 
			"height": "50px",
			"background-color": "#4CAF50",
			"border-radius": "15px",
			"color": "white",
			"text-align": "center",
			"padding": "10px",
			"border": "1px solid black",
			"position": "absolute",
			"left": event.pageX +"px",
			"top": event.pageY +"px"
		});			
		$("#poistonVahvistus").show();
	});
	
	$("#vahvistaPoisto").click(function(){
		document.location="Servlet_PoistaAsiakas?asiakas_id="+poistettava_id;
	});
	
	$("#peruutaPoisto").click(function(){
		$("#poistonVahvistus").hide();
	});
	
	
});
</script>
</body>
</html>