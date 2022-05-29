<%-- 
    Document   : gravaVisitante
    Created on : 08/07/2015, 15:19:26
    Author     : Valdomiro
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Driver"%> 
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>-->
        <meta charset="utf-8" />
       <meta http-equiv="refresh" content="2; URL=login2.jsp" >
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        
        <title></title>
        <script>
  $(function() {
    $( "#dialog" ).dialog();
  });
  </script>
    </head>
    <body>
        <%
            
            String str;
            String nome = request.getParameter("nome");
            String cidade= request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String pais = request.getParameter("pais");
            String localidade = request.getParameter("localidade");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String tp = request.getParameter("estudante");
            if(tp==null)
            {
                tp="";
            }
            
            str = "0000-0000-00000-033333";
          
            
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO usuario"+" VALUES('"+0+"','"+nome+"','"+email+"','"+cidade+"','"+pais+"','"+estado+"',md5('"+senha+"'),'"+str+"','"+tp+"','"+localidade+"')");
              %>
               <div id="dialog" title="Mensagem" style="display:none">
                   <p>Cadastro realizado com Sucesso !</p>
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
