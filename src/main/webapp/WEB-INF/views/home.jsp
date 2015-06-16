<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<P>  Character Encoding is ${pageContext['response']['characterEncoding']}. </P>
<P>  Character Encoding is ${pageContext.response.characterEncoding}. </P>
<P>  Status is ${pageContext.response['status']}. </P>
<P>  2 </P>
</body>
</html>
