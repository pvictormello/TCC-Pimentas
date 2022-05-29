<%-- 
    Document   : fasevegetativa
    Created on : 15/11/2014, 09:53:45
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
            
           // traducao = session.getValue("traducao").toString();

        %>
         <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./localizacao.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao.jsp" ><% out.print(res.traduz(206,traducao));%></a> »
            <a class="caminho" href="./faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(28,traducao));%>.</a>
            <!--Include.-->
        </div>
        
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="localizacao.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="faseplantula.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class="active"><a href="fasevegetativa.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="fasereprodutiva.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
          
        <%
             
                 int cod=0 ;//= Integer.parseInt(request.getParameter("codigo"));
                 
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
              rs = st.executeQuery("Select* from fasevegetativa where Identificador = '"+cod+"'");
             
            
          
              while(rs.next()){
                 
                  
                  %>
        
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="fasereprodutiva.jsp">

                  <input type="hidden" name="chave" value="<% out.print(cod); %>"/>   
                    
		<h3><% out.print(res.traduz(28,traducao));%>:</h3>
		<div class="field">
                    <label for="name">7.1.2.1 <% out.print(res.traduz(29,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                 <% 
                                    if(rs.getString("cod29").equals("1"))
                                    {%>
                                               <td><input type="radio" name="cicloplanta" value="1" checked disabled />  1-<% out.print(res.traduz(30,traducao));%></td>
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="cicloplanta" value="1" disabled />  1-<% out.print(res.traduz(30,traducao));%></td>
                                           <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod29").equals("2"))
                                    {%>
                                             <td><input type="radio" name="cicloplanta" value="2" checked disabled />  2-<% out.print(res.traduz(31,traducao));%></td>  
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="cicloplanta" value="2" disabled />  2-<% out.print(res.traduz(31,traducao));%></td>
                                           <% } %>
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod29").equals("3"))
                                    {%>
                                              <td><input type="radio" name="cicloplanta" value="3" checked disabled />  3-<% out.print(res.traduz(32,traducao));%></td> 
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="cicloplanta" value="3" disabled />  3-<% out.print(res.traduz(32,traducao));%></td>
                                           <% } %>
                                
                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.1.2.2 <% out.print(res.traduz(33,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod33").equals("1"))
                                {%>
                                           <td><input type="radio" name="corTronco" value="1" checked disabled />  1-<% out.print(res.traduz(7,traducao));%></td>
                                <% }else
                                        { %>
                                           <td><input type="radio" name="corTronco" value="1" disabled />  1-<% out.print(res.traduz(7,traducao));%></td>
                                       <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod33").equals("2"))
                                    {%>
                                               <td><input type="radio" name="corTronco" value="2" checked disabled />  2-<% out.print(res.traduz(34,traducao));%></td>
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="corTronco" value="2" disabled />  2-<% out.print(res.traduz(34,traducao));%></td>
                                           <% } %>
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod33").equals("3"))
                                    {%>
                                              <td><input type="radio" name="corTronco" value="3" checked disabled />  3-<% out.print(res.traduz(8,traducao));%></td> 
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="corTronco" value="3" disabled />  3-<% out.print(res.traduz(8,traducao));%></td>
                                           <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                    if(rs.getString("cod33").equals("4"))
                                    {%>
                                               <td><input type="radio" name="corTronco" value="4" checked disabled />  4-<% out.print(res.traduz(20,traducao));%></td>
                                    <% }else
                                            { %>
                                               <td><input type="radio" name="corTronco" value="4" disabled />  4-<% out.print(res.traduz(20,traducao));%></td>
                                           <% } %>

                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.3 <% out.print(res.traduz(36,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod36").equals("1"))
                                       {%>
                                            <td><input type="radio" name="AntocianinaNodal" value="1" checked disabled />  1-<% out.print(res.traduz(7,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="AntocianinaNodal" value="1" disabled />  1-<% out.print(res.traduz(7,traducao));%></td>
                                        <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod36").equals("3"))
                                       {%>
                                            <td><input type="radio" name="AntocianinaNodal" value="3" checked disabled />  3-<% out.print(res.traduz(16,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="AntocianinaNodal" value="3" disabled />  3-<% out.print(res.traduz(16,traducao));%></td>
                                        <% } %>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod36").equals("5"))
                                       {%>
                                            <td><input type="radio" name="AntocianinaNodal" value="5" checked disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="AntocianinaNodal" value="5" disabled />  5-<% out.print(res.traduz(8,traducao));%></td>
                                        <% } %>
                                
                            </tr>
                             <tr>
                                <% 
                                if(rs.getString("cod36").equals("7"))
                                       {%>
                                            <td><input type="radio" name="AntocianinaNodal" value="7" checked disabled />  7-<% out.print(res.traduz(17,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="AntocianinaNodal" value="7" disabled />  7-<% out.print(res.traduz(17,traducao));%></td>
                                        <% } %>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.4 <% out.print(res.traduz(37,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod37").equals("1"))
                                       {%>
                                            <td><input type="radio" name="FormaTronco" value="1" checked disabled />  1-<% out.print(res.traduz(38,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="FormaTronco" value="1" disabled />  1-<% out.print(res.traduz(38,traducao));%></td>
                                        <% } %>
                                
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod37").equals("2"))
                                       {%>
                                            <td><input type="radio" name="FormaTronco" value="2" checked disabled />  2-<% out.print(res.traduz(39,traducao));%></td>
                                       <% }else
                                         { %>
                                            <td><input type="radio" name="FormaTronco" value="2" disabled />  2-<% out.print(res.traduz(39,traducao));%></td>
                                        <% } %>
                            </tr>
                            <tr>
                                <% 
                                if(rs.getString("cod37").equals("3"))
                                       {%>
                                             <td><input type="radio" name="FormaTronco" value="3" checked disabled />  3-<% out.print(res.traduz(40,traducao));%></td>
                                       <% }else
                                         { %>
                                             <td><input type="radio" name="FormaTronco" value="3" disabled />  3-<% out.print(res.traduz(40,traducao));%></td>
                                        <% } %>

                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.5 <% out.print(res.traduz(41,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/figura1.png"/></td>
                                <td><img src="./imagens/figura2.png"/></td>
                                <td><img src="./imagens/figura3.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                    if(rs.getString("cod41").equals("3"))
                                    {%>
                                         <td><input type="radio" name="TricomaCaule" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                    <% }else
                                      { %>
                                         <td><input type="radio" name="TricomaCaule" value="3" disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                     <% } %>
                    <%		 
                    if(rs.getString("cod41").equals("5"))
                                    {%>
                                         <td><input type="radio" name="TricomaCaule" value="5" checked disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                    <% }else
                                      { %>
                                        <td><input type="radio" name="TricomaCaule" value="5" disabled />  5-<% out.print(res.traduz(11,traducao));%></td> 
                                     <% } %>
                    <%		 
                    if(rs.getString("cod41").equals("7"))
                                    {%>
                                         <td><input type="radio" name="TricomaCaule" value="7" checked disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                    <% }else
                                      { %>
                                         <td><input type="radio" name="TricomaCaule" value="7" disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                     <% } %>
                               
                            </tr>
                           
                             
                        </table>
                    
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.6 <% out.print(res.traduz(42,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod42").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="1" checked disabled />   <% out.print(res.traduz(43,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="1" disabled />   <% out.print(res.traduz(43,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod42").equals("2"))
                                                {%>
                                                      <td><input type="radio" name="ComprimentoPlanta" value="2" checked disabled />   <% out.print(res.traduz(44,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="2" disabled />   <% out.print(res.traduz(44,traducao));%></td>
                                                 <% } %>

                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod42").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="ComprimentoPlanta" value="3" checked disabled />   <% out.print(res.traduz(45,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="3" disabled />   <% out.print(res.traduz(45,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             <tr>
                                <%		 
                                if(rs.getString("cod42").equals("4"))
                                                {%>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="4" checked />   <% out.print(res.traduz(46,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="4" disabled />   <% out.print(res.traduz(46,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod42").equals("5"))
                                                {%>
                                                     <td><input type="radio" name="ComprimentoPlanta" value="5" checked disabled />   <% out.print(res.traduz(47,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                      <td><input type="radio" name="ComprimentoPlanta" value="5" disabled />   <% out.print(res.traduz(47,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                        </table>
                       
                </div>
                 <div class="field">
                    <label for="name">7.1.2.7 <% out.print(res.traduz(48,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod48").equals("3"))
                                                {%>
                                                     <td><input type="radio" name="HDCDP" value="3" checked />  3-<% out.print(res.traduz(49,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="HDCDP" value="3" disabled />  3-<% out.print(res.traduz(49,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod48").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="HDCDP" value="5" checked disabled />  5-<% out.print(res.traduz(50,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="HDCDP" value="5" disabled />  5-<% out.print(res.traduz(50,traducao));%></td> 
                                                 <% } %>

                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod48").equals("7"))
                                                {%>
                                                    <td><input type="radio" name="HDCDP" value="7" checked disabled />  7-<% out.print(res.traduz(51,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="HDCDP" value="7" disabled />  7-<% out.print(res.traduz(51,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod48").equals("9"))
                                                {%>
                                                     <td><input type="radio" name="HDCDP" value="9" checked disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="HDCDP" value="9" disabled />  9-<% out.print(res.traduz(20,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.8 <% out.print(res.traduz(52,traducao));%>:</label>
                    <input name="cod52" class="input2" type="text" value="<% if(!rs.getString("cod52").equals("-1")){out.print(rs.getString("cod52"));} %>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.9 <% out.print(res.traduz(53,traducao));%>:</label>
                    <input name="cod53" class="input2" type="text" value="<% if(!rs.getString("cod53").equals("-1")){out.print(rs.getString("cod53")); } %>" disabled/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.10 <% out.print(res.traduz(54,traducao));%>:</label>
                    <input name="cod54" class="input2" type="text" value="<% if(!rs.getString("cod54").equals("-1")){ out.print(rs.getString("cod54"));}  %>" disabled />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.11 <% out.print(res.traduz(55,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/fig1.png" id="imgpos"/></td>
                                <td><img src="./imagens/fig2.png" id="imgpos"/></td>
                                <td><img src="./imagens/fig3.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                    if(rs.getString("cod55").equals("3"))
                                    {%>
                                        <td><input type="radio" name="HDR" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                    <% }else
                                      { %>
                                        <td><input type="radio" name="HDR" value="3" disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                     <% } %>
                    <%		 
                    if(rs.getString("cod55").equals("5"))
                                    {%>
                                        <td><input type="radio" name="HDR"  value="5" checked disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                    <% }else
                                      { %>
                                         <td><input type="radio" name="HDR"  value="5" disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                     <% } %>

                    <%		 
                    if(rs.getString("cod55").equals("7"))
                                    {%>
                                          <td><input type="radio" name="HDR" value="7" checked disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                    <% }else
                                      { %>
                                          <td><input type="radio" name="HDR" value="7" disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                     <% } %>
                            </tr>
                           
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.12 <% out.print(res.traduz(56,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod56").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="perfilhamento" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="perfilhamento" value="3" disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod56").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="perfilhamento" value="5" checked disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="perfilhamento" value="5" disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                               <%		 
                            if(rs.getString("cod56").equals("7"))
                                            {%>
                                                 <td><input type="radio" name="perfilhamento" value="7" checked disabled />  7-<% out.print(res.traduz(12,traducao));%></td>  
                                            <% }else
                                              { %>
                                                  <td><input type="radio" name="perfilhamento" value="7" disabled />  7-<% out.print(res.traduz(12,traducao));%></td> 
                                             <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.13 <% out.print(res.traduz(57,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod57").equals("3"))
                                                {%>
                                                   <td><input type="radio" name="DensidadeFolha" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="DensidadeFolha" value="3" disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod57").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="DensidadeFolha" value="5" checked disabled />  5-<% out.print(res.traduz(50,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="DensidadeFolha" value="5" disabled />  5-<% out.print(res.traduz(50,traducao));%></td>
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod57").equals("7"))
                                                {%>
                                                      <td><input type="radio" name="DensidadeFolha" value="7" checked disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                                <% }else
                                                  { %>
                                                      <td><input type="radio" name="DensidadeFolha" value="7" disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.14 <% out.print(res.traduz(58,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod58").equals("1"))
                                                {%>
                                                     <td><input type="radio" name="corFolha" value="1" checked disabled />  1-<% out.print(res.traduz(19,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="corFolha" value="1" disabled />  1-<% out.print(res.traduz(19,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod58").equals("2"))
                                            {%>
                                               <td><input type="radio" name="corFolha" value="2" checked disabled />  2-<% out.print(res.traduz(14,traducao));%></td>
                                            <% }else
                                              { %>
                                                 <td><input type="radio" name="corFolha" value="2" disabled />  2-<% out.print(res.traduz(14,traducao));%></td>
                                             <% } %>
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod58").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="corFolha" value="3" checked disabled />  3-<% out.print(res.traduz(7,traducao));%></td>
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="corFolha" value="3" disabled />  3-<% out.print(res.traduz(7,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod58").equals("4"))
                                                {%>
                                                     <td><input type="radio" name="corFolha" value="4" checked disabled />  4-<% out.print(res.traduz(15,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                      <td><input type="radio" name="corFolha" value="4" disabled />  4-<% out.print(res.traduz(15,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod58").equals("5"))
                                                {%>
                                                    <td><input type="radio" name="corFolha" value="5" checked disabled />  5-<% out.print(res.traduz(16,traducao));%></td>  
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="corFolha" value="5" disabled />  5-<% out.print(res.traduz(16,traducao));%></td> 
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                            if(rs.getString("cod58").equals("6"))
                                            {%>
                                                <td><input type="radio" name="corFolha" value="6" checked disabled />  6-<% out.print(res.traduz(8,traducao));%></td>  
                                            <% }else
                                              { %>
                                                 <td><input type="radio" name="corFolha" value="6" disabled />  6-<% out.print(res.traduz(8,traducao));%></td> 
                                             <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod58").equals("7"))
                                                {%>
                                                     <td><input type="radio" name="corFolha" value="7" checked disabled />  7-<% out.print(res.traduz(18,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                      <td><input type="radio" name="corFolha" value="7" disabled />  7-<% out.print(res.traduz(18,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod58").equals("8"))
                                                {%>
                                                    <td><input type="radio" name="corFolha" value="8" checked disabled />  8-<% out.print(res.traduz(20,traducao));%></td>  
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="corFolha" value="8" disabled />  8-<% out.print(res.traduz(20,traducao));%></td> 
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                 <div class="field">
                    <label for="name">7.1.2.15 <% out.print(res.traduz(59,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/leafshape1.png"/></td>
                                <td><img src="./imagens/leafshape2.png"/></td>
                                <td><img src="./imagens/leafshape3.png"/></td>
                        
                            </tr>
                            <tr>
                                
                                <%		 
                        if(rs.getString("cod59").equals("1"))
                                        {%>
                                              <td><input type="radio" name="FormaFolha" value="1" checked disabled />  1-<% out.print(res.traduz(22,traducao));%></td>
                                        <% }else
                                          { %>
                                              <td><input type="radio" name="FormaFolha" value="1" disabled />  1-<% out.print(res.traduz(22,traducao));%></td>
                                         <% } %>

                        <%		 
                        if(rs.getString("cod59").equals("2"))
                                        {%>
                                             <td><input type="radio" name="FormaFolha" value="2" checked disabled />  2-<% out.print(res.traduz(23,traducao));%></td>
                                        <% }else
                                          { %>
                                             <td><input type="radio" name="FormaFolha" value="2" disabled />  2-<% out.print(res.traduz(23,traducao));%></td>
                                         <% } %>

                        <%		 
                        if(rs.getString("cod59").equals("3"))
                                        {%>
                                            <td><input type="radio" name="FormaFolha" value="3" checked disabled />  3-<% out.print(res.traduz(24,traducao));%></td>
                                        <% }else
                                          { %>
                                             <td><input type="radio" name="FormaFolha" value="3" disabled />  3-<% out.print(res.traduz(24,traducao));%></td>
                                         <% } %>
                                
                            </tr>
                           
                             
                        </table>
                    
                </div>
                 <div class="field">
                    <label for="name">7.1.2.16 <% out.print(res.traduz(60,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod60").equals("1"))
                                                {%>
                                                    <td><input type="radio" name="MargemFolha" value="1" checked disabled />  1-<% out.print(res.traduz(61,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="MargemFolha" value="1" disabled />  1-<% out.print(res.traduz(61,traducao));%></td> 
                                                 <% } %>
                                
                            </tr>
                            <tr>
                               <%		 
                                if(rs.getString("cod60").equals("2"))
                                                {%>
                                                    <td><input type="radio" name="MargemFolha" value="2" checked disabled />  2-<% out.print(res.traduz(62,traducao));%></td> 
                                                <% }else
                                                  { %>
                                                    <td><input type="radio" name="MargemFolha" value="2" disabled />  2-<% out.print(res.traduz(62,traducao));%></td> 
                                                 <% } %>
                            </tr>
                            <tr>
                                <%		 
                                if(rs.getString("cod60").equals("3"))
                                                {%>
                                                    <td><input type="radio" name="MargemFolha" value="3" checked disabled />  3-<% out.print(res.traduz(63,traducao));%></td>
                                                <% }else
                                                  { %>
                                                     <td><input type="radio" name="MargemFolha" value="3" disabled />  3-<% out.print(res.traduz(63,traducao));%></td>
                                                 <% } %>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.17 <% out.print(res.traduz(64,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td>Notas:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/leafpubescence1.png"/></td>
                                <td><img src="./imagens/leafpubescence2.png"/></td>
                                <td><img src="./imagens/leafpubescence3.png"/></td>
                        
                            </tr>
                            <tr>
                                <%		 
                        if(rs.getString("cod64").equals("3"))
                                        {%>
                                            <td><input type="radio" name="PDTNF" value="3" checked disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                        <% }else
                                          { %>
                                             <td><input type="radio" name="PDTNF" value="3" disabled />  3-<% out.print(res.traduz(10,traducao));%></td>
                                         <% } %>

                        <%		 
                        if(rs.getString("cod64").equals("5"))
                                        {%>
                                            <td><input type="radio" name="PDTNF" value="5" checked disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                        <% }else
                                          { %>
                                             <td><input type="radio" name="PDTNF" value="5" disabled />  5-<% out.print(res.traduz(11,traducao));%></td>
                                         <% } %>

                        <%		 
                        if(rs.getString("cod64").equals("7"))
                                        {%>
                                            <td><input type="radio" name="PDTNF"  value="7" checked disabled />  7-<% out.print(res.traduz(12,traducao));%></td>
                                        <% }else
                                          { %>
                                            <td><input type="radio" name="PDTNF"  value="7" disabled />  7-<% out.print(res.traduz(12,traducao));%></td> 
                                         <% } %>
                            </tr>     
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.18 <% out.print(res.traduz(65,traducao));%>:</label>
                    <input name="cod65" class="input2" type="text" value="<% if(!rs.getString("cod65").equals("-1")){ out.print(rs.getString("cod65"));}  %>" disabled />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.19 <% out.print(res.traduz(66,traducao));%>:</label>
                    <input name="cod66" class="input2" type="text" value="<% if(!rs.getString("cod66").equals("-1")){ out.print(rs.getString("cod66"));}  %>" disabled/>
                    
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
                    
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" onclick="goNext()" />
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack()" />
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>
