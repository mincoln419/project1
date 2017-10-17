<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*, com.hb.util.*"
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
	<%
	String url=request.getParameter("url");
	String sabun=request.getParameter("sabun");
	String name=request.getParameter("name");
	String pay=request.getParameter("pay");
	
	if(url==null || "main".equals(url))url="main.jsp";		
	else if("list".equals(url))url="list.jsp";
	else if("add".equals(url))url="add.jsp";
	else if("detail".equals(url))url="detail.jsp";
	else if("edit".equals(url))url="edit.jsp";
	
%>
	
		<!-- header -->
		<tr>
		<td>
			<img alt="logo" src="./img/logo.jpg">
		
		</td>
		
		<!--  menu -->
		<tr>
			<td bgcolor="#cccccc" align="center">
				<a href="index.jsp?url=main">HOME</a>
				<a href="index.jsp?url=list">게시판보기</a>
				<a href="index.jsp?url=add">게시판작성</a>
				<a href="#">etc...</a>			
			
			</td>
		
		</tr>
		<!-- contents -->
		<tr>
			<td>
			<jsp:include page="<%=url%>">
				<jsp:param value="<%=sabun%>" name="sabun"/>
				<jsp:param value="<%=name%>" name="name"/>
				<jsp:param value="<%=pay%>" name="pay"/>
				
			</jsp:include>
				
				
				
			</td>
		
		
		
		</tr>	
		<!-- footer -->		
		<tr>
		<td width="800" height="80" background="./img/footer.gif" colspan="2">
	
		</td>
		
		</tr>
		
		
		
		
	</table>



</body>
</html>
