<%@page import="java.sql.*" %>
<%@page import="java.sql.Driver"%> 

	<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[0].toString().charAt(2)!='1'){
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
            <a class="caminho" href="/SistemaGermo/Consulta.jsp" title="Ir para o Inicio"><% out.print(res.traduz(243,traducao));%></a> �
            <a class="caminho"><% out.print(res.traduz(206,traducao));%></a>
            <!--Include.-->
        </div>
       
       <%
          String val = request.getParameter("escolhido");
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from usuario where email = '"+val+"'");
             
            
          
              while(rs.next()){
                 
                  %>
                  
                  
         
        
           <div class="container">
         
 
                          
	     <form id="contactform" name="f1" class="rounded" method="post" action="">
               
		<div class="field">
			<label for="name"><% out.print(res.traduz(187,traducao));%>:</label>
                        <input type="text" class="input" name="nome" id="name" value="<% out.print(rs.getString("nome")); %>" disabled/>
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(188, traducao)); %>:</label>
			<input type="text" class="input" name="cidade" id="cidade" value="<% out.print(rs.getString("cidade")); %>" disabled />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(189,traducao)); %>:</label>
			<input type="text" class="input" name="estado" id="estado" value="<% out.print(rs.getString("estado")); %>" disabled />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(190,traducao)); %>:</label>
                        <input type="text" class="input" name="pais" id="pais" value="<% out.print(rs.getString("pais")); %>" disabled />
			
		</div>
		<div class="field">
		<label for="tp"><% out.print(res.traduz(191,traducao)); %>:</label>
                <% if(rs.getString("tipousuario").equals("Estudante"))
                {
                    %>
                    <input type="radio" name="estudante" value="Estudante" checked disabled /><% out.print(res.traduz(193,traducao)); %>:
                    <%
                }else {
                    %>
                    <input type="radio" name="estudante" value="Estudante" disabled/><% out.print(res.traduz(193,traducao)); %>:
                    <%
                    }
                    if(rs.getString("tipousuario").equals("Pesquisador"))
                    {
                    %>
                        <input type="radio" name="estudante" value="Pesquisador" checked disabled /><% out.print(res.traduz(194,traducao)); %>
                        <%
                    }else{
                        %>
                            <input type="radio" name="estudante" value="Pesquisador" disabled/><% out.print(res.traduz(194,traducao)); %>
                         <%
                    }
                    if(rs.getString("tipousuario").equals("Profissional"))
                    {
                        %>
                        <input type="radio" name="estudante" value="Profissional" checked disabled /><% out.print(res.traduz(195,traducao)); %>
                        <%
                    }else
                    {
                        %>
                        <input type="radio" name="estudante" value="Profissional" disabled /><% out.print(res.traduz(195,traducao)); %>:
                        <%
                    }
                
                
                %>
		
                
                
	        </div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(212,traducao )); %>:</label>
			<input type="text" class="input" name="localidade" value="<% out.print(rs.getString("localidade")); %>" disabled/>
	
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(196,traducao)); %>:</label>
			<input type="text" class="input" name="email" id="email" value="<% out.print(rs.getString("email")); %>" disabled />
	
		</div>
		
		<fieldset><legend><% out.print(res.traduz(202,traducao )); %></legend>
		<center><table>
		    
		
		    <tr>
			 
			 <td><a><u><% out.print(res.traduz(201,traducao)); %></u></a></td>
                         <td><a><u><% out.print(res.traduz(211,traducao)); %></u></a></td>
                          <td><a><u><% out.print(res.traduz(245,traducao)+" "+res.traduz(201,traducao)); %></u>&nbsp;&nbsp;&nbsp;</a></td>
                          <td><a><u><% out.print(res.traduz(245,traducao)+" "+res.traduz(244,traducao)); %></u></a></td>
			  
			</tr>
			<tr>
                            <%
                              String permissao ;
                              permissao = rs.getString("permissao");
                              String array[] = new String[4];  
                              array = permissao.split("-"); 
                               array[0].toString().charAt(0);
                              if(array[0].toString().charAt(0)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="u1" id="op" class="tam" checked disabled/><% out.print(res.traduz(207,traducao)); %></td>
                                  <%
                              }else{
                                  %>
                                  <td><input type="checkbox" name="u1" id="op" class="tam" disabled /><% out.print(res.traduz(207,traducao)); %></td>
                                  <%
                              }
                              if(array[1].toString().charAt(0)=='1')
                              {
                                  %>
                                   <td><input type="checkbox" name="p1" id="op" class="tam" checked disabled /><% out.print(res.traduz(207,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                  <td><input type="checkbox" name="p1" id="op" class="tam" disabled/><% out.print(res.traduz(207,traducao)); %></td>
                                  <%
                              }
                              if(array[2].toString().charAt(0)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="ru1" id="op" class="tam" checked disabled /><% out.print(res.traduz(263,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="ru1" id="op" class="tam" disabled/><% out.print(res.traduz(263,traducao)); %></td>
                                  <%
                                  
                              }
                              if(array[3].toString().charAt(0)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="rp1" id="op" class="tam" checked disabled /><% out.print(res.traduz(263,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="rp1" id="op" class="tam" disabled/><% out.print(res.traduz(263,traducao)); %></td>
                                  <%
                                  
                              }
			  
			  
			  %>
			</tr>
			<tr>
                            <%
			        if(array[0].toString().charAt(1)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="u2" id="op" class="tam" checked disabled/><% out.print(res.traduz(208,traducao)); %></td>
                                  <%
                              }else{
                                  %>
                                  <td><input type="checkbox" name="u2" id="op" class="tam" disabled /><% out.print(res.traduz(208,traducao)); %></td>
                                  <%
                              }
                              if(array[1].toString().charAt(1)=='1')
                              {
                                  %>
                                   <td><input type="checkbox" name="p2" id="op" class="tam" checked disabled /><% out.print(res.traduz(208,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                  <td><input type="checkbox" name="p2" id="op" class="tam" disabled/><% out.print(res.traduz(208,traducao)); %></td>
                                  <%
                              }
                              if(array[2].toString().charAt(1)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="ru2" id="op" class="tam" checked disabled /><% out.print(res.traduz(188,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="ru2" id="op" class="tam" disabled/><% out.print(res.traduz(188,traducao)); %></td>
                                  <%
                                  
                              }
                              if(array[3].toString().charAt(1)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="rp2" id="op" class="tam" checked disabled /><% out.print(res.traduz(269,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="rp2" id="op" class="tam" disabled/><% out.print(res.traduz(269,traducao)); %></td>
                                  <%
                                  
                              }
                          %>
			</tr>
			<tr>
			    <%
			        if(array[0].toString().charAt(2)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="u3" id="op" class="tam" checked disabled/><% out.print(res.traduz(209,traducao)); %></td>
                                  <%
                              }else{
                                  %>
                                  <td><input type="checkbox" name="u3" id="op" class="tam" disabled /><% out.print(res.traduz(209,traducao)); %></td>
                                  <%
                              }
                              if(array[1].toString().charAt(2)=='1')
                              {
                                  %>
                                   <td><input type="checkbox" name="p3" id="op" class="tam" checked disabled/><% out.print(res.traduz(209,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                  <td><input type="checkbox" name="p3" id="op" class="tam" disabled/><% out.print(res.traduz(209,traducao)); %></td>
                                  <%
                              }
                              if(array[2].toString().charAt(2)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="ru3" id="op" class="tam" checked disabled /><% out.print(res.traduz(249,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="ru3" id="op" class="tam" disabled/><% out.print(res.traduz(249,traducao)); %></td>
                                  <%
                                  
                              }
                              if(array[3].toString().charAt(2)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="rp3" id="op" class="tam" checked disabled /><% out.print(res.traduz(230,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="rp3" id="op" class="tam" disabled/><% out.print(res.traduz(230,traducao)); %></td>
                                  <%
                                  
                              }
                          %>
			</tr>
			<tr>
			    <%
			        if(array[0].toString().charAt(3)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="u4" id="op" class="tam" checked disabled/><% out.print(res.traduz(210,traducao)); %></td>
                                  <%
                              }else{
                                  %>
                                  <td><input type="checkbox" name="u4" id="op" class="tam" disabled/><% out.print(res.traduz(210,traducao)); %></td>
                                  <%
                              }
                              if(array[1].toString().charAt(3)=='1')
                              {
                                  %>
                                   <td><input type="checkbox" name="p4" id="op" class="tam" checked disabled/><% out.print(res.traduz(210,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                  <td><input type="checkbox" name="p4" id="op" class="tam" disabled/><% out.print(res.traduz(210,traducao)); %></td>
                                  <%
                              }
                              if(array[2].toString().charAt(3)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="ru4" id="op" class="tam" checked disabled /><% out.print(res.traduz(190,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="ru4" id="op" class="tam" disabled/><% out.print(res.traduz(190,traducao)); %></td>
                                  <%
                                  
                              }
                              if(array[3].toString().charAt(3)=='1')
                              {
                                  %>
                                  <td><input type="checkbox" name="rp4" id="op" class="tam" checked disabled /><% out.print(res.traduz(251,traducao)); %></td>
                                  <%
                              }else
                              {
                                  %>
                                   <td><input type="checkbox" name="rp4" id="op" class="tam" disabled/><% out.print(res.traduz(251,traducao)); %></td>
                                  <%
                                  
                              }
                          %>
                           
			</tr>
                        <tr>
                            
                            <td></td>
                            <td></td>
                            <% if(array[2].toString().charAt(4)=='1')
                                { %>
                                    <td><input type="checkbox" name="ru5" id="op" class="tam" checked disabled /><% out.print(res.traduz(191,traducao)); %></td>
                                <%
                                }else
                                {
                                    %>
                                        <td><input type="checkbox" name="ru5" id="op" class="tam" disabled/><% out.print(res.traduz(191,traducao)); %></td>
                                    <%
                                }
                            
                            %>
                             <% if(array[3].toString().charAt(4)=='1')
                                { %>
                                    <td><input type="checkbox" name="rp5" id="op" class="tam" checked disabled /><% out.print(res.traduz(267,traducao)); %></td>
                                <%
                                }else
                                {
                                    %>
                                        <td><input type="checkbox" name="rp5" id="op" class="tam" disabled/><% out.print(res.traduz(267,traducao)); %></td>
                                    <%
                                }
                            
                            %>
                            
                        </tr>
                        <tr>
                            <td></td>
			    <td></td>
                            <td></td>
                            <% if(array[3].toString().charAt(5)=='1')
                                { %>
                                    <td><input type="checkbox" name="rp6" id="op" class="tam" checked disabled /><% out.print(res.traduz(268,traducao)); %></td>
                                <%
                                }else
                                {
                                    %>
                                        <td><input type="checkbox" name="rp6" id="op" class="tam" disabled/><% out.print(res.traduz(268,traducao)); %></td>
                                    <%
                                }
                            
                            %>
                            
                        </tr>
			 
		</table></center>
		</fieldset>
		 
                          <input type="button" name="Submit"  class="button" value=">> <% out.print(res.traduz(240,traducao));%>" onclick="NewConsult()" />
		</form> 
               
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
       <br>
       <br>
      <!-- <footer id="colophon" class="rodape" role="contentinfo">
	  <div class="clearfix container">
	    <div class="info">
              	&copy;Valdomiro C&M 2014. Todos os direitos reservados.
                
	   </div>
           <div class="credito">
               <a href="">UFU Campus Monte Carmelo </a>
	   </div>
	 </div>
	</footer>--->
        <!----Rodape--------------------->
       
      <%@include file="rodape.jsp" %> 

    </body>
</html>
