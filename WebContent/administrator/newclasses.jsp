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
<title>eDziekanat - Administrator - Strona g��wna</title>
</head>
<body>
	<div id="layout">
		<div id="menu">
			<div class="pure-menu">
				<a class="pure-menu-heading" href="home">eDziekanat</a>
				<ul class="pure-menu-list">
					<li class="pure-menu-item"><a href="admin"
						class="pure-menu-link">Strona g��wna</a></li>
					<li class="pure-menu-item"><a href="admintimetable"
						class="pure-menu-link menu-item-divided">Plan zaj��</a></li>

					<li class="pure-menu-item">
						<form action="admintimetable" method="post">
							<input type="hidden" name="studentsGroupId"
								value="${studentsGroup.id}">
							<button class="linkButton " type="submit">Poka� plan</button>
						</form>
					</li>
					<li class="pure-menu-item"><a class="pure-menu-link" href="#">Zaplanuj
							nowe zaj�cia</a></li>

					<li class="pure-menu-item menu-item-divided"><a
						class="pure-menu-link" href="adminclassrooms">Dost�pno�� sal</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="admincourses">Kierunki</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminstudentgroups">Grupy studenckie</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminlecturers">Wyk�adowcy</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminsubjects">Przedmioty</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminstudents">Studenci</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="marksstatistics">Statystyki</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminscholarships">Stypendia</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminpayments">Nale�no�ci</a></li>
					<li class="pure-menu-item"><a class="pure-menu-link"
						href="adminapplications">Wnioski</a></li>
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
				<h2 class="content-subhead">Nowe zaj�cia dla grupy:
					${studentsGroup.id} kierunek: ${studentsGroup.course.name }</h2>
				<center>
					<form class="pure-form pure-form-stacked" action="addnewclasses"
						method=post>
						<fieldset>

							<label for="sg">Grupa studencka </label> <input id="sg"
								type="text" name="nothing" class="pure-input-1-2"
								style="width: 50%"
								value="grupa: ${studentsGroup.id} kierunek: ${studentsGroup.course.name }"
								disabled> <label for="state">Przedmiot </label> <select
								name="subjectId" style="width: 50%" id="state">
								<c:forEach items="${subjects}" var="subject">
									<option value="${subject.id}">${subject.name}</option>
								</c:forEach>
							</select> <label for="classstate">Sala </label> <select style="width: 50%"
								name="classroomId" id="classstate">
								<c:forEach items="${classrooms}" var="classroom">
									<option value="${classroom.id}">Nr:
										${classroom.number} typ: ${classroom.type }</option>
								</c:forEach>
							</select> <label for="startDate">Data rozpocz�cia </label> <input
								id="startDate" type="date" name="startDate" required> 
								<label for="startTime">Godzina rozpocz�cia</label>
							<select style="width:188px" name="startTime" id="startTime">
										<option value="0">7:30</option>
										<option value="1">9:15</option>
										<option value="2">11:00</option>
										<option value="3">12:45</option>
										<option value="4">14:30</option>
										<option value="5">16:15</option>
										<option value="6">18:00</option>
										<option value="7">19:45</option>
								</select>
							<label for="repeat">Powtarzaj </label>
								 <select style="width:188px" name="repeat" id="repeat">
										<option value="0">Nie powtarzaj</option>
										<option value="1">Co tydzie�</option>
										<option value="2">Co dwa tygodnie</option>
								</select>
							<label for="endDate">Data zako�czenia </label>
							<input id="endDate" type="date" name="endDate">
						</fieldset>

						<button type="submit"
							class="pure-button pure-input-1-2 pure-button-primary">Wy�lij</button>
					</form>

				</center>
			</div>
		</div>
	</div>
</body>
</html>