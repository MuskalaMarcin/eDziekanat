<%@ page language="java"
	import="edziekanat.databasemodel.dao.UserDAO, edziekanat.databasemodel.dto.UserDTO"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet"
	href="http://localhost:8080/eDziekanat/resources/pure-min.css">
<link rel="stylesheet"
	href="http://localhost:8080/eDziekanat/resources/styles.css">
<title>eDziekanat - Nowa Wiadomo��</title>
</head>
<body>
	<div id="layout">
		<div id="menu">
			<div class="pure-menu">
				<a class="pure-menu-heading" href="home">eDziekanat</a>
				<ul class="pure-menu-list">
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/student"
						class="pure-menu-link">Strona g��wna</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studenttranscript"
						class="pure-menu-link">Indeks</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/timetable"
						class="pure-menu-link">Plan zaj��</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studentsubjects"
						class="pure-menu-link">Moje przedmioty</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studentscholarships"
						class="pure-menu-link">Stypendia</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studentwaitingpayments"
						class="pure-menu-link">P�atno�ci</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studentapplications"
						class="pure-menu-link">Wnioski</a></li>
					<li class="pure-menu-item"><a
						href="http://localhost:8080/eDziekanat/studentlecturers"
						class="pure-menu-link">Wyk�adowcy</a></li>
					<li class="pure-menu-item menu-item-divided"><a
						href="http://localhost:8080/eDziekanat/receivedmessages"
						class="pure-menu-link">Historia komunikat�w</a></li>
					<li class="pure-menu-item  pure-menu-selected"><a href="#"
						class="pure-menu-link">Nowa wiadomo��</a></li>
					<li class="pure-menu-item menu-item-divided"><a
						href="http://localhost:8080/eDziekanat/logout"
						class="pure-menu-link">Wyloguj</a>
				</ul>
			</div>
		</div>
		<div id="main">
			<div class="header">
				<h1>eDziekanat</h1>
				<h2>Tw�j wirtualny dziekanat.</h2>
			</div>
			<div class="content">
				<h2 class="content-subhead">Wy�lij now� wiadomo��:</h2>
				<p>
				<p>
					<%
					    String name = "Error";
					    UserDTO receiver = new UserDAO().getEntity(request.getParameter("receiverLogin"));
					    if (receiver.getUserRole().equals("admin"))
					    {
							name = receiver.getAdministrator().getName() + " " + receiver.getAdministrator().getSurname();
					    }
					    else if (receiver.getUserRole().equals("student"))
					    {
							name = receiver.getStudent().getName() + " " + receiver.getStudent().getSurname();
					    }
					    else if (receiver.getUserRole().equals("lecturer"))
					    {
							name = receiver.getLecturer().getName() + " " + receiver.getLecturer().getSurname();
					    }
					%>
				
				<center>
					<form action="http://localhost:8080/eDziekanat/sendmessage"
						method=post class="pure-form">
						<fieldset class="pure-group">
							<input type="text" name="msgtitle" class="pure-input-1-2"
								placeholder="Tytu�"
								value="<%out.print(request.getParameter("title") == null ? "" : "RE:" + request.getParameter("title"));%>"
								required> <input type="text" name="receivername"
								class="pure-input-1-2" placeholder="Odbiorca"
								value="<%out.print(name);%>" disabled>
						</fieldset>

						<fieldset class="pure-group">
							<textarea name="content" class="pure-input-1-2"
								placeholder="Tre��" required></textarea>
						</fieldset>

						<input type="hidden" name="msgreceiver"
							value="<%out.print(receiver.getLogin());%>">
						<button type="submit"
							class="pure-button pure-input-1-2 pure-button-primary">Wy�lij</button>
					</form>
				</center>
			</div>
		</div>
	</div>
</body>
</html>