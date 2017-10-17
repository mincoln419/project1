<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>입력페이지</h1>
		<form action="insert.jsp">
			<p>사번
			<input type="text" name="sabun">
			
			</p>
			<p>이름
			<input type="text" name="name">
			</p>
			<p>금액
			<input type="text" name="pay">
			</p>
			
			<p>
			<input type="submit" value="입력">
			<input type="reset" value="취소">
			</p>
		
		</form>


</body>
</html>