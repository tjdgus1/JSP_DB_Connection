<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function ok(url){
		
		location.href=url;
	}
</script>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db ="jdbc:mysql://localhost:3306/first";
	Connection conn=  DriverManager.getConnection(db, "root", "1111");
	
	String sql = "select * from studentF";
	
	Statement st = conn.createStatement();
	
	ResultSet rs = st.executeQuery(sql);
	/* 
	Statement는 DB에서 넘어오는 컬럼, 자바에서는 전송 객체의 멤버 변수명을 파라미터에값에 직접 넣어주고 실행한다.
	PreparedStatement는 컬럼, 자바에서는 전송 객체의 멤버 변수명을 직접 넣지 않고,'?'로 작성하여 '?' 위치 순번을 지정하여 실행한다.
	*/
	
	rs.afterLast(); ///rs의 위치를 가장 마지막 데이터 뒤쪽으로 보내서 뒤쪽부터 출력하는게 가능하게 한다.
	
%>
<table width="500" border="1">
	<tr>
	 	<td colspan="5" align="right">
	 	    <input type="button" value="글쓰기" onClick="ok('sung_write.jsp')"></td>
	</tr>
	<tr>
	 	<td>학번</td>
	 	<td>이름</td>
	 	<td>국어</td>
	 	<td>영어</td>
	 	<td>수학</td>
	 	<td>수정</td>
	 	<td>삭제</td>
	 	
	</tr>
<%
 while(rs.previous()){
	//rs.next()메소드의 경우 아래 있는 데이터를 찾아 가는거지만
	//rs.previous()메소드의 경우 위에 있는 데이터를 가리킨다.
	
%>
	<tr>
	 	<td><%=rs.getInt("hakbun")%></td>
	 	<td><%=rs.getString("name")%></td>
	 	<td><%=rs.getInt("kor")%></td>
	 	<td><%=rs.getInt("eng")%></td>
	 	<td><%=rs.getInt("mat")%></td>
	 	<td><input type="button" value="수정" onClick="ok('sung_edit.jsp?id=<%=rs.getInt("id")%>')"></td>
	 	<td><input type="button" value="삭제" onClick="ok('sung_del.jsp?id=<%=rs.getInt("id")%>')"></td>
	</tr>
<%
}%>
</table>
</body>
</html>