<%-- 
    Document   : busca3
    Created on : 10/10/2014, 18:44:57
    Author     : Valdomiro
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="java.sql.DriverManager"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
	  }else{
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[0].toString().charAt(1)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js"></script>
    </head>
    <body>
        <% 
             Cookie cookie4 = null; 
               Cookie[] cookies4 = null;
               cookies4 = request.getCookies(); 
               for (int i = 0; i < cookies4.length; i++)
                { 
                    cookie4 = cookies4[i]; 
                    if(cookie4.getName().equals("Traducao")){
                      traducao = cookie4.getValue();
                    }
                }
            //traducao = session.getValue("traducao").toString();
        %>
       <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
       <%--<sql:setDataSource var="banco" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sisgermo"
                           user="root" password=""/>
        <sql:query dataSource="${banco}" var="result">
            SELECT  *from usuario ;
        </sql:query>---%>
<% 
     Connection conn =null;
          Statement st= null;
          ResultSet rs =null;


        try { 
        
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from usuario ORDER BY nome");
              
              %>
                 <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="alterauser.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(256,traducao)); %> </legend>
                      
                         <select name="escolhido" id="select">
                         <option value="0"><% out.print(res.traduz(192,traducao)); %>..</option>
                            <%          
                                    while(rs.next())
                                    {

                                        %>
                                        <option value="<% out.print(rs.getString("email")); %>"  title="" name="t"><% out.print(rs.getString("nome")); %></option>
                                        <%

                                    }
                             %>
                         
                          </select>
                        <input type="submit" name="Submit"  class="button" value=">><% out.print(res.traduz(220,traducao)); %>" />
                    </fieldset>
                
	        </div>
             </form>
           </div>
              <%
             
            }catch(Exception e) {
        
               e.printStackTrace();
            } 
            finally {
            
             if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
                 
               }               
%>
             
          <%--- <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="alterauser.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(256,traducao)); %> </legend>
                      
                         <select name="escolhido" id="select">
                         <option value="0"><% out.print(res.traduz(192,traducao)); %>..</option>
                         <c:forEach var="row" items="${result.rows}" >
                             <option value="${row.email}"  title="" name="t"> ${row.nome}</option>
                          </c:forEach>
                          </select>
                        <input type="submit" name="Submit"  class="button" value=">><% out.print(res.traduz(220,traducao)); %>" />
                    </fieldset>
                
	        </div>
             </form>
           </div>
                  ---%>
        
    </body>
</html>
