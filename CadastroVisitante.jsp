<%-- 
    Document   : CadastroVisitante
    Created on : 07/07/2015, 20:50:04
    Author     : Valdomiro
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <title></title>
       <script type="text/javascript" src="js/script.js" charset="UTF-8"></script>
       <!--<script type="text/javascript" src="aplicacao.js"></script>-->
       <!-- Inclusão do Jquery -->

      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	  <script type="text/javascript" src="jquery/validasenha.js"></script>
      <script type="text/javascript">
         
 $(function(){ 
      $("input[name='email']").blur( function(){  
      //var email = $("input[name='email']").val();
      
      var email= $('#em').val();
      if(email != "")
         {
    	   var filtro = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    		if(filtro.test(email))
		{
                    $.post('verifica.jsp',{email: email},function(data){
                    var x = parseInt(data);
           
                   if(x==1)
                   { 
                      $("#sub").hide();// esconde o campo de submissao
                      $('#em').css('border', '3px #C33 solid');
                    alert("Email já cadastrado! Cadastre um email válido para continuar");
        
                   }else 
                   {
                      $("#sub").show();// mostra o campo de submissão  
                      $('#em').css('border', '1px #b9bdc1 solid');
                      
                   }

                });
		 
		  return true;
		} else {
      			alert("Este endereço de email não é válido!");
                        $("#sub").hide();
    			 return false;
			}
	} else {
		alert('Digite um email!'); 
                return false;
	       }

       
        });
   });   
    

      </script>
      
    </head>
    <body>
       
        <% 
           Cookie cookie3 = null; 
           Cookie[] cookies3 = null;
           cookies3 = request.getCookies(); 
           if(cookies3!=null){
           for (int i = 0; i < cookies3.length; i++)
                { 
                    cookie3 = cookies3[i]; 
                    if(cookie3.getName().equals("Traducao")){
                        //out.print("Traducao "+cookie2.getName()+" "+cookie2.getValue());
                       traducao = cookie3.getValue();
                       //out.print("Traducao no cadastro "+traducao);
                    }
                }
           }
           else
           {
               traducao="por";
           }
           
      
           
        %>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %> 
   
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="/SistemaGermo/Cadastro.jsp" title="Ir para o Inicio"><% out.print(res.traduz(243,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(207,traducao));%></a>
            <!--Include.-->
        </div>
       
         
          <div class="container">
     
		<form id="contactform" name="f1" class="rounded" method="post" action="gravaVisitante.jsp">
		
		<div class="field">
                    <label for="name"><% out.print(res.traduz(187,traducao));%>:</label>
			<input type="text" class="input" name="nome" placeholder="<% out.print(res.traduz(187,traducao));%>" id="name" required />
			<p class="hint"><% out.print(res.traduz(213,traducao));%>.</p>
		</div>
		<div class="field">
                    <label><% out.print(res.traduz(188, traducao)); %>:</label>
			<input type="text" class="input" name="cidade" id="cidade" placeholder="<% out.print(res.traduz(188,traducao)); %>" required/>
			<p class="hint"><% out.print(res.traduz(214,traducao));%>.</p>
		</div>
		<div class="field">
                    <label><% out.print(res.traduz(189,traducao)); %>:</label>
                    <input type="text" class="input" name="estado" id="estado" placeholder="<% out.print(res.traduz(189,traducao)); %>" required />
			<p class="hint"><% out.print(res.traduz(215,traducao));%>.</p>
		</div>
		<div class="field">
			<label><% out.print(res.traduz(190,traducao)); %>:</label>
			<input type="text" class="input" name="pais" id="pais" placeholder="<% out.print(res.traduz(190,traducao)); %>" required />
			<p class="hint"><% out.print(res.traduz(216,traducao));%>.</p>
		</div>
		<div class="field">
		<label for="tp"><% out.print(res.traduz(191,traducao)); %>:</label>
		<input type="radio" name="estudante" value="Estudante"/><% out.print(res.traduz(193,traducao)); %>
                <input type="radio" name="estudante" value="Pesquisador" /><% out.print(res.traduz(194,traducao)); %>
                <input type="radio" name="estudante" value="Profissional"/><% out.print(res.traduz(195,traducao)); %>
	        </div>
                <div class="field">
			<label><% out.print(res.traduz(212,traducao )); %>:</label>
			<input type="text" class="input" name="localidade" placeholder="<% out.print(res.traduz(212,traducao));%>" required/>
			<p class="hint"><% out.print(res.traduz(217,traducao));%>.</p>
		</div>
		<div class="field">
			<label><% out.print(res.traduz(196,traducao)); %>:</label>
			<input type="text" class="input" name="email" id="em" placeholder="<% out.print(res.traduz(196,traducao)); %> " />
			<p class="hint"><% out.print(res.traduz(218,traducao));%>.</p>
                        <div id="mensagem">
                            
                        </div>
		</div>
                
		<div class="field">
			<label><% out.print(res.traduz(197,traducao )); %>:</label>
                        <input type="password" class="input" name="senha" id="senha" placeholder="<% out.print(res.traduz(197,traducao)); %>" required  />
			<p class="hint"><%out.print(res.traduz(219,traducao));%>.</p>
		</div>
		<div class="field">
			<label><% out.print(res.traduz(203,traducao)); %>:</label>
                        <input type="password" class="input" name="senha2" id="senha2" placeholder="<% out.print(res.traduz(203,traducao)); %>"/>
			<p class="hint"><% out.print(res.traduz(203,traducao));%>.</p>
		</div>
		
	
                <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao)); %>">
		<input type="submit" name="Submit" id="sub" class="button" value="<% out.print(res.traduz(198,traducao )); %>" />
		</form> 
          </div>
            <br>
           <footer id="colophon" class="rodape" role="contentinfo">
	  <div class="clearfix container">
	    <div class="info">
              	&copy;Valdomiro C&M 2014. Todos os direitos reservados.
                
	   </div>
           <div class="credito">
               <a href="">UFU Campus Monte Carmelo </a>
	   </div>
	 </div>
	</footer>
                        
    </body>
</html>
