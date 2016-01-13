<%@ page language="java"
	import="edziekanat.databasemodel.dto.MessageDTO, java.util.List"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Student - Wiadomo�ci</title>
</head>
<body>
	<font face="Verdana"><center>
			<font size="7"><b>eDziekanat - Tw�j wirtualny dziekanat</b></font><br>
			<br> <br> <br>

			<table border="1" cellspacing="5" cellpadding="5">
				<tr>
					<td><a href="student">Strona g��wna</a></td>
					<td><a href="studenttranscript">Indeks</a></td>
					<td><a href="studenttimetable">Plan zaj��</a></td>
					<td><a href="studentsubjects">Moje przedmioty</a></td>
					<td><a href="studentscholarships">Stypendia</a></td>
					<td><a href="studentpayments">P�atno�ci</a></td>
					<td><a href="studentapplications">Wnioski</a></td>
					<td><a href="studentlecturers">Wyk�adowcy</a></td>
					<td bgcolor="silver"><a href="messages">Historia
							komunikat�w</a></td>
					<td><a href="logout">Wyloguj</a></td>
				</tr>
			</table>

			<p>
				<font color="red"> TODO: <br> 1. Wy�wietlanie historii
					wys�anych komunikat�w.<br> 2. Wy�wietlanie historii
					przychodz�cych komunikat�w.<br> 3. Mo�liwo�� odpisania na
					przychodz�c� wiadomo��.
				</font>
			</p>
			<%
			    List<MessageDTO> received = (List<MessageDTO>) request.getAttribute("receivedMessages");
			    if (received != null)
			    {
					List<String> receiverNames = (List<String>) request.getAttribute("senderNames");
			%>
			<p>
			Skrzynka odbiorcza:
			<table border="1">
				<%
				    for (int i = 0; i < received.size(); i++)
						{
						    MessageDTO rcvd = received.get(i);
				%>
				<tr>
					<td colspan="2">Wiadomo�� numer: <%
					    out.print(i + 1);
					%></td>
				</tr>
				<tr>
					<td>Tytu�:</td>
					<td>
						<%
						    out.print(rcvd.getTitle());
						%>
					</td>
				</tr>
				<tr>
					<td>Nadawca:</td>
					<td>
						<%
						    out.print(receiverNames.get(i));
						%>
					</td>
				</tr>
				<tr>
					<td>Data nadania:</td>
					<td>
						<%
						    out.print(rcvd.getDispatchDate());
						%>
					</td>
				</tr>
				<tr>
					<td>Tre��:</td>
					<td>
						<%
						    out.print(rcvd.getContent());
						%>
					</td>
				</tr>
				<%
				    }
				%>
			</table>
			<%
			    }
			    List<MessageDTO> sent = (List<MessageDTO>) request.getAttribute("sentMessages");
			    if (sent != null)
			    {
					List<String> senderNames = (List<String>) request.getAttribute("receiverNames");
			%>
			<p>
			Skrzynka nadawcza:
			<table border="1">
				<%
				    for (int i = 0; i < received.size(); i++)
						{
						    MessageDTO snd = sent.get(i);
				%>
				<tr>
					<td colspan="2">Wiadomo�� numer: <%
					    out.print(i + 1);
					%></td>
				</tr>
				<tr>
					<td>Tytu�:</td>
					<td>
						<%
						    out.print(snd.getTitle());
						%>
					</td>
				</tr>
				<tr>
					<td>Nadawca:</td>
					<td>
						<%
						    out.print(senderNames.get(i));
						%>
					</td>
				</tr>
				<tr>
					<td>Data nadania:</td>
					<td>
						<%
						    out.print(snd.getDispatchDate());
						%>
					</td>
				</tr>
				<tr>
					<td>Data Odczytu:</td>
					<td>
						<%
						    out.print(snd.getReceiveDate() != null ? snd.getReceiveDate() : "Nie odczytano.");
						%>
					</td>
				</tr>
				<tr>
					<td>Tre��:</td>
					<td>
						<%
						    out.print(snd.getContent());
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