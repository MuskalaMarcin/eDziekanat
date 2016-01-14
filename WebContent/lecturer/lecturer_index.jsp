<%@ page language="java" import="edziekanat.bean.LoginBean"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet" href="resources/pure-min.css">
<link rel="stylesheet" href="resources/styles.css">
<title>eDziekanat - Wyk�adowca - Strona g��wna</title>
</head>
<body>
	<div id="layout">
		<div id="menu">
			<div class="pure-menu">
				<a class="pure-menu-heading" href="home">eDziekanat</a>
				<ul class="pure-menu-list">
					<li class="pure-menu-item pure-menu-selected"><a
						class="pure-menu-link" href="lecturer">Strona g��wna</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerlearningmaterials">Materia�y dydaktyczne</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerseestudents">Studenci</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerseelecturers">Wyk�adowcy</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerclassrooms">Dost�pno�� sal</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturertimetable">Plan zaj��</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturersubjects">Moje przedmioty</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="messages">Historia komunikat�w</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="logout">Wyloguj</a></li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div class="header">
				<h1>eDziekanat</h1>
				<h2>Tw�j wirtualny dziekanat.</h2>
			</div>
			<div class="content">
				<h2 class="content-subhead">Zalogowano jako:</h2>
				<p>
					<%
					    LoginBean loginBean = (LoginBean) request.getSession().getAttribute("loginBean");
					%>
					Login: <b> <%
     out.print(loginBean.getLogin());
 %>
					</b><br> Imi� i nazwisko: <b> <%
     out.print(loginBean.getName());
 %> <%
     out.print(loginBean.getSurname());
 %>
					</b><br> Stopie� naukowy: <b> <%
     out.print(loginBean.getAcademicDegree());
 %>
					</b><br> E-mail: <b> <%
     out.print(loginBean.geteMail());
 %>
					</b><br> Poziom uprawnie�: <b> <%
     out.print(loginBean.getUserRole());
 %>
					</b><br> Adres: <b> <%
     out.print(loginBean.getAddress());
 %>
					</b><br>
				</p>
			</div>
		</div>
	</div>
</body>
</html>