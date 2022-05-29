<%-- 
    Document   : Cabe?alho
    Created on : 31/08/2014, 10:03:30
    Author     : Valdomiro
--%>

<%---<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
 
<%!
  public String traducao="";

  
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <!-- <meta http-equiv="refresh" content="1; URL=Home.jsp" >-->
      <!-- <script type="text/javascript" src="jquery/login.js"></script>
       <script type="text/javascript" src="jquery/logoff.js"></script>--->
        <link rel=stylesheet type="text/css" href="css/estilo.css"> 
		
        <title></title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> 
     	
  <script type="text/javascript">
 $(document).ready(function(){
		var verificacao = function(){
			var id = $( this ).attr('id');
			//alert( id );
                        var trad = document.getElementById(id).value;
                      
                        $.post('SetTraducao.jsp',{name:trad},function(data){
        
         var x = parseInt(data);
         //alert("Valor"+x);
             
         if(x==0)
         {
            
             alert("Você escolheu a lingua (Português do Brasil)");
         }
         else if(x==1)
         {
             
             alert("Você escolheu a lingua (Espanhol da Espanha)");
         }
         else if(x==2)
         {
            
             alert("Você escolheu a lingua (Ingês Americano)");
         }
         else if(x==3){
             alert("fora do intervalo");
         }
        
          //$("button").html(data);
       });
		};
	
		$('#bras').click( verificacao );
		$('#esp').click( verificacao );
		$('#eng').click(verificacao);
	});
 
      </script>
	  <script type="text/javascript">
          $(document).ready(function(){
   var x;	
      $("#submit").click(function() {
          
          var email= $('#email').val();
          var senha= $('#pass').val();
          
          $.post('validaLogin.jsp',{email: email,senha: senha},function(data){
               x = parseInt(data);
             
              if(x==0)
              {
                 
                  alert("Email ou senha inv\u00e1lidos !");
                  $('#email').css('border', '3px #C33 solid');
                  $('#pass').css('border', '3px #C33 solid');
                  $("#invalido").addClass("invalido");
                  $("#invalido").html("Email ou senha inv\u00e1lidos !");
                  //$('#logado').hide();
                  //$('#cross').fadeIn();
                  $('#logoff').attr('disabled', 'disabled');
              }else
              {
                  window.location.reload(true);
                  $('#email').css('border', '1px #25a4b0 solid ');
                  $('#pass').css('border', '1px #25a4b0 solid ');
                  $("#invalido").removeClass("invalido");
                  $("#invalido").html("").remove("Email ou senha inv\u00e1lidos !");
                  $("#logado").addClass("logado");
                  $('#logoff').removeAttr('disabled');
                  
                 
                  
              }
              
                  
          });
         
        
          
          
      });  
      $("#bt_sair").click(function(){
          
          var val= $(this).attr('id');
            
             $.post('logoff.jsp',{valor:val},function(data){
              var x = parseInt(data);
             $(location).attr("href","Home.jsp");
         });
      });
      
      
                
});
      </script>
	 
      
   
    </head>
    <body>
        
       <%-- <jsp:useBean id="res" class="meupacote.processa" />----%> 
        <jsp:useBean id="res" class="meupacote.processa" />
       <% 
               Cookie cookie = null; 
               Cookie[] cookies = null;
               cookies = request.getCookies(); 
           
           if(traducao.isEmpty()){
               
               if(cookies.length<=1){
                    Cookie trad= new Cookie("Traducao","por");
                    trad.setMaxAge(60*60*24);
                    response.addCookie(trad);
                    
                    
               }
                Cookie ck = null; 
                Cookie[] cks = null;
                cks = request.getCookies();
                 for (int i = 0; i < cks.length; i++)
                        { 
                            ck = cks[i]; 
                            if(ck.getName().equals("Traducao")){

                                traducao = ck.getValue();
                                

                            }
                            //out.print("Traducao cabecalho "+ ck.getValue());
                        }
                 
                 
                
           }else{
               
               if( cookies == null ){
                out.print("não existe cookies");
               }else{
                //out.print("Tamanho do cookie "+cookies.length);
                    for (int i = 0; i < cookies.length; i++)
                    { 
                        cookie = cookies[i]; 
                        if(cookie.getName().equals("Traducao")){

                            traducao = cookie.getValue();

                        }
                    }
              }
            
           }
            
           
           
          /* if(traducao.isEmpty()){
        
              session.putValue("traducao","por");
              session.setMaxInactiveInterval(60*60*1);
              traducao = session.getValue("traducao").toString();
            }else{
  
               traducao = session.getValue("traducao").toString();
               
             }*/
           //out.println("Traducao"+traducao);
       %>
       
        
        <div class="tradutor">
            
             <button type="submit" name="brasil" value="0" id="bras"><a href="Home.jsp" title="Portugês (Brasil)"><img src=".\imagens\brasil.png" /></a></button>
             <button type="submit" name="espanhol" value="1" id="esp"><a href="Home.jsp" title="Espanhol (Espanha)"><img src=".\imagens\espanha.png" /></a></button>
              <button type="submit" name="ingles" value="2" id="eng"><a href="Home.jsp" title="Inglês (Americano)"><img src=".\imagens\EUA2.png" /></a></button>
              
        </div>
		

    <div id="content">
        <div id="content-inner">		
             <div id="header">

                <div class="top"></div>
                <div id="slogan-holder"><% out.print(res.traduz(186,traducao)); %>.</div>
                <div id="logo-holder">
                    <a href="/" title="Home">
                            <img src=".\imagens\logotipo.png" alt="" width="150" height="100" />
                    </a>
                </div>
	
                <div class="" id="invalido"> </div>
                <div class="logado" id="logado">
                    <% 
                      try{
                       if(session.getValue("loginUsuario") != null && session.getValue("senhaUsuario") != null){
                          String x="» ";
                          
                             out.print(x+res.traduz(283,traducao)+" :"+session.getAttribute("User").toString());
                          
                       }
                      }catch(Exception e)
                      {
                          e.printStackTrace();
                      }
                        
                    %> 
                    
                </div>
                    <div class="logoff" id="logoff">
                        <a href="#" id="bt_sair">
                            <% 
                             try{
                              if(session.getValue("loginUsuario") != null && session.getValue("senhaUsuario") != null){ 
                               out.print("» "+res.traduz(284,traducao));
                             } 
                             }catch(Exception e){
                                 e.printStackTrace(); 
                             }
                            %>
                        </a>   
                    </div>
         <% if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){ %>
	<div class="login-holder">
	   <form name="login" id="login"  action="" method="post">
                <label class="email-holder">
                   <input type="text" name="email" id="email" placeholder="E-mail" />
                </label>
		<input type="password" name="password" id="pass" placeholder="password" />
		<input type="button" id="submit"  value="<% out.print(res.traduz(290,traducao)); %>" />
            </form>
		<div class="options">
			<a href="CadastroVisitante.jsp"><% out.print(res.traduz(184,traducao)); %></a> <%--- | <a href="*" ><% out.print(res.traduz(185,traducao)); %></a>---%>
		</div>
	</div>
         <%} %>
    
        </div>
        </div>
       </div>
                
    </body>
</html>

