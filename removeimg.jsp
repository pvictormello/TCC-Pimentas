<%-- 
    Document   : removeimg
    Created on : 17/02/2015, 10:28:06
    Author     : Valdomiro
--%>

<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%
  
   
    String name = request.getParameter("nome");
    
    
    byte[] bytes = name.getBytes(StandardCharsets.ISO_8859_1);
    name = new String(bytes,"UTF-8");
    
         Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              // -----consulta nome das imagens para fazer a deleção no diretorio------//
              
               
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Delete from imagens where nome = '"+name+"'");
   
                   String nome = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\"+name;
                   File f = new File(nome); 
                   f.delete(); 
                   out.print('1');
       
          }catch(Exception ex)
          {
              out.print('0');
              out.println(ex);
              ex.printStackTrace();
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
    
    
 %>

