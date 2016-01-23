<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet" href="resources/pure-min.css">
<link rel="stylesheet" href="resources/styles.css">
<title>eDziekanat - Moje przedmioty</title>
</head>
<body>
	<div id="layout">
		<div id="menu">
			<div class="pure-menu">
				<a class="pure-menu-heading" href="home">eDziekanat</a>
				<ul class="pure-menu-list">
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturer">Strona g��wna</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerlearningmaterials">Materia�y dydaktyczne</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerseestudents">Studenci</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerseelecturers">Wyk�adowcy</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="lecturerclassrooms">Dost�pno�� sal</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="timetable">Plan zaj��</a></li>
					<c:forEach items="${semesterList}" var="semester">
						<li
							class="pure-menu-item <c:if test="${selectedSemester==semester}">pure-menu-selected</c:if>">
							<form action="lecturersubjects" method="post">
								<input type="hidden" name="rqsemester" value="${semester}">
								<button
									class="<c:if test="${selectedSemester==semester}">linkButtonSelected</c:if> linkButton "
									type="submit">Semestr ${semester}</button>
							</form>
						</li>
					</c:forEach>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="receivedmessages">Historia komunikat�w</a></li>
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
				<h2 class="content-subhead">Przedmioty 
				<p>Semestr: ${selectedSemester}</h2>
				<p>
					<c:choose>
						<c:when test="${noSubjects==true}">
					Brak przedmiot�w do wy�wietlenia.
					</c:when>
						<c:otherwise>
							<table class="responseTable">
								<tr class="grayRow">
									<td>Nr</td>
									<td>Nazwa</td>
									<td>ECTS</td>
								</tr>
								<c:forEach items="${subjects}" var="subject"
									varStatus="varStatus">
									<tr>
										<td>${varStatus.index + 1}</td>
										<td>${subject.name}</td>
										<td>${subject.ECTS}</td>
										<td width="75px" id="respond">
											<form action="lecturerseestudents" method=post>
												<input type="hidden" name="semesterList"
													value="${semesterList}"> <input type="hidden"
													name="subjectId" value="${subject.id}"><input
													class="pure-button pure-input-1-2 pure-button-primary"
													type="submit" value="Studenci">
											</form>
										</td>
										<td width="80px" id="respond">
											<form action="lecturerlearningmaterials" method=post>
												<input type="hidden" name="semesterList"
													value="${semesterList}"> <input type="hidden"
													name="subjectId" value="${subject.id}"> <input
													class="pure-button pure-input-1-2 pure-button-primary"
													type="submit" value="Materia�y">
											</form>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
	</div>
</body>
</html>