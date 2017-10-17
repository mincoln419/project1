<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import ="java.sql.*, com.hb.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<jsp:useBean id="bean" class="com.hb.bean.GuestDto"></jsp:useBean>
<jsp:setProperty property="sabun" name="bean"/>
<h1><%=bean.getSabun()%>님의 상세 페이지</h1>
<%
	String sql="select * from guest02 where sabun=?";		

	Connection conn=MyOra.getConnection();
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, bean.getSabun());
	ResultSet rs=pstmt.executeQuery();
	String sabun="";
	String nalja="";
	String pay="";
	
	if(rs.next()){		
		bean.setName(rs.getString("name"));		
		bean.setNalja(rs.getDate("nalja"));
		bean.setPay(rs.getInt("pay"));
	}
	if(rs!=null)rs.close();
	if(pstmt!=null)pstmt.close();
	if(conn!=null)conn.close();
%>
	<table>
		<tr>
		<td>사번</td>
		<td><jsp:getProperty property="sabun" name="bean"/>
		</td>
		</tr>
	
		<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="bean"/>
		</td>	
		</tr>
		
		<tr>
		<td>날짜</td>
		<td><jsp:getProperty property="nalja" name="bean"/>
		</td>	
		</tr>
		
		<tr>
		<td>금액</td>
		<td><jsp:getProperty property="pay" name="bean"/>
		</td>	
		</tr>
		
		
		
	</table>

	<a href="index.jsp?url=edit&sabun=<%=%>
	">
	
	
	
	</a>


</body>
</html>