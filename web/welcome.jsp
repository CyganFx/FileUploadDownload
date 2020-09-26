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
    <link href='https://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/accordion.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
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
    <h1><strong>Image upload</strong> form with style and pure CSS</h1>
    <div class="form-group">
        <label for="title">Image description <span>Use description to get a better result</span></label>
        <input type="text" name="description" id="title" class="form-controll"/>
    </div>
    <div class="form-group file-area">
        Images <span>Your images should be at least 400x300 wide</span>
        <input type="file" name="file">
        <div class="file-dummy">
            <div class="success">Great, your files are selected. Keep on.</div>
            <div class="default">Please select some pictures</div>
        </div>
    </div>
    <div class="form-group">
        <input type="submit" value="Upload Image">
    </div>


</form>
<br>
<h2>View my current images</h2>

<a href='display.jsp?id="<%=(int)session.getAttribute("id")%>"'>Display</a>
<%--<center><a href="viewAll.jsp">View All </a></center>--%>

<div class="accordion">
    <div class="accordion-item">
<a>Website info:</a>
        <div class="content">
<p>Servlet version: <%= getServletInfo() %>
</p>
<p>Servlet container used: <%= application.getServerInfo() %>
</p>
        </div>
    </div>
        <div class="accordion-item">
<a>Contact info:</a>
            <div class="content">
<p>duman070601@gmail.com</p>
<p>a.zholamanov@astanait.edu.kz</p>
<p>a.imangazin@astanait.edu.kz</p>
            </div>
        </div>
    </div>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<script  src="javascript/toggle.js"></script>
</body>
</html>
