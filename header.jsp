<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script><!-- datepickeriä varten -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"><!-- datepickeriä varten -->
<link rel="stylesheet" type="text/css" href="varausjarjestelma.css">
<title>Varausjärjestelmä</title>
<style>
label{
    display:inline-block;
    width:120px;
    text-align:right;
    vertical-align:top;
}
label.error {
	width:80px;	
    color: red; 
    text-align:left;  
}
.lbl_min{
    display:inline-block;
    width:120px;
    text-align:right;
    vertical-align:top;
    background-color: "white";	
}
.header_icon{
	height:50px;
}
.icon{
	height:30px;
}
.icon_mini{
	height:20px;
	vertical-align:bottom;
}
</style>
</head>

<body>
<div class="ylapalkki">
<a href="index.jsp">Etusivu</a>
<a href="asiakashaku.jsp">Asiakkaat</a>
<a href="haevaraushallit.jsp">Varaukset</a>
<a href="hallihaku.jsp">Hallit</a>
<a href="lajihaku.jsp">Lajit</a>&nbsp;
</div>
<!--
<img src="images/home.png" class="header_icon" title="Kotiin" onclick="document.location='index.jsp'">
<img src="images/user.png" class="header_icon" title="Asiakastiedot" onclick="document.location='asiakashaku.jsp'">
<img src="images/boat.png" class="header_icon" title="Varaukset" onclick="document.location='varaushaku.jsp'">
<img src="images/boat.png" class="header_icon" title="Lajit" onclick="document.location='lajihaku.jsp'">
<img src="images/boat.png" class="header_icon" title="Tunnit" onclick="document.location='haetunnit.jsp'">
<img src="images/user.png" class="header_icon" title="Varaushallitiedot" onclick="document.location='haevaraushallit.jsp'">
<img src="images/user.png" class="header_icon" title="Hallitiedot" onclick="document.location='hallihaku.jsp'">&nbsp;
  -->
<hr>
