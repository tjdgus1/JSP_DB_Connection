<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");

	int id= Integer.parseInt(request.getParameter("id"));
	String sql = "delete from studentF where id="+id;
	
	Statement st = conn.createStatement();
	out.print(sql);
	
	st.execute(sql);
	st.close();
	conn.close();
	response.sendRedirect("sung_list.jsp");
%>