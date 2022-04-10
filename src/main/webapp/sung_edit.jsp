<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/first";
	Connection conn=DriverManager.getConnection(db, "root", "1111");
	
	int id=Integer.parseInt(request.getParameter("id"));
	
	String sql = "select * from studentF where id="+id;
	
	Statement st = conn.createStatement();
	
	ResultSet rs = st.executeQuery(sql);
	
	rs.next();
	
	
%>
<form action="sung_edit_ok.jsp" method="get">
<table width="500" align="center">
	<tr>
	 	<td>학번</td>
	 	<td><%=rs.getString("hakbun")%></td>
	</tr>
	<tr>
	 	<td>이름</td>
	 	<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
	</tr>
	<tr>
	 	<td>국어</td>
	 	<td><input type="text" name="kor" value="<%=rs.getInt("kor")%>"></td>
	</tr>
	<tr>
	 	<td>영어</td>
	 	<td><input type="text" name="eng" value="<%=rs.getInt("eng")%>"></td>
	</tr>
	<tr>
	 	<td>수학</td>
	 	<td><input type="text" name="mat" value="<%=rs.getInt("mat")%>">
	 		<input type="hidden" name="id" value="<%=id%>">
	 	</td>
	</tr>
	<tr>
	 	<td colspan="2" align="center">
	 		<input type="submit" value="수정하기">
	 	</td>
	</tr>
</table>
</body>
</html>