<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	
	//sql쿼리
	String sql = "update studentF set  name=?, kor=?, eng=?, mat=? where id=?";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("kor"));
	pstmt.setString(3, request.getParameter("eng"));
	pstmt.setString(4, request.getParameter("mat"));
	pstmt.setString(5, request.getParameter("id"));
	
	pstmt.executeUpdate();
	
	
	//닫기
	pstmt.close();
	conn.close();
	
	//이동
	response.sendRedirect("sung_list.jsp");

%>