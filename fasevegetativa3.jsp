<%-- 
    Document   : fasevegetativa3
    Created on : 20/11/2014, 08:03:11
    Author     : Valdomiro
--%>

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
        <script type="text/javascript" src="js/script.js" charset="UTF-8"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
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
                
                $.post('setValores2.jsp',{valor: value,id:id},function(data){
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
            <a class="caminho" href="./localizacao3.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao3.jsp" ><% out.print(res.traduz(208,traducao));%></a> »
            <a class="caminho" href="./faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(28,traducao));%>.</a>
            <!--Include.-->
        </div>
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="localizacao3.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="faseplantula3.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class="active"><a href="fasevegetativa3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="fasereprodutiva3.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
          
        <%
             
                 int cod ;//= Integer.parseInt(request.getParameter("codigo"));
                 cod = Integer.parseInt(session.getValue("esc").toString());
                 int flag;
                 if(session.getValue("flag2") !=null){
                     session.setAttribute("flag2",1);
                     flag=Integer.parseInt(session.getValue("flag2").toString());
                 }else{
                     session.setAttribute("flag2",0);
                     flag= Integer.parseInt(session.getValue("flag2").toString());
                 }
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         if(flag==0){
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from fasevegetativa where Identificador = '"+cod+"'");
             
            
          
              while(rs.next()){
                 session.putValue("fv1",rs.getString("cod29"));
                  session.putValue("fv2",rs.getString("cod33"));
                  session.putValue("fv3",rs.getString("cod36"));
                  session.putValue("fv4",rs.getString("cod37"));
                  session.putValue("fv5",rs.getString("cod41"));
                  session.putValue("fv6",rs.getString("cod42"));
                  session.putValue("fv7",rs.getString("cod48"));
                  session.putValue("fv8",rs.getString("cod52"));
                  session.putValue("fv9",rs.getString("cod53"));
                  session.putValue("fv10",rs.getString("cod54"));
                  session.putValue("fv11",rs.getString("cod55"));
                  session.putValue("fv12",rs.getString("cod56"));
                  session.putValue("fv13",rs.getString("cod57"));
                  session.putValue("fv14",rs.getString("cod58"));
                  session.putValue("fv15",rs.getString("cod59"));
                  session.putValue("fv16",rs.getString("cod60"));
                  session.putValue("fv17",rs.getString("cod64"));
                  session.putValue("fv18",rs.getString("cod65"));
                  session.putValue("fv19",rs.getString("cod66"));
                  
             
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

		<form id="contactform" name="f" class="rounded" method="post" action="fasereprodutiva3.jsp">

                  <input type="hidden" name="chave" value="<% out.print(cod); %>"/>   
                    
		<h3><% out.print(res.traduz(28,traducao));%>:</h3>
		<div class="field">
                    <label for="name">7.1.2.1 <% out.print(res.traduz(29,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                  <td><input type="radio" name="cicloplanta" id="fv1" value="1" <% if(session.getValue("fv1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv1").toString()); if(var==1){ %>checked<%}} %>  />  1-<% out.print(res.traduz(30,traducao));%></td>
                            </tr>
                            <tr>
                                   <td><input type="radio" name="cicloplanta" id="fv1" <% if(session.getValue("fv1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv1").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(31,traducao));%></td>  
                            </tr>
                            <tr>
                                   <td><input type="radio" name="cicloplanta" id="fv1" <% if(session.getValue("fv1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv1").toString()); if(var==3){ %>checked<%}} %> value="3"/>  3-<% out.print(res.traduz(32,traducao));%></td> 
                                
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

                                <td><input type="radio" name="corTronco" id="fv2" <% if(session.getValue("fv2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv2").toString()); if(var==1){ %>checked<%}} %> value="1"   />  1-<% out.print(res.traduz(7,traducao));%></td>
                            </tr>
                            <tr>

                                <td><input type="radio" name="corTronco" id="fv2" <% if(session.getValue("fv2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv2").toString()); if(var==2){ %>checked<%}} %> value="2"   />  2-<% out.print(res.traduz(34,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="fv2" <% if(session.getValue("fv2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv2").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(8,traducao));%></td> 
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="corTronco" id="fv2" <% if(session.getValue("fv2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv2").toString()); if(var==4){ %>checked<%}} %> value="4"   />  4-<% out.print(res.traduz(20,traducao));%></td>

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
                                <td><input type="radio" name="AntocianinaNodal" id="fv3" <% if(session.getValue("fv3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv3").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(7,traducao));%></td>
                                
                            </tr>
                            <tr>
                                  <td><input type="radio" name="AntocianinaNodal" id="fv3" <% if(session.getValue("fv3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv3").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(16,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="AntocianinaNodal" id="fv3" <% if(session.getValue("fv3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv3").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(8,traducao));%></td>
                                
                            </tr>
                             <tr>
                                 <td><input type="radio" name="AntocianinaNodal" id="fv3" <% if(session.getValue("fv3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv3").toString()); if(var==7){ %>checked<%}} %>  value="7" />  7-<% out.print(res.traduz(17,traducao));%></td>
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
                                 <td><input type="radio" name="FormaTronco" id="fv4" <% if(session.getValue("fv4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv4").toString()); if(var==1){ %>checked<%}} %> value="1"   />  1-<% out.print(res.traduz(38,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="FormaTronco" id="fv4" <% if(session.getValue("fv4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv4").toString()); if(var==2){ %>checked<%}} %> value="2"   />  2-<% out.print(res.traduz(39,traducao));%></td>

                            </tr>
                            <tr>
                                 <td><input type="radio" name="FormaTronco" id="fv4" <% if(session.getValue("fv4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv4").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(40,traducao));%></td>
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
                                         <td><input type="radio" name="TricomaCaule" id="fv5" <% if(session.getValue("fv5")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv5").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(10,traducao));%></td>

                                         <td><input type="radio" name="TricomaCaule" id="fv5" <% if(session.getValue("fv5")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv5").toString()); if(var==5){ %>checked<%}} %> value="5"   />  5-<% out.print(res.traduz(11,traducao));%></td>

                                         <td><input type="radio" name="TricomaCaule" id="fv5" <% if(session.getValue("fv5")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv5").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(12,traducao));%></td>

                               
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

                                <td><input type="radio" name="ComprimentoPlanta" id="fv6" <% if(session.getValue("fv6")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv6").toString()); if(var==1){ %>checked<%}} %> value="1"  />   <% out.print(res.traduz(43,traducao));%></td>

                            </tr>
                            <tr>
                                 <td><input type="radio" name="ComprimentoPlanta" id="fv6" <% if(session.getValue("fv6")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv6").toString()); if(var==2){ %>checked<%}} %> value="2"  />   <% out.print(res.traduz(44,traducao));%></td>
                            </tr>
                            <tr>
        
                                 <td><input type="radio" name="ComprimentoPlanta" id="fv6" <% if(session.getValue("fv6")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv6").toString()); if(var==3){ %>checked<%}} %> value="3"   />   <% out.print(res.traduz(45,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="fv6" <% if(session.getValue("fv6")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv6").toString()); if(var==4){ %>checked<%}} %> value="4"  />   <% out.print(res.traduz(46,traducao));%></td>
        
                            </tr>
                            <tr>
                                <td><input type="radio" name="ComprimentoPlanta" id="fv6" <% if(session.getValue("fv6")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv6").toString()); if(var==5){ %>checked<%}} %> value="5"   />   <% out.print(res.traduz(47,traducao));%></td> 

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
                                 <td><input type="radio" name="HDCDP" id="fv7" <% if(session.getValue("fv7")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv7").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(49,traducao));%></td>

                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="fv7" <% if(session.getValue("fv7")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv7").toString()); if(var==5){ %>checked<%}} %> value="5"   />  5-<% out.print(res.traduz(50,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="fv7" <% if(session.getValue("fv7")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv7").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(51,traducao));%></td>
                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="HDCDP" id="fv7" <% if(session.getValue("fv7")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv7").toString()); if(var==9){ %>checked<%}} %> value="9"  />  9-<% out.print(res.traduz(20,traducao));%></td>

                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.8 <% out.print(res.traduz(52,traducao));%>:</label>
                    <input name="cod52" class="input2" type="number" min="0" step="0.01" id="fv8"  value="<% if(session.getValue("fv8")!= null){ if(!session.getValue("fv8").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("fv8").toString()); if(var!=-1.0){ out.print(session.getValue("fv8").toString());}}} %>" onBlur="isNumber(f.cod52.value,f.fv8.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.9 <% out.print(res.traduz(53,traducao));%>:</label>
                    <input name="cod53" class="input2" type="number" min="0" step="0.01" id="fv9" value="<% if(session.getValue("fv9")!= null){ if(!session.getValue("fv9").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("fv9").toString()); if(var!=-1.0){ out.print(session.getValue("fv9").toString());}}} %>" onBlur="isNumber(f.cod53.value,f.fv9.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.10 <% out.print(res.traduz(54,traducao));%>:</label>
                    <input name="cod54" class="input2" type="number" min="0" step="0.01" id="fv10" value="<% if(session.getValue("fv10")!= null){ if(!session.getValue("fv10").toString().isEmpty()){ Double var=0.0;var = Double.parseDouble(session.getValue("fv10").toString()); if(var!=-1.0){ out.print(session.getValue("fv10").toString());}}} %>" onBlur="isNumber(f.cod54.value,f.fv10.id);return false;" />
                    
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
                                 <td><input type="radio" name="HDR" id="fv11" <% if(session.getValue("fv11")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv11").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(10,traducao));%></td>

                                 <td><input type="radio" name="HDR" id="fv11" <% if(session.getValue("fv11")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv11").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(11,traducao));%></td>

                                  <td><input type="radio" name="HDR" id="fv11" <% if(session.getValue("fv11")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv11").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(12,traducao));%></td>
 
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.12 <% out.print(res.traduz(56,traducao));%>:</label><br>
                    <table>
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="perfilhamento" id="fv12" <% if(session.getValue("fv12")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv12").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(10,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="perfilhamento" id="fv12" <% if(session.getValue("fv12")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv12").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(11,traducao));%></td>

                            </tr>
                            <tr>
                                 <td><input type="radio" name="perfilhamento" id="fv12" <% if(session.getValue("fv12")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv12").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>  

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
                                <td><input type="radio" name="DensidadeFolha" id="fv13" <% if(session.getValue("fv13")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv13").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(10,traducao));%></td>

                                
                            </tr>
                            <tr>
                                <td><input type="radio" name="DensidadeFolha" id="fv13" <% if(session.getValue("fv13")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv13").toString()); if(var==5){ %>checked<%}} %> value="5"   />  5-<% out.print(res.traduz(50,traducao));%></td>
 
                            </tr>
                            <tr>
                                <td><input type="radio" name="DensidadeFolha" id="fv13" <% if(session.getValue("fv13")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv13").toString()); if(var==7){ %>checked<%}} %> value="7"   />  7-<% out.print(res.traduz(12,traducao));%></td>

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
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(19,traducao));%></td>   
                            </tr>
                            <tr>
                                 <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(14,traducao));%></td>

                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(7,traducao));%></td>
  
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(15,traducao));%></td> 
   
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(16,traducao));%></td>  
   
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==6){ %>checked<%}} %> value="6"  />  6-<% out.print(res.traduz(8,traducao));%></td>  
    
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==7){ %>checked<%}} %> value="7"   />  7-<% out.print(res.traduz(18,traducao));%></td> 
 
                            </tr>
                            <tr>
                                <td><input type="radio" name="corFolha" id="fv14" <% if(session.getValue("fv14")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv14").toString()); if(var==8){ %>checked<%}} %> value="8"   />  8-<% out.print(res.traduz(20,traducao));%></td>  
  
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
                            <td><input type="radio" name="FormaFolha" id="fv15" <% if(session.getValue("fv15")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv15").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(22,traducao));%></td>

                            <td><input type="radio" name="FormaFolha" id="fv15" <% if(session.getValue("fv15")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv15").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(23,traducao));%></td>

                            <td><input type="radio" name="FormaFolha" id="fv15" <% if(session.getValue("fv15")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv15").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(24,traducao));%></td>
    
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
                                <td><input type="radio" name="MargemFolha" id="fv16" <% if(session.getValue("fv16")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv16").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(61,traducao));%></td>

                            </tr>
                            <tr>
                                <td><input type="radio" name="MargemFolha" id="fv16" <% if(session.getValue("fv16")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv16").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(62,traducao));%></td> 

                            </tr>
                            <tr>
                                <td><input type="radio" name="MargemFolha" id="fv16" <% if(session.getValue("fv16")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv16").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(63,traducao));%></td>

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
                                <td><input type="radio" name="PDTNF" id="fv17" <% if(session.getValue("fv17")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv17").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(10,traducao));%></td>

                                <td><input type="radio" name="PDTNF" id="fv17" <% if(session.getValue("fv17")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv17").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(11,traducao));%></td>

                                <td><input type="radio" name="PDTNF" id="fv17" <% if(session.getValue("fv17")!= null){ int var=0;var = Integer.parseInt(session.getValue("fv17").toString()); if(var==7){ %>checked<%}} %>  value="7"  />  7-<% out.print(res.traduz(12,traducao));%></td>

                            </tr>     
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.18 <% out.print(res.traduz(65,traducao));%>:</label>
                    <input name="cod65" class="input2" type="number" min="0" step="0.01" id="fv18" value="<% if(session.getValue("fv18")!= null){ if(!session.getValue("fv18").toString().isEmpty()){ Double var=0.0;var = Double.parseDouble(session.getValue("fv18").toString()); if(var!=-1.0){ out.print(session.getValue("fv18").toString());}}} %>" onBlur="isNumber(f.cod65.value,f.fv18.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.2.19 <% out.print(res.traduz(66,traducao));%>:</label>
                    <input name="cod66" class="input2" type="number" min="0" step="0.01" id="fv19" value="<% if(session.getValue("fv19")!= null){  if(!session.getValue("fv19").toString().isEmpty()){Double var=0.0;var = Double.parseDouble(session.getValue("fv19").toString()); if(var!=-1.0){ out.print(session.getValue("fv19").toString());}}} %>" onBlur="isNumber(f.cod66.value,f.fv19.id);return false;" />
                    
                </div>
                  
                    
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" />
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack2()" />
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>

