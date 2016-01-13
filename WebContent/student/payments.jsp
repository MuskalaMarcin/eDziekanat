<%@ page language="java" 
	import="edziekanat.databasemodel.dto.PaymentDTO, java.util.List"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Student - P�atno�ci</title>
</head>
<body>
	<font face="Verdana"><center>
		<font size="7"><b>eDziekanat - Tw�j wirtualny dziekanat</b></font><br><br><br><br>
	
		<table border="1" cellspacing="5" cellpadding="5">
			<tr>
				<td><a href="student">Strona g��wna</a></td>
				<td><a href="studenttranscript">Indeks</a></td>
				<td><a href="studenttimetable">Plan zaj��</a></td>
				<td><a href="studentsubjects">Moje przedmioty</a></td>
				<td><a href="studentscholarships">Stypendia</a></td>
				<td bgcolor="silver"><a href="studentpayments">P�atno�ci</a></td>
				<td><a href="studentapplications">Wnioski</a></td>
				<td><a href="studentlecturers">Wyk�adowcy</a></td>
				<td><a href="messages">Historia komunikat�w</a></td>
				<td><a href="logout">Wyloguj</a></td>
			</tr>
		</table>
		
		<p>
			<font color="red">
				TODO: <br>
				1. Wy�wietlanie historii p�atno�ci<br>
				2. Wy�wietlanie aktualnie oczekuj�cych na p�atno�ci<br>
				3. W przypadku oczekuj�cych mo�liwo�� kontaktu z administratorem.
			</font>
		</p>
		<%
			    List<PaymentDTO> payments = (List<PaymentDTO>) request.getAttribute("ownpayments");
			    
				if (payments != null)
			    {
			%>
			<p>P�atno�ci:
			<table border="1">
				<%
				    for (int i = 0; i < payments.size(); i++)
						{
							PaymentDTO pmnts = payments.get(i);
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
						    out.print(pmnts.getTitle());
						%>
					</td>
				</tr>
				<tr>
					<td>Opis:</td>
					<td>
						<%
						    out.print(pmnts.getDescription());
						%>
					</td>
				</tr>
				<tr>
					<td>Kwota:</td>
					<td>
						<%
						    out.print(pmnts.getAmount());
						%>
					</td>
				</tr>
				<tr>
					<td>Data polecenia zap�aty:</td>
					<td>
						<%
						    out.print(pmnts.getIssueDate());
						%>
					</td>
				</tr>
				<tr>
					<td>Data p�atno�ci:</td>
					<td>
						<%
						    out.print(pmnts.getPaymentDate());
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