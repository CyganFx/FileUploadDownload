<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.File" %>
<%@ page import="static Servlets.FileUploadServlet.UPLOAD_DIR" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="errorPage.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/display.css">
    <title>Title</title>
</head>
<body>
<%
    int userId = (int) session.getAttribute("id");
    String applicationPath = application.getRealPath("");
    try {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/users", "postgres", "duman070601");
        Statement st = con.createStatement();
        String sql = "SELECT file_name, description FROM images where id=" + userId + "";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            String folderAndFileName = rs.getString("file_name");
            String fileName = folderAndFileName.replace(UPLOAD_DIR + File.separator, "");
            String description = rs.getString("description");
%>

<div class="table-users">
    <div class="header">Pictures</div>
    <table style="width:100%" cellspacing="0">
        <tr>
            <th>Original File Path</th>
            <th>Image</th>
            <th>Description</th>
            <th>Download</th>
            <th>Delete</th>
        </tr>
        <tr>
            <td><%=applicationPath + UPLOAD_DIR + File.separator + fileName%>
            </td>
            <td>
                <image src="<%=folderAndFileName%>" width="200" height="200"/>
            </td>
            <td><%=description%>
            </td>
            <td><a href="FileDownloadServlet?filename=<%=fileName%>">Download</a></td>
            <td><a href="FileDeleteServlet?filename=<%=fileName%>">Delete</a></td>
        </tr>
    </table>
</div>
<%
        }
    } catch (Exception e) {
        out.println(e);
    }
%><br>
</body>
</html>
