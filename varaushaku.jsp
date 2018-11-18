<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>





 String bufDt =  bDOB.getText();  //data from form
     DateFormat dF = new SimpleDateFormat("dd-MM-yyyy"); //data in form is in this format
     Date bbdt = (Date)dF.parse(bufDt);  // string data is converted into java util date
     DateFormat dsF = new SimpleDateFormat("yyyy-MM-dd"); //converted date is reformatted for conversion to sql.date
     String ndt = dsF.format(bbdt); // java util date is converted to compatible java sql date
     java.sql.Date sqlDate=  java.sql.Date.valueOf(ndt);  // finally data from the form is convered to java sql. date for placing in database