<%@ page language="java" import="edziekanat.databasemodel.dto.UserDTO,edziekanat.databasemodel.dao.UserDAO" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Wyk�adowca - strona g��wna</title>
</head>
<body>
	Strona g��wna studenta.
	<a href="logout">Wyloguj</a>
		<% 
			UserDTO loginBean = (UserDTO)request.getSession().getAttribute("loginBean");
			System.out.println(loginBean.getLogin());
			System.out.println(loginBean.geteMail());
		%>
</body>
</html>