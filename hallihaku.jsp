<%@include file="header.jsp" %>
<%@ page import="model.Halli"%>  
<%@ page import="java.util.ArrayList"%>  
<%! @SuppressWarnings("unchecked") %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String hakusana;
if(session.getAttribute("hakusanaHalli")!=null){
	hakusana=session.getAttribute("hakusanaHalli").toString();
}else{
	hakusana="";
}
//***ALKU TULEE header.jsp tiedostosta******************************************************************************************************
%>
<img src="images/add.png" title="Uusi halli" class="icon" id="uusiHalli">
<span class='otsikkoTeksti'>Uusi halli</span>
<br><br>
<fieldset id="hakuAlue">
	<legend>Haku:</legend>	
	<input type="text" name="hakuSana" id="hakuSana" value="<%out.println(hakusana);%>">
	<img src="images/search.png" title="Etsi" class="icon" id="haeHalli">
</fieldset>
<fieldset id="tulosAlue">
	<legend>Tulos:</legend>
	<div id="poistonVahvistus">
	<span id="poistettavaNimi"></span>
	<img src="images/accept.png" title="Poista" class="icon" id="vahvistaPoisto">
	<img src="images/delete.png" title="Peruuta" class="icon" id="peruutaPoisto">
	</div>
	<table id="tiedotTaulu2">
		<thead>
			<tr>
				<th>Hal.No</th>
				<th>Hallin nimi</th>
				<th>Hallin osoite</th>	
				<th></th>			
			</tr>
		</thead>
		<tbody>
		<%
		if(request.getAttribute("hallit")!=null){	
			ArrayList<Halli> hallit = (ArrayList<Halli>)request.getAttribute("hallit");
			for(int i=0;i<hallit.size();i++){
				out.print("\n<tr>");
				out.print("<td>" + hallit.get(i).getHalli_id() + "</td>");
				out.print("<td>" + hallit.get(i).getNimi() + "</td>");
				out.print("<td>" + hallit.get(i).getOsoite()+ "</td>");	
				out.print("<td>");
				out.print("\n<img src='images/modify.png' class='icon muokkaa' id='muokkaa_"+hallit.get(i).getHalli_id()+"' name='"+hallit.get(i).getNimi()+" "+hallit.get(i).getOsoite()+"' title='Muokkaa'>");
				out.print("\n<img src='images/delete.png' class='icon poista' id='poista_"+hallit.get(i).getHalli_id()+"' name='"+hallit.get(i).getNimi()+" "+hallit.get(i).getOsoite()+"' title='Poista'>");
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
		
	$("#hakuAlue").css({
		"width": "210px", 
		"border-radius": "15px"
	});
	
	$("#tulosAlue").css({
		"width": "400px", 
		"border-radius": "15px"
	});	
	
	$("#uusiHalli").click(function(){
		document.location="uusihalli.jsp";	
	});	
	
	$("#haeHalli").click(function(){
		document.location=encodeURI("Servlet_HaeHallit?hakusana=" + $("#hakuSana").val());	
	});
	
	$(".muokkaa").click(function(){
		//Objektin ominaisuuksien ja arvojen läpikäynti (ei tarvita tässä tapauksessa, vain esimerkkinä)
		/*
		var obj = $(this)[0]; 	
		for(var key in obj) {
			console.log('key: ' + key + '\n' + 'value: ' + obj[key]);
		}
		*/	
		document.location="Servlet_MuokkaaHalli?halli_id=" + $(this)[0].id;	
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
		document.location="Servlet_PoistaHalli?halli_id="+poistettava_id;
	});
	
	$("#peruutaPoisto").click(function(){
		$("#poistonVahvistus").hide();
	});
	
	
});
</script>
</body>
</html>