<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>



<html>
<head>
   <title>TODAY DRINK</title>
   <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
    <link rel="stylesheet" type="text/css" href="mobile.css" media="(max-width: 1024px)">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/demo.css" type="text/css" media="all" />
    <script type="text/javascript" src="js/jquery.js"></script>

<%
String name=request.getParameter("uid");
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
   Statement st = conn.createStatement();
   ResultSet rs = st.executeQuery("SELECT * FROM menu where name='"+name+"'");
   OutputStream output = response.getOutputStream();
   InputStream input=null;
   
   
   byte[] imageData = null;
   if (rs.next()) {
      Blob img = rs.getBlob("image");
      imageData = img.getBytes(1, (int)img.length());
   }
   
   st.close();
   rs.close();
   conn.close();
   
   
   out.clear();
   pageContext.pushBody();
   
   response.setContentType("image/gif");
   OutputStream os = response.getOutputStream();
   os.write(imageData);
   os.flush();
   os.close();
   %>
   
   
