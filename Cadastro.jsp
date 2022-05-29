<%@page import="java.util.ArrayList"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[0].toString().charAt(0)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>

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
         
 $(function(){ // declaro o in?cio do jquery
      $("input[name='email']").blur( function(){  
      //var email = $("input[name='email']").val();
      
      var email= $('#em').val();
       //alert(email);
       $.post('verifica.jsp',{email: email},function(data){
        //$('#resultado').html(data);//onde vou escrever o resultado
        
           
           var x = parseInt(data);
           
            if(x==1)
            { 
               
               //document.getElementById("sub").disabled = true;
               //document.querySelector('#sub').style.background = '#f0f0f0';
               $("#sub").hide();// esconde o campo de submissao
               alert("Email já cadastrado! Cadastre um email válido para continuar");
               //$("#sub").attr("disabled",true);
              // $("input[name='email']").val('');//apagando o input
             }else 
             {
                 $("#sub").show();// mostra o campo de submissão
                 //document.getElementById("sub").disabled = false;
                 //document.querySelector('#sub').style.background = '#848FB2';
                 
             }

          });
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
           
             
           
           //traducao = session.getValue("traducao").toString();
          
           
               
           
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
     
		<form id="contactform" name="f1" class="rounded" method="post" action="gravauser.jsp">
		
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
			<input type="text" class="input" name="email" id="em" placeholder="<% out.print(res.traduz(196,traducao)); %>"  />
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
		
		<fieldset><legend><% out.print(res.traduz(202,traducao )); %></legend>
		<center><table>
		    
		<tr>
			<td>
			 <select name="tp" id="Selecionado" title="perfil" onchange="selecionarInclude()" >
                        <option value="0"><% out.print(res.traduz(192,traducao)); %></option>
                        <option value="1" title="" name="todos" ><% out.print(res.traduz(204,traducao)); %></option>
                        <option value="2" title="" ><% out.print(res.traduz(205,traducao)); %></option>
                        <option value="3" title="" ><% out.print(res.traduz(206,traducao)); %></option>
                        </select>
			 </td>
		</tr>
		    <tr>
			 
			 <td><a><u><% out.print(res.traduz(201,traducao)); %></u></a></td>
			  <td><a><u><% out.print(res.traduz(211,traducao)); %></u></a></td>
                          <td><a><u><% out.print(res.traduz(245,traducao)+" "+res.traduz(201,traducao)); %></u>&nbsp;&nbsp;&nbsp;</a></td>
                          <td><a><u><% out.print(res.traduz(245,traducao)+" "+res.traduz(244,traducao)); %></u></a></td>
			  
			</tr>
			<tr>
			  <td><input type="checkbox" name="u1" value="1" class="tam" /><% out.print(res.traduz(207,traducao)); %></td>
			  <td><input type="checkbox" name="p1" value="1" class="tam" /><% out.print(res.traduz(207,traducao)); %></td>
			  <%--<td><input type="checkbox" name="op2"  value="1" class="tam"/><% out.print(res.traduz(207,traducao)); %></td>--%>
                          <td><input type="checkbox" name="ru1"  value="1" class="tam"/><% out.print(res.traduz(263,traducao)); %></td>
                          <td><input type="checkbox" name="rp1"  value="1" class="tam"/><% out.print(res.traduz(263,traducao)); %></td>
			</tr>
			<tr>
			  <td><input type="checkbox" name="u2"  value="1" class="tam"/><% out.print(res.traduz(208,traducao)); %></td>
			  <td><input type="checkbox" name="p2"  value="1" class="tam"/><% out.print(res.traduz(208,traducao)); %></td>
			 <%-- <td><input type="checkbox" name="op5"  value="1" class="tam"/><% out.print(res.traduz(208,traducao)); %></td>--%>
                         <td><input type="checkbox" name="ru2"  value="1" class="tam"/><% out.print(res.traduz(188,traducao)); %></td>
                         <td><input type="checkbox" name="rp2"  value="1" class="tam"/><% out.print(res.traduz(269,traducao)); %></td>
			</tr>
			<tr>
			    <td><input type="checkbox" name="u3"  value="1" class="tam"/><% out.print(res.traduz(209,traducao)); %></td>
			    <td><input type="checkbox" name="p3"  value="1" class="tam"/><% out.print(res.traduz(209,traducao)); %></td>
			   <%-- <td><input type="checkbox" name="op8"   value="1" class="tam"/><% out.print(res.traduz(209,traducao)); %></td>--%>
                            <td><input type="checkbox" name="ru3"   value="1" class="tam"/><% out.print(res.traduz(249,traducao)); %></td>
                            <td><input type="checkbox" name="rp3"   value="1" class="tam"/><% out.print(res.traduz(230,traducao)); %></td>
			</tr>
			<tr>
			    <td><input type="checkbox" name="u4"   value="1" class="tam"/><% out.print(res.traduz(210,traducao)); %></td>
			    <td><input type="checkbox" name="p4"  value="1" class="tam"/><% out.print(res.traduz(210,traducao)); %></td>
			   <%-- <td><input type="checkbox" name="op11"  value="1" class="tam"/><% out.print(res.traduz(210,traducao )); %></td>--%>
                            <td><input type="checkbox" name="ru4"  value="1" class="tam"/><% out.print(res.traduz(190,traducao )); %></td>
                            <td><input type="checkbox" name="rp4"  value="1" class="tam"/><% out.print(res.traduz(251,traducao )); %></td>
			</tr>
                        <tr>
			    <td></td>
			    <td></td>
                            <td><input type="checkbox" name="ru5"  value="1" class="tam"/><% out.print(res.traduz(191,traducao )); %></td>
                            <td><input type="checkbox" name="rp5"  value="1" class="tam"/><% out.print(res.traduz(267,traducao )); %></td>
			</tr>
                        <tr>
			    <td></td>
			    <td></td>
                            <td></td>
                            <td><input type="checkbox" name="rp6"  value="1" class="tam"/><% out.print(res.traduz(268,traducao )); %></td>
			</tr>
			 
		</table></center>
		</fieldset>
	


                <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao)); %>">
		<input type="submit" name="Submit" id="sub" class="button" value="<% out.print(res.traduz(198,traducao )); %>" />
		</form> 
          </div>
            <br>
            <br>
            <br>
          <!----Rodape--------------------->
       
      <%@include file="rodape.jsp" %> 
                        
    </body>
</html>