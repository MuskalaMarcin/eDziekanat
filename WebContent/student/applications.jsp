<%@ page language="java"
	import="edziekanat.databasemodel.dto.ApplicationDTO, java.util.List"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Student - Wnioski</title>
</head>
<body>
	<font face="Verdana"><center>
			<font size="7"><b>eDziekanat - Tw�j wirtualny dziekanat</b></font><br>
			<br>
			<br>
			<br>

			<table border="1" cellspacing="5" cellpadding="5">
				<tr>
					<td><a href="student">Strona g��wna</a></td>
					<td><a href="studenttranscript">Indeks</a></td>
					<td><a href="studenttimetable">Plan zaj��</a></td>
					<td><a href="studentsubjects">Moje przedmioty</a></td>
					<td><a href="studentscholarships">Stypendia</a></td>
					<td><a href="studentpayments">P�atno�ci</a></td>
					<td bgcolor="silver"><a href="studentapplications">Wnioski</a></td>
					<td><a href="studentlecturers">Wyk�adowcy</a></td>
					<td><a href="messages">Historia komunikat�w</a></td>
					<td><a href="logout">Wyloguj</a></td>
				</tr>
			</table>

			<p>
				<font color="red"> TODO: <br> 1. Wy�wietlanie informacji
					o wys�anych wnioskach ��cznie z info czy jest przyj�ty i kiedy<br>
					2. Kontakt do administratora kt�ry si� nim zajmowa�.
				</font>
			</p>

			<%
			    List<ApplicationDTO> applications = (List<ApplicationDTO>) request.getAttribute("ownapplications");

			    if (applications != null)
			    {
			%>
			<p>Wnioski:
			<table border="1">
				<%
				    for (int i = 0; i < applications.size(); i++)
						{
						    ApplicationDTO apps = applications.get(i);
				%>
				<tr>
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
				    }
				%>
			</table>

			<%
			    }
			%>

		</center></font>
</body>
</html>