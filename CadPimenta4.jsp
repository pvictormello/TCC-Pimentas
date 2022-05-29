<%-- 
    Document   : CadPimenta4
    Created on : 25/09/2014, 15:02:58
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
                      // alert("Nenhum dado foi recebido!");
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
      <script>
 function confirmBox() {
   
     var r = confirm("Deseja mesmo Salvar ?");
    if (r == true) {
        document.getElementById("contactform").submit();
        
        
    } else {
        location.href="Home.jsp";
    }

}
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
            <a class="caminho" href="./CadPimenta4.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(67,traducao));%>.</a>
            <!--Include.-->
        </div>
        
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="CadPimenta.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="CadPimenta2.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="CadPimenta2.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="CadPimenta3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class="active"><a href="CadPimenta4.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
         <div class="container">

		<form id="contactform" name="f" class="rounded" method="post" action="SetCadastroPimenta.jsp">
                    
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
                    <input type="hidden" name="cicloplanta" value="<% out.print(request.getParameter("cicloplanta")); %>" />
                    <input type="hidden" name="corTronco" value="<% out.print(request.getParameter("corTronco")); %>" />
                    <input type="hidden" name="AntocianinaNodal" value="<% out.print(request.getParameter("AntocianinaNodal")); %>" />
                    <input type="hidden" name="FormaTronco" value="<% out.print(request.getParameter("FormaTronco")); %>" />
                    <input type="hidden" name="TricomaCaule" value="<% out.print(request.getParameter("TricomaCaule")); %>" />
                    <input type="hidden" name="ComprimentoPlanta" value="<% out.print(request.getParameter("ComprimentoPlanta")); %>" />
                    <input type="hidden" name="HDCDP" value="<% out.print(request.getParameter("HDCDP")); %>" />
                    <input type="hidden" name="cod52" value="<% out.print(request.getParameter("cod52")); %>" />
                    <input type="hidden" name="cod53" value="<% out.print(request.getParameter("cod53")); %>" />
                    <input type="hidden" name="cod54" value="<% out.print(request.getParameter("cod54")); %>" />
                    <input type="hidden" name="HDR" value="<% out.print(request.getParameter("HDR")); %>" />
                    <input type="hidden" name="perfilhamento" value="<% out.print(request.getParameter("perfilhamento")); %>" />
                    <input type="hidden" name="DensidadeFolha" value="<% out.print(request.getParameter("DensidadeFolha")); %>" />
                    <input type="hidden" name="corFolha" value="<% out.print(request.getParameter("corFolha")); %>" />
                    <input type="hidden" name="FormaFolha" value="<% out.print(request.getParameter("FormaFolha")); %>" />
                    <input type="hidden" name="MargemFolha" value="<% out.print(request.getParameter("MargemFolha")); %>" />
                    <input type="hidden" name="PDTNF" value="<% out.print(request.getParameter("PDTNF")); %>" />
                    <input type="hidden" name="cod65" value="<% out.print(request.getParameter("cod65")); %>" />
                    <input type="hidden" name="cod66" value="<% out.print(request.getParameter("cod66")); %>" />
                    
		<h3><% out.print(res.traduz(67,traducao));%>:</h3>
                <div class="field">
                    <label for="name">7.2.1.1 <% out.print(res.traduz(68,traducao));%>:</label>
                    <input name="cod68" id="cod68" class="input2" type="number" <% if(session.getValue("cod68")!= null){ if(!session.getValue("cod68").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod68").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="1" min="0" max="1000"  onBlur="isNumber(f.cod68.value,f.cod68.id);return false;"/>
                    
                </div>
		<div class="field">
                    <label for="name">7.2.1.2 <% out.print(res.traduz(69,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><input type="radio" name="cod69" id="7.2.1.2" <% if(session.getValue("7.2.1.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.2").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(70,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod69" id="7.2.1.2" <% if(session.getValue("7.2.1.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.2").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(71,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod69" id="7.2.1.2" <% if(session.getValue("7.2.1.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.2").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(72,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod69" id="7.2.1.2" <% if(session.getValue("7.2.1.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.2").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(73,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod69" id="7.2.1.2" <% if(session.getValue("7.2.1.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.2").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(74,traducao));%></td>
                                
                            </tr>
                        </table>
			
                </div>   
                <div class="field">
                    <label for="name">7.2.1.3 <% out.print(res.traduz(75,traducao));%>:</label><br>
                    <table>
                         <tr>
                                <td><img src="./imagens/flower1.png"/></td>
                                <td><img src="./imagens/flower2.png"/></td>
                                <td><img src="./imagens/flower3.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod75" id="7.2.1.3" <% if(session.getValue("7.2.1.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.3").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(76,traducao));%></td>
                                <td><input type="radio" name="cod75" id="7.2.1.3" <% if(session.getValue("7.2.1.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.3").toString()); if(var==5){ %>checked<%}} %> value="5"/>  5-<% out.print(res.traduz(11,traducao));%></td>
                                <td><input type="radio" name="cod75" id="7.2.1.3" <% if(session.getValue("7.2.1.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.3").toString()); if(var==7){ %>checked<%}} %> value="7"/>  7-<% out.print(res.traduz(51,traducao));%></td>
                            </tr>
                            
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.4 <% out.print(res.traduz(77,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(14,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(19,traducao));%></td>
                                
                            </tr>
                             <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(78,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(79,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(80,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(81,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==8){ %>checked<%}} %> value="8" />  8-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod77" id="7.2.1.4" <% if(session.getValue("7.2.1.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.4").toString()); if(var==9){ %>checked<%}} %> value="9" />  9-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.5 <% out.print(res.traduz(82,traducao));%>:</label><br>
                    <table>
                     
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(19,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(78,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod82" id="7.2.1.5" <% if(session.getValue("7.2.1.5")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.5").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.6 <% out.print(res.traduz(83,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <td><input type="radio" name="cod83" id="7.2.1.6" <% if(session.getValue("7.2.1.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.6").toString()); if(var==1){ %>checked<%}} %> value="1" />   1-<% out.print(res.traduz(84,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod83" id="7.2.1.6" <% if(session.getValue("7.2.1.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.6").toString()); if(var==2){ %>checked<%}} %> value="2" />   2-<% out.print(res.traduz(85,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod83" id="7.2.1.6" <% if(session.getValue("7.2.1.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.6").toString()); if(var==3){ %>checked<%}} %> value="3"  />   3-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                            
                        </table>
                       
                </div>
                 <div class="field">
                    <label for="name">7.2.1.7 <% out.print(res.traduz(86,traducao));%>:</label><br>
                    <table>
                      
                            <tr>
                                <td><input type="radio" name="cod86" id="7.2.1.7" <% if(session.getValue("7.2.1.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.7").toString()); if(var==1){ %>checked<%}} %> value="1"  />  <% out.print(res.traduz(87,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod86" id="7.2.1.7" <% if(session.getValue("7.2.1.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.7").toString()); if(var==2){ %>checked<%}} %> value="2" />  <% out.print(res.traduz(88,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod86" id="7.2.1.7" <% if(session.getValue("7.2.1.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.7").toString()); if(var==3){ %>checked<%}} %> value="3" />  <% out.print(res.traduz(89,traducao));%></td>
                                
                            </tr>
   
                             
                        </table>
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.1.8 <% out.print(res.traduz(90,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==1){ %>checked<%}} %> value="1"  />   1-<% out.print(res.traduz(6,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==2){ %>checked<%}} %> value="2" />   2-<% out.print(res.traduz(19,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==3){ %>checked<%}} %> value="3" />   3-<% out.print(res.traduz(91,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==4){ %>checked<%}} %> value="4" />   4-<% out.print(res.traduz(92,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==5){ %>checked<%}} %> value="5" />   5-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod90" id="7.2.1.8" <% if(session.getValue("7.2.1.8")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.8").toString()); if(var==6){ %>checked<%}} %> value="6" />   6-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                            
                        </table>
                       
                </div>
                <div class="field">
                    <label for="name">7.2.1.9 <% out.print(res.traduz(93,traducao));%>:</label>
                    <input name="cod93" id="cod93" class="input2" type="number" <% if(session.getValue("cod93")!= null){ if(!session.getValue("cod93").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod93").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod93.value,f.cod93.id);return false;"/>
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.10 <% out.print(res.traduz(222,traducao));%>:</label><br>
                    <table>
                         
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(19,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(92,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(16,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod222" id="7.2.1.10"  <% if(session.getValue("7.2.1.10")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.10").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    <div class="field">
                    <label for="name">7.2.1.11 <% out.print(res.traduz(94,traducao));%>:</label>
                    <input name="cod94" id="cod94" class="input2" type="number" <% if(session.getValue("cod94")!= null){ if(!session.getValue("cod94").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod94").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod94.value,f.cod94.id);return false;"/>
                    
                </div>
        
                </div>
                <div class="field">
                    <label for="name">7.2.1.12 <% out.print(res.traduz(95,traducao));%>:</label><br>
                    <table>
                          
                            <tr>
                                <td><input type="radio" name="cod95" id="7.2.1.12" <% if(session.getValue("7.2.1.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.12").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(96,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod95" id="7.2.1.12" <% if(session.getValue("7.2.1.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.12").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(97,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod95" id="7.2.1.12" <% if(session.getValue("7.2.1.12")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.12").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(98,traducao));%></td>
                                
                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.13 <% out.print(res.traduz(99,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <td><input type="radio" name="cod99" id="7.2.1.13" <% if(session.getValue("7.2.1.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.13").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod99" id="7.2.1.13" <% if(session.getValue("7.2.1.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.13").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.14 <% out.print(res.traduz(102,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <td><input type="radio" name="cod102" id="7.2.1.14" <% if(session.getValue("7.2.1.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.14").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod102" id="7.2.1.14" <% if(session.getValue("7.2.1.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.14").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.1.15 <% out.print(res.traduz(103,traducao));%>:</label><br>
                    <center> <table>
             
                             <tr>
                                <td><img src="./imagens/calyx3.png"/></td>
                                <td><img src="./imagens/calyx5.png"/></td>
                                <td><img src="./imagens/calyx7.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod103" id="7.2.1.15" <% if(session.getValue("7.2.1.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.15").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(104,traducao));%></td>
                                <td><input type="radio" name="cod103" id="7.2.1.15" <% if(session.getValue("7.2.1.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.15").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(11,traducao));%></td>
                                <td><input type="radio" name="cod103" id="7.2.1.15" <% if(session.getValue("7.2.1.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.15").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(105,traducao));%></td>
                                <td><input type="radio" name="cod103" id="7.2.1.15" <% if(session.getValue("7.2.1.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.15").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(20,traducao));%></td>
                            </tr>
                           
                             
                        </table></center>
                    
                </div>
                 
                <div class="field">
                    <label for="name">7.2.1.16 <% out.print(res.traduz(106,traducao));%>:</label><br>
                    <center><table>
                             <tr>
                                <td><img src="./imagens/calyx0.png"/></td>
                                <td><img src="./imagens/calyx1.png"/></td>
                                
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod106" id="7.2.1.16" <% if(session.getValue("7.2.1.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.16").toString()); if(var==0){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                <td><input type="radio" name="cod106" id="7.2.1.16" <% if(session.getValue("7.2.1.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.1.16").toString()); if(var==1){ %>checked<%}} %> value="2"/>  1-<% out.print(res.traduz(101,traducao));%></td>
                                
                            </tr>     
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.1 <% out.print(res.traduz(107,traducao));%>:</label>
                    <input name="cod107" id="cod107" class="input2" type="number" <% if(session.getValue("cod107")!= null){ if(!session.getValue("cod107").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod107").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="1" min="0" max="1000"  onBlur="isNumber(f.cod107.value,f.cod107.id);return false;"/>
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.2.2 <% out.print(res.traduz(108,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod108" id="7.2.2.2" <% if(session.getValue("7.2.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.2").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                
                                
                            </tr> 
                            <tr>
                                <td><input type="radio" name="cod108" id="7.2.2.2" <% if(session.getValue("7.2.2.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.2").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.3 <% out.print(res.traduz(109,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(19,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(7,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(120,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(8,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(17,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod109" id="7.2.2.3" <% if(session.getValue("7.2.2.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.3").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(20,traducao));%></td>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.4 <% out.print(res.traduz(110,traducao));%>:</label><br>
                    <table>
                           
                            <tr>
                                <td><input type="radio" name="cod110" id="7.2.2.4" <% if(session.getValue("7.2.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.4").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(111,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod110" id="7.2.2.4" <% if(session.getValue("7.2.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.4").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod110" id="7.2.2.4" <% if(session.getValue("7.2.2.4")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.4").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(113,traducao));%></td>
                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.5 <% out.print(res.traduz(114,traducao));%>:</label>
                    <input name="cod114" id="cod114" class="input2" type="number" <% if(session.getValue("cod114")!= null){ if(!session.getValue("cod114").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod114").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="1" min="0" max="1000"  onBlur="isNumber(f.cod114.value,f.cod114.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.6 <% out.print(res.traduz(115,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(116,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(117,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(118,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(119,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(120,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(121,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==8){ %>checked<%}} %> value="8" />  8-<% out.print(res.traduz(122,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==9){ %>checked<%}} %> value="9" />  9-<% out.print(res.traduz(123,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==10){ %>checked<%}} %> value="10" />  10-<% out.print(res.traduz(8,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==11){ %>checked<%}} %> value="11" />  11-<% out.print(res.traduz(124,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==12){ %>checked<%}} %> value="12" />  12-<% out.print(res.traduz(125,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod115" id="7.2.2.6" <% if(session.getValue("7.2.2.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.6").toString()); if(var==13){ %>checked<%}} %> value="13" />  13-<% out.print(res.traduz(20,traducao));%></td>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.7 <% out.print(res.traduz(126,traducao));%>:</label><br>
                    <table>
             
                             <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(127,traducao));%></td>
                                <td><img src="./imagens/elongate.png"/></td>
                        
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(128,traducao));%></td>
                                <td><img src="./imagens/almost.png"/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(129,traducao));%></td>
                                <td><img src="./imagens/triangular.png"/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(85,traducao));%></td>
                                <td><img src="./imagens/companulate.png"/></td>
                            </tr>
                             <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(130,traducao));%></td>
                                <td><img src="./imagens/blocky.png"/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod126" id="7.2.2.7" <% if(session.getValue("7.2.2.7")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.7").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(20,traducao));%></td>
                                
                            </tr>
                            
                        </table>
                     
                 </div>
                <br>
                <div class="field">
                    <label for="name">7.2.2.8 <% out.print(res.traduz(131,traducao));%>:</label>
                    <input name="cod131" id="cod131" class="input2" type="number" <% if(session.getValue("cod131")!= null){ if(!session.getValue("cod131").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod131").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod131.value,f.cod131.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.9 <% out.print(res.traduz(132,traducao));%>:</label>
                    <input name="cod132" id="cod132" class="input2" type="number" <% if(session.getValue("cod132")!= null){ if(!session.getValue("cod132").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod132").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod132.value,f.cod132.id);return false;"/>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.10 <% out.print(res.traduz(133,traducao));%>:</label>
                    <input name="cod133" id="cod133" class="input2" type="number" <% if(session.getValue("cod133")!= null){ if(!session.getValue("cod133").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod133").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod133.value,f.cod133.id);return false;"/>   
                </div>
                <div class="field">
                    <label for="name">7.2.2.11 <% out.print(res.traduz(134,traducao));%>:</label>
                    <input name="cod134" id="cod134" class="input2" type="number" <% if(session.getValue("cod134")!= null){ if(!session.getValue("cod134").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod134").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000"  onBlur="isNumber(f.cod134.value,f.cod134.id);return false;"/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.12 <% out.print(res.traduz(135,traducao));%>:</label>
                    <input name="cod135" id="cod135" class="input2" type="number" <% if(session.getValue("cod135")!= null){ if(!session.getValue("cod135").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod135").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="0.01" min="0" max="1000" onBlur="isNumber(f.cod135.value,f.cod135.id);return false;"/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.13 <% out.print(res.traduz(136,traducao));%>:</label><br>
                    <center> <table>
                            
                            <tr>
                                <td><img src="./imagens/fig12.1.png"/></td>
                                <td><img src="./imagens/fig12.2.png"/></td> 
                                <td><img src="./imagens/fig12.3.png"/></td>
                            </tr> 
                            <tr>
                                <td><input type="radio" name="cod136" id="7.2.2.13" <% if(session.getValue("7.2.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.13").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(137,traducao));%></td>
                                <td><input type="radio" name="cod136" id="7.2.2.13" <% if(session.getValue("7.2.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.13").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(138,traducao));%></td>
                                <td><input type="radio" name="cod136" id="7.2.2.13" <% if(session.getValue("7.2.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.13").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(139,traducao));%></td>
                            </tr>
                            <tr>
                                <td><img src="./imagens/fig12.4.png"/></td>
                                <td><img src="./imagens/fig12.5.png"/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod136" id="7.2.2.13" <% if(session.getValue("7.2.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.13").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(140,traducao));%></td>
                                 <td><input type="radio" name="cod136" id="7.2.2.13" <% if(session.getValue("7.2.2.13")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.13").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(141,traducao));%></td>
                            </tr>
                            
                          
                        </table></center>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.14 <% out.print(res.traduz(142,traducao));%>:</label><br>
                    <center> <table>
                            
                            <tr>
                                <td><img src="./imagens/neck1.png"/></td>
                                <td><img src="./imagens/neck2.png"/></td>   
                            </tr> 
                            <tr>
                                <td><input type="radio" name="cod142" id="7.2.2.14" <% if(session.getValue("7.2.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.14").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                <td><input type="radio" name="cod142" id="7.2.2.14" <% if(session.getValue("7.2.2.14")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.14").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>
                            </tr>
                        </table></center>  
                 </div>
                <div class="field">
                    <label for="name">7.2.2.15 <% out.print(res.traduz(143,traducao));%>:</label><br>
                    <center> <table>
             
                             <tr>
                                 
                                 <td><img src="./imagens/pointed.png"/></td>
                                 <td><img src="./imagens/blunt.png"/></td>
                                 <td><img src="./imagens/sunken.png"/></td>
                                 <td><img src="./imagens/sunkenandpointed.png"/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod143" id="7.2.2.15" <% if(session.getValue("7.2.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.15").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(144,traducao));%></td>
                                <td><input type="radio" name="cod143" id="7.2.2.15" <% if(session.getValue("7.2.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.15").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(145,traducao));%></td>
                                <td><input type="radio" name="cod143" id="7.2.2.15" <% if(session.getValue("7.2.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.15").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(146,traducao));%></td>
                                <td><input type="radio" name="cod143" id="7.2.2.15" <% if(session.getValue("7.2.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.15").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(147,traducao));%></td>
                                <td><input type="radio" name="cod143" id="7.2.2.15" <% if(session.getValue("7.2.2.15")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.15").toString()); if(var==5){ %>checked<%}} %> value="5"/>  5-<% out.print(res.traduz(20,traducao));%></td>
                            </tr>
                 
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.16 <% out.print(res.traduz(148,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod148" id="7.2.2.16" <% if(session.getValue("7.2.2.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.16").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
                                
                                
                            </tr> 
                            <tr>
                                <td><input type="radio" name="cod148" id="7.2.2.16" <% if(session.getValue("7.2.2.16")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.16").toString()); if(var==2){ %>checked<%}} %> value="2"  />  1-<% out.print(res.traduz(101,traducao));%></td>
                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.17 <% out.print(res.traduz(149,traducao));%>:</label><br>
                    <center> <table>
                            <tr>
                                <td><img src="./imagens/fruit3.png"/></td>
                                <td><img src="./imagens/fruit5.png"/></td>
                                <td><img src="./imagens/fruit7.png"/></td>
                            </tr>
                             <tr>
                                 <td><input type="radio" name="cod149" id="7.2.2.17" <% if(session.getValue("7.2.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.17").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(150,traducao));%>  </td>
                                 <td><input type="radio" name="cod149" id="7.2.2.17" <% if(session.getValue("7.2.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.17").toString()); if(var==5){ %>checked<%}} %> value="5"/>  5-<% out.print(res.traduz(112,traducao));%>  </td>
                                 <td><input type="radio" name="cod149" id="7.2.2.17" <% if(session.getValue("7.2.2.17")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.17").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(151,traducao));%>  </td>
                                 
                            </tr>   
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.18 <% out.print(res.traduz(152,traducao));%>:</label>
                    <input name="cod152" id="cod152" class="input2" type="number" <% if(session.getValue("cod152")!= null){ if(!session.getValue("cod152").toString().isEmpty()){int var=0;var = Integer.parseInt(session.getValue("cod152").toString()); if(var!=-1){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> step="1" min="0" max="1000" onBlur="isNumber(f.cod152.value,f.cod152.id);return false;"/> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.19 <% out.print(res.traduz(153,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod153" id="7.2.2.19" <% if(session.getValue("7.2.2.19")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.19").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(154,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod153" id="7.2.2.19" <% if(session.getValue("7.2.2.19")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.19").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(155,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod153" id="7.2.2.19" <% if(session.getValue("7.2.2.19")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.19").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(156,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                
                <div class="field">
                    <label for="name">7.2.2.20.1 <% out.print(res.traduz(158,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod158" id="7.2.2.20.1" <% if(session.getValue("7.2.2.20.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.1").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(159,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod158" id="7.2.2.20.1" <% if(session.getValue("7.2.2.20.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.1").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod158" id="7.2.2.20.1" <% if(session.getValue("7.2.2.20.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.1").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(160,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.20.2 <% out.print(res.traduz(161,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod161" id="7.2.2.20.2" <% if(session.getValue("7.2.2.20.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.2").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(159,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod161" id="7.2.2.20.2" <% if(session.getValue("7.2.2.20.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.2").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod161" id="7.2.2.20.2" <% if(session.getValue("7.2.2.20.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.20.2").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(160,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.21 <% out.print(res.traduz(162,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod162" id="7.2.2.21" <% if(session.getValue("7.2.2.21")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.21").toString()); if(var==1){ %>checked<%}} %> value="1" />  <% out.print(res.traduz(163,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod162" id="7.2.2.21" <% if(session.getValue("7.2.2.21")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.21").toString()); if(var==2){ %>checked<%}} %> value="2" />  <% out.print(res.traduz(164,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod162" id="7.2.2.21" <% if(session.getValue("7.2.2.21")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.21").toString()); if(var==3){ %>checked<%}} %> value="3" />  <% out.print(res.traduz(165,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.22 <% out.print(res.traduz(180,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod180" id="7.2.2.22" <% if(session.getValue("7.2.2.22")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.22").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(181,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod180" id="7.2.2.22" <% if(session.getValue("7.2.2.22")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.22").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(182,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod180" id="7.2.2.22" <% if(session.getValue("7.2.2.22")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.2.2.22").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(183,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                
                <div class="field">
                    <label for="name">7.3.1 <% out.print(res.traduz(167,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod167" id="7.3.1" <% if(session.getValue("7.3.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.1").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(168,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod167" id="7.3.1" <% if(session.getValue("7.3.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.1").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(124,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod167" id="7.3.1" <% if(session.getValue("7.3.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.1").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(125,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod167" id="7.3.1" <% if(session.getValue("7.3.1")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.1").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(20,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.3.2 <% out.print(res.traduz(169,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod169" id="7.3.2" <% if(session.getValue("7.3.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.2").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(154,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod169" id="7.3.2" <% if(session.getValue("7.3.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.2").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(170,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod169" id="7.3.2" <% if(session.getValue("7.3.2")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.2").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(156,traducao));%></td>
                            </tr>
                        </table>   
                </div>
                 <div class="field">
                    <label for="name">7.3.3 <% out.print(res.traduz(171,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod171" id="7.3.3" <% if(session.getValue("7.3.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.3").toString()); if(var==3){ %>checked<%}} %> value="3"/>  3-<% out.print(res.traduz(172,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod171" id="7.3.3" <% if(session.getValue("7.3.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.3").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(50,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod171" id="7.3.3" <% if(session.getValue("7.3.3")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.3").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(173,traducao));%></td>
                            </tr>
                      </table>   
                 </div>
                 <div class="field">
                    <label for="name">7.3.4 <% out.print(res.traduz(174,traducao));%>:</label>
                    <input name="cod174" id="cod174" <% if(session.getValue("cod174")!= null){ if(!session.getValue("cod174").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod174").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> class="input2" type="number" step="0.01" min="0" max="1000" value="0" onBlur="isNumber(f.cod174.value,f.cod174.id);return false;"/> 
                </div>
                 <div class="field">
                    <label for="name">7.3.5 <% out.print(res.traduz(175,traducao));%>:</label>
                    <input name="cod175" id="cod175" <% if(session.getValue("cod175")!= null){ if(!session.getValue("cod175").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("cod175").toString()); if(var!=-1.0){ %> value="<%out.print(var);%>"<%}}else{%>value="null"<%}} %> class="input2" type="number" step="0.01" min="0" max="1000" value="0" onBlur="isNumber(f.cod175.value,f.cod175.id);return false;"/> 
                </div>
                 <div class="field">
                    <label for="name">7.3.6 <% out.print(res.traduz(176,traducao));%>:</label><br>
                    <table>
                            
                            <tr>
                                <td><input type="radio" name="cod176" id="7.3.6" <% if(session.getValue("7.3.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.6").toString()); if(var==1){ %>checked<%}} %> value="1" />  <% out.print(res.traduz(177,traducao));%></td>
                                   
                            </tr>  
                            <tr>
                                <td><input type="radio" name="cod176" id="7.3.6" <% if(session.getValue("7.3.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.6").toString()); if(var==2){ %>checked<%}} %> value="2" />  <% out.print(res.traduz(178,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod176" id="7.3.6" <% if(session.getValue("7.3.6")!= null){ int var=0;var = Integer.parseInt(session.getValue("7.3.6").toString()); if(var==3){ %>checked<%}} %> value="3" />  <% out.print(res.traduz(179,traducao));%></td>
                            </tr>
                            
                        </table>   
                 </div>
                
                    <input type="button" name="Submit"  class="button" value=" <% out.print(res.traduz(198,traducao));%> >>" onclick="confirmBox()" />
                    <input type="reset"  name="Limpar" class="button" value="<% out.print(res.traduz(199,traducao));%>">
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="voltar3()" />
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>

