<%-- 
    Document   : menu
    Created on : 02/09/2014, 14:51:29
    Author     : Valdomiro
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="css/style2.css" type="text/css" >
        <link rel=stylesheet href="css/jquery.waiting.css" type="text/css" >
        <script type="text/javascript" src="jquery/jquery.waiting.js"></script>
        <title></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            $(".link").click(function(){
                //alert("The paragraph was clicked.");
				var traducao =$('#trad').val();
                $("#load").addClass("jquery-waiting-base-container");
                $("#load").html(traducao+"!");
            });
        });
        </script>
        
    </head>
    <body>
        
       <div class="" id="load"></div>
         <% 
             Cookie cookie2 = null; 
            Cookie[] cookies2 = null;
            cookies2 = request.getCookies(); 
            
            String traducao="";
            if(cookies2!=null){
            for (int i = 0; i < cookies2.length; i++)
                { 
                    cookie2 = cookies2[i]; 
                    if(cookie2.getName().equals("Traducao")){
                      traducao = cookie2.getValue();
                     
                    }
                }
            }else
            {
               traducao="por";
               
            }
  
        %>
       <jsp:useBean id="re" class="meupacote.processa" />
      
         
        
         <% 
            try{
           //if(!session.isNew()){
            if(session.getValue("loginUsuario") != null && session.getValue("senhaUsuario") != null){
             
             String permissao= (String) session.getValue("permissaoUsuario");
             String array[] = new String[4];  
             array = permissao.split("-");
    
         %>
		 <input type="hidden" id="trad" value="<% out.print(re.traduz(285,traducao)); %>"/>
         <div class="menu" id="conteudo">
        <ul id="nav">
          <li class="current"><a href="Home.jsp">Home</a></li>
	
        <% if(array[0].toString().contains("1")){ %>
        <li><a href=""  ><% out.print(re.traduz(243,traducao)); %></a>
		<ul>
                    <% if(array[0].toString().charAt(0)=='1'){%>
			<li><a class="" href="Cadastro.jsp"><% out.print(re.traduz(207,traducao)); %></a></li>
                        <%} if(array[0].toString().charAt(1)=='1'){ %>
			<li><a class="" href="busca3.jsp"><% out.print(re.traduz(208,traducao)); %></a></li>
                        <%}if(array[0].toString().charAt(2)=='1'){%>
			<li><a class="" href="busca2.jsp"><% out.print(re.traduz(206,traducao)); %></a></li>
                        <%} if(array[0].toString().charAt(3)=='1'){ %>
			<li><a class="" href="busca.jsp"><% out.print(re.traduz(210,traducao)); %></a></li>
                        <%}%>
		</ul>
	</li>
        <% }
            if(array[1].toString().contains("1")){ 
        %>
	<li><a href="#"><% out.print(re.traduz(244,traducao)); %></a>
		<ul>
                      <% if(array[1].toString().charAt(0)=='1'){%>
			<li><a class="" href="CadPimenta.jsp"><% out.print(re.traduz(207,traducao)); %></a></li>
                        <%}
                            if(array[1].toString().charAt(1)=='1'){
                        %>
			<li><a class="" href="search3.jsp"><% out.print(re.traduz(208,traducao)); %></a></li>
                        <%}
                            if(array[1].toString().charAt(2)=='1'){
                         %>
			<li><a class="" href="search.jsp"><% out.print(re.traduz(209,traducao)); %></a></li>
                        <%}
                            if(array[1].toString().charAt(3)=='1'){
                        %>
			<li><a class="" href="search2.jsp"><% out.print(re.traduz(210,traducao)); %></a></li>
                        <%}%>
		</ul>
	</li> 
        <%} %>
        <% if(array[2].toString().contains("1")|| array[3].toString().contains("1")|| array[3].toString().contains("3")){  %>
          <li><a href="#"><% out.print(re.traduz(245,traducao)); %></a>
                <ul>
                    <% if(array[2].toString().contains("1")){ %>
                    <li><a class="link" href="#"><% out.print(re.traduz(243,traducao)); %></a>
                            <ul>
                                <% if(array[2].toString().charAt(0)=='1'){%>
                                <li><a class="link" href="GeraPdf.jsp"><% out.print(re.traduz(263,traducao)); %></a></li>
                                <%} if(array[2].toString().charAt(1)=='1'){%>
                                <li><a class="" href="SelectCidade.jsp"><% out.print(re.traduz(188,traducao)); %></a></li>
                                <%} if(array[2].toString().charAt(2)=='1'){%>
                                <li><a class="" href="SelectNome.jsp"><% out.print(re.traduz(249,traducao)); %></a></li>
                                <%} if(array[2].toString().charAt(3)=='1'){%>
                                <li><a class="" href="SelectPais.jsp"><% out.print(re.traduz(190,traducao)); %></a></li>
                                <%} if(array[2].toString().charAt(4)=='1'){%>
                                <li><a class="" href="SelectTipoUser.jsp"><% out.print(re.traduz(191,traducao)); %></a></li>
                                <%}%>

                            </ul>
                    </li> 
                    <%} %>
                    <% if(array[3].toString().contains("1")|| array[3].toString().contains("3")){ %>
                    <li><a href=""><% out.print(re.traduz(244,traducao)); %></a>
                            <ul>
                                <% if(array[3].toString().charAt(0)=='1'){ %>
                                <li><a class="link" href="RelGeralPim.jsp"><% out.print(re.traduz(263,traducao)); %></a>
                                    <ul>
                                        <li><a class="link" href="RelGeralCor.jsp"><% out.print(re.traduz(269,traducao)); %></a></li>
                                        <li><a class="link" href="RelGeralEspecie.jsp"><% out.print(re.traduz(230,traducao)); %></a></li>
                                        <li><a class="link" href="RelGeralID.jsp"><% out.print(re.traduz(251,traducao)); %></a></li>
                                        <li><a class="link" href="RelGeralLocal.jsp"><% out.print(re.traduz(267,traducao)); %></a></li>
                                        <li><a class="link" href="RelGeralTipo.jsp"><% out.print(re.traduz(268,traducao)); %></a></li>
                                    </ul>
                                </li>
                                <%} if(array[3].toString().charAt(1)=='1' || array[3].toString().charAt(1)=='3'){  %>
                                <li><a class="" href="SelectCor.jsp"><% out.print(re.traduz(269,traducao)); %></a></li>
                                <%} if(array[3].toString().charAt(2)=='1' || array[3].toString().charAt(2)=='3'){ %>
                                <li><a class="" href="SelectEspecie.jsp"><% out.print(re.traduz(230,traducao)); %></a></li>
                                <%} if(array[3].toString().charAt(3)=='1' || array[3].toString().charAt(3)=='3'){ %>
                                <li><a class="" href="SelectId.jsp"><% out.print(re.traduz(251,traducao)); %></a></li>
                                <%} if(array[3].toString().charAt(4)=='1'|| array[3].toString().charAt(4)=='3'){ %>
                                <li><a class="" href="SelectLocal.jsp"><% out.print(re.traduz(267,traducao)); %></a></li>
                                <%} if(array[3].toString().charAt(5)=='1'|| array[3].toString().charAt(5)=='3'){ %>
                                <li><a class="" href="SelectTipo.jsp"><% out.print(re.traduz(268,traducao)); %></a></li>
                                <%}%>
                               

                            </ul>
                    </li>
                    <%}%>
                </ul>
        </li>
        <%} %> 
	<li><a href="Sobre.jsp"><% out.print(re.traduz(246,traducao)); %></a></li>
        <li><a href="Faleconosco.jsp"><% out.print(re.traduz(266,traducao)); %></a></li>
        
        </ul>
        </div>
        <%}else{ %>
             
            <div class="menu" id="conteudo">
        <ul id="nav">
            <li class="current"><a href="Home.jsp">Home</a></li>
            <li><a href="#"><% out.print(re.traduz(244,traducao)); %></a>
                    <ul>

                         <li><a class="" href="login2.jsp"><% out.print(re.traduz(209,traducao)); %></a></li>

                    </ul>
            </li>	
            <li><a href="Sobre.jsp"><% out.print(re.traduz(246,traducao)); %></a></li>
            <li><a href="Faleconosco.jsp"><% out.print(re.traduz(266,traducao)); %></a></li>
       </ul>
        </div>
        
             <%}
            }catch(Exception e)
                    {
                      e.printStackTrace();
                      out.println(e);
                    }
        %>
        
      
        
      

    </body>
</html>
