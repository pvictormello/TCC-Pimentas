<%-- 
    Document   : faseplantula
    Created on : 14/11/2014, 21:49:46
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js"></script>
        
        <title></title>

        
    </head>
    <body>
        <% 
            
            //traducao = session.getValue("traducao").toString();

        %>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./localizacao.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao.jsp" ><% out.print(res.traduz(209,traducao));%></a> »
            <a class="caminho" href="./faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(4,traducao));%>.</a>
            <!--Include.-->
        </div>
        
        <ul id="nav2">
	    <li class=""><a href="localizacao.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href=""><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li> --%>
	</ul>
        
        <ul id="nav3">
            <li class="active"><a href="faseplantula.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="fasevegetativa.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="fasereprodutiva.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
        
            <%
               int cod=0;
                if(session.getValue("codigo")!=null){
                    cod = Integer.parseInt(session.getValue("codigo").toString());
                 }
  
           
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from faseplantula where ID_Plantula = '"+cod+"'");
             
            
          
              while(rs.next()){
                 
                  
                  %>
        
       
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="fasevegetativa.jsp">

                 <input type="hidden" name="codigo" value="<% out.print(cod); %>"/>      
		<h3><% out.print(res.traduz(4,traducao));%>:</h3>
		<div class="field">
                    <label for="name">7.1.1.1 <% out.print(res.traduz(5,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod5").equals("1"))
                                    {%>
                                        <td><input type="radio" name="corhipo" value="1" checked disabled/>  1- <% out.print(res.traduz(6,traducao));%></td>
                                   <% }else 
                                   {%>
                                        <td><input type="radio" name="corhipo" value="1" disabled/>  1- <% out.print(res.traduz(6,traducao));%></td>
                                  <% }
                                %>
                                
                                
                            </tr>
                            <tr><%
                                    if(rs.getString("cod5").equals("2"))
                                    {%>
                                        <td><input type="radio" name="corhipo" value="2" checked disabled />  2- <% out.print(res.traduz(7,traducao));%></td>
                                    <%}else
                                     {%>
                                        <td><input type="radio" name="corhipo" value="2" disabled />  2- <% out.print(res.traduz(7,traducao));%></td>
                                   <% } %>
                                    
                                       
                                
                            </tr>
                            <tr>
                                <%
                                    if(rs.getString("cod5").equals("3"))
                                    {%>
                                        <td><input type="radio" name="corhipo" value="2" checked disabled /> 3- <% out.print(res.traduz(8,traducao));%> </td>
                                    <%}else
                                     {%>
                                        <td><input type="radio" name="corhipo" value="2" disabled /> 3- <% out.print(res.traduz(8,traducao));%> </td>
                                   <% } %>
                                
                                
                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.1.1.2 <% out.print(res.traduz(9,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod9").equals("3"))
                                        {%>
                                              <td><input type="radio" name="presTricoma" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                       <% }else
                                        { %>
                                              <td><input type="radio" name="presTricoma" value="3" disabled/>  3-<% out.print(res.traduz(10,traducao));%></td>
                                       <% } %>
                                
                                
                            </tr>
                            <tr>
                                
                                <% 
                                    if(rs.getString("cod9").equals("5"))
                                        {%>
                                        <td><input type="radio" name="presTricoma" value="5" checked disabled/>  5-<% out.print(res.traduz(11,traducao));%></td>
                                       <% }else
                                        { %>
                                             <td><input type="radio" name="presTricoma" value="5" disabled/>  5-<% out.print(res.traduz(11,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod9").equals("7"))
                                        {%>
                                            <td><input type="radio" name="presTricoma" value="7" checked disabled/>  7-<% out.print(res.traduz(12,traducao));%></td>
                                       <% }else
                                        { %>
                                            <td><input type="radio" name="presTricoma" value="7" disabled/>  7-<% out.print(res.traduz(12,traducao));%></td>
                                       <% } %>
                                
                                
                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.3 <% out.print(res.traduz(13,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod13").equals("1"))
                                     {%>
                                               <td><input type="radio" name="corcotiledone" value="1" checked disabled/>  1-<% out.print(res.traduz(14,traducao));%></td> 
                                      <% }else
                                             { %>
                                                <td><input type="radio" name="corcotiledone" value="1" disabled/>  1-<% out.print(res.traduz(14,traducao));%></td>
                                            <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod13").equals("2"))
                                        {%>
                                           <td><input type="radio" name="corcotiledone" value="2" checked disabled />  2-<% out.print(res.traduz(7,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td><input type="radio" name="corcotiledone" value="2" disabled />  2-<% out.print(res.traduz(7,traducao));%></td>
                                       <% } %>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod13").equals("3"))
                                    {%>
                                        <td><input type="radio" name="corcotiledone" value="3" checked disabled/>  3-<% out.print(res.traduz(15,traducao));%></td>
                                   <% }else
                                    { %>
                                       <td><input type="radio" name="corcotiledone" value="3" disabled/>  3-<% out.print(res.traduz(15,traducao));%></td>
                                   <% } %>
                                
                            </tr>
                             <tr>
                                <% 
                                    if(rs.getString("cod13").equals("4"))
                                        {%>
                                           <td><input type="radio" name="corcotiledone" value="4" checked disabled/>  4-<% out.print(res.traduz(16,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td><input type="radio" name="corcotiledone" value="4" disabled />  4-<% out.print(res.traduz(16,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                             <tr>
                                 <% 
                                    if(rs.getString("cod13").equals("5"))
                                        {%>
                                            <td><input type="radio" name="corcotiledone" value="5" checked disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                       <% }else
                                        { %>
                                            <td><input type="radio" name="corcotiledone" value="5" disabled/>  5-<% out.print(res.traduz(8,traducao));%></td>
                                       <% } %>	
                                
                            </tr>
                             <tr>
                                <% 
                                    if(rs.getString("cod13").equals("6"))
                                        {%>
                                           <td><input type="radio" name="corcotiledone" value="6" checked disabled />  6-<% out.print(res.traduz(17,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td><input type="radio" name="corcotiledone" value="6" disabled/>  6-<% out.print(res.traduz(17,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                             <tr>
                                <% 
                                    if(rs.getString("cod13").equals("7"))
                                        {%>
                                           <td><input type="radio" name="corcotiledone"  value="7" checked disabled />  7-<% out.print(res.traduz(18,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td><input type="radio" name="corcotiledone"  value="7" disabled />  7-<% out.print(res.traduz(18,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                             <tr>
                                <% 
                                    if(rs.getString("cod13").equals("8"))
                                        {%>
                                           <td><input type="radio" name="corcotiledone" value="8" checked disabled />  8-<% out.print(res.traduz(19,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td><input type="radio" name="corcotiledone" value="8" disabled />  8-<% out.print(res.traduz(19,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                             <tr>
                                <% 
                                if(rs.getString("cod13").equals("9"))
                                    {%>
                                       <td><input type="radio" name="corcotiledone" value="9" checked disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                   <% }else
                                    { %>
                                       <td><input type="radio" name="corcotiledone" value="9" disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                   <% } %>
                                
                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.4 <% out.print(res.traduz(21,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><img src="./imagens/img1.png"/></td>
                                <td><img src="./imagens/img2.png"/></td>
                                <td><img src="./imagens/img4.png"/></td>
                                <td><img src="./imagens/img5.png"/></td>
                            </tr>
                            <tr>
                                 
                                    <% 
                                    if(rs.getString("cod21").equals("1"))
                                        {%>
                                           <td>  <input type="radio" name="formacoti" value="1" checked disabled /> <% out.print(res.traduz(22,traducao));%></td>
                                       <% }else
                                        { %>
                                           <td>  <input type="radio" name="formacoti" value="1" disabled /> <% out.print(res.traduz(22,traducao));%></td>
                                       <% } %>
                                        <% 
                        if(rs.getString("cod21").equals("2"))
                            {%>
                               <td>  <input type="radio" name="formacoti" value="2" checked disabled /> <% out.print(res.traduz(23,traducao));%></td>
                           <% }else
                            { %>
                               <td>  <input type="radio" name="formacoti" value="2" disabled /> <% out.print(res.traduz(23,traducao));%></td>
                           <% } %>

                        <% 
                        if(rs.getString("cod21").equals("3"))
                            {%>
                               <td>  <input type="radio" name="formacoti" value="3" checked disabled /> <% out.print(res.traduz(24,traducao));%></td>
                           <% }else
                            { %>
                               <td>  <input type="radio" name="formacoti" value="3" disabled /> <% out.print(res.traduz(24,traducao));%></td>
                           <% } %>

                      <% 
                        if(rs.getString("cod21").equals("4"))
                            {%>
                               <td>  <input type="radio" name="formacoti"  value="4" checked disabled /> <% out.print(res.traduz(25,traducao));%></td>
                           <% }else
                            { %>
                               <td>  <input type="radio" name="formacoti"  value="4" disabled /> <% out.print(res.traduz(25,traducao));%></td>
                           <% } %>   

                            </tr>
                           
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.5 <% out.print(res.traduz(26,traducao));%>:</label>
                    <input name="cod26" class="input2" type="text"  value="<% if(!rs.getString("cod26").equals("-1")){ out.print(rs.getString("cod26"));}%>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.6 <% out.print(res.traduz(27,traducao));%>:</label>
                    <input name="cod27" class="input2" id="cod27" type="text" value="<% if(!rs.getString("cod27").equals("-1")){ out.print(rs.getString("cod27"));} %>" disabled/>
                    
                </div>
                     <%  
              }//final do while
          }
          catch(Exception ex)
          {
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
                    
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" onclick="goNext()"/>
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack()" />
                    
                </form>
                        
		</div>
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
            
    </body>
</html>

