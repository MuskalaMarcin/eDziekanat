<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet" href="resources/pure-min.css">
<link rel="stylesheet" href="resources/styles.css">
<title>eDziekanat - Skrzynka odbiorcza</title>
</head>
<body>
	<div id="layout">
		<div id="menu">
			<div class="pure-menu">
				<a class="pure-menu-heading" href="home">eDziekanat</a>
				<ul class="pure-menu-list">
					<li class="pure-menu-item"><a href="student"
						class="pure-menu-link">Strona g��wna</a></li>
					<li class="pure-menu-item"><a href="studenttranscript"
						class="pure-menu-link">Indeks</a></li>
					<li class="pure-menu-item"><a href="timetable"
						class="pure-menu-link">Plan zaj��</a></li>
					<li class="pure-menu-item"><a href="studentsubjects"
						class="pure-menu-link">Moje przedmioty</a></li>
					<li class="pure-menu-item"><a href="studentscholarships"
						class="pure-menu-link">Stypendia</a></li>
					<li class="pure-menu-item"><a href="studentwaitingpayments"
						class="pure-menu-link ">P�atno�ci</a></li>
					<li class="pure-menu-item"><a href="studentapplications"
						class="pure-menu-link">Wnioski</a></li>
					<li class="pure-menu-item"><a href="studentlecturers"
						class="pure-menu-link">Wyk�adowcy</a></li>
					<li class="pure-menu-item menu-item-divided"><a href="#"
						class="pure-menu-link">Historia komunikat�w</a></li>
					<li class="pure-menu-item pure-menu-selected"><a
						href="receivedmessages" class="pure-menu-link">Skrzynka
							odbiorcza</a></li>
					<li class="pure-menu-item"><a href="sentmessages"
						class="pure-menu-link">Skrzynka nadawcza</a></li>
					<li class="pure-menu-item   menu-item-divided"><a
						href="logout" class="pure-menu-link">Wyloguj</a>
				</ul>
			</div>
		</div>
		<div id="main">
			<div class="header">
				<h1>eDziekanat</h1>
				<h2>Tw�j wirtualny dziekanat.</h2>
			</div>
			<div class="content">
				<h2 class="content-subhead">Skrzynka odbiorcza:</h2>
				<c:choose>
					<c:when test="${empty receivedMessages}">
						<p>Skrzynka odbiorcza jest pusta.</p>
					</c:when>
					<c:otherwise>
						<table class="responseTable">
							<c:forEach items="${receivedMessages}" var="msg"
								varStatus="varStatus">
								<tr class="grayRow">
									<td id="respond">
										<form action="student/newmessage" method=post>
											<input type="hidden" name="receiverLogin"
												value="${msg.sender.login}"> <input type="hidden"
												name="title" value="${msg.title }"> <input
												class="pure-button pure-input-1-2 pure-button-primary"
												type="submit" value="Odpowiedz">
										</form>
									</td>
									<td colspan="3">Wiadomo�� ${varStatus.index + 1}</td>
								</tr>
								<tr>
									<td>Nadawca:</td>
									<td>${senderNames[varStatus.index]}</td>
									<td>Data nadania:</td>
									<td><fmt:formatDate pattern="dd.MM.yyyy"
											value="${msg.dispatchDate}" /></td>
								</tr>
								<tr>
									<td width="150px">Tytu�:</td>
									<td colspan="3">${msg.title}</td>
								</tr>
								<tr>
									<td>Tre��:</td>
									<td id="content" colspan="3">${msg.content}</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>