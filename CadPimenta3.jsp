<%-- 
    Document   : CadPimenta3.jsp
    Created on : 21/09/2014, 12:57:14
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
                //alert(id+" "+name+" "+value)
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
            <a class="caminho" href="./CadPimenta2.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./CadPimenta2.jsp" ><% out.print(res.traduz(207,traducao));%></a> »
            <a class="caminho" href="./CadPimenta3.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(28,traducao));%>.</a>
            <!--Include.-->
        </div>
        
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="CadPimenta.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="CadPimenta2.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="CadPimenta2.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class="active"><a href="CadPimenta3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="CadPimenta4.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
          
        
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="CadPimenta4.jsp">

                    <input type="hidden" name="id" value="<% out.print(request.getParameter("id")); %>" />
                    <input type="hidden" name="esp" value="<% out.print(request.getParameter("esp")); %>" />
                    <input type="hidden" name="variedade" value="<% out.print(request.getParameter("variedade")); %>" />
                    <input type="hidden" name="cor" value="<% out.print(request.getParameter("cor")); %>" />
                    <input type="hidden" name="geracao" value="<% out.print(request.getParameter("geracao")); %>" />
                    <input type="hidden" name="produtor" value="<% out.print(request.getParameter("produtor")); %>" />
                    <input type="hidden" name="coordenadas" value="<% out.print(request.getParameter("coordenadas")); %>" />
                    <input type="hidden" name="localiza" value="<% out.print(request.getParameter("localiza")); %>" />
                    <input type="hidden" name="tel" value="<% out.print(request.getParameter("tel")); %>" />
                    <input type="hidden" name="data" value="<% out.print(request.getParameter("data")); %>" />
                    <input type="hidden" name="obs" value="<% out.print(request.getParameter("obs")); %>" />
                    <input type="hidden" name="corhipo" value="<% out.print(request.getParameter("corhipo")); %>" />
                    <input type="hidden" name="presTricoma" value="<% out.print(request.getParameter("presTricoma")); %>" />
                    <input type="hidden" name="corcotiledone" value="<% out.print(request.getParameter("corcotiledone")); %>" />
                    <input type="hidden" name="formacoti" value="<% out.print(request.getParameter("formacoti")); %>" />
                    <input type="hidden" name="cod26" value="<% out.print(request.getParameter("cod26")); %>" />
                    <input type="hidden" name="cod27" value="<% out.print(request.getParameter("cod27")); %>" />
                    
                    
		<h3><% out.print(res.traduz(28,traducao));%>:</h3>
		<div class="field">
                    <label for="name">7.1.2.1 <% out.print(res.traduz(29,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cicloplanta" id="7.1.2.1" <% if(session.getValue("7.1.2.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.1").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(30,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cicloplanta" id="7.1.2.1" <% if(session.getValue("7.1.2.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.1").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(31,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cicloplanta" id="7.1.2.1" <% if(session.getValue("7.1.2.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.1").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(32,traducao));%></td>
                                
                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.1.2.2 <% out.print(res.traduz(33,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="7.1.2.2" <% if(session.getValue("7.1.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.2").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="7.1.2.2" <% if(session.getValue("7.1.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.2").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(34,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="7.1.2.2" <% if(session.getValue("7.1.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.2").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="7.1.2.2" <% if(session.getValue("7.1.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.2").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.3 <% out.print(res.traduz(36,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="AntocianinaNodal" id="7.1.2.3" <% if(session.getValue("7.1.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.3").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="AntocianinaNodal" id="7.1.2.3" <% if(session.getValue("7.1.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.3").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(16,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="AntocianinaNodal" id="7.1.2.3" <% if(session.getValue("7.1.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.3").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="AntocianinaNodal" id="7.1.2.3" <% if(session.getValue("7.1.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.3").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(17,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.4 <% out.print(res.traduz(37,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="FormaTronco" <% if(session.getValue("7.1.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.4").toString()); if(var==1){ %>checked<%}} %> id="7.1.2.4" value="1" />  1-<% out.print(res.traduz(38,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="FormaTronco" id="7.1.2.4" <% if(session.getValue("7.1.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.4").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(39,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="FormaTronco" id="7.1.2.4" <% if(session.getValue("7.1.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.4").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(40,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.5 <% out.print(res.traduz(41,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/figura1.png"/></td>
                                <td><img src="./imagens/figura2.png"/></td>
                                <td><img src="./imagens/figura3.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="TricomaCaule" id="7.1.2.5" <% if(session.getValue("7.1.2.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.5").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
                                <td><input type="radio" name="TricomaCaule" id="7.1.2.5" <% if(session.getValue("7.1.2.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.5").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(11,traducao));%></td>
                                <td><input type="radio" name="TricomaCaule" id="7.1.2.5" <% if(session.getValue("7.1.2.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.5").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
                            </tr>
                           
                             
                        </table>
                    
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.6 <% out.print(res.traduz(42,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="7.1.2.6" <% if(session.getValue("7.1.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.6").toString()); if(var==1){ %>checked<%}} %> value="1" />   <% out.print(res.traduz(43,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="7.1.2.6" <% if(session.getValue("7.1.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.6").toString()); if(var==2){ %>checked<%}} %> value="2" />   <% out.print(res.traduz(44,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="7.1.2.6" <% if(session.getValue("7.1.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.6").toString()); if(var==3){ %>checked<%}} %> value="3" />   <% out.print(res.traduz(45,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="7.1.2.6" <% if(session.getValue("7.1.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.6").toString()); if(var==4){ %>checked<%}} %> value="4" />   <% out.print(res.traduz(46,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="7.1.2.6" <% if(session.getValue("7.1.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.6").toString()); if(var==5){ %>checked<%}} %> value="5" />   <% out.print(res.traduz(47,traducao));%></td>
                                
                            </tr>
                        </table>
                       
                </div>
                 <div class="field">
                    <label for="name">7.1.2.7 <% out.print(res.traduz(48,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="7.1.2.7" <% if(session.getValue("7.1.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.7").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(49,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="7.1.2.7" <% if(session.getValue("7.1.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.7").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(50,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="7.1.2.7" <% if(session.getValue("7.1.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.7").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(51,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="7.1.2.7" <% if(session.getValue("7.1.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.7").toString()); if(var==9){ %>checked<%}} %> value="9" />  9-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.8 <% out.print(res.traduz(52,traducao));%>:</label>
                    <input name="cod52" id="cod52" class="input2" type="number" <% if(session.getValue("cod52")!= null){ if(!session.getValue("cod52").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod52").toString()); if(var!=-1.0){ %> value="<% out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod52.value,f.cod52.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.9 <% out.print(res.traduz(53,traducao));%>:</label>
                    <input name="cod53" id="cod53" class="input2" type="number" <% if(session.getValue("cod53")!= null){ if(!session.getValue("cod53").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod53").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod53.value,f.cod53.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.10 <% out.print(res.traduz(54,traducao));%>:</label>
                    <input name="cod54" id="cod54" class="input2" type="number" <% if(session.getValue("cod54")!= null){ if(!session.getValue("cod54").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod54").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod54.value,f.cod54.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.11 <% out.print(res.traduz(55,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/fig1.png" id="imgpos"/></td>
                                <td><img src="./imagens/fig2.png" id="imgpos"/></td>
                                <td><img src="./imagens/fig3.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDR" id="7.1.2.11" <% if(session.getValue("7.1.2.11")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.11").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
                                <td><input type="radio" name="HDR" id="7.1.2.11" <% if(session.getValue("7.1.2.11")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.11").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(11,traducao));%></td>
                                <td><input type="radio" name="HDR" id="7.1.2.11" <% if(session.getValue("7.1.2.11")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.11").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
                            </tr>
                           
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.12 <% out.print(res.traduz(56,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="perfilhamento" id="7.1.2.12" <% if(session.getValue("7.1.2.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.12").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="perfilhamento" id="7.1.2.12" <% if(session.getValue("7.1.2.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.12").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(11,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="perfilhamento" id="7.1.2.12" <% if(session.getValue("7.1.2.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.12").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.13 <% out.print(res.traduz(57,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="DensidadeFolha" id="7.1.2.13" <% if(session.getValue("7.1.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.13").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="DensidadeFolha" id="7.1.2.13" <% if(session.getValue("7.1.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.13").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(50,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="DensidadeFolha" id="7.1.2.13" <% if(session.getValue("7.1.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.13").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.14 <% out.print(res.traduz(58,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(19,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(14,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(15,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(16,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(18,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="7.1.2.14" <% if(session.getValue("7.1.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.14").toString()); if(var==8){ %>checked<%}} %> value="8" />  8-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                 <div class="field">
                    <label for="name">7.1.2.15 <% out.print(res.traduz(59,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/leafshape1.png"/></td>
                                <td><img src="./imagens/leafshape2.png"/></td>
                                <td><img src="./imagens/leafshape3.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="FormaFolha" id="7.1.2.15" <% if(session.getValue("7.1.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.15").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(22,traducao));%></td>
                                <td><input type="radio" name="FormaFolha" id="7.1.2.15" <% if(session.getValue("7.1.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.15").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(23,traducao));%></td>
                                <td><input type="radio" name="FormaFolha" id="7.1.2.15" <% if(session.getValue("7.1.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.15").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(24,traducao));%></td>
                            </tr>
                           
                             
                        </table>
                    
                </div>
                 <div class="field">
                    <label for="name">7.1.2.16 <% out.print(res.traduz(60,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="MargemFolha" id="7.1.2.16" <% if(session.getValue("7.1.2.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.16").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(61,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="MargemFolha" id="7.1.2.16" <% if(session.getValue("7.1.2.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.16").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(62,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="MargemFolha" id="7.1.2.16" <% if(session.getValue("7.1.2.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.16").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(63,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.17 <% out.print(res.traduz(64,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td>Notas:</td>
                            </tr>
                             <tr>
                                <td><img src="./imagens/leafpubescence1.png"/></td>
                                <td><img src="./imagens/leafpubescence2.png"/></td>
                                <td><img src="./imagens/leafpubescence3.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="PDTNF" id="7.1.2.17" <% if(session.getValue("7.1.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.17").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(10,traducao));%></td>
                                <td><input type="radio" name="PDTNF" id="7.1.2.17" <% if(session.getValue("7.1.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.17").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(11,traducao));%></td>
                                <td><input type="radio" name="PDTNF" id="7.1.2.17" <% if(session.getValue("7.1.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.1.2.17").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
                            </tr>     
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.18 <% out.print(res.traduz(65,traducao));%>:</label>
                    <input name="cod65" id="cod65" class="input2" type="number"<% if(session.getValue("cod65")!= null){ if(!session.getValue("cod65").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod65").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod65.value,f.cod65.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.19 <% out.print(res.traduz(66,traducao));%>:</label>
                    <input name="cod66" id="cod66" class="input2" type="number" <% if(session.getValue("cod66")!= null){ if(!session.getValue("cod66").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod66").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod66.value,f.cod66.id);return false;"/>
                    
                </div>
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" />
                    <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao));%>">
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="voltar2()" />
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>
