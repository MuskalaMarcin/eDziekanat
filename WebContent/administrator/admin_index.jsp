<%@ page language="java" import="edziekanat.bean.LoginBean"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Administrator - strona g��wna</title>
</head>
<body>
		<font face="Verdana"><center>
		<font size="7"><b>eDziekanat - Tw�j wirtualny dziekanat</b></font><br><br><br><br>
	
		<table border="1" cellspacing="5" cellpadding="5">
			<tr>
				<td bgcolor="silver"><a href="admin">Strona g��wna</a></td>
				<td><a href="admintimetable">Plan zaj��</a></td>
				<td><a href="adminusers">U�ytkownicy</a></td>
				<td><a href="adminlecturers">Wyk�adowcy</a></td>
				<td><a href="adminsubjects">Przedmioty</a></td>
				<td><a href="adminstudents">Studenci</a></td>
				<td><a href="adminbackup">Kopia zapasowa</a></td>
				<td><a href="adminstatistics">Statystyki</a></td>
				<td><a href="adminscholarships">Stypendia</a></td>
				<td><a href="admipayments">Nale�no�ci</a></td>
				<td><a href="adminapplications">Wnioski</a></td>
				<td><a href="messages">Historia komunikat�w</a></td>
				<td><a href="logout">Wyloguj</a></td>
			</tr>
		</table>
		
		<%LoginBean loginBean = (LoginBean) request.getSession().getAttribute("loginBean");%>
		<p>
			<br><br><br>Zalogowany jako:<br><br>
			Login: <b><%out.print(loginBean.getLogin()); %></b><br>
			Imi� i nazwisko: <b><%out.print(loginBean.getName());%> <% out.print(loginBean.getSurname()); %></b><br>
			Stopie� naukowy: <b><%out.print(loginBean.getAcademicDegree()); %></b><br>
			E-mail: <b><%out.print(loginBean.geteMail()); %></b><br>
			Poziom uprawnie�: <b><%out.print(loginBean.getUserRole()); %></b><br>
			Adres: <b><%out.print(loginBean.getAddress()); %></b><br>
		</p>
	</center></font>
</body>
</html>