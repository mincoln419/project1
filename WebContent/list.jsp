<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*, java.sql.*, com.hb.bean.GuestDto, com.hb.util.*"
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<GuestDto> list=new ArrayList<GuestDto>();
String param=request.getParameter("pg");
int pg=1;
if(param!=null){pg=Integer.parseInt(param);}
int plimit=5;
String paramlim=request.getParameter("plimit");
if(paramlim!=null){plimit=Integer.parseInt(paramlim);
	session.setAttribute("plimit", plimit);
}

int pstart=1+(pg-1)*plimit;
int pend=pstart+plimit-1;

String paramKey=request.getParameter("keyword");
if(paramKey==null){
	paramKey="";
}

String sql="select * from";
sql+="(select rownum as rn, sabun, name, nalja, pay from";
sql+="(select sabun, name, nalja, pay from guest02 where name like '%"+paramKey+"%' order by sabun)";
sql+="order by rownum desc) where rn between "+pstart+" and "+pend;


Connection conn=MyOra.getConnection();
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select count(*) as cnt from guest02 where name like '%"+paramKey+"%'");
int tot=0;
if(rs.next()){
	tot=rs.getInt("cnt");
}
if(rs!=null)rs.close();
if(stmt!=null)stmt.close();

stmt=conn.createStatement();
rs=stmt.executeQuery(sql);

while(rs.next()){
		GuestDto bean = new GuestDto();
		bean.setNum(rs.getInt("rn"));
		bean.setSabun(rs.getInt("sabun"));
		bean.setName(rs.getString("name"));
		bean.setNalja(rs.getDate("nalja"));
		bean.setPay(rs.getInt("pay"));
		list.add(bean);
}

if(rs!=null)rs.close();
if(stmt!=null)stmt.close();
if(conn!=null)conn.close();


%>

	<h1>리스트 페이지(tot:<%=tot%>개)</h1>
	<form action="list.jsp">
		<select name="plimit">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="20">20개</option>			
		</select>
		<input type="submit" value="보기">	
		
	</form>
	
	
	
	<table>
	
	<tr>
	<td>글번호</td>
	<td>사번</td>
	<td>이름</td>
	<td>날짜</td>
	<td>금액</td>
		
	</tr>
	
	<%
	for(GuestDto bean:list){
		
	
	%>
	
	<tr>
	<td><%=bean.getNum() %></td>
	<td><%=bean.getSabun() %></td>
	<td>	
	<a href="index.jsp?url=detail&sabun=<%=bean.getSabun()%>"><%=bean.getName() %></a>	
	</td>
	<td><%=bean.getNalja() %></td>
	<td><%=bean.getPay() %></td>
		
	</tr>

	<%} %>
	
	</table>

	
	<form action="list.jsp">
		<p>
		검색<input type="text" name="keyword">
		<input type="submit" value="확인">
		</p>
	
	</form>


	<%	
	int end=0;
	int start=0;
	end=(1+(pg-1)/5)*5;
	start=1+(pg-1)/5*5;
	if(end>(tot-1)/5){
		end=(tot-1)/plimit+1;
	}
	if(pg!=1){
	%>
	<a href="list.jsp?pg=<%=pg-1%>&plimit=<%=plimit%>&paramKey=<%=paramKey%>">[이전]</a>
	<%
	}
	for(int i=start;i<=end;i++){
		%><a href="list.jsp?pg=<%=i%>&plimit=<%=plimit%>&paramKey=<%=paramKey%>">
		<%
		out.print("["+i+"]");%></a>
	<%} %>
	<a href="list.jsp?pg=<%=pg+1%>&plimit=<%=plimit%>&paramKey=<%=paramKey%>">[다음]</a>
	
	

</body>
</html>