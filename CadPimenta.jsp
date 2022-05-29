<%-- 
    Document   : CadPimenta local de coleta
    Created on : 18/09/2014, 08:48:48
    Author     : Valdomiro
--%>

<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[1].toString().charAt(0)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
        
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />--->
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        
        <title></title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        
   <script type="text/javascript">
     $(document).ready(function() {
            $('input').blur(function() {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                var value = $(this).val();
                
               if($("input[name='id']").val()!=null&& $("input[name='id']").val().trim()!=''){
                 $("#link"). attr ( "href" ,"CadPimenta2.jsp"); 
             
              }else{
                 $("#link"). attr ( "href" ,"? link= bloqueado"); 
              }
               
                $.post('setValores.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
       
                });
                
            });
            
            $(":input").bind('keyup change click',function(e) {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                //var value = $(this).attr('value');
                var value = $(this).val();
                $.post('setValores.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
                    
                 });
 
                });
    
   });           

    </script>
         
 

     </head>
    <body>
        <%
             //traducao = session.getValue("traducao").toString();
        %>
        
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
        <!-------------BreadCrum------------------------------------->
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./CadPimenta.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./CadPimenta.jsp" ><% out.print(res.traduz(207,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(223,traducao));%>.</a>
            <!--Include.-->
        </div>
        
        <!---Abas---------->
        <ul id="nav2">
	    <li class="active"><a href="CadPimenta.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
            <li class=""><a id="link" ><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225, traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226, traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(227, traducao ));%></a></li>---%>
	</ul>
        
        <div class="container">

		<form id="contactform" name="f2" class="rounded" method="post" action="CadPimenta2.jsp">
		<h3><% out.print(res.traduz(229, traducao));%>:</h3>
		<div class="field">
			<label for="name"><% out.print(res.traduz(228, traducao ));%>:</label>
                        <input type="text" class="input" name="id" id="nome" value="<% if(session.getValue("nome")!= null){out.print(session.getValue("nome"));} %>" required/>
			
		</div>
		<div class="field">
			<label for="esp"><% out.print(res.traduz(230,traducao));%>:</label>
			<input type="text" class="input" name="esp" id="especie" value="<% if(session.getValue("especie")!= null){out.print(session.getValue("especie"));} %>" required/>
			
		</div>
		<div class="field">
			<label for="var"><% out.print(res.traduz(231,traducao));%>:</label>
                        <input type="text" class="input" name="variedade" id="var" value="<% if(session.getValue("var")!= null){ out.print(session.getValue("var").toString());} %>" required />
			
		</div>
		
		<div class="field">
		<label for="cor"><% out.print(res.traduz(232,traducao));%>:</label>
                <input type="text" name="cor" id="cor" class="input" value="<% if(session.getValue("cor")!= null){out.print(session.getValue("cor"));} %>" required/>
		
	        </div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(233,traducao));%>:</label>
			<input type="text" class="input" name="geracao" id="ger" value="<% if(session.getValue("ger")!= null){out.print(session.getValue("ger"));} %>" required />
			
		</div>

		<div class="field">
			<label for="email"><% out.print(res.traduz(234,traducao));%>:</label>
                        <input type="text" class="input" name="produtor" id="prod" value="<% if(session.getValue("prod")!= null){out.print(session.getValue("prod"));} %>" required />
			
		</div>
		<div class="field">
			<label for="email"><% out.print(res.traduz(235,traducao));%>:</label>
			<input type="text" class="input" name="coordenadas" id="cord" value="<% if(session.getValue("cord")!= null){out.print(session.getValue("cord"));} %>" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(236,traducao));%>:</label>
			<input type="text" class="input" name="localiza" id="localiz" required value="<% if(session.getValue("localiz")!= null){out.print(session.getValue("localiz"));} %>" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(237,traducao ));%>:</label>
			<input type="text" class="input" name="tel" id="tele" value="<% if(session.getValue("tele")!= null){out.print(session.getValue("tele"));} %>" onKeyPress="MascaraTelefone(f2.tel);" onBlur="ValidaTelefone(f2.tel);" />
			
		</div>
                <div class="field">
			<label for="email"><% out.print(res.traduz(238,traducao));%>:</label>
			<input type="date"  name="dat" id="data" value="<% if(session.getValue("data")!= null){out.print(session.getValue("data"));} %>" onBlur="validaData();" />
			<!--<p class="hint">Informe a data de coleta.</p>-->
		</div>
                <div class="field">
			<label for="ob"><% out.print(res.traduz(239,traducao));%>:</label>
                        <textarea  class="input" name="obs" id="obs" ><% if(session.getValue("obs")!= null){out.print(session.getValue("obs"));} %></textarea>
			
		</div>
		
		
		

                 <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" />
                 <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao));%>">
                 
		</form> 
</div>
        <br>
        <br>
        
        
    <%@include file="rodape.jsp" %>  
    </body>
</html>
