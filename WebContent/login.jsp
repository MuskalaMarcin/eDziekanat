<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
<title>eDziekanat - Zaloguj si�</title>
</head>
<body>
Zaloguj si�
	<form action="j_security_check" method=post>
    	<p><strong>Please Enter Your User Name: </strong>
    	<input type="text" name="j_username" size="25">
    	<p><p><strong>Please Enter Your Password: </strong>
    	<input type="password" size="15" name="j_password">
    	<p><p>
    	<input type="submit" value="Submit">
    <input type="reset" value="Reset">
</form>
</body>
</html>