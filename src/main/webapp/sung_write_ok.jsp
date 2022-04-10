<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	
//폼의 값을 request(받아온다) 	
	request.setCharacterEncoding("utf-8");
	String hakbun = request.getParameter("hakbun");
	String name= request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");

	
	/* //쿼리문.
	String sql ="";
	sql = "insert into studentF(hakbun, name, kor, eng, mat) ";
	sql += "values(?, ?, ?, ?, ?)";
		
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, hakbun);
	pstmt.setString(2, name);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, mat);
	
	pstmt.execute(); */
	
	String sql = "insert into studentF(hakbun, name, kor, eng, mat) values('"+hakbun+"', '"+name+"', "+kor+", "+eng+", "+mat+")";
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);

	response.sendRedirect("sung_list.jsp");
	//pstmt.close();
	conn.close();
%>