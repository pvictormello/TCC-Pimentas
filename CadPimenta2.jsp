<%-- 
    Document   : CadPimentap2
    Created on : 18/09/2014, 14:30:29
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
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript">
      $(document).ready(function() {
          
            $('input:radio').click(function() {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                var value = $(this).attr('value');
                //alert(id+" "+name+" "+value)
                $.post('setValores.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
                    if(x==0){ 
                       //alert("Nenhum dado foi recebido!");
                   }
                });
                
                });

            $(":input").bind('keyup mouseup',function() {
                var id = $(this).attr('id');
                var name = $(this).attr('name');
                //var value = $(this).attr('value');
				var value = $(this).val();
                
                $.post('setValores.jsp',{valor: value,id:id},function(data){
                    var x = parseInt(data);
                    if(x==0){ 
                       //alert("Nenhum dado foi recebido!");
                   }
                 });
 
                });
    
   });      

      </script>
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
            <a class="caminho" href="./CadPimenta.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./CadPimenta.jsp" ><% out.print(res.traduz(207,traducao));%></a> »
            <a class="caminho" href="./CadPimenta2.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(4,traducao));%>.</a>
            <!--Include.-->
        </div>
       
        <div  id="menu">
        <ul id="nav2">
	    <li class=""><a href="CadPimenta.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="CadPimenta2.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href=""><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        
        <ul id="nav3">
            <li class="active"><a href="CadPimenta2.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="CadPimenta3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="CadPimenta4.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
        </div>
        
           
        
       
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="CadPimenta3.jsp">
                    
                    <input type="hidden" name="id" id="idf" value="<%out.print(request.getParameter("id"));%>"/>
                    <input type="hidden" name="esp" value="<%out.print(request.getParameter("esp"));%>"/>
                    <input type="hidden" name="variedade" value="<%out.print(request.getParameter("variedade"));%>"/>
                    <input type="hidden" name="cor" value="<%out.print(request.getParameter("cor"));%>"/>;
                    <input type="hidden" name="geracao" value="<%out.print(request.getParameter("geracao"));%>"/>
                    <input type="hidden" name="produtor" value="<%out.print(request.getParameter("produtor"));%>"/>
                    <input type="hidden" name="coordenadas" value="<%out.print(request.getParameter("coordenadas"));%>"/>
                    <input type="hidden" name="localiza" value="<%out.print(request.getParameter("localiza"));%>"/>
                    <input type="hidden" name="tel" value="<%out.print(request.getParameter("tel"));%>"/>
                    <input type="hidden" name="data" value="<%out.print(request.getParameter("data"));%>"/>;
                    <input type="hidden" name="obs" value="<%out.print(request.getParameter("obs"));%>"/>;
                       
		<h3><% out.print(res.traduz(4,traducao));%>:</h3>
		<div class="field">
                    
                    <label for="name">7.1.1.1 <% out.print(res.traduz(5,traducao));%>:</label><br>
                    
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            
                            <tr>
        
                                <td><input type="radio" name="corhipo" <% if(session.getValue("corhipo1")!= null){ int var=0;var = Integer.parseInt(session.getValue("corhipo1").toString()); if(var==1){ %>checked<%}} %>  id="corhipo1" value="1" />  1- <% out.print(res.traduz(6,traducao));%></td>
        
                            </tr>
                            <tr>

                                <td><input type="radio" name="corhipo" <%if(session.getValue("corhipo1")!= null){ int var=0;var = Integer.parseInt(session.getValue("corhipo1").toString()); if(var==2){ %>checked<%}} %> id="corhipo1" value="2" />  2- <% out.print(res.traduz(7,traducao));%></td>

                            </tr>
                            <tr>
				 <td><input type="radio" name="corhipo" <% if(session.getValue("corhipo1")!= null){int var=0;var = Integer.parseInt(session.getValue("corhipo1").toString()); if(var==3){ %>checked<%}} %> id="corhipo1" value="3" />  3- <% out.print(res.traduz(8,traducao));%></td>

                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.1.1.2 <% out.print(res.traduz(9,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
		              <td><input type="radio" name="presTricoma" <% if(session.getValue("pt")!= null){int var=0; var = Integer.parseInt(session.getValue("pt").toString()); if(var==3){ %>checked<%}} %> id="pt" value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
 
                            </tr>
                            <tr>
			       <td><input type="radio" name="presTricoma" <% if(session.getValue("pt")!= null){ int var=0;var = Integer.parseInt(session.getValue("pt").toString()); if(var==5){ %>checked<%} }%> id="pt" value="5"/>  5-<% out.print(res.traduz(11,traducao));%></td>

                            </tr>
                            <tr>
                              <td><input type="radio" name="presTricoma" <% if(session.getValue("pt")!= null){ int var=0; var = Integer.parseInt(session.getValue("pt").toString()); if(var==7){ %>checked<%} }%> id="pt" value="7"/>  7-<% out.print(res.traduz(12,traducao));%></td>
   
                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.3 <% out.print(res.traduz(13,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==1){ %>checked<%}} %> id="7.1.1.3" value="1" />  1-<% out.print(res.traduz(14,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==2){ %>checked<%}} %> id="7.1.1.3" value="2" />  2-<% out.print(res.traduz(7,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==3){ %>checked<%}} %> id="7.1.1.3" value="3" />  3-<% out.print(res.traduz(15,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==4){ %>checked<%}} %> id="7.1.1.3" value="4" />  4-<% out.print(res.traduz(16,traducao));%></td>
                                
                            </tr>
                             <tr>
                                 <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==5){ %>checked<%}} %> id="7.1.1.3" value="5" />  5-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==6){ %>checked<%}} %> id="7.1.1.3" value="6" />  6-<% out.print(res.traduz(17,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==7){ %>checked<%}} %> id="7.1.1.3"  value="7" />  7-<% out.print(res.traduz(18,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==8){ %>checked<%}} %> id="7.1.1.3" value="8" />  8-<% out.print(res.traduz(19,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="corcotiledone" <% if(session.getValue("7.1.1.3")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.3").toString()); if(var==9){ %>checked<%}} %> id="7.1.1.3" value="9" />  9-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.4 <% out.print(res.traduz(21,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><img src="./imagens/img1.png"/></td>
                                <td><img src="./imagens/img2.png"/></td>
                                <td><img src="./imagens/img4.png"/></td>
                                <td><img src="./imagens/img5.png"/></td>
                            </tr>
                            <tr>
                                <td>  <input type="radio" name="formacoti" <% if(session.getValue("7.1.1.4")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.4").toString()); if(var==1){ %>checked<%}} %> id="7.1.1.4" value="1" /> <% out.print(res.traduz(22,traducao));%></td>
                                <td>  <input type="radio" name="formacoti" <% if(session.getValue("7.1.1.4")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.4").toString()); if(var==2){ %>checked<%}} %> id="7.1.1.4" value="2" /> <% out.print(res.traduz(23,traducao));%></td>
                                <td>  <input type="radio" name="formacoti" <% if(session.getValue("7.1.1.4")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.4").toString()); if(var==3){ %>checked<%}} %> id="7.1.1.4" value="3" /> <% out.print(res.traduz(24,traducao));%></td>
                                <td>  <input type="radio" name="formacoti" <% if(session.getValue("7.1.1.4")!= null){int var=0;var = Integer.parseInt(session.getValue("7.1.1.4").toString()); if(var==4){ %>checked<%}} %> id="7.1.1.4" value="4" /> <% out.print(res.traduz(25,traducao));%></td>
                            </tr>
                           
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.5 <% out.print(res.traduz(26,traducao));%>:</label>
                    <input name="cod26" id="codi26"  class="input2" type="number" <% if(session.getValue("codi26")!= null){ if(!session.getValue("codi26").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("codi26").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod26.value,f.codi26.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.6 <% out.print(res.traduz(27,traducao));%>:</label>
                    <input name="cod27" class="input2" id="codi27" type="number" <% if(session.getValue("codi27")!= null){if(!session.getValue("codi27").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("codi27").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0.000" max="1000"  onBlur="isNumber(f.cod27.value,f.codi27.id);return false;" />
                    
                </div>
                    
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>"  />
                    <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao));%>">
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="voltar()" />
                </form>
                        
		</div>
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
            
    </body>
</html>
