<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<script type="text/javascript">
<%-- This function verifies that the passwords match --%>
function verify(){
	if(document.regForm.password.value != document.regForm.verifyPassword.value){
		document.getElementById("invalid").innerHTML="Passwords did not match!";
		return false;
	}

}
</script>
<body>
<center>
Welcome to the Airways
<p id="invalid"> </p>
<%-- Form submits to Registration servlet after verifying passwords match through verify function --%>
<form name="regForm" action="Registration" onSubmit="return verify()" method="post"> Username: <input type="text" name="user">
<br> Password: <input type="password" name="password"> 
<br> Verify Password: <input type="password" name="verifyPassword"> <br>
<br> Email: <input type="text" name="email">
<br> Date of Birth: <input type="date" name="dob">
<input type="submit" value="Register"> </form>
</center>
<a href="login.jsp">Back</a>
</body>
</html>