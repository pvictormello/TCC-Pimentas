<%-- 
    Document   : imagens
    Created on : 15/02/2015, 13:45:43
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />
        <script type="text/javascript" src="js/script.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
       <!-- <script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript" src="functions.js"></script>
        <script type="text/javascript" src="bootstrap.min.js"></script>--->
        <link rel="stylesheet" href="css/custom.css" type="text/css" media="screen" />
       
        <title>Imagens</title>
    </head>
    <body>
        <h1></h1>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho" href="./localizacao.jsp" title="Ir para o Inicio"><% out.print(res.traduz(244,traducao));%></a> »
            <a class="caminho" href="./localizacao.jsp" ><% out.print(res.traduz(209,traducao));%></a> »
            <a class="caminho" href="./faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a> »
            <a class="caminho"><% out.print(res.traduz(248,traducao));%>.</a>
            <!--Include.-->
        </div>
        
        <jsp:useBean id="temp" class="meupacote.processaDB" />
        <ul id="nav2">
	    <li class=""><a href="localizacao.jsp"><% out.print(res.traduz(223,traducao));%></a></li>
	    <li class="active"><a href="faseplantula.jsp"><% out.print(res.traduz(224,traducao));%></a></li>
	   <%--<li class=""><a href="#"><% out.print(res.traduz(225,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(226,traducao));%></a></li>
	    <li class=""><a href="#"><% out.print(res.traduz(227,traducao));%></a></li>---%>
	</ul>
        <ul id="nav3">
            <li class=""><a href="faseplantula.jsp"><% out.print(res.traduz(4,traducao));%></a></li>
            <li class=""><a href="fasevegetativa.jsp"><% out.print(res.traduz(28,traducao));%></a></li>
            <li class=""><a href="fasereprodutiva.jsp"><% out.print(res.traduz(67,traducao));%></a></li>
            <li class="active"><a href="imagens.jsp"><% out.print(res.traduz(248,traducao));%></a></li>
        </ul>
        <%
             
                 int cod=0 ;//= Integer.parseInt(request.getParameter("chave"));
                 if(session.getValue("codigo")!=null){
                    cod = Integer.parseInt(session.getValue("codigo").toString());
                 }
                
         
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from imagens where identificador = '"+cod+"'");
              
              if(temp.getTamanho(cod)>0) 
              {
             
            %>
            <br>
            <br>
            <br>
            <div class="tab">
            <form id="contactform" method="post" action="search.jsp">
            <table cellspacing="0" id="myTable" summary="Tabela de dados">
            <thead>
              <tr>
                <!--<th><input type="checkbox" value="1" id="marcar-todos" name="marcar-todos" /></th>-->
                <th></th>
                <th><% out.print(res.traduz(251,traducao));%></th>
                <th><% out.print(res.traduz(249,traducao));%></th>
                <th><% out.print(res.traduz(248,traducao));%></th>
                <th></th>
              </tr>
            </thead>
            <%
              while(rs.next()){
                  %>
                 <tbody>
                    <tr>
                      <td></td>
                      <td><% out.print(rs.getString("identificador"));%></td>
                      <td><% out.print(rs.getString("nome"));%></td>
                      <%
                          String caminho="";
                          caminho= "./fotos/"+rs.getString("nome");
                      %>
                      <td><img src="<% out.print(caminho); %>" width="125" height="125"></td>
                     <!-- <td></td>--->
                     <!-- <td>
                        
                        <a href="#"><img src="./imagens/del.ico" width="35" height="35" title="Excluir"  /></a>
                      </td>-->
                      <td class="actions">
		       <!--<button class="delete" onclick="RemoveTableRow(this)" type="button">Remove</button>--->
		      </td>
                    </tr>
                   </tbody>
              <%    
                  
              }//final do while
              }
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
          %>
        
      
            </table>
            <% if(temp.getTamanho(cod)>0){ %>
            
            <input type="button" name="Submit"  class="button" value="<% out.print(res.traduz(240,traducao));%> >>" onclick="search()" />
            <% } %>
            
           </form>
           </div>
            <% if(temp.getTamanho(cod)<1){ %>
                    <div class="tab">
                         <form id="contactform" method="post" action=".jsp">
                           <img src="./imagens/semImagem.jpg" width="650" height="380">
                           <br>
                           <br>
                            <input type="button" name="Submit"  class="button" value="<% out.print(res.traduz(240,traducao));%> >>" onclick="search()" />
                         </form>
                    </div>
                     
                   <% }
            %>
          <br>
          <br>
          <%@include file="rodape.jsp" %> 
    
    
   <script>
    $(function(){
      
      $('table > tbody > tr:odd').addClass('odd');
      
      $('table > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('table > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('table > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $('form').submit(function(e){ e.preventDefault(); });
      
      $('#pesquisar').keydown(function(){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou) $(this).hide();
          else $(this).show();
          encontrou = false;
        });
      });
      
      $("table") 
        .tablesorter({
          dateFormat: 'uk',
          headers: {
            0: {
              sorter: false
            },
            5: {
              sorter: false
            }
          }
        }) 
        .tablesorterPager({container: $("#pager")})
        .bind('sortEnd', function(){
          $('table > tbody > tr').removeClass('odd');
          $('table > tbody > tr:odd').addClass('odd');
        });
      
    });
    </script>
    </body>
</html>
