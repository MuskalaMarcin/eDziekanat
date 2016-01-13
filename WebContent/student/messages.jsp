<%@ page language="java"
	import="edziekanat.databasemodel.dto.MessageDTO, java.util.List, java.util.Date"
	contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<link rel="stylesheet" href="./resources/styles.css">
<title>eDziekanat - Student - Wiadomo�ci</title>
</head>
<body>
	<p id="headertext">eDziekanat - Tw�j wirtualny dziekanat</p>

	<table id="menu">
		<tr>
			<td><a href="student">Strona g��wna</a></td>
			<td><a href="studenttranscript">Indeks</a></td>
			<td><a href="studenttimetable">Plan zaj��</a></td>
			<td><a href="studentsubjects">Moje przedmioty</a></td>
			<td><a href="studentscholarships">Stypendia</a></td>
			<td><a href="studentpayments">P�atno�ci</a></td>
			<td><a href="studentapplications">Wnioski</a></td>
			<td><a href="studentlecturers">Wyk�adowcy</a></td>
			<td id="grayCell"><a href="messages">Historia komunikat�w</a></td>
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
			List<String> senderNames = (List<String>) request.getAttribute("senderNames");
	%>
	<p>Skrzynka odbiorcza:
	<table class="responseTable">
		<%
		    for (int i = 0; i < received.size(); i++)
				{
				    MessageDTO rcvd = received.get(i);
		%>
		<tr>
			<td id="grayCell" colspan="2">Wiadomo�� numer: <%
			    out.print(i + 1);
			%></td>
		</tr>
		<tr>
			<td width="150px">Tytu�:</td>
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
				    out.print(senderNames.get(i));
				%>
			</td>
		</tr>
		<tr>
			<td>Data nadania:</td>
			<td>
				<%
				    Date date = rcvd.getDispatchDate();
						    out.print(date.getDay() + "." + date.getMonth() + "." + (date.getYear() + 1900));
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2">Tre��:</td>
		</tr>
		<tr>
			<td id="content" colspan="2">
				<%
				    out.print(rcvd.getContent());
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2">Odpowiedz</td>
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
			List<String> receiverNames = (List<String>) request.getAttribute("receiverNames");
	%>
	<p>Skrzynka nadawcza:
	<table class="responseTable">
		<%
		    for (int i = 0; i < received.size(); i++)
				{
				    MessageDTO snd = sent.get(i);
		%>
		<tr>
			<td id="grayCell" colspan="2">Wiadomo�� numer: <%
			    out.print(i + 1);
			%></td>
		</tr>
		<tr>
			<td width="150px">Tytu�:</td>
			<td>
				<%
				    out.print(snd.getTitle());
				%>
			</td>
		</tr>
		<tr>
			<td>Odbiorca:</td>
			<td>
				<%
				    out.print(receiverNames.get(i));
				%>
			</td>
		</tr>
		<tr>
			<td>Data wys�ania:</td>
			<td>
				<%
				    Date dateSnd = snd.getDispatchDate();
						    out.print(dateSnd.getDay() + "." + dateSnd.getMonth() + "." + (dateSnd.getYear() + 1900));
				%>
			</td>
		</tr>
		<tr>
			<td>Data dostarczenia:</td>
			<td>
				<%
					if(snd.getReceiveDate()==null)
					{%>
					    Nie dostarczono.
					<% }
					else{
						Date dateRcv = snd.getReceiveDate();
						    out.print(dateRcv.getDay() + "." + dateRcv.getMonth() + "." + (dateRcv.getYear() + 1900));
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2">Tre��:</td>
		</tr>
		<tr>
			<td id="content" colspan="2">
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
</body>
</html>