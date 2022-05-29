<%-- 
    Document   : localizacao
    Created on : 14/11/2014, 19:04:58
    Author     : Valdomiro
--%>

<%@page import="java.sql.Date"%>
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
            <a class="caminho"><% out.print(res.traduz(223,traducao));%>.</a>
            <!--Include.-->
        </div>
        
        
        <%
            int val;
            try{
                val = Integer.parseInt(request.getParameter("escolhido"));
                session.setAttribute("codigo",val);//seta secçaõ para pegar o codigo das consultas
            }catch(Exception ex){
                val = Integer.parseInt(session.getValue("codigo").toString());
            }
            
   
         
          %>
        <!---Abas---------->
        <ul id="nav2">
            <li class="active"><a href="localizacao.jsp" ><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class=""><a href="faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <%
           
          
          String array[] = new String[5];
          String data;
          
          if(session.getValue("codigo")!=null){
              val= Integer.parseInt(session.getValue("codigo").toString());
          }
          
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from local_coleta where Codigo = '"+val+"'");
             
            
          
              while(rs.next()){
                
                  
                  %>
         
        <div class="container">

		<form id="contactform" name="f2" class="rounded" method="post" action="faseplantula.jsp">
                    <input type="hidden" name="sel" value="<% out.print(val); %>"/>
		<h3><% out.print(res.traduz(229,traducao));%>:</h3>
		<div class="field">
			<label for="name"><% out.print(res.traduz(228,traducao));%>:</label>
			<input type="text" class="input" name="id" id="name" value="<%out.print(rs.getString("IDAmostra")); %>" disabled/>
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(230,traducao));%>:</label>
			<input type="text" class="input" name="esp" id="esp" value="<%out.print(rs.getString("especie")); %>" disabled/>
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(231,traducao));%>:</label>
                        <input type="text" class="input" name="variedade" id="var" value="<%out.print(rs.getString("variedade")); %>" disabled/>
			
		</div>
		
		<div class="field">
		<label for="cor"><% out.print(res.traduz(232,traducao));%>:</label>
                <input type="text" name="cor" class="input" value="<%out.print(rs.getString("cor")); %>" disabled/>
		
	        </div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(233,traducao));%>:</label>
			<input type="text" class="input" name="geracao" id="ger" value="<%out.print(rs.getString("geracao")); %>" disabled/>
			
		</div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(234,traducao));%>:</label>
			<input type="text" class="input" name="produtor" id="prod" value="<%out.print(rs.getString("nomeProdutor")); %>" disabled />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(235,traducao));%>:</label>
			<input type="text" class="input" name="coordenadas" id="cord" value="<%out.print(rs.getString("coordenadas")); %>" disabled/>
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(236,traducao));%>:</label>
			<input type="text" class="input" name="localiza" id="localiz" value="<%out.print(rs.getString("localizacao")); %>" disabled/>
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(237,traducao));%>:</label>
			<input type="text" class="input" name="tel" id="tel" value="<%out.print(rs.getString("telefone")); %>" disabled />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(238,traducao));%>:</label>
                        <input type="text" name="data" id="data" value="<%out.print(rs.getString("dataColeta")); %>" disabled />
			
		</div>
                <div class="field">
			<label for="ob"><% out.print(res.traduz(239,traducao));%>:</label>
                        <textarea  class="input" name="obs" id="obs" disabled><%out.print(rs.getString("observacao")); %></textarea>
			
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
                 
                 
                 
		</form> 
</div>
        <br>
        <br>
        
        
    <%@include file="rodape.jsp" %>  
    </body>
</html>
