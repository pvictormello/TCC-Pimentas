<%-- 
    Document   : Faleconosco
    Created on : 08/05/2015, 13:56:10
    Author     : Valdomiro
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formulario.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
    <script src="jquery/mensage.js" type="text/javascript"></script>
    <link href="css/mensage.css" rel="stylesheet" type="text/css" />
      
        
        

        <script type="text/javascript">
$(function($) {
	// Quando o formulário for enviado, essa função é chamada
	$("#form").submit(function() {
		// Colocamos os valores de cada campo em uma váriavel para facilitar a manipulação
		var nome = $("#name").val();
		var email = $("#emails").val();
		var cpf = $("#cpf").val();
                var tel = $("#phone").val();
                var endereco = $("#end").val();
                var inst = $("#inst").val();
                var mensagem = $("#message").val();
                
                
               
		// Exibe mensagem de carregamento
		//$("#status").html("<img src='./imagens/loading.gif' alt='Enviando..' />");
                
		
		$.post('enviar.jsp', {nome: nome,email: email, cpf: cpf,tel: tel,end: endereco,inst: inst, mensagem: mensagem }, function(resposta) {
				// Quando terminada a requisição
				// Exibe a div status
                               
                               var resp= parseInt(resposta.toString());
                                
                                //$("#status").html("Mensagem enviada com sucesso!");
				//$("#status").slideDown();
				// Se a resposta é um erro
				if (resp==0) {
					// Exibe o erro na div
					$("#status").html(resposta);
				} 
				// Se resposta for false, ou seja, não ocorreu nenhum erro
				else {
					
					$("#status").html("Mensagem enviada com sucesso!");
					// Coloca a mensagem no div de mensagens
					$("#mensagens").prepend("<strong>"+ nome +"</strong> disse: <em>" + mensagem + "</em><br />");
					// Limpando todos os campos
					
                                         $("#name").val("");
                                         $("#emails").val("");
                                         $("#cpf").val("");
                                         $("#phone").val("");
                                         $("#end").val("");
                                         $("#inst").val("");
                                         $("#message").val("");
				}
                                
		});
                
                $().toastmessage('showSuccessToast', "  Mensagem enviada! ...");
	});
        
                ///aqui
                
                
                 
                        
                       // $("#status" ).dialog();
                        //$("p").prepend("<p>Mensagem enviado com sucesso!<p>");
                        //$("#status").html("<p>Mensagem enviada com sucesso!<p>");
                
                
                //$('enviando').fadeOut('fast');
           $(document).ready(function(){
            $("#enviar").click(function(){
               
               //$().toastmessage('showSuccessToast', "  Mensagem enviada! ...");
           
            });
        });
        
        
});

   
</script>

        <title></title>
        
      
       
    </head>
    <body>
        <%@page import="com.projetoemail.email.*" %>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
        <!-------------BreadCrum------------------------------------->
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./Faleconosco.jsp" title="Ir para o Inicio"><% out.print(res.traduz(266,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(270,traducao));%>.</a>
            <!--Include.-->
        </div>
            
         <div id="status" class="" title="Mensagem">
             <p></p>
         </div> 
        
        
         <div id="status"></div>
        <div id="form-wrapper" class="myform">
            <form id="form" name="form" method="post" action="">
 
                <h1><% out.print(res.traduz(270,traducao));%></h1>
                <p><% out.print(res.traduz(271,traducao));%></p>
 
                <label for="name"><% out.print(res.traduz(249,traducao));%>
                    <span class="small"><% out.print(res.traduz(276,traducao));%></span>
                </label>
                <input type="text" name="name" placeholder="Ex: Tio ben" id="name" required />
 
                <label for="email"><% out.print(res.traduz(196,traducao));%>
                    <span class="small"><% out.print(res.traduz(277,traducao));%></span>
                </label>
                <input type="text" name="email" placeholder="mail@example.com" id="emails" onBlur="validaEmail();" required />
                
                <label for="cpf"><% out.print(res.traduz(273,traducao));%>
                    <span class="small"><% out.print(res.traduz(279,traducao));%></span>
                </label>
                <input type="text" name="cpf" placeholder="111.111.111-11" id="cpf" onBlur="ValidarCPF(form.cpf);" onKeyPress="MascaraCPF(form.cpf);" required />
 
                <label for="phone"><% out.print(res.traduz(237,traducao));%>
                    <span class="small"><% out.print(res.traduz(278,traducao));%>.</span>
                </label>
                <input type="text" name="phone" placeholder="(34) 3842-3842" id="phone" onKeyPress="MascaraTelefone(form.phone);" onBlur="ValidaTelefone(form.phone);" required/>
                
                <label for="phone"><% out.print(res.traduz(275,traducao));%>
                    <span class="small"><% out.print(res.traduz(280,traducao));%>.</span>
                </label>
                <input type="text" name="end" placeholder="Rua, Numero ,bairro, cidade, estado, país" id="end" required />
                
                <label for="web"><% out.print(res.traduz(274,traducao));%>
                    <span class="small"><% out.print(res.traduz(281,traducao));%></span>
                </label>
                <input id="inst" type="text" placeholder="Universidade Federal de Uberlândia" name="inst" required/>
 
                <label for="message"><% out.print(res.traduz(272,traducao));%>
                    <span class="small"><% out.print(res.traduz(282,traducao));%></span>
                </label>
                <textarea placeholder="" name="message" id="message"  rows="10"></textarea>
 
                <button type="submit" id="enviar"><% out.print(res.traduz(198,traducao));%></button>
                
               
                
                
                
                <div class="spacer"></div>
 
            </form>
        </div>
                
                <br>
        <br>
        
        
    <%@include file="rodape.jsp" %> 
              
    </body>
</html>