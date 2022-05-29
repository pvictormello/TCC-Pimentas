<%-- 
    Document   : fasereprodutiva2
    Created on : 16/11/2014, 12:18:32
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            <a class="caminho" href="./localizacao2.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao2.jsp" ><% out.print(res.traduz(210,traducao));%></a> »
            <a class="caminho" href="./faseplantula2.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(67,traducao));%>.</a>
            <!--Include.-->
        </div>
        
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="localizacao2.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula2.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="faseplantula2.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="fasevegetativa2.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class="active"><a href="fasereprodutiva2.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
        
         <%
             
                 //int cod = Integer.parseInt(request.getParameter("chave"));
                 int cod ;
                 if(session.getValue("codigo")!=null){
                    cod = Integer.parseInt(session.getValue("codigo").toString());
                 }else{
                   cod = Integer.parseInt(request.getParameter("chave"));
                }
                
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from fasereprodutiva where Identif = '"+cod+"'");
             
            
          
              while(rs.next()){
                 
                  
                  %>
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="imagens2.jsp">
                    
                    <input type="hidden" name="chave" value="<%out.print(cod);%>"/> 
                    
		<h3><% out.print(res.traduz(67,traducao));%>:</h3>
                <div class="field">
                    <label for="name">7.2.1.1 <% out.print(res.traduz(68,traducao));%>:</label>
                    <input name="cod68" class="input2" type="text" value="<% if(!rs.getString("cod68").equals("-1")){out.print(rs.getString("cod68"));}%>" disabled/>
                    
                </div>
		<div class="field">
                    <label for="name">7.2.1.2 <% out.print(res.traduz(69,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod69").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="cod69" id="one" value="1" checked disabled />  1-<% out.print(res.traduz(70,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod69" id="one" value="1" disabled />  1-<% out.print(res.traduz(70,traducao));%></td> 
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod69").equals("2"))
                                                {%>
                                                      <td><input type="radio" name="cod69" id="two" value="2" checked disabled />  2-<% out.print(res.traduz(71,traducao));%></td>
                                                <% }else
                                                  { %>
                                                      <td><input type="radio" name="cod69" id="two" value="2" disabled />  2-<% out.print(res.traduz(71,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod69").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod69" id="tree" value="3" checked disabled />  3-<% out.print(res.traduz(72,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod69" id="tree" value="3" disabled />  3-<% out.print(res.traduz(72,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod69").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod69" id="four" value="4" checked disabled />  4-<% out.print(res.traduz(73,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod69" id="four" value="4" disabled />  4-<% out.print(res.traduz(73,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod69").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod69" id="five" value="5" checked disabled />  5-<% out.print(res.traduz(74,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod69" id="five" value="5" disabled />  5-<% out.print(res.traduz(74,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.2.1.3 <% out.print(res.traduz(75,traducao));%>:</label><br>
                    <table>
                         <tr>
                                <td><img src="./imagens/flower1.png"/></td>
                                <td><img src="./imagens/flower2.png"/></td>
                                <td><img src="./imagens/flower3.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                if(rs.getString("cod75").equals("3"))
                                {%>
                                    <td><input type="radio" name="cod75" id="3" value="3" checked disabled />  3-<% out.print(res.traduz(76,traducao));%></td>
                                <% }else
                                  { %>
                                     <td><input type="radio" name="cod75" id="3" value="3" disabled />  3-<% out.print(res.traduz(76,traducao));%></td>
                                 <% } %>

                <%		 
                if(rs.getString("cod75").equals("5"))
                                {%>
                                    <td><input type="radio" name="cod75" id="5" value="5" checked disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                <% }else
                                  { %>
                                     <td><input type="radio" name="cod75" id="5" value="5" disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                 <% } %>

                <%		 
                if(rs.getString("cod75").equals("7"))
                                {%>
                                    <td><input type="radio" name="cod75" id="7" value="7" checked disabled />  7-<% out.print(res.traduz(51,traducao));%></td>
                                <% }else
                                  { %>
                                    <td><input type="radio" name="cod75" id="7" value="7" disabled />  7-<% out.print(res.traduz(51,traducao));%></td>
                                 <% } %>
                                
                            </tr>
                            
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.4 <% out.print(res.traduz(77,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod77").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="cod77" value="1" checked disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod77" value="1" disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod77").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod77" value="2" checked disabled />  2-<% out.print(res.traduz(14,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod77" value="2" disabled />  2-<% out.print(res.traduz(14,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod77").equals("3"))
                                                {%>
                                                     <td><input type="radio" name="cod77" value="3" checked disabled />  3-<% out.print(res.traduz(19,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod77" value="3" disabled />  3-<% out.print(res.traduz(19,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             <tr>
                                <%		 
                                    if(rs.getString("cod77").equals("4"))
                                                    {%>
                                                         <td><input type="radio" name="cod77" value="4" checked disabled />  4-<% out.print(res.traduz(78,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                         <td><input type="radio" name="cod77" value="4" disabled />  4-<% out.print(res.traduz(78,traducao));%></td>
                                                     <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod77").equals("5"))
                                                    {%>
                                                        <td><input type="radio" name="cod77" value="5" checked disabled />  5-<% out.print(res.traduz(79,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod77" value="5" disabled />  5-<% out.print(res.traduz(79,traducao));%></td>
                                                     <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod77").equals("6"))
                                                    {%>
                                                        <td><input type="radio" name="cod77" value="6" checked disabled />  6-<% out.print(res.traduz(80,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod77" value="6" disabled />  6-<% out.print(res.traduz(80,traducao));%></td>
                                                     <% } %>
                                
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod77").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod77" value="7" checked disabled />  7-<% out.print(res.traduz(81,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod77" value="7" disabled />  7-<% out.print(res.traduz(81,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod77").equals("8"))
                                                {%>
                                                    <td><input type="radio" name="cod77" value="8" checked disabled />  8-<% out.print(res.traduz(8,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod77" value="8" disabled />  8-<% out.print(res.traduz(8,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod77").equals("9"))
                                                {%>
                                                    <td><input type="radio" name="cod77" value="9" checked disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod77" value="9" disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.5 <% out.print(res.traduz(82,traducao));%>:</label><br>
                    <table>
                     
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="cod82" value="1" checked disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod82" value="1" disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod82" value="2" checked disabled />  2-<% out.print(res.traduz(19,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod82" value="2" disabled />  2-<% out.print(res.traduz(19,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod82" value="3" checked disabled/>  3-<% out.print(res.traduz(78,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod82" value="3" disabled />  3-<% out.print(res.traduz(78,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod82" value="4" checked disabled />  4-<% out.print(res.traduz(7,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod82" value="4" disabled />  4-<% out.print(res.traduz(7,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod82" value="5" checked disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod82" value="5" disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod82").equals("6"))
                                                {%>
                                                    <td><input type="radio" name="cod82" value="6" checked disabled />  6-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod82" value="6" disabled />  6-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.6 <% out.print(res.traduz(83,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <%		 
                                if(rs.getString("cod83").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod83" value="1" checked disabled />   1-<% out.print(res.traduz(84,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod83" value="1" disabled />   1-<% out.print(res.traduz(84,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod83").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod83" value="2" checked disabled />   2-<% out.print(res.traduz(85,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod83" value="2" disabled />   2-<% out.print(res.traduz(85,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod83").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod83" value="3" checked disabled />   3-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod83" value="3" disabled />   3-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            
                        </table>
                       
                </div>
                 <div class="field">
                    <label for="name">7.2.1.7 <% out.print(res.traduz(86,traducao));%>:</label><br>
                    <table>
                      
                            <tr>
                                <%		 
                                if(rs.getString("cod86").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod86" value="1" checked disabled  />  <% out.print(res.traduz(87,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod86" value="1" disabled  />  <% out.print(res.traduz(87,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod86").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod86" value="2" checked disabled />  <% out.print(res.traduz(88,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod86" value="2" disabled />  <% out.print(res.traduz(88,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod86").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="cod86" value="3" checked disabled />  <% out.print(res.traduz(89,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod86" value="3" disabled />  <% out.print(res.traduz(89,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
   
                             
                        </table>
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.1.8 <% out.print(res.traduz(90,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="cod90" value="1" checked disabled />   1-<% out.print(res.traduz(6,traducao));%></td>
                                                <% }else
                                                    {%>
                                                     <td><input type="radio" name="cod90" value="1" disabled  />   1-<% out.print(res.traduz(6,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod90" value="2" checked disabled />   2-<% out.print(res.traduz(19,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod90" value="2" disabled />   2-<% out.print(res.traduz(19,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod90" value="3" checked disabled />   3-<% out.print(res.traduz(91,traducao));%></td>
                                                <% }else
                                                  { %>
                                                   <td><input type="radio" name="cod90" value="3" disabled />   3-<% out.print(res.traduz(91,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod90" value="4" checked disabled />   4-<% out.print(res.traduz(92,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod90" value="4" disabled />   4-<% out.print(res.traduz(92,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("5"))
                                                {%>
                                                   <td><input type="radio" name="cod90" value="5" checked disabled />   5-<% out.print(res.traduz(8,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod90" value="5" disabled />   5-<% out.print(res.traduz(8,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod90").equals("6"))
                                                {%>
                                                   <td><input type="radio" name="cod90" value="6" checked disabled />   6-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod90" value="6" disabled />   6-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            
                        </table>
                       
                </div>
                <div class="field">
                    <label for="name">7.2.1.9 <% out.print(res.traduz(93,traducao));%>:</label>
                    <input name="cod93" class="input2" type="text" value="<% if(!rs.getString("cod93").equals("-1")){ out.print(rs.getString("cod93"));} %>" disabled/>
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.10 <% out.print(res.traduz(222,traducao));%>:</label><br>
                    <table>
                         
                            <tr>
                                <%		 
                                    if(rs.getString("cod222").equals("1"))
                                                    {%>
                                                         <td><input type="radio" name="cod222" value="1" checked disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                      <% }else 
                                                        { %>
                                                         <td><input type="radio" name="cod222" value="1" disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                     <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod222").equals("2"))
                                            {%>
                                                <td><input type="radio" name="cod222" value="2" checked disabled />  2-<% out.print(res.traduz(19,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod222" value="2" disabled />  2-<% out.print(res.traduz(19,traducao));%></td>
                                             <% } %>
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod222").equals("3"))
                                            {%>
                                                <td><input type="radio" name="cod222" value="3" checked disabled  />  3-<% out.print(res.traduz(7,traducao));%></td>
                                            <% }else
                                              { %>
                                               <td><input type="radio" name="cod222" value="3" disabled />  3-<% out.print(res.traduz(7,traducao));%></td>
                                             <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod222").equals("4"))
                                            {%>
                                                <td><input type="radio" name="cod222" value="4" checked disabled />  4-<% out.print(res.traduz(92,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod222" value="4" disabled />  4-<% out.print(res.traduz(92,traducao));%></td>
                                             <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod222").equals("5"))
                                                {%>
                                                   <td><input type="radio" name="cod222" value="5" checked disabled />  5-<% out.print(res.traduz(16,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod222" value="5" disabled />  5-<% out.print(res.traduz(16,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod222").equals("6"))
                                                {%>
                                                   <td><input type="radio" name="cod222" value="6" checked disabled />  6-<% out.print(res.traduz(8,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod222" value="6" disabled />  6-<% out.print(res.traduz(8,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod222").equals("7"))
                                                {%>
                                                   <td><input type="radio" name="cod222" value="7" checked disabled />  7-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod222" value="7" disabled />  7-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>

                                
                            </tr>
                             
                        </table>
                    <div class="field">
                    <label for="name">7.2.1.11 <% out.print(res.traduz(94,traducao));%>:</label>
                    <input name="cod94" class="input2" type="text" value="<% if(!rs.getString("cod94").equals("-1")){ out.print(rs.getString("cod94"));} %>" disabled />
                    
                </div>
        
                </div>
                <div class="field">
                    <label for="name">7.2.1.12 <% out.print(res.traduz(95,traducao));%>:</label><br>
                    <table>
                          
                            <tr>
                                <%		 
                                if(rs.getString("cod95").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="cod95" value="3" checked disabled />  3-<% out.print(res.traduz(96,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod95" value="3" disabled />  3-<% out.print(res.traduz(96,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod95").equals("5"))
                                                {%>
                                                   <td><input type="radio" name="cod95" value="5" checked disabled />  5-<% out.print(res.traduz(97,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod95" value="5" disabled />  5-<% out.print(res.traduz(97,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod95").equals("7"))
                                                {%>
                                                   <td><input type="radio" name="cod95" value="7" checked disabled />  7-<% out.print(res.traduz(98,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod95" value="7" disabled />  7-<% out.print(res.traduz(98,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.13 <% out.print(res.traduz(99,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <%		 
                            if(rs.getString("cod99").equals("1"))
                                            {%>
                                              <td><input type="radio" name="cod99" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod99" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                             <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod99").equals("2"))
                                                {%>
                                                  <td><input type="radio" name="cod99" value="2" checked disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod99" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                 <% } %>
		 
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.14 <% out.print(res.traduz(102,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <%		 
                                if(rs.getString("cod102").equals("1"))
                                                {%>
                                                   <td><input type="radio" name="cod102" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod102" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod102").equals("2"))
                                                    {%>
                                                        <td><input type="radio" name="cod102" value="2" checked disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod102" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                     <% } %>
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.1.15 <% out.print(res.traduz(103,traducao));%>:</label><br>
                    <center> <table>
             
                             <tr>
                                <td><img src="./imagens/calyx3.png"/></td>
                                <td><img src="./imagens/calyx5.png"/></td>
                                <td><img src="./imagens/calyx7.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod103").equals("1"))
                                            {%>
                                                 <td><input type="radio" name="cod103" value="1" checked disabled />  1-<% out.print(res.traduz(104,traducao));%></td>
                                            <% }else
                                              { %>
                                                 <td><input type="radio" name="cod103" value="1" disabled />  1-<% out.print(res.traduz(104,traducao));%></td>
                                             <% } %>

                            <%		 
                            if(rs.getString("cod103").equals("2"))
                                            {%>
                                               <td><input type="radio" name="cod103" value="2" checked disabled />  2-<% out.print(res.traduz(11,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod103" value="2" disabled />  2-<% out.print(res.traduz(11,traducao));%></td>
                                             <% } %>

                            <%		 
                            if(rs.getString("cod103").equals("3"))
                                            {%>
                                               <td><input type="radio" name="cod103" value="3" checked disabled />  3-<% out.print(res.traduz(105,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod103" value="3" disabled />  3-<% out.print(res.traduz(105,traducao));%></td>
                                             <% } %>


                            <%		 
                            if(rs.getString("cod103").equals("4"))
                                            {%>
                                                <td><input type="radio" name="cod103" value="4" checked disabled />  4-<% out.print(res.traduz(20,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod103" value="4" disabled />  4-<% out.print(res.traduz(20,traducao));%></td>
                                             <% } %>
                            </tr>
                           
                             
                        </table></center>
                    
                </div>
                 
                <div class="field">
                    <label for="name">7.2.1.16 <% out.print(res.traduz(106,traducao));%>:</label><br>
                    <center><table>
                             <tr>
                                <td><img src="./imagens/calyx0.png"/></td>
                                <td><img src="./imagens/calyx1.png"/></td>
                                
                        
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod106").equals("1"))
                                                {%>
                                                   <td><input type="radio" name="cod106" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod106" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                 <% } %>


                                <%		 
                                if(rs.getString("cod106").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod106" value="2" checked disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod106" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                 <% } %>
		 
                            </tr>     
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.1 <% out.print(res.traduz(107,traducao));%>:</label>
                    <input name="cod107" class="input2" type="text" value="<% if(!rs.getString("cod107").equals("-1")){out.print(rs.getString("cod107"));} %>" disabled/>
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.2.2 <% out.print(res.traduz(108,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod108").equals("1"))
                                                {%>
                                                   <td><input type="radio" name="cod108" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod108" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                 <% } %>
                                
                                
                            </tr> 
                            <tr>
                                <%		 
                                if(rs.getString("cod108").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod108" value="2" checked disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod108" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                 <% } %>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.3 <% out.print(res.traduz(109,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod109").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod109" value="1" checked disabled />  1-<% out.print(res.traduz(6,traducao));%></td> 
                                                  <% }else 
                                                    { %>
                                                     <td><input type="radio" name="cod109" value="1" disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod109").equals("2"))
                                                {%>
                                                   <td><input type="radio" name="cod109" value="2" checked disabled />  2-<% out.print(res.traduz(19,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod109" value="2" disabled />  2-<% out.print(res.traduz(19,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod109").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="cod109" value="3" checked disabled />  3-<% out.print(res.traduz(7,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod109" value="3" disabled />  3-<% out.print(res.traduz(7,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod109").equals("4"))
                                                    {%>
                                                         <td><input type="radio" name="cod109" value="4" checked disabled />  4-<% out.print(res.traduz(120,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                         <td><input type="radio" name="cod109" value="4" disabled />  4-<% out.print(res.traduz(120,traducao));%></td>
                                                     <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod109").equals("5"))
                                                {%>
                                                   <td><input type="radio" name="cod109" value="5" checked disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod109" value="5" disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod109").equals("6"))
                                                {%>
                                                   <td><input type="radio" name="cod109" value="6" checked disabled />  6-<% out.print(res.traduz(17,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod109" value="6" disabled />  6-<% out.print(res.traduz(17,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod109").equals("7"))
                                            {%>
                                               <td><input type="radio" name="cod109" value="7" checked disabled />  7-<% out.print(res.traduz(20,traducao));%></td> 
                                            <% }else
                                              { %>
                                               <td><input type="radio" name="cod109" value="7" disabled />  7-<% out.print(res.traduz(20,traducao));%></td> 
                                             <% } %>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.4 <% out.print(res.traduz(110,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <%		 
                                    if(rs.getString("cod110").equals("3"))
                                                    {%>
                                                        <td><input type="radio" name="cod110" value="3" checked disabled />  3-<% out.print(res.traduz(111,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                         <td><input type="radio" name="cod110" value="3" disabled />  3-<% out.print(res.traduz(111,traducao));%></td>
                                                     <% } %>
                                
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod110").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod110" value="5" checked disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod110" value="5" disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod110").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod110" value="7" checked disabled />  7-<% out.print(res.traduz(113,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod110" value="7" disabled />  7-<% out.print(res.traduz(113,traducao));%></td>
                                                 <% } %>
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.5 <% out.print(res.traduz(114,traducao));%>:</label>
                    <input name="cod114" class="input2" type="text" value="<% if(!rs.getString("cod114").equals("-1")){ out.print(rs.getString("cod114"));}%>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.6 <% out.print(res.traduz(115,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="1" checked disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="1" disabled />  1-<% out.print(res.traduz(6,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="2" checked disabled />  2-<% out.print(res.traduz(116,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="2" disabled />  2-<% out.print(res.traduz(116,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="3" checked disabled />  3-<% out.print(res.traduz(117,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="3" disabled />  3-<% out.print(res.traduz(117,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="4" checked disabled />  4-<% out.print(res.traduz(118,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="4" disabled />  4-<% out.print(res.traduz(118,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="5" checked disabled />  5-<% out.print(res.traduz(119,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="5" disabled />  5-<% out.print(res.traduz(119,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("6"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="6" checked disabled />  6-<% out.print(res.traduz(120,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="6" disabled />  6-<% out.print(res.traduz(120,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="7" checked disabled />  7-<% out.print(res.traduz(121,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="7" disabled />  7-<% out.print(res.traduz(121,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("8"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="8" checked disabled />  8-<% out.print(res.traduz(122,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="8" disabled />  8-<% out.print(res.traduz(122,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("9"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="9" checked disabled />  9-<% out.print(res.traduz(123,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="9" disabled />  9-<% out.print(res.traduz(123,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod115").equals("10"))
                                                    {%>
                                                        <td><input type="radio" name="cod115" value="10" checked disabled />  10-<% out.print(res.traduz(8,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod115" value="10" disabled />  10-<% out.print(res.traduz(8,traducao));%></td>
                                                     <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("11"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="11" checked disabled />  11-<% out.print(res.traduz(124,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="11" disabled />  11-<% out.print(res.traduz(124,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("12"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="12" checked disabled />  12-<% out.print(res.traduz(125,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="12" disabled />  12-<% out.print(res.traduz(125,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod115").equals("13"))
                                                {%>
                                                    <td><input type="radio" name="cod115" value="13" checked disabled />  13-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod115" value="13" disabled />  13-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.7 <% out.print(res.traduz(126,traducao));%>:</label><br>
                    <table>
             
                             <tr>
                                <%		 
                                if(rs.getString("cod126").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod126" value="1" checked disabled />  1-<% out.print(res.traduz(127,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod126" value="1" disabled />  1-<% out.print(res.traduz(127,traducao));%></td>
                                                 <% } %>
                                <td><img src="./imagens/elongate.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod126").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod126" value="2" checked disabled />  2-<% out.print(res.traduz(128,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod126" value="2" disabled />  2-<% out.print(res.traduz(128,traducao));%></td>
                                                 <% } %>
                                <td><img src="./imagens/almost.png"/></td>
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod126").equals("3"))
                                                    {%>
                                                        <td><input type="radio" name="cod126" value="3" checked disabled />  3-<% out.print(res.traduz(129,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod126" value="3" disabled />  3-<% out.print(res.traduz(129,traducao));%></td>
                                                     <% } %>
                                <td><img src="./imagens/triangular.png"/></td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod126").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod126" value="4" checked disabled />  4-<% out.print(res.traduz(85,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod126" value="4" disabled />  4-<% out.print(res.traduz(85,traducao));%></td>
                                                 <% } %>
                                <td><img src="./imagens/companulate.png"/></td>
                            </tr>
                             <tr>
                                <%		 
                                if(rs.getString("cod126").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod126" value="5" checked disabled />  5-<% out.print(res.traduz(130,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="cod126" value="5" disabled />  5-<% out.print(res.traduz(130,traducao));%></td>
                                                 <% } %>
                                <td><img src="./imagens/blocky.png"/></td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod126").equals("6"))
                                                {%>
                                                    <td><input type="radio" name="cod126" value="6" checked disabled />  6-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod126" value="6" disabled />  6-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            
                        </table>
                     
                 </div>
                <br>
                <div class="field">
                    <label for="name">7.2.2.8 <% out.print(res.traduz(131,traducao));%>:</label>
                    <input name="cod131" class="input2" type="text" value="<% if(!rs.getString("cod131").equals("-1")){out.print(rs.getString("cod131"));}%>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.9 <% out.print(res.traduz(132,traducao));%>:</label>
                    <input name="cod132" class="input2" type="text" value="<% if(!rs.getString("cod132").equals("-1")){ out.print(rs.getString("cod132"));}%>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.10 <% out.print(res.traduz(133,traducao));%>:</label>
                    <input name="cod133" class="input2" type="text" value="<% if(!rs.getString("cod133").equals("-1")){out.print(rs.getString("cod133"));}%>" disabled/>   
                </div>
                <div class="field">
                    <label for="name">7.2.2.11 <% out.print(res.traduz(134,traducao));%>:</label>
                    <input name="cod134" class="input2" type="text" value="<% if(!rs.getString("cod134").equals("-1")){out.print(rs.getString("cod134"));}%>" disabled/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.12 <% out.print(res.traduz(135,traducao));%>:</label>
                    <input name="cod135" class="input2" type="text" value="<% if(!rs.getString("cod135").equals("-1")){out.print(rs.getString("cod135"));}%>" disabled/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.13 <% out.print(res.traduz(136,traducao));%>:</label><br>
                    <center> <table>
                            
                            <tr>
                                <td><img src="./imagens/fig12.1.png"/></td>
                                <td><img src="./imagens/fig12.2.png"/></td> 
                                <td><img src="./imagens/fig12.3.png"/></td>
                            </tr> 
                            <tr>
                                <%		 
                            if(rs.getString("cod136").equals("1"))
                                            {%>
                                                <td><input type="radio" name="cod136" value="1" checked disabled />  1-<% out.print(res.traduz(137,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod136" value="1" disabled />  1-<% out.print(res.traduz(137,traducao));%></td>
                                             <% } %>


                            <%		 
                            if(rs.getString("cod136").equals("2"))
                                            {%>
                                                <td><input type="radio" name="cod136" value="2" checked disabled />  2-<% out.print(res.traduz(138,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod136" value="2" disabled />  2-<% out.print(res.traduz(138,traducao));%></td>
                                             <% } %>


                            <%		 
                            if(rs.getString("cod136").equals("3"))
                                            {%>
                                                <td><input type="radio" name="cod136" value="3" checked disabled />  3-<% out.print(res.traduz(139,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod136" value="3" disabled />  3-<% out.print(res.traduz(139,traducao));%></td>
                                             <% } %>
                            </tr>
                            <tr>
                                <td><img src="./imagens/fig12.4.png"/></td>
                                <td><img src="./imagens/fig12.5.png"/></td>
                            </tr>
                            <tr>
                                
                                <%		 
                                if(rs.getString("cod136").equals("4"))
                                                {%>
                                                    <td><input type="radio" name="cod136" value="4" checked disabled />  4-<% out.print(res.traduz(140,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod136" value="4" disabled />  4-<% out.print(res.traduz(140,traducao));%></td>
                                                 <% } %>


                                <%		 
                                if(rs.getString("cod136").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod136" value="5" checked disabled />  5-<% out.print(res.traduz(141,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod136" value="5" disabled />  5-<% out.print(res.traduz(141,traducao));%></td>
                                                 <% } %>
                               
                            </tr>
                            
                          
                        </table></center>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.14 <% out.print(res.traduz(142,traducao));%>:</label><br>
                    <center> <table>
                            
                            <tr>
                                <td><img src="./imagens/neck1.png"/></td>
                                <td><img src="./imagens/neck2.png"/></td>   
                            </tr> 
                            <tr>
                                <%		 
                        if(rs.getString("cod142").equals("1"))
                                        {%>
                                            <td><input type="radio" name="cod142" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="cod142" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                         <% } %>


                        <%		 
                        if(rs.getString("cod142").equals("2"))
                                        {%>
                                            <td><input type="radio" name="cod142" value="2" checked disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="cod142" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                         <% } %>
                                
                            </tr>
                        </table></center>  
                 </div>
                <div class="field">
                    <label for="name">7.2.2.15 <% out.print(res.traduz(143,traducao));%>:</label><br>
                    <center> <table>
             
                             <tr>
                                 
                                 <td><img src="./imagens/pointed.png"/></td>
                                 <td><img src="./imagens/blunt.png"/></td>
                                 <td><img src="./imagens/sunken.png"/></td>
                                 <td><img src="./imagens/sunkenandpointed.png"/></td>
                            </tr>
                            <tr>
                               <%		 
                                            if(rs.getString("cod143").equals("1"))
                                                            {%>
                                                                 <td><input type="radio" name="cod143" value="1" checked disabled />  1-<% out.print(res.traduz(144,traducao));%></td>
                                                            <% }else
                                                              { %>
                                                                 <td><input type="radio" name="cod143" value="1" disabled  />  1-<% out.print(res.traduz(144,traducao));%></td>
                                                             <% } %>


                                            <%		 
                                            if(rs.getString("cod143").equals("2"))
                                                            {%>
                                                                <td><input type="radio" name="cod143" value="2" checked disabled />  2-<% out.print(res.traduz(145,traducao));%></td>
                                                            <% }else
                                                              { %>
                                                                <td><input type="radio" name="cod143" value="2" disabled />  2-<% out.print(res.traduz(145,traducao));%></td>
                                                             <% } %>

                                            <%		 
                                            if(rs.getString("cod143").equals("3"))
                                                            {%>
                                                                <td><input type="radio" name="cod143" value="3" checked disabled />  3-<% out.print(res.traduz(146,traducao));%></td>
                                                            <% }else
                                                              { %>
                                                                <td><input type="radio" name="cod143" value="3" disabled />  3-<% out.print(res.traduz(146,traducao));%></td>
                                                             <% } %>


                                            <%		 
                                            if(rs.getString("cod143").equals("4"))
                                                            {%>
                                                                <td><input type="radio" name="cod143" value="4" checked disabled />  4-<% out.print(res.traduz(147,traducao));%></td>
                                                            <% }else
                                                              { %>
                                                                <td><input type="radio" name="cod143" value="4" disabled />  4-<% out.print(res.traduz(147,traducao));%></td>
                                                             <% } %>

                                            <%		 
                                            if(rs.getString("cod143").equals("5"))
                                                            {%>
                                                                <td><input type="radio" name="cod143"  value="5" checked disabled />  5-<% out.print(res.traduz(20,traducao));%></td>
                                                            <% }else
                                                              { %>
                                                                <td><input type="radio" name="cod143"  value="5" disabled />  5-<% out.print(res.traduz(20,traducao));%></td>
                                                             <% } %>
                                
                                
                                
                                
                            </tr>
                 
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.16 <% out.print(res.traduz(148,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                
                                <%		 
                                if(rs.getString("cod148").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod148" value="1" checked disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod148" value="1" disabled />  0-<% out.print(res.traduz(100,traducao));%></td>
                                                 <% } %>
		 
                                
                            </tr> 
                            <tr>
                               <%		 
                                if(rs.getString("cod148").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod148" value="2" checked disabled  />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod148" value="2" disabled />  1-<% out.print(res.traduz(101,traducao));%></td>
                                                 <% } %> 
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.17 <% out.print(res.traduz(149,traducao));%>:</label><br>
                    <center> <table>
                            <tr>
                                <td><img src="./imagens/fruit3.png"/></td>
                                <td><img src="./imagens/fruit5.png"/></td>
                                <td><img src="./imagens/fruit7.png"/></td>
                            </tr>
                             <tr>
                                <%		 
                        if(rs.getString("cod149").equals("3"))
                                        {%>
                                            <td><input type="radio" name="cod149" value="3" checked disabled />  3-<% out.print(res.traduz(150,traducao));%>  </td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="cod149" value="3" disabled />  3-<% out.print(res.traduz(150,traducao));%>  </td>
                                         <% } %>


                        <%		 
                        if(rs.getString("cod149").equals("5"))
                                        {%>
                                            <td><input type="radio" name="cod149" value="5" checked disabled />  5-<% out.print(res.traduz(112,traducao));%>  </td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="cod149" value="5" disabled />  5-<% out.print(res.traduz(112,traducao));%>  </td>
                                         <% } %>

                        <%		 
                        if(rs.getString("cod149").equals("7"))
                                        {%>
                                            <td><input type="radio" name="cod149" value="7" checked disabled />  7-<% out.print(res.traduz(151,traducao));%>  </td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="cod149" value="7" disabled />  7-<% out.print(res.traduz(151,traducao));%>  </td>
                                         <% } %> 

                                 
                                 
                            </tr>   
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.18 <% out.print(res.traduz(152,traducao));%>:</label>
                    <input name="cod152" class="input2" type="text" value="<% if(!rs.getString("cod152").equals("-1")){out.print(rs.getString("cod152"));}%>" disabled/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.19 <% out.print(res.traduz(153,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod153").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod153" value="1" checked disabled />  1-<% out.print(res.traduz(154,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod153" value="1" disabled />  1-<% out.print(res.traduz(154,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod153").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod153" value="2" checked disabled />  2-<% out.print(res.traduz(155,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod153" value="2" disabled />  2-<% out.print(res.traduz(155,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod153").equals("3"))
                                            {%>
                                                <td><input type="radio" name="cod153" value="3" checked disabled />  3-<% out.print(res.traduz(156,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod153" value="3" disabled />  3-<% out.print(res.traduz(156,traducao));%></td>
                                             <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                
                <div class="field">
                    <label for="name">7.2.2.20.1 <% out.print(res.traduz(158,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod158").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="cod158" value="3" checked disabled />  3-<% out.print(res.traduz(159,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod158" value="3" disabled />  3-<% out.print(res.traduz(159,traducao));%></td>
                                                 <% } %>
		 
                                   
                            </tr>  
                            <tr>
                               <%		 
                                if(rs.getString("cod158").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod158" value="5" checked disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod158" value="5" disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                 <% } %> 
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod158").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod158" value="7" checked disabled />  7-<% out.print(res.traduz(160,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod158" value="7" disabled />  7-<% out.print(res.traduz(160,traducao));%></td>
                                                 <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.20.2 <% out.print(res.traduz(161,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod161").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod161" value="3" checked disabled />  3-<% out.print(res.traduz(159,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod161" value="3" disabled />  3-<% out.print(res.traduz(159,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod161").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod161" value="5" checked disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod161" value="5" disabled />  5-<% out.print(res.traduz(112,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod161").equals("7"))
                                            {%>
                                                <td><input type="radio" name="cod161" value="7" checked disabled />  7-<% out.print(res.traduz(160,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod161" value="7"  disabled />  7-<% out.print(res.traduz(160,traducao));%></td>
                                             <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.21 <% out.print(res.traduz(162,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                    if(rs.getString("cod162").equals("1"))
                                                    {%>
                                                        <td><input type="radio" name="cod162" value="1" checked disabled />  <% out.print(res.traduz(163,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod162" value="1" disabled />  <% out.print(res.traduz(163,traducao));%></td>
                                                     <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod162").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod162" value="2" checked disabled />  <% out.print(res.traduz(164,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod162" value="2" disabled />  <% out.print(res.traduz(164,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod162").equals("3"))
                                            {%>
                                                <td><input type="radio" name="cod162" value="3" checked disabled />  <% out.print(res.traduz(165,traducao));%></td>
                                            <% }else
                                              { %>
                                                <td><input type="radio" name="cod162" value="3" disabled />  <% out.print(res.traduz(165,traducao));%></td>
                                             <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.22 <% out.print(res.traduz(180,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod180").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod180" value="3" checked disabled />  3-<% out.print(res.traduz(181,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod180" value="3" disabled />  3-<% out.print(res.traduz(181,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod180").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="cod180" value="5" checked disabled />  5-<% out.print(res.traduz(182,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod180" value="5" disabled />  5-<% out.print(res.traduz(182,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod180").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod180" value="7" checked disabled />  7-<% out.print(res.traduz(183,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod180" value="7" disabled />  7-<% out.print(res.traduz(183,traducao));%></td>
                                                 <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                
                <div class="field">
                    <label for="name">7.3.1 <% out.print(res.traduz(167,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod167").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod167" value="1" checked disabled />  1-<% out.print(res.traduz(168,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod167" value="1" disabled />  1-<% out.print(res.traduz(168,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod167").equals("2"))
                                                {%>
                                                   <td><input type="radio" name="cod167" value="2" checked disabled />  2-<% out.print(res.traduz(124,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod167" value="2" disabled />  2-<% out.print(res.traduz(124,traducao));%></td>
                                                 <% } %>
		 
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod167").equals("3"))
                                                    {%>
                                                        <td><input type="radio" name="cod167" value="3" checked disabled />  3-<% out.print(res.traduz(125,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod167" value="3" disabled />  3-<% out.print(res.traduz(125,traducao));%></td>
                                                     <% } %>
                            </tr>
                            <tr>
                                <%		 
                                        if(rs.getString("cod167").equals("4"))
                                                        {%>
                                                           <td><input type="radio" name="cod167" value="4" checked disabled />  4-<% out.print(res.traduz(20,traducao));%></td> 
                                                        <% }else
                                                          { %>
                                                            <td><input type="radio" name="cod167" value="4" disabled />  4-<% out.print(res.traduz(20,traducao));%></td>
                                                         <% } %>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.3.2 <% out.print(res.traduz(169,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod169").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="cod169" value="1" checked disabled />  1-<% out.print(res.traduz(154,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod169" value="1" disabled />  1-<% out.print(res.traduz(154,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod169").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod169" value="2" checked disabled />  2-<% out.print(res.traduz(170,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod169" value="2" disabled />  2-<% out.print(res.traduz(170,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod169").equals("3"))
                                                    {%>
                                                       <td><input type="radio" name="cod169" value="3" checked disabled />  3-<% out.print(res.traduz(156,traducao));%></td> 
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod169" value="3" disabled />  3-<% out.print(res.traduz(156,traducao));%></td>
                                                     <% } %>
                            </tr>
                        </table>   
                </div>
                 <div class="field">
                    <label for="name">7.3.3 <% out.print(res.traduz(171,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod171").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="cod171" value="3" checked disabled />  3-<% out.print(res.traduz(172,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod171" value="3" disabled />  3-<% out.print(res.traduz(172,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                    if(rs.getString("cod171").equals("5"))
                                                    {%>
                                                        <td><input type="radio" name="cod171" value="5" checked disabled />  5-<% out.print(res.traduz(50,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod171" value="5" disabled />  5-<% out.print(res.traduz(50,traducao));%></td>
                                                     <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod171").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="cod171" value="7" checked disabled />  7-<% out.print(res.traduz(173,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod171" value="7" disabled />  7-<% out.print(res.traduz(173,traducao));%></td>
                                                 <% } %>
                            </tr>
                      </table>   
                 </div>
                 <div class="field">
                    <label for="name">7.3.4 <% out.print(res.traduz(174,traducao));%>:</label>
                    <input name="cod174" class="input2" type="text" value="<% if(!rs.getString("cod174").equals("-1")){ out.print(rs.getString("cod174"));}%>" disabled/> 
                </div>
                 <div class="field">
                    <label for="name">7.3.5 <% out.print(res.traduz(175,traducao));%>:</label>
                    <input name="cod175" class="input2" type="text" value="<% if(!rs.getString("cod175").equals("-1")){out.print(rs.getString("cod175"));}%>" disabled/> 
                </div>
                 <div class="field">
                    <label for="name">7.3.6 <% out.print(res.traduz(176,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <%		 
                                if(rs.getString("cod176").equals("1"))
                                                {%>
                                                   <td><input type="radio" name="cod176" value="1" checked disabled />  <% out.print(res.traduz(177,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod176" value="1" disabled />  <% out.print(res.traduz(177,traducao));%></td>
                                                 <% } %>
                                   
                            </tr>  
                            <tr>
                                <%		 
                                if(rs.getString("cod176").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="cod176" value="2" checked disabled />  <% out.print(res.traduz(178,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="cod176" value="2" disabled />  <% out.print(res.traduz(178,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                    if(rs.getString("cod176").equals("3"))
                                                    {%>
                                                        <td><input type="radio" name="cod176" value="3" checked disabled />  <% out.print(res.traduz(179,traducao));%></td>
                                                    <% }else
                                                      { %>
                                                        <td><input type="radio" name="cod176" value="3" disabled />  <% out.print(res.traduz(179,traducao));%></td>
                                                     <% } %>
                            </tr>
                            
                        </table>   
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
            <input type="button" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" onclick="goNext2()" />    
            <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack()" />       
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>



