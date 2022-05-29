
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : busca2
    Created on : 10/10/2014, 16:32:31
    Author     : Valdomiro
--%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js" charset="UTF-8"></script>
       <!-- <script type="text/javascript" src="script.js"></script>--->
    </head>
    <body>
        <% 
            
            //traducao = session.getValue("traducao").toString();
            session.putValue("codigo", null);

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

	     <form id="contactform" name="f1" class="rounded" method="post" action="localizacao.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(242,traducao)); %> </legend>
                      
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
        
      <%--  <sql:setDataSource var="banco" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sisgermo"
                           user="root" password=""/>
        <sql:query dataSource="${banco}" var="result">
            SELECT  *from local_coleta ;
        </sql:query>
             
           <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="localizacao.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(242,traducao)); %></legend>
                      
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
        --%>          
        
    </body>
</html>
