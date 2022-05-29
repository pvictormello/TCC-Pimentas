<%-- 
    Document   : fasereprodutiva3
    Created on : 20/11/2014, 08:24:00
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
      <script>
 function confirmBox() {
   
     var r = confirm("Deseja mesmo Salvar as alterações ?");
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
            <a class="caminho" href="./localizacao3.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao3.jsp" ><% out.print(res.traduz(208,traducao));%></a> »
            <a class="caminho" href="./faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(67,traducao));%>.</a>
            <!--Include.-->
        </div>
       <%-- <jsp:useBean id="res" class="meupacote.processa" />--%>
        <ul id="nav2">
	    <li class=""><a href="localizacao3.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	    <%--<li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li>--%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="faseplantula3.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="fasevegetativa3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class="active"><a href="fasereprodutiva3.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
        
         <%
             
                 int cod =Integer.parseInt(session.getValue("esc").toString());//Integer.parseInt(request.getParameter("chave"));
                 int flag;
                 if(session.getValue("flag3") !=null){
                     session.setAttribute("flag3",1);
                     flag=Integer.parseInt(session.getValue("flag3").toString());
                 }else{
                     session.setAttribute("flag3",0);
                     flag= Integer.parseInt(session.getValue("flag3").toString());
                 }
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         if(flag==0){
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from fasereprodutiva where Identif = '"+cod+"'");
             
             session.setAttribute("index",cod);// Seta o valor do index(Codigo identificador da tupla)
          
              while(rs.next()){
                  
                  session.putValue("fr1",rs.getString("cod68"));
                  session.putValue("fr2",rs.getString("cod69"));
                  session.putValue("fr3",rs.getString("cod75"));
                  session.putValue("fr4",rs.getString("cod77"));
                  session.putValue("fr5",rs.getString("cod82"));
                  session.putValue("fr6",rs.getString("cod83"));
                  session.putValue("fr7",rs.getString("cod86"));
                  session.putValue("fr8",rs.getString("cod90"));
                  session.putValue("fr9",rs.getString("cod93"));
                  session.putValue("fr10",rs.getString("cod222"));
                  session.putValue("fr11",rs.getString("cod94"));
                  session.putValue("fr12",rs.getString("cod95"));
                  session.putValue("fr13",rs.getString("cod99"));
                  session.putValue("fr14",rs.getString("cod102"));
                  session.putValue("fr15",rs.getString("cod103"));
                  session.putValue("fr16",rs.getString("cod106"));
                  session.putValue("fr17",rs.getString("cod107"));
                  session.putValue("fr18",rs.getString("cod108"));
                  session.putValue("fr19",rs.getString("cod109"));
                  session.putValue("fr20",rs.getString("cod110"));
                  session.putValue("fr21",rs.getString("cod114"));
                  session.putValue("fr22",rs.getString("cod115"));
                  session.putValue("fr23",rs.getString("cod126"));
                  session.putValue("fr24",rs.getString("cod131"));
                  session.putValue("fr25",rs.getString("cod132"));
                  session.putValue("fr26",rs.getString("cod133"));
                  session.putValue("fr27",rs.getString("cod134"));
                  session.putValue("fr28",rs.getString("cod135"));
                  session.putValue("fr29",rs.getString("cod136"));
                  session.putValue("fr30",rs.getString("cod142"));
                  session.putValue("fr31",rs.getString("cod143"));
                  session.putValue("fr32",rs.getString("cod148"));
                  session.putValue("fr33",rs.getString("cod149"));
                  session.putValue("fr34",rs.getString("cod152"));
                  session.putValue("fr35",rs.getString("cod153"));
                  session.putValue("fr36",rs.getString("cod158"));
                  session.putValue("fr37",rs.getString("cod161"));
                  session.putValue("fr38",rs.getString("cod162"));
                  session.putValue("fr39",rs.getString("cod180"));
                  session.putValue("fr40",rs.getString("cod167"));
                  session.putValue("fr41",rs.getString("cod169"));
                  session.putValue("fr42",rs.getString("cod171"));
                  session.putValue("fr43",rs.getString("cod174"));
                  session.putValue("fr44",rs.getString("cod175"));
                  session.putValue("fr45",rs.getString("cod176"));
                  
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

		<form id="contactform" name="f" class="rounded" method="post" action="SetAlteracaoPimentas.jsp">
                    
                    <input type="hidden" name="chave" value="<%out.print(cod);%>"/> 
                    
		<h3><% out.print(res.traduz(67,traducao));%>:</h3>
                <div class="field">
                    <label for="name">7.2.1.1 <% out.print(res.traduz(68,traducao));%>:</label>
                    <input name="cod68" class="input2" id="fr1" type="number" min="0" step="1" value="<% if((session.getValue("fr1") != null)&&(!session.getValue("fr1").toString().isEmpty())&&(!session.getValue("fr1").equals("-1"))){ out.print(session.getValue("fr1").toString()); } %>" onBlur="isNumber(f.cod68.value,f.fr1.id);return false;" />
                    
                </div>
		<div class="field">
                    <label for="name">7.2.1.2 <% out.print(res.traduz(69,traducao));%>:</label><br>
                        <table>
                            
                            <tr>

                                <td><input type="radio" name="cod69" id="fr2" <% if((session.getValue("fr2")!= null)&&(!session.getValue("fr2").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr2").toString()); if(var==1){ %>checked<%}} %> value="1"   />  1-<% out.print(res.traduz(70,traducao));%></td>
                                       
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod69" id="fr2" <% if((session.getValue("fr2")!= null)&&(!session.getValue("fr2").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr2").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(71,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod69" id="fr2" <% if((session.getValue("fr2")!= null)&&(!session.getValue("fr2").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr2").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(72,traducao));%></td>

                                
                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod69" id="fr2" <% if((session.getValue("fr2")!= null)&&(!session.getValue("fr2").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr2").toString()); if(var==4){ %>checked<%}} %> value="4"   />  4-<% out.print(res.traduz(73,traducao));%></td>

                                
                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod69" id="fr2" <% if((session.getValue("fr2")!= null)&&(!session.getValue("fr2").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr2").toString()); if(var==5){ %>checked<%}} %> value="5"   />  5-<% out.print(res.traduz(74,traducao));%></td>

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

                                    <td><input type="radio" name="cod75" id="fr3" <% if((session.getValue("fr3")!= null)&&(!session.getValue("fr3").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr3").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(76,traducao));%></td>

                                    <td><input type="radio" name="cod75" id="fr3" <% if((session.getValue("fr3")!= null)&&(!session.getValue("fr3").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr3").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(11,traducao));%></td>

                                    <td><input type="radio" name="cod75" id="fr3" <% if((session.getValue("fr3")!= null)&&(!session.getValue("fr3").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr3").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(51,traducao));%></td>
       
                            </tr>
                            
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.4 <% out.print(res.traduz(77,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(6,traducao));%></td>
   
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(14,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(19,traducao));%></td>

                            </tr>
                             <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==4){ %>checked<%}} %> value="4"   />  4-<% out.print(res.traduz(78,traducao));%></td>

                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(79,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(80,traducao));%></td>
  
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(81,traducao));%></td>
  
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==8){ %>checked<%}} %> value="8" />  8-<% out.print(res.traduz(8,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod77" id="fr4" <% if((session.getValue("fr4")!= null)&&(!session.getValue("fr4").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr4").toString()); if(var==9){ %>checked<%}} %> value="9"  />  9-<% out.print(res.traduz(20,traducao));%></td>

                            </tr>
                             
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.5 <% out.print(res.traduz(82,traducao));%>:</label><br>
                    <table>
                     
                            <tr>

                                 <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(6,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(19,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(78,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==4){ %>checked<%}} %> value="4"  />  4-<% out.print(res.traduz(7,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(8,traducao));%></td>
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod82" id="fr5" <% if((session.getValue("fr5")!= null)&&(!session.getValue("fr5").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr5").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(20,traducao));%></td>
    
                            </tr>
                             
                        </table>
                    
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.6 <% out.print(res.traduz(83,traducao));%>:</label><br>
                    <table>
                           
                            <tr>

                                <td><input type="radio" name="cod83" id="fr6" <% if((session.getValue("fr6")!= null)&&(!session.getValue("fr6").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr6").toString()); if(var==1){ %>checked<%}} %> value="1"   />   1-<% out.print(res.traduz(84,traducao));%></td>
    
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod83" id="fr6" <% if((session.getValue("fr6")!= null)&&(!session.getValue("fr6").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr6").toString()); if(var==2){ %>checked<%}} %> value="2"  />   2-<% out.print(res.traduz(85,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod83" id="fr6" <% if((session.getValue("fr6")!= null)&&(!session.getValue("fr6").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr6").toString()); if(var==3){ %>checked<%}} %> value="3"  />   3-<% out.print(res.traduz(20,traducao));%></td>
   
                            </tr>
                            
                        </table>
                       
                </div>
                 <div class="field">
                    <label for="name">7.2.1.7 <% out.print(res.traduz(86,traducao));%>:</label><br>
                    <table>
                      
                            <tr>

                                 <td><input type="radio" name="cod86" id="fr7" <% if((session.getValue("fr7")!= null)&&(!session.getValue("fr7").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr7").toString()); if(var==1){ %>checked<%}} %> value="1"   />  <% out.print(res.traduz(87,traducao));%></td>
     
                            </tr>
                            <tr>
                                <td><input type="radio" name="cod86" id="fr7" <% if((session.getValue("fr7")!= null)&&(!session.getValue("fr7").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr7").toString()); if(var==2){ %>checked<%}} %> value="2"   />  <% out.print(res.traduz(88,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod86" id="fr7" <% if((session.getValue("fr7")!= null)&&(!session.getValue("fr7").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr7").toString()); if(var==3){ %>checked<%}} %> value="3"  />  <% out.print(res.traduz(89,traducao));%></td>
    
                            </tr>
   
                             
                        </table>
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.1.8 <% out.print(res.traduz(90,traducao));%>:</label><br>
                    <table>
                           
                            <tr>

                                <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==1){ %>checked<%}} %> value="1" />   1-<% out.print(res.traduz(6,traducao));%></td>
    
                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==2){ %>checked<%}} %> value="2"  />   2-<% out.print(res.traduz(19,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==3){ %>checked<%}} %> value="3" />   3-<% out.print(res.traduz(91,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==4){ %>checked<%}} %> value="4" />   4-<% out.print(res.traduz(92,traducao));%></td>
    
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==5){ %>checked<%}} %> value="5"   />   5-<% out.print(res.traduz(8,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod90" id="fr8" <% if((session.getValue("fr8")!= null)&&(!session.getValue("fr8").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr8").toString()); if(var==6){ %>checked<%}} %> value="6"  />   6-<% out.print(res.traduz(20,traducao));%></td>

                            </tr>
                            
                        </table>
                       
                </div>
                <div class="field">
                    <label for="name">7.2.1.9 <% out.print(res.traduz(93,traducao));%>:</label>
                    <input name="cod93" class="input2" type="number" min="0" step="0.01" id="fr9" value="<% if((session.getValue("fr9")!= null)&&(!session.getValue("fr9").equals("-1"))&&(!session.getValue("fr9").toString().isEmpty())){ out.print(session.getValue("fr9").toString());} %>" onBlur="isNumber(f.cod93.value,f.fr9.id);return false;" />
                    
                </div>
                
                <div class="field">
                    <label for="name">7.2.1.10 <% out.print(res.traduz(222,traducao));%>:</label><br>
                    <table>
                         
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==1){ %>checked<%}} %> value="1"   />  1-<% out.print(res.traduz(6,traducao));%></td>
     
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(19,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(7,traducao));%></td>
    
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(92,traducao));%></td>
    
                            </tr>
                            <tr>

                               <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(16,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(8,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod222" id="fr10" <% if((session.getValue("fr10")!= null)&&(!session.getValue("fr10").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr10").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(20,traducao));%></td>
   
                            </tr>
                             
                        </table>
                    <div class="field">
                    <label for="name">7.2.1.11 <% out.print(res.traduz(94,traducao));%>:</label>
                    <input name="cod94" class="input2" type="number" min="0" step="0.01" id="fr11" value="<% if((session.getValue("fr11")!= null)&&(!session.getValue("fr11").equals("-1"))&&(!session.getValue("fr11").toString().isEmpty())){ out.print(session.getValue("fr11").toString());} %>" onBlur="isNumber(f.cod94.value,f.fr11.id);return false;"  />
                    
                </div>
        
                </div>
                <div class="field">
                    <label for="name">7.2.1.12 <% out.print(res.traduz(95,traducao));%>:</label><br>
                    <table>
                          
                            <tr>

                                 <td><input type="radio" name="cod95" id="fr12" <% if((session.getValue("fr12")!= null)&&(!session.getValue("fr12").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr12").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(96,traducao));%></td>

                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod95" id="fr12" <% if((session.getValue("fr12")!= null)&&(!session.getValue("fr12").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr12").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(97,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod95" id="fr12" <% if((session.getValue("fr12")!= null)&&(!session.getValue("fr12").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr12").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(98,traducao));%></td>

                            </tr>
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.13 <% out.print(res.traduz(99,traducao));%>:</label><br>
                    <table>
                           
                            <tr>

                                 <td><input type="radio" name="cod99" id="fr13" <% if((session.getValue("fr13")!= null)&&(!session.getValue("fr13").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr13").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
  
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod99" id="fr13" <% if((session.getValue("fr13")!= null)&&(!session.getValue("fr13").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr13").toString()); if(var==2){ %>checked<%}} %> value="2"  />  1-<% out.print(res.traduz(101,traducao));%></td>

                            </tr>
                            
                             
                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.1.14 <% out.print(res.traduz(102,traducao));%>:</label><br>
                    <table>
                           
                            <tr>

                                <td><input type="radio" name="cod102" id="fr14" <% if((session.getValue("fr14")!= null)&&(!session.getValue("fr14").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr14").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>
     
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod102" id="fr14" <% if((session.getValue("fr14")!= null)&&(!session.getValue("fr14").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr14").toString()); if(var==2){ %>checked<%}} %> value="2"   />  1-<% out.print(res.traduz(101,traducao));%></td>

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

                                <td><input type="radio" name="cod103" id="fr15" <% if((session.getValue("fr15")!= null)&&(!session.getValue("fr15").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr15").toString()); if(var==1){ %>checked<%}} %> value="1"   />  1-<% out.print(res.traduz(104,traducao));%></td>

                                <td><input type="radio" name="cod103" id="fr15" <% if((session.getValue("fr15")!= null)&&(!session.getValue("fr15").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr15").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(11,traducao));%></td>

                                <td><input type="radio" name="cod103" id="fr15" <% if((session.getValue("fr15")!= null)&&(!session.getValue("fr15").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr15").toString()); if(var==3){ %>checked<%}} %> value="3"   />  3-<% out.print(res.traduz(105,traducao));%></td>

                                <td><input type="radio" name="cod103" id="fr15" <% if((session.getValue("fr15")!= null)&&(!session.getValue("fr15").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr15").toString()); if(var==4){ %>checked<%}} %> value="4"  />  4-<% out.print(res.traduz(20,traducao));%></td>

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

                                <td><input type="radio" name="cod106" id="fr16" <% if((session.getValue("fr16")!= null)&&(!session.getValue("fr16").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr16").toString()); if(var==1){ %>checked<%}} %> value="1"   />  0-<% out.print(res.traduz(100,traducao));%></td>

                                <td><input type="radio" name="cod106" id="fr16" <% if((session.getValue("fr16")!= null)&&(!session.getValue("fr16").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr16").toString()); if(var==2){ %>checked<%}} %> value="2"  />  1-<% out.print(res.traduz(101,traducao));%></td>

                            </tr>     
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.1 <% out.print(res.traduz(107,traducao));%>:</label>
                    <input name="cod107" class="input2" type="number" min="0" step="1" id="fr17" value="<% if((session.getValue("fr17")!= null)&&(!session.getValue("fr17").equals("-1"))&&(!session.getValue("fr17").toString().isEmpty())){ out.print(session.getValue("fr17").toString());} %> " onBlur="isNumber(f.cod107.value,f.fr17.id);return false;" />
                    
                </div>
                 <div class="field">
                    <label for="name">7.2.2.2 <% out.print(res.traduz(108,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod108" id="fr18" <% if((session.getValue("fr18")!= null)&&(!session.getValue("fr18").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr18").toString()); if(var==1){ %>checked<%}} %>  value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>

                            </tr> 
                            <tr>

                                <td><input type="radio" name="cod108" id="fr18" <% if((session.getValue("fr18")!= null)&&(!session.getValue("fr18").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr18").toString()); if(var==2){ %>checked<%}} %> value="2"  />  1-<% out.print(res.traduz(101,traducao));%></td>

                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.3 <% out.print(res.traduz(109,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td> 
 
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==2){ %>checked<%}} %> value="2"   />  2-<% out.print(res.traduz(19,traducao));%></td> 
          
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(7,traducao));%></td> 

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(120,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(8,traducao));%></td>
 
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(17,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod109" id="fr19" <% if((session.getValue("fr19")!= null)&&(!session.getValue("fr19").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr19").toString()); if(var==7){ %>checked<%}} %> value="7"   />  7-<% out.print(res.traduz(20,traducao));%></td> 

                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.4 <% out.print(res.traduz(110,traducao));%>:</label><br>
                    <table>
                           
                            <tr>

                                 <td><input type="radio" name="cod110" id="fr20" <% if((session.getValue("fr20")!= null)&&(!session.getValue("fr20").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr20").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(111,traducao));%></td>
   
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod110" id="fr20" <% if((session.getValue("fr20")!= null)&&(!session.getValue("fr20").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr20").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod110" id="fr20" <% if((session.getValue("fr20")!= null)&&(!session.getValue("fr20").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr20").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(113,traducao));%></td>

                         </tr>

                        </table>
                    
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.5 <% out.print(res.traduz(114,traducao));%>:</label>
                    <input name="cod114" class="input2" type="number" min="0" step="1" id="fr21" value="<% if((session.getValue("fr21")!= null)&&(!session.getValue("fr21").equals("-1"))&&(!session.getValue("fr21").toString().isEmpty())){ out.print(session.getValue("fr21").toString());} %>" onBlur="isNumber(f.cod114.value,f.fr21.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.6 <% out.print(res.traduz(115,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(6,traducao));%></td>
     
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==2){ %>checked<%}} %> value="2"   />  2-<% out.print(res.traduz(116,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(117,traducao));%></td>

                            </tr>
                            <tr>

                               <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==4){ %>checked<%}} %> value="4"  />  4-<% out.print(res.traduz(118,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(119,traducao));%></td>
 
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==6){ %>checked<%}} %> value="6" />  6-<% out.print(res.traduz(120,traducao));%></td>
 
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==7){ %>checked<%}} %> value="7"  />  7-<% out.print(res.traduz(121,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==8){ %>checked<%}} %> value="8" />  8-<% out.print(res.traduz(122,traducao));%></td>
 
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==9){ %>checked<%}} %> value="9"  />  9-<% out.print(res.traduz(123,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==10){ %>checked<%}} %> value="10"  />  10-<% out.print(res.traduz(8,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==11){ %>checked<%}} %> value="11"  />  11-<% out.print(res.traduz(124,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==12){ %>checked<%}} %> value="12"  />  12-<% out.print(res.traduz(125,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod115" id="fr22" <% if((session.getValue("fr22")!= null)&&(!session.getValue("fr22").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr22").toString()); if(var==13){ %>checked<%}} %> value="13"  />  13-<% out.print(res.traduz(20,traducao));%></td>

                            </tr>
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.7 <% out.print(res.traduz(126,traducao));%>:</label><br>
                    <table>
             
                             <tr>

                                <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(127,traducao));%></td>

                                <td><img src="./imagens/elongate.png"/></td>
                        
                            </tr>
                            <tr>

                                 <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(128,traducao));%></td>

                                <td><img src="./imagens/almost.png"/></td>
                            </tr>
                            <tr>
 
                                <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==3){ %>checked<%}} %>  value="3"  />  3-<% out.print(res.traduz(129,traducao));%></td>

                                <td><img src="./imagens/triangular.png"/></td>
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==4){ %>checked<%}} %>  value="4" />  4-<% out.print(res.traduz(85,traducao));%></td>

                                <td><img src="./imagens/companulate.png"/></td>
                            </tr>
                             <tr>

                                <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==5){ %>checked<%}} %>  value="5"   />  5-<% out.print(res.traduz(130,traducao));%></td>

                                <td><img src="./imagens/blocky.png"/></td>
                            </tr>
                            <tr>

                                <td><input type="radio" name="cod126" id="fr23" <% if((session.getValue("fr23")!= null)&&(!session.getValue("fr23").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr23").toString()); if(var==6){ %>checked<%}} %>  value="6"   />  6-<% out.print(res.traduz(20,traducao));%></td>
    
                            </tr>
                            
                        </table>
                     
                 </div>
                <br>
                <div class="field">
                    <label for="name">7.2.2.8 <% out.print(res.traduz(131,traducao));%>:</label>
                    <input name="cod131" class="input2" type="number" min="0" step="0.01" id="fr24" value="<% if((session.getValue("fr24")!= null)&&(!session.getValue("fr24").equals("-1"))&&(!session.getValue("fr24").toString().isEmpty())){ out.print(session.getValue("fr24").toString());} %> " onBlur="isNumber(f.cod131.value,f.fr24.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.9 <% out.print(res.traduz(132,traducao));%>:</label>
                    <input name="cod132" class="input2" type="number" min="0" step="0.01" id="fr25" value="<% if((session.getValue("fr25")!= null)&&(!session.getValue("fr25").equals("-1"))&&(!session.getValue("fr25").toString().isEmpty())){ out.print(session.getValue("fr25").toString());} %>" onBlur="isNumber(f.cod132.value,f.fr25.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.10 <% out.print(res.traduz(133,traducao));%>:</label>
                    <input name="cod133" class="input2" type="number" min="0" step="0.01" id="fr26" value="<% if((session.getValue("fr26")!= null)&&(!session.getValue("fr26").equals("-1"))&&(!session.getValue("fr26").toString().isEmpty())){ out.print(session.getValue("fr26").toString());} %> " onBlur="isNumber(f.cod133.value,f.fr26.id);return false;"/>   
                </div>
                <div class="field">
                    <label for="name">7.2.2.11 <% out.print(res.traduz(134,traducao));%>:</label>
                    <input name="cod134" class="input2" type="number" min="0" step="0.01" id="fr27" value="<% if((session.getValue("fr27")!= null)&&(!session.getValue("fr27").equals("-1"))&&(!session.getValue("fr27").toString().isEmpty())){ out.print(session.getValue("fr27").toString());} %> " onBlur="isNumber(f.cod134.value,f.fr27.id);return false;" /> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.12 <% out.print(res.traduz(135,traducao));%>:</label>
                    <input name="cod135" class="input2" type="number" min="0" step="0.01" id="fr28" value="<% if((session.getValue("fr28")!= null)&&(!session.getValue("fr28").equals("-1"))&&(!session.getValue("fr28").toString().isEmpty())){ out.print(session.getValue("fr28").toString());} %> " onBlur="isNumber(f.cod135.value,f.fr28.id);return false;" /> 
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

                                                <td><input type="radio" name="cod136" id="fr29" <% if((session.getValue("fr29")!= null)&&(!session.getValue("fr29").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr29").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(137,traducao));%></td>

                                                <td><input type="radio" name="cod136" id="fr29" <% if((session.getValue("fr29")!= null)&&(!session.getValue("fr29").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr29").toString()); if(var==2){ %>checked<%}} %>  value="2"   />  2-<% out.print(res.traduz(138,traducao));%></td>

                                                <td><input type="radio" name="cod136" id="fr29" <% if((session.getValue("fr29")!= null)&&(!session.getValue("fr29").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr29").toString()); if(var==3){ %>checked<%}} %>  value="3"  />  3-<% out.print(res.traduz(139,traducao));%></td>

                            </tr>
                            <tr>
                                <td><img src="./imagens/fig12.4.png"/></td>
                                <td><img src="./imagens/fig12.5.png"/></td>
                            </tr>
                            <tr>

                                   <td><input type="radio" name="cod136" id="fr29" <% if((session.getValue("fr29")!= null)&&(!session.getValue("fr29").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr29").toString()); if(var==4){ %>checked<%}} %> value="4"   />  4-<% out.print(res.traduz(140,traducao));%></td>

                                   <td><input type="radio" name="cod136" id="fr29" <% if((session.getValue("fr29")!= null)&&(!session.getValue("fr29").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr29").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(141,traducao));%></td>
   
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

                                 <td><input type="radio" name="cod142" id="fr30" <% if((session.getValue("fr30")!= null)&&(!session.getValue("fr30").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr30").toString()); if(var==1){ %>checked<%}} %> value="1"  />  0-<% out.print(res.traduz(100,traducao));%></td>

                                 <td><input type="radio" name="cod142" id="fr30" <% if((session.getValue("fr30")!= null)&&(!session.getValue("fr30").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr30").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>

                                
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

                                 <td><input type="radio" name="cod143" id="fr31" <% if((session.getValue("fr31")!= null)&&(!session.getValue("fr31").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr31").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(144,traducao));%></td>

                                 <td><input type="radio" name="cod143" id="fr31" <% if((session.getValue("fr31")!= null)&&(!session.getValue("fr31").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr31").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(145,traducao));%></td>

                                 <td><input type="radio" name="cod143" id="fr31" <% if((session.getValue("fr31")!= null)&&(!session.getValue("fr31").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr31").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(146,traducao));%></td>

                                 <td><input type="radio" name="cod143" id="fr31" <% if((session.getValue("fr31")!= null)&&(!session.getValue("fr31").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr31").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(147,traducao));%></td>

                                <td><input type="radio" name="cod143" id="fr31" <% if((session.getValue("fr31")!= null)&&(!session.getValue("fr31").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr31").toString()); if(var==5){ %>checked<%}} %>  value="5"  />  5-<% out.print(res.traduz(20,traducao));%></td>

                            </tr>
                 
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.16 <% out.print(res.traduz(148,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod148" id="fr32" <% if((session.getValue("fr32")!= null)&&(!session.getValue("fr32").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr32").toString()); if(var==1){ %>checked<%}} %> value="1" />  0-<% out.print(res.traduz(100,traducao));%></td>

                            </tr> 
                            <tr>

                              <td><input type="radio" name="cod148" id="fr32" <% if((session.getValue("fr32")!= null)&&(!session.getValue("fr32").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr32").toString()); if(var==2){ %>checked<%}} %> value="2" />  1-<% out.print(res.traduz(101,traducao));%></td>

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

                               <td><input type="radio" name="cod149" id="fr33" <% if((session.getValue("fr33")!= null)&&(!session.getValue("fr33").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr33").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(150,traducao));%>  </td>

                               <td><input type="radio" name="cod149" id="fr33" <% if((session.getValue("fr33")!= null)&&(!session.getValue("fr33").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr33").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%>  </td>

                               <td><input type="radio" name="cod149" id="fr33" <% if((session.getValue("fr33")!= null)&&(!session.getValue("fr33").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr33").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(151,traducao));%>  </td>
  
                            </tr>   
                        </table></center>
                    
                </div>
                <div class="field">
                    <label for="name">7.2.2.18 <% out.print(res.traduz(152,traducao));%>:</label>
                    <input name="cod152" class="input2" type="number" min="0" step="1" id="fr34" value="<% if((session.getValue("fr34")!= null)&&(!session.getValue("fr34").equals("-1"))&&(!session.getValue("fr34").toString().isEmpty())){ out.print(session.getValue("fr34").toString());} %> " onBlur="isNumber(f.cod152.value,f.fr34.id);return false;" /> 
                </div>
                <div class="field">
                    <label for="name">7.2.2.19 <% out.print(res.traduz(153,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod153" id="fr35" <% if((session.getValue("fr35")!= null)&&(!session.getValue("fr35").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr35").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(154,traducao));%></td>

                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod153" id="fr35" <% if((session.getValue("fr35")!= null)&&(!session.getValue("fr35").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr35").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(155,traducao));%></td>

                            </tr>
                            <tr>

                               <td><input type="radio" name="cod153" id="fr35" <% if((session.getValue("fr35")!= null)&&(!session.getValue("fr35").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr35").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(156,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
                
                <div class="field">
                    <label for="name">7.2.2.20.1 <% out.print(res.traduz(158,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod158" id="fr36" <% if((session.getValue("fr36")!= null)&&(!session.getValue("fr36").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr36").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(159,traducao));%></td> 
 
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod158" id="fr36" <% if((session.getValue("fr36")!= null)&&(!session.getValue("fr36").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr36").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod158" id="fr36" <% if((session.getValue("fr36")!= null)&&(!session.getValue("fr36").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr36").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(160,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.20.2 <% out.print(res.traduz(161,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod161" id="fr37" <% if((session.getValue("fr37")!= null)&&(!session.getValue("fr37").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr37").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(159,traducao));%></td>
  
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod161" id="fr37" <% if((session.getValue("fr37")!= null)&&(!session.getValue("fr37").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr37").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(112,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod161" id="fr37" <% if((session.getValue("fr37")!= null)&&(!session.getValue("fr37").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr37").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(160,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.21 <% out.print(res.traduz(162,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod162" id="fr38" <% if((session.getValue("fr38")!= null)&&(!session.getValue("fr38").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr38").toString()); if(var==1){ %>checked<%}} %> value="1"  />  <% out.print(res.traduz(163,traducao));%></td>
   
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod162" id="fr38" <% if((session.getValue("fr38")!= null)&&(!session.getValue("fr38").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr38").toString()); if(var==2){ %>checked<%}} %> value="2"  />  <% out.print(res.traduz(164,traducao));%></td>

                            </tr>
                            <tr>

                               <td><input type="radio" name="cod162" id="fr38" <% if((session.getValue("fr38")!= null)&&(!session.getValue("fr38").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr38").toString()); if(var==3){ %>checked<%}} %> value="3"  />  <% out.print(res.traduz(165,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.2.2.22 <% out.print(res.traduz(180,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod180" id="fr39" <% if((session.getValue("fr39")!= null)&&(!session.getValue("fr39").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr39").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(181,traducao));%></td>
 
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod180" id="fr39" <% if((session.getValue("fr39")!= null)&&(!session.getValue("fr39").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr39").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(182,traducao));%></td>

                            </tr>
                            <tr>

                               <td><input type="radio" name="cod180" id="fr39" <% if((session.getValue("fr39")!= null)&&(!session.getValue("fr39").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr39").toString()); if(var==7){ %>checked<%}} %> value="7"   />  7-<% out.print(res.traduz(183,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
               
                <div class="field">
                    <label for="name">7.3.1 <% out.print(res.traduz(167,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod167" id="fr40" <% if((session.getValue("fr40")!= null)&&(!session.getValue("fr40").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr40").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(168,traducao));%></td>
    
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod167" id="fr40" <% if((session.getValue("fr40")!= null)&&(!session.getValue("fr40").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr40").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(124,traducao));%></td> 

                            </tr>
                            <tr>
 
                                <td><input type="radio" name="cod167" id="fr40" <% if((session.getValue("fr40")!= null)&&(!session.getValue("fr40").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr40").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(125,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod167" id="fr40" <% if((session.getValue("fr40")!= null)&&(!session.getValue("fr40").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr40").toString()); if(var==4){ %>checked<%}} %> value="4"  />  4-<% out.print(res.traduz(20,traducao));%></td> 

                            </tr>
                            
                        </table>   
                 </div>
                <div class="field">
                    <label for="name">7.3.2 <% out.print(res.traduz(169,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                 <td><input type="radio" name="cod169" id="fr41" <% if((session.getValue("fr41")!= null)&&(!session.getValue("fr41").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr41").toString()); if(var==1){ %>checked<%}} %> value="1" />  1-<% out.print(res.traduz(154,traducao));%></td>
 
                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod169" id="fr41" <% if((session.getValue("fr41")!= null)&&(!session.getValue("fr41").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr41").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2-<% out.print(res.traduz(170,traducao));%></td>
 
                            </tr>
                            <tr>
 
                                <td><input type="radio" name="cod169" id="fr41" <% if((session.getValue("fr41")!= null)&&(!session.getValue("fr41").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr41").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(156,traducao));%></td> 

                            </tr>
                        </table>   
                </div>
                 <div class="field">
                    <label for="name">7.3.3 <% out.print(res.traduz(171,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                                <td><input type="radio" name="cod171" id="fr42" <% if((session.getValue("fr42")!= null)&&(!session.getValue("fr42").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr42").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(172,traducao));%></td>

                            </tr>  
                            <tr>

                                <td><input type="radio" name="cod171" id="fr42" <% if((session.getValue("fr42")!= null)&&(!session.getValue("fr42").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr42").toString()); if(var==5){ %>checked<%}} %> value="5" />  5-<% out.print(res.traduz(50,traducao));%></td>

                            </tr>
                            <tr>

                               <td><input type="radio" name="cod171" id="fr42" <% if((session.getValue("fr42")!= null)&&(!session.getValue("fr42").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr42").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(173,traducao));%></td>

                            </tr>
                      </table>   
                 </div>
                 <div class="field">
                    <label for="name">7.3.4 <% out.print(res.traduz(174,traducao));%>:</label>
                    <input name="cod174" class="input2" type="number" min="0" step="0.01" id="fr43" value="<% if((session.getValue("fr43")!= null)&&(!session.getValue("fr43").equals("-1"))&&(!session.getValue("fr43").toString().isEmpty())){ out.print(session.getValue("fr43").toString());} %>" onBlur="isNumber(f.cod174.value,f.fr43.id);return false;" /> 
                </div>
                 <div class="field">
                    <label for="name">7.3.5 <% out.print(res.traduz(175,traducao));%>:</label>
                    <input name="cod175" class="input2" type="number" min="0" step="1.0" id="fr44" value="<% if((session.getValue("fr44")!= null)&&(!session.getValue("fr44").equals("-1"))&&(!session.getValue("fr44").toString().isEmpty())){ out.print(session.getValue("fr44").toString());} %>" onBlur="isNumber(f.cod175.value,f.fr44.id);return false;" /> 
                </div>
                 <div class="field">
                    <label for="name">7.3.6 <% out.print(res.traduz(176,traducao));%>:</label><br>
                    <table>
                            
                            <tr>

                               <td><input type="radio" name="cod176" id="45" <% if((session.getValue("fr45")!= null)&&(!session.getValue("fr45").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr45").toString()); if(var==1){ %>checked<%}} %> value="1" />  <% out.print(res.traduz(177,traducao));%></td> 

                                   
                            </tr>  
                            <tr>

                               <td><input type="radio" name="cod176" id="45" <% if((session.getValue("fr45")!= null)&&(!session.getValue("fr45").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr45").toString()); if(var==2){ %>checked<%}} %> value="2" />  <% out.print(res.traduz(178,traducao));%></td>

                            </tr>
                            <tr>

                                <td><input type="radio" name="cod176" id="45" <% if((session.getValue("fr45")!= null)&&(!session.getValue("fr45").toString().isEmpty())){ int var=0;var = Integer.parseInt(session.getValue("fr45").toString()); if(var==3){ %>checked<%}} %> value="3"  />  <% out.print(res.traduz(179,traducao));%></td>

                            </tr>
                            
                        </table>   
                 </div>
                            
            <input type="button" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" onclick="confirmBox()" />    
            <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack3()" />      
                    
                </form>
                        
		</div>
        
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
    </body>
</html>




