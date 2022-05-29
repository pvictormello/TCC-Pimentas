<%-- 
    Document   : delete
    Created on : 16/11/2014, 12:41:09
    Author     : Valdomiro
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
           if(array[1].toString().charAt(3)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; URL=Home.jsp" >
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
           List<String> list = new ArrayList<String>();
           
             int x ;
                 if(session.getValue("codigo")!=null){
                    x = Integer.parseInt(session.getValue("codigo").toString());
                 }else{
                   x = Integer.parseInt(request.getParameter("chave"));
                }
            //int x =Integer.parseInt(request.getParameter("chave"));
            Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              // -----consulta nome das imagens para fazer a deleção no diretorio------//
              
               Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from imagens where identificador = '"+x+"'");
              while(rs.next()){
                  list.add(rs.getString("nome"));
              }
              
              
              // --------Deleta nas tabelas -----------------//
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Delete from local_coleta where Codigo = '"+x+"'");
               %>
               <div id="dialog" title="Mensagem" style="display:none">
                   <p>Cadastro Excluido com Sucesso !</p>
               </div>
               <%
               int i=0;
               for(String r:list)
               {
                   String nome = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\"+r.toString();
                   File f = new File(nome); 
                   f.delete(); 
                  
               }
              
               
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

