<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Classes.Dao" %><%--
  Created by IntelliJ IDEA.
  User: Думан
  Date: 26.09.2020
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int userId = (int) session.getAttribute("id");
    try {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/users", "postgres", "duman070601");
        Statement st = con.createStatement();
        String sql = "SELECT file_name, description FROM images where id=" + userId + "";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            String dbfilename = rs.getString("file_name");
            String description = rs.getString("description");
%>

<table style="width:100%">
    <tr>
        <th>Id</th>
        <th>Image</th>
        <th>Description</th>
        <th>Download</th>

    </tr>
    <tr>
        <td><%=userId%></td>
        <td><image src="<%=dbfilename%>" width="200" height="200"/></td>
        <td><%=description%></td>
        <td><a href="FileDownloadServlet?filename=raftaliya.jpg">Download</a></td>
    </tr>
</table>
<%
        }
    } catch (Exception e) {
        out.println(e);
    }
%><br>
</body>
</html>
