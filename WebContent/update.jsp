<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*, com.hb.util.MyOra"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="bean" class="com.hb.bean.GuestDto"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>

<%
	String sql="update guest02 set name=?, nalja=sysdate, pay=? where sabun=?";
	Connection conn=MyOra.getConnection();
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bean.getName());
	pstmt.setInt(2, bean.getPay());
	pstmt.setInt(3,bean.getSabun());
	
	int cnt=pstmt.executeUpdate();
	if(pstmt!=null)pstmt.close(); 
	if(conn!=null)conn.close();
	
	
	String path="edit.jsp";
	if(cnt>0)path="detail.jsp";	

%>
	<jsp:forward page="index.jsp">
		<jsp:param value="<%=path %>" name="url"/>
	</jsp:forward>
	


</body>
</html>