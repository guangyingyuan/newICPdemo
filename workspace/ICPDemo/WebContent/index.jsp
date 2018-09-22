<!DOCTYPE html>
<html lang="en">
<%@page import="com.javahelps.helloworld.Person"%>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
</head>
<body>
	<% 
		Person person = new Person();
		person.setName("Tom");
		out.print("<h1>Welcome " + person.getName() + "</h1>");
	%>
	<p>
	<a href="#">Click Here</a>
</body>
</html>