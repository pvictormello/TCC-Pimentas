<%-- 
    Document   : verifica
    Created on : 29/10/2014, 19:22:06
    Author     : Valdomiro
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>

 <%
         String val = request.getParameter("email");
        // val="valdomirocm@si.ufu.br";
         int status= -1;
         //val="valdomirocm@hotmail.com";
         //String x="Email já cadastado !";
	  Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
  
          try{
              

              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from usuario where email = '"+val+"'");
                while(rs.next())
                 {
                     if(rs.getString("email").equals(request.getParameter("email"))){
                         //Gson gson = new Gson(); // converte objetos Java para JSON e retorna JSON como String 
                         //String json = gson.toJson('1');
                         
                            
                         status=1;
			}
                     
                  }
                if(status==1)
                {
                   out.print('1'); 
                }else if(status==-1)
                {
                    //Gson gson = new Gson(); // converte objetos Java para JSON e retorna JSON como String 
                    //String j= gson.toJson("0");
                    out.print('0');
                }
              
          }catch(Exception ex)
          {
              out.print(ex);
          }
          
              
                 
%>
