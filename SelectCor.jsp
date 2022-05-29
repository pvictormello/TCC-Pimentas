<%-- 
    Document   : SelectCor
    Created on : 07/05/2015, 14:49:18
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
      
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permis= (String) session.getValue("permissaoUsuario");
           String array2[] = new String[4];  
           array2 = permis.split("-");
           if(array2[3].toString().charAt(1)=='0'){
             response.sendRedirect("Home.jsp");
           }
       }
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js" charset="UTF-8"></script>
        <title></title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            $("#link").click(function(){
               var traducao =$('#trad').val();
               if($("option:selected").val()!='0'){
                $("#load").addClass("jquery-waiting-base-container");
                $("#load").html(traducao+"!");
                
            }
           
            });
        });
        </script>
    </head>
    <body>
        <div class="" id="load"></div>
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
              rs = st.executeQuery("Select Codigo,cor from local_coleta where cor <> ' ' group by cor");
              
              %>
			  
			   <input type="hidden" name="tradu" id="trad" value="<% out.print(res.traduz(285,traducao)); %>"/>
                 <div class="container">

	     <form id="contactform" name="f1" class="rounded" method="post" action="RelatorioCor.jsp" onSubmit="return selecao(); return false;">
                
		<div class="field">
                    <fieldset>
                        <legend align = "center"><% out.print(res.traduz(192,traducao)); %> </legend>
                      
                         <select name="escolhido" id="select">
                         <option value="0"><% out.print(res.traduz(192,traducao)); %>..</option>
                            <%          
                                    while(rs.next())
                                    {

                                        %>
                                        <option value="<% out.print(rs.getString("cor")); %>"  title="" name="cor"><% out.print(rs.getString("cor")); %></option>
                                        <%

                                    }
                             %>
                         
                          </select>
                        <input type="submit" name="Submit" id="link"  class="button" value=">><% out.print(res.traduz(220,traducao)); %>" />
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
    </body>
</html>
