<%@ page import="Classes.User" %><%--
  Created by IntelliJ IDEA.
  User: Думан
  Date: 11.09.2020
  Time: 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="errorPage.jsp" %>
<html>
<head>
    <title>Welcome</title>
</head>
<style>
    body {
        font-family: "Segoe UI";
        background: antiquewhite;
    }
</style>
<body>

<%-- Preventing redirection without login --%>

<% if (session.getAttribute("email") == null) {
    response.sendRedirect(request.getContextPath() + "/id-check?id=" + application.getInitParameter("correctId"));
} %>

<%-- Using JSTL to get data from sessions --%>

<h1>Welcome ${first_name}!</h1>
<h2>There is a data we got from our database:</h2>
<ul>
    <li>User Id: ${id} </li>
    <li>Full Name: ${first_name} ${last_name}</li>
    <li>Job: ${job} </li>
</ul>

<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
    <table width="400px" align="center" border=2>
        <tr>
            <td align="center" colspan="2">Image upload form</td>
        </tr>
        <tr>
            <td>Image Link:</td>
            <td>
                <input type="file" name="file">
            </td>
        </tr>
        <tr>
            <td>Image Description:</td>
            <td>
                <input type="text" name="description">
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<br>
<h2>View my current images</h2>

<a href='display.jsp?id="<%=(int)session.getAttribute("id")%>"'>Display</a>
<%--<center><a href="viewAll.jsp">View All </a></center>--%>


<h4>Website info:</h4>
<p>Servlet version: <%= getServletInfo() %>
</p>
<p>Servlet container used: <%= application.getServerInfo() %>
</p>
<h4>Contact info:</h4>
<p>duman070601@gmail.com</p>
<p>a.zholamanov@astanait.edu.kz</p>
<p>a.imangazin@astanait.edu.kz</p>

</body>
</html>
