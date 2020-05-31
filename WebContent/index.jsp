<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "livres";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Livres</title>
</head>
<body>
	<h1>Liste des livres</h1>
		<table>
		<tr>
			<th>Description</th>
			<th class="right">Prix</th>
			<th>&nbsp;</th>
		</tr>
	
	<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from livre";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("description") %></td>
<td class="right"><%=resultSet.getString("prix") %></td>
<td>
				<form action="cart" method="post">
					<input type="hidden" name="productCode" value=<%=resultSet.getString("code") %>>
					 <input
						type="submit" value="Add To Cart">
				</form>
			</td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</table>
	
	
	
	

</body>
</html>