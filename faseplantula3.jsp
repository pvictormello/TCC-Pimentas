<%-- 
    Document   : faseplantula3
    Created on : 20/11/2014, 07:41:58
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
            <a class="caminho"><% out.print(res.traduz(4,traducao));%>.</a>
            <!--Include.-->
        </div>
        
        <ul id="nav2">
	    <li class=""><a href="localizacao3.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula3.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%-- <li class=""><a href=""><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href=""><% out.print(res.traduz(227,traducao));%></a></li> --%>
	</ul>
        
        <ul id="nav3">
            <li class="active"><a href="faseplantula3.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="fasevegetativa3.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="fasereprodutiva3.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
        </ul>
        
            <%
             
                 int cod = Integer.parseInt(session.getValue("esc").toString());//Integer.parseInt(request.getParameter("sel"));

                 int flag;
                 if(session.getValue("flag") !=null){
                     session.setAttribute("flag",1);
                     flag=Integer.parseInt(session.getValue("flag").toString());
                 }else{
                     session.setAttribute("flag",0);
                     flag= Integer.parseInt(session.getValue("flag").toString());
                 }
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          //out.print("Valor dad Flag"+flag);
         if(flag==0){
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from faseplantula where ID_Plantula = '"+cod+"'");
             
            
          
              while(rs.next()){
                 
                  session.putValue("fp1",rs.getString("cod5"));
                  session.putValue("fp2",rs.getString("cod9"));
                  session.putValue("fp3",rs.getString("cod13"));
                  session.putValue("fp4",rs.getString("cod21"));
                  session.putValue("fp5",rs.getString("cod26"));
                  session.putValue("fp6",rs.getString("cod27"));
                  
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

		<form id="contactform" name="f" class="rounded" method="post" action="fasevegetativa3.jsp">

                 <input type="hidden" name="codigo" value="<% out.print(cod); %>"/>      
		<h3><% out.print(res.traduz(4,traducao));%>:</h3>
		<div class="field">
                    <label for="name">7.1.1.1 <% out.print(res.traduz(5,traducao));%>:</label><br>
                        <table>
                            
                            <tr>
                                <td><% out.print(res.traduz(221,traducao));%>:</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corhipo" id="fp1" <% if(session.getValue("fp1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp1").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1- <% out.print(res.traduz(6,traducao));%></td>

                            </tr>
                            <tr>
                               <td><input type="radio" name="corhipo" id="fp1" <% if(session.getValue("fp1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp1").toString()); if(var==2){ %>checked<%}} %> value="2"  />  2- <% out.print(res.traduz(7,traducao));%></td>
     
                            </tr>
                            <tr>
                                <td><input type="radio" name="corhipo" id="fp1" <% if(session.getValue("fp1")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp1").toString()); if(var==3){ %>checked<%}} %> value="3"   /> 3- <% out.print(res.traduz(8,traducao));%> </td>
                       
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
                                 <td><input type="radio" name="presTricoma" id="fp2" <% if(session.getValue("fp2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp2").toString()); if(var==3){ %>checked<%}} %> value="3"  />  3-<% out.print(res.traduz(10,traducao));%></td>   
                            </tr>
                            <tr>
                                 <td><input type="radio" name="presTricoma" id="fp2" <% if(session.getValue("fp2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp2").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(11,traducao));%></td>
                            </tr>
                            <tr>
                                   <td><input type="radio" name="presTricoma" id="fp2" <% if(session.getValue("fp2")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp2").toString()); if(var==7){ %>checked<%}} %> value="7" />  7-<% out.print(res.traduz(12,traducao));%></td>
 
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
                                <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==1){ %>checked<%}} %> value="1"  />  1-<% out.print(res.traduz(14,traducao));%></td> 
                            </tr>
                            <tr>
                                <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==2){ %>checked<%}} %> value="2" />  2-<% out.print(res.traduz(7,traducao));%></td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==3){ %>checked<%}} %> value="3" />  3-<% out.print(res.traduz(15,traducao));%></td>

                            </tr>
                             <tr>
                                   <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==4){ %>checked<%}} %> value="4" />  4-<% out.print(res.traduz(16,traducao));%></td>
                            </tr>
                             <tr>
                                 <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==5){ %>checked<%}} %> value="5"  />  5-<% out.print(res.traduz(8,traducao));%></td>
  
                            </tr>
                             <tr>
                                 <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==6){ %>checked<%}} %> value="6"  />  6-<% out.print(res.traduz(17,traducao));%></td>
                                
                            </tr>
                             <tr>
                                 <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==7){ %>checked<%}} %>  value="7" />  7-<% out.print(res.traduz(18,traducao));%></td>
                                
                            </tr>
                             <tr>
                                  <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==8){ %>checked<%}} %> value="8"  />  8-<% out.print(res.traduz(19,traducao));%></td>
                                
                            </tr>
                             <tr>
                                    <td><input type="radio" name="corcotiledone" id="fp3" <% if(session.getValue("fp3")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp3").toString()); if(var==9){ %>checked<%}} %> value="9"  />  9-<% out.print(res.traduz(20,traducao));%></td>
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

                               <td><input type="radio" name="formacoti" id="fp4" <% if(session.getValue("fp4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp4").toString()); if(var==1){ %>checked<%}} %> value="1"  /> <% out.print(res.traduz(22,traducao));%></td>
                               <td><input type="radio" name="formacoti" id="fp4" <% if(session.getValue("fp4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp4").toString()); if(var==2){ %>checked<%}} %> value="2"  /> <% out.print(res.traduz(23,traducao));%></td>
                               <td><input type="radio" name="formacoti" id="fp4" <% if(session.getValue("fp4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp4").toString()); if(var==3){ %>checked<%}} %> value="3" /> <% out.print(res.traduz(24,traducao));%></td>
                               <td><input type="radio" name="formacoti" id="fp4" <% if(session.getValue("fp4")!= null){ int var=0;var = Integer.parseInt(session.getValue("fp4").toString()); if(var==4){ %>checked<%}} %> value="4" /> <% out.print(res.traduz(25,traducao));%></td>

                            </tr>
                           
                        </table>
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.5 <% out.print(res.traduz(26,traducao));%>:</label>
                    <input name="cod26" class="input2" type="number" min="0" step="0.01" id="fp5"  value="<% if(session.getValue("fp5")!= null){ if(!session.getValue("fp5").toString().isEmpty()){ Double var=0.0;var = Double.parseDouble(session.getValue("fp5").toString()); if(var!=-1.0){ out.print(session.getValue("fp5").toString());}}} %>" onBlur="isNumber(f.cod26.value,f.fp5.id);return false;" />
                    
                </div>
                <div class="field">
                    <label for="name">7.1.1.6 <% out.print(res.traduz(27,traducao));%>:</label>
                    <input name="cod27" class="input2" id="fp6" type="number" min="0" step="0.01" value="<% if(session.getValue("fp6")!= null){ if(!session.getValue("fp6").toString().isEmpty()){ Double var=0.0;var = Double.parseDouble(session.getValue("fp6").toString()); if(var!=-1.0){ out.print(session.getValue("fp6").toString());}}} %>" onBlur="isNumber(f.cod27.value,f.fp6.id);return false;" />
                    
                </div>
                     
                    
                    <input type="submit" name="Submit"  class="button" value="<% out.print(res.traduz(220,traducao));%> >>" />
                    <input type="button" name="Submit"  class="button" value="<< <% out.print(res.traduz(247,traducao));%>" onclick="goBack1()" />
                </form>
                        
		</div>
        <br>
        <br>
        <%@include file="rodape.jsp" %> 
            
    </body>
</html>
