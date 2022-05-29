<%-- 
    Document   : remover
    Created on : 25/09/2014, 09:32:25
    Author     : Valdomiro
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Driver"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[0].toString().charAt(3)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; URL=busca.jsp" >
        <title></title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
      <!-- <link rel="stylesheet" href="http:/resources/demos/style.css">-->
  <script>
  $(function() {
    $( "#dialog" ).dialog();
  });
  </script>
    </head>
    <body>
        <%
            
            String x =request.getParameter("cod");
            Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Delete from usuario where email = '"+x+"'");
               %>
               <div id="dialog" title="Mensagem" style="display:none">
                   <p>Cadastro Excluido com Sucesso !</p>
               </div>
               <%
              
               
          }catch(Exception ex)
          {
              %>
                <div id="dialog" title="Mensagem" style="display:none">
                   <p>Ops acontenceu um erro !!!</p>
               </div>
              <%
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
        
            
    </body>
</html>
