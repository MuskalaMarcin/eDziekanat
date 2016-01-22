<%@ page language="java"
	import="edziekanat.databasemodel.dto.ApplicationDTO, java.util.List"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet" href="resources/pure-min.css">
<link rel="stylesheet" href="resources/styles.css">
<title>eDziekanat - Student - Wnioski</title>
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
					<li class="pure-menu-item"><a href="studenttimetable"
						class="pure-menu-link">Plan zaj��</a></li>
					<li class="pure-menu-item"><a href="studentsubjects"
						class="pure-menu-link">Moje przedmioty</a></li>
					<li class="pure-menu-item"><a href="studentscholarships"
						class="pure-menu-link">Stypendia</a></li>
					<li class="pure-menu-item"><a href="studentpayments"
						class="pure-menu-link">P�atno�ci</a></li>
					<li class="pure-menu-item menu-item-divided"><a href="#"
						class="pure-menu-link">Wnioski</a></li>
					<li class="pure-menu-item pure-menu-selected"><a
						href="studentapplications" class="pure-menu-link">Wnioski
							rozpatrzone </a></li>
					<li class="pure-menu-item"><a href="studentwaitingapplications"
						class="pure-menu-link">Wnioski nierozpatrzone</a></li>
						<li class="pure-menu-item"><a href="studentnewapplication"
						class="pure-menu-link">Nowy wniosek</a></li>
					<li class="pure-menu-item   menu-item-divided">
					<li class="pure-menu-item"><a href="studentlecturers"
						class="pure-menu-link">Wyk�adowcy</a></li>
					<li class="pure-menu-item"><a href="receivedmessages"
						class="pure-menu-link">Historia komunikat�w</a></li>
					<li class="pure-menu-item"><a href="logout"
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
				<h2 class="content-subhead">Wnioski:</h2>
				<p>
				<p>
					<font color="red"> TODO: <br> 1. Wy�wietlanie
						informacji o wys�anych wnioskach ��cznie z info czy jest przyj�ty
						i kiedy<br> 2. Kontakt do administratora kt�ry si� nim
						zajmowa�.
					</font>
				</p>
				<p>
					<%
					    List<ApplicationDTO> applications = (List<ApplicationDTO>) request.getAttribute("ownapplications");
					%>
				</p>
				<%
				    if (applications != null)
				    {
				%>
				<p>
				<table class="responseTable">
					<%
					    for (int i = 0; i < applications.size(); i++)
							{
							    ApplicationDTO apps = applications.get(i);
					%>
					<tr class="grayRow">
						<td colspan="2">Nr: <%
						    out.print(i + 1);
						%></td>
					</tr>
					<tr>
						<td>Tytu�:</td>
						<td>
							<%
							    out.print(apps.getTitle());
							%>
						</td>
					</tr>
					<tr>
						<td>Tre�� wniosku:</td>
						<td>
							<%
							    out.print(apps.getContent());
							%>
						</td>
					</tr>
					<tr>
						<td>Data z�o�enia:</td>
						<td>
							<%
							    out.print(apps.getDispatchDate());
							%>
						</td>
					</tr>
					<tr>
						<td>Status:</td>
						<td>
							<%
							    out.print(apps.getStatus());
							%>
						</td>
					</tr>
					<%
					    if (apps.getStatus().equalsIgnoreCase("Odrzucony"))
							    {
					%>
					<tr>
						<td colspan="2">
							<form action="student/newmessage" method=post>
								<input type="hidden" name="receiverLogin"
									value="<%out.print(apps.getAdministrator().getUser().getLogin());%>">
								<input type="hidden" name="title"
									value="<%out.print(apps.getTitle());%>"> <input
									type="submit" value="Odpowiedz">
							</form>
						</td>
					</tr>
					<%
					    }
					%>
					<%
					    }
					%>
				</table>

				<%
				    }
				%>
				</p>
			</div>
		</div>
	</div>
</body>
</html>