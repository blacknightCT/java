<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="UserServlet" method="get">
		所属班级：<select id="check">
						<option value="Java班">Java班</option>
						<option value="C#班">C#班</option>
						<option value="PHP班">PHP班</option>
						<option value="C班">C班</option>
				</select>
		姓名<input type="text" placeholder="输入学生名查询......" name="username">
		<input type="hidden" value="select" name="tag">
		<input type="submit" value="搜索">
	</form>

	<div align="center" style="border:1px solid black;width:400px">
	<table>
		<tr>
			<td>序号</td>
			<td>班级</td>
			<td>姓名</td>
			<td>成绩</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		
		
		<%
		List<User> UserList2 = new ArrayList<User>();
		if(request.getAttribute("UserList")!=null){
			UserList2 = (List<User>)request.getAttribute("UserList");
		}
			%>
		<%
		if(UserList2!=null){
			for(User user : UserList2){%>
			<tr>
				<td><%=user.getNum() %></td>
				<td><%=user.getStuclass() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getGrade() %></td>
				<td><%=user.getBei() %></td>
				<td>
					<a onclick="return confirm('确认删除吗？');" href="UserServlet?tag=delete&username=<%=user.getName()%>">删除</a> 
					<a href="UserServlet?tag=get&username=<%=user.getName()%>">修改</a>
				</td>
				
			</tr>
			<%}%>
		<%}
		%>
		<tr>
			<td>共计：<%=UserList2.size() %></td>
		</tr>
	</table>
	</div>


	<c:forEach items="${requestScope.UserList }" var="stu"
		varstatus="status">
		<c:choose>
			<c:when test="${stu.grade<60}">
				<td style="color: red">${stu.grade }</td>
				<td style="color: red">${stu.bei }</td>
			</c:when>
		</c:choose>
	</c:forEach>
</body>
</html>
