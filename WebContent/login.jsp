<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Zaloguj si�</title>
</head>
<body>
	<center><font size="3px" face="Verdana">
	<p><font size="7"><b>eDziekanat - Tw�j wirtualny dziekanat</b></font><br><br><br><br><br><br></p>
	<p>Zaloguj si� do systemu, aby uzyska� dost�p do swoich danych.<br><br></p>
	<form action="loginaction" method=post>
		<p><b>Login: </b> <input type="text" name="username" size="25"></p>
		<p><b>Has�o: </b> <input type="password" size="25"
				name="password">
			<%
			    if (request.getSession().getAttribute("loginError") != null
					    && request.getSession().getAttribute("loginError").equals("true"))
			    {
					out.print("<p><font color='red'><b>B��dny login lub has�o, spr�buj ponownie.</b></font></p>");
					request.getSession().invalidate();
			    }
			%>
		</p>
		<p><input type="submit" value="Zaloguj"></p>
	</form>
	</font>
	</center>
	<%
	    request.getSession().setAttribute("backURL", request.getAttribute("javax.servlet.forward.request_uri"));
	%>
</body>
</html>