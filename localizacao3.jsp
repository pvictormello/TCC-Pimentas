<%-- 
    Document   : localizacao3
    Created on : 20/11/2014, 07:33:37
    Author     : Valdomiro
--%>

<%@page import="java.sql.Date"%>
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
        
        <title></title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
        <script type="text/javascript">
        
        $(document).ready(function() {
          
            $('input').blur(function() {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                var value = $(this).val();
               
                $.post('setValores.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
       
                });
                
            });
            $(":input").bind('keyup change click',function(e) {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                var value = $(this).val();
                
                $.post('setValores2.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
                    
                 });
                
                });
                  
   });      
    

      </script>
        
    </head>
    <body>
        <% 
            
           // traducao = session.getValue("traducao").toString();

        %>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./localizacao3.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao3.jsp" ><% out.print(res.traduz(208,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(223,traducao));%>.</a>
            <!--Include.-->
        </div>
      
        <!---Abas---------->
        <ul id="nav2">
            <li class="active"><a href="localizacao3.jsp" ><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class=""><a href="faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	    <%--<li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <%
            int val;
            int flag=0;
            try{
                 val = Integer.parseInt(request.getParameter("escolhido"));
                 session.setAttribute("esc", val);
                 
            }catch(Exception ex){
                val= Integer.parseInt(session.getValue("esc").toString());
                flag=1;
            }

          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          if(flag==0){
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from local_coleta where Codigo = '"+val+"'");
             
            
          
              while(rs.next()){
                 
                  
                  session.putValue("loc1",rs.getString("IDAmostra"));
                  session.putValue("loc2",rs.getString("especie"));
                  session.putValue("loc3",rs.getString("variedade"));
                  session.putValue("loc4",rs.getString("cor"));
                  session.putValue("loc5",rs.getString("geracao"));
                  session.putValue("loc6",rs.getString("nomeProdutor"));
                  session.putValue("loc7",rs.getString("coordenadas"));
                  session.putValue("loc8",rs.getString("localizacao"));
                  session.putValue("loc9",rs.getString("telefone"));
                  session.putValue("loc10",rs.getString("dataColeta"));
                  session.putValue("loc11",rs.getString("observacao"));
                  
                  
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
          }
	%>	
         
        <div class="container">

		<form id="contactform" name="f2" class="rounded" method="post" action="faseplantula3.jsp">
                    <input type="hidden" name="sel" value="<% out.print(val); %>"/>
		<h3><% out.print(res.traduz(229,traducao));%>:</h3>
		<div class="field">
			<label for="name"><% out.print(res.traduz(228,traducao));%>:</label>
			<input type="text" class="input" name="id" id="loc1" value="<% if(session.getValue("loc1")!= null){out.print(session.getValue("loc1"));} %>" /><%--<out.print(rs.getString("IDAmostra"));---%> 
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(230,traducao));%>:</label>
			<input type="text" class="input" name="esp" id="loc2" value="<% if(session.getValue("loc2")!= null){out.print(session.getValue("loc2"));} %>" />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(231,traducao));%>:</label>
                        <input type="text" class="input" name="variedade" id="loc3" value="<% if(session.getValue("loc3")!= null){out.print(session.getValue("loc3"));} %>"/>
			
		</div>
		
		<div class="field">
		<label for="cor"><% out.print(res.traduz(232,traducao));%>:</label>
                <input type="text" name="cor" class="input" id="loc4" value="<% if(session.getValue("loc4")!= null){out.print(session.getValue("loc4"));} %>"/>
		
	        </div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(233,traducao));%>:</label>
			<input type="text" class="input" name="geracao" id="loc5" value="<% if(session.getValue("loc5")!= null){out.print(session.getValue("loc5"));} %>"/>
			
		</div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(234,traducao));%>:</label>
			<input type="text" class="input" name="produtor" id="loc6" value="<% if(session.getValue("loc6")!= null){out.print(session.getValue("loc6"));} %>" />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(235,traducao));%>:</label>
			<input type="text" class="input" name="coordenadas" id="loc7" value="<% if(session.getValue("loc7")!= null){out.print(session.getValue("loc7"));} %>" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(236,traducao));%>:</label>
			<input type="text" class="input" name="localiza" id="loc8" value="<% if(session.getValue("loc8")!= null){out.print(session.getValue("loc8"));} %>" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(237,traducao));%>:</label>
			<input type="text" class="input" name="tel" id="loc9" value="<% if(session.getValue("loc9")!= null){out.print(session.getValue("loc9"));} %>" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(238,traducao));%>:</label>
                        <input type="date" name="data" id="loc10" value="<% if(session.getValue("loc10")!= null){out.print(session.getValue("loc10"));} %>"  />
			
		</div>
                <div class="field">
			<label for="ob"><% out.print(res.traduz(239,traducao));%>:</label>
                        <textarea  class="input" name="obs" id="loc11" ><%if(session.getValue("loc11")!= null){out.print(session.getValue("loc11"));} %></textarea>
			
		</div>
                       
		
		

                 <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" />
                 
                 
		</form> 
</div>
        <br>
        <br>
        
        
    <%@include file="rodape.jsp" %>  
    </body>
</html>

