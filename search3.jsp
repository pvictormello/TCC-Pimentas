<%-- 
    Document   : search3
    Created on : 20/11/2014, 07:32:11
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[1].toString().charAt(1)!='1'){
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
            
            //traducao = session.getValue("traducao").toString();
            
            session.putValue("flag", null);
            session.putValue("flag2", null);
            session.putValue("flag3", null);
            session.putValue("esc", null);

        %>
       <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
 <% 
     Connection conn =null;
          Statement st= null;
          ResultSet rs =null;


        try { 
        
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from local_coleta ORDER BY variedade");
              
              %>
                 <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="localizacao3.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(254,traducao)); %> </legend>
                      
                         <select name="escolhido" id="select">
                         <option value="0"><% out.print(res.traduz(192,traducao)); %>..</option>
                            <%          
                                    while(rs.next())
                                    {

                                        %>
                                        <option value="<% out.print(rs.getString("Codigo")); %>"  title="" name="t"><% out.print(rs.getString("IDAmostra")); %></option>
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
        
       <%-- <sql:setDataSource var="banco" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sisgermo"
                           user="root" password=""/>
        <sql:query dataSource="${banco}" var="result">
            SELECT  *from local_coleta ;
        </sql:query>
             
           <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="localizacao3.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(254,traducao)); %></legend>
                      
                         <select name="escolhido" id="select">
                         <option value="0"><% out.print(res.traduz(192,traducao)); %>..</option>
                         <c:forEach var="row" items="${result.rows}" >
                             <option value="${row.Codigo}"  title="" name="t"> ${row.IDAmostra}</option>
                          </c:forEach>
                          </select>
                        <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao)); %> >>" />
                    </fieldset>
                
	        </div>
             </form>
           </div>
               ---%>   
        
    </body>
</html>

