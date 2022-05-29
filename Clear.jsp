<%-- 
    Document   : Clear
    Created on : 22/02/2015, 13:00:15
    Author     : Valdomiro
--%>

<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="meupacote.diretorio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="meupacote.diretorio.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }
    %>
<%
    
        //String clic = request.getParameter("id");
        int clic=0;
        try{
            clic = Integer.parseInt(request.getParameter("id"));
        }catch(Exception ex)
          {
             out.print('0');
             ex.printStackTrace();
          }
   
         String Index="";
         String antigoNome="";
         String novoNome="";
         String sequencia="";
         String diretorio="";
         String novoDir="";
         String array[] = new String[3];
         int contador=1;
         diretorio="C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\";
         novoDir="C:"C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\";
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from imagens where identificador = '"+clic+"'");
              while(rs.next())
              {
                
                  antigoNome= rs.getString("nome");
                  Index=""+clic;
                  sequencia=""+contador;
                  array = antigoNome.split("_"); 
                  novoNome = Index+"_"+sequencia+"_"+array[2].toString();
                     
                  //out.println("( Antigo "+rs.getString("nome")+"] [ Novo "+novoNome +")");
          
                  contador++;
                  Connection conn2 =null;
                  Statement st2= null;
                  ResultSet rs2 =null;
                  
                  try{
              
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conn2 = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
                    st2 = conn2.createStatement();
                     st2.executeUpdate("Update  imagens set nome='"+novoNome+"' where nome='"+antigoNome+"'");

                }catch(Exception ex){
                    out.print('0');
                    out.println(ex);
                    ex.printStackTrace();
                    
                }finally{
                    if(rs2!=null) 
                        rs2.close();
                    if(st2!=null)
                        st2.close();
                    if(conn2!=null) 
                        conn2.close();
                }
                  
                    File f = new File(diretorio+antigoNome); 
                    File f1= new File(novoDir+novoNome);
                    f.renameTo(f1);
                    antigoNome="";
                    novoNome="";
                    }
      
          }
          catch(Exception ex)
          {
              out.print('0');
              out.println(ex);
              //ex.printStackTrace();
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
           out.print('1');
         
         
%>
