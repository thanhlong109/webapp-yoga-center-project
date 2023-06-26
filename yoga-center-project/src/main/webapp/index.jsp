<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>index</title>
</head>
<body>
  <h1>Index</h1>
  <%
    String id = (request.getAttribute("id") != null) ? request.getAttribute("id").toString() : "";
    String name = (request.getAttribute("name") != null) ? request.getAttribute("name").toString() : "";
    String picture = (request.getAttribute("picture") != null) ? request.getAttribute("picture").toString() : "";
    String family_name = (request.getAttribute("family_name") != null) ? request.getAttribute("family_name").toString() : "";
    String given_name = (request.getAttribute("given_name") != null) ? request.getAttribute("given_name").toString() : "";
    String email = (request.getAttribute("email") != null) ? request.getAttribute("email").toString() : "";
    Boolean verified_email = (request.getAttribute("verified_email") != null) ? (Boolean) request.getAttribute("verified_email") : true;
    
    out.print("Id: " + id);
    out.print("<br/>Name: " + name);
    out.print("<br/>Picture: " + picture);
    out.print("<br/>family_name: " + family_name);
    out.print("<br/>given_name: " + given_name);
    out.print("<br/>email: " + email);
    out.print("<br/>verified: " + verified_email);
  %>
</body>
</html>
