<%-- 
    Document   : login2
    Created on : 07/07/2015, 15:18:01
    Author     : Valdomiro
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel=stylesheet type="text/css" href="css/login2.css"> 
		 <link rel="stylesheet" href="css/formulario.css" type="text/css" media="screen" />
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> 
        <title></title>
        <script type="text/javascript">
          $(document).ready(function(){
   	
      $("#submit2").click(function() {
          var x;
          var email= $('#email2').val();
          var senha= $('#pass2').val();
          
          if(email != ""){
               var filtro = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    		if(filtro.test(email))
                {
                     $.post('validaLogin.jsp',{email: email,senha: senha},function(data){
                     x = parseInt(data);
                   
                    if(x==0)
                    {

                        alert("E-mail ou senha inv\u00e1lidos !");
                        $('#email2').css('border', '3px #C33 solid');
                        $('#pass2').css('border', '3px #C33 solid');
                        $("#invalido2").addClass("mensagemError");
                        $("#invalido2").html("Email ou senha inv\u00e1lidos !");
                        $("#invalido2").css({"color":"red","font-size": "12px"});
                        //$('#logoff').attr('disabled', 'disabled');
                    }else
                    {

                        $(location).attr("href","Home.jsp");
                        $('#email2').css('border', '1px #25a4b0 solid ');
                        $('#pass2').css('border', '1px #25a4b0 solid ');
                        $("#invalido2").removeClass("mensagemError");
                        $("#invalido2").html("").remove("Email ou senha inv\u00e1lidos !");
                        $("#logado").addClass("logado");
                        //$('#logoff').removeAttr('disabled');

                    }
                });
                return true;
            }else {
      		  alert("Este endereço de email não é válido!");
                   return false;
		}
      }else{
          alert('Digite um email!'); 
           return false;
        }           
      });   
           
});
      </script>
    </head>
    
    <body class="login">
        
       
		<%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %> 
       
        <!-------------BreadCrum------------------------------------->
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho"></a> »
            <a class="caminho">Login.</a>
           
        </div>
         <br>

    <div class="content">
 
    <form method="POST" class="" action="">

        <h3 class="form-title"><% out.print(res.traduz(286,traducao));%></h3>
              
        <div class="control-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9"><% out.print(res.traduz(196,traducao));%></label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="<% out.print(res.traduz(196,traducao));%>" id="email2" name="email" value="" required="required"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9"><% out.print(res.traduz(197,traducao));%></label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-lock"></i>
                    <input class="m-wrap placeholder-no-fix" type="password" placeholder="<% out.print(res.traduz(197,traducao));%>" id="pass2" name="password" value="" required="required"/>
                </div>
            </div>
        </div>
        <input type="hidden" name="login_secret" value="">
        <input type="hidden" name="r" value="index/index">
                <div class="form-actions">
            <!--<button type="submit" class="btn purple pull-right"><i class="preloader" style="display: none"></i>
                Login <i class="m-icon-swapright m-icon-white"></i>
            </button>-->
        <input type="button" class="loginButton" id="submit2"  value="Login" />
     
        </div>
		<div class="" id="invalido2"> </div>
        <div class="forget-password">
            <h4><% out.print(res.traduz(287,traducao));%> ?</h4>
            <p>
                <a href="CadastroVisitante.jsp" id="forget-password"><% out.print(res.traduz(288,traducao));%></a> <% out.print(res.traduz(289,traducao));%>  </p>
        </div>
    </form>
   
</div>
        
    </body>
</html>