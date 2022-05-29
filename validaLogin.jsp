<%-- 
    Document   : validaLogin
    Created on : 20/06/2015, 08:32:56
    Author     : Valdomiro
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="res" class="meupacote.processa" />
<%
         String val = request.getParameter("email");
         String senha = request.getParameter("senha");
        // val="valdomirocm@si.ufu.br";
         int status= -1;
         //val="valdomirocm@hotmail.com";
         //String x="Email já cadastado !";
	  Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
  
          try{
              
             String pass= res.getHash(senha,"MD5");
             String permissao="";
             String name="";
              String array[] = new String[4]; 
             
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from usuario where email = '"+val+"'");
                while(rs.next())
                 {
                     
                     if(rs.getString("email").equals(request.getParameter("email"))&&(rs.getString("senha").equals(pass))){
                         //Gson gson = new Gson(); // converte objetos Java para JSON e retorna JSON como String 
                         //String json = gson.toJson('1');
                         
                         permissao= rs.getString("permissao");
                         name= rs.getString("nome");
                         
                         array = name.split(" ");
                         status=1;
			}
                     
                  }
                if(status==1)
                {
                   session.putValue("loginUsuario",val); //Grava a session com o Login
                   session.putValue("senhaUsuario", senha); //Grava a session com a Senha
                   session.putValue("permissaoUsuario",permissao);// Grava a permissao do usuario
                   session.putValue("User",array[0].toString());
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
