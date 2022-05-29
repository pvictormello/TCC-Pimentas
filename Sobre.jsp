<%-- 
    Document   : Sobre
    Created on : 17/07/2015, 16:49:53
    Author     : Valdomiro
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/SobreCSS.css" type="text/css" media="screen" />
        <title></title>
    </head>
    <body>
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
         <!-------------BreadCrum------------------------------------->
        <div id="migalhas">
            <span class="mensagem" title="Ir para o Inicio"><% out.print(res.traduz(264,traducao));%></span>
            <a class="caminho"></a> »
            <a class="caminho"><% out.print(res.traduz(246,traducao));%>.</a>
            <!--Include.-->
        </div>
		
		 <div id="form-wrapper" class="myform">
            <form id="form" name="form" method="post" action="">
                
                <div class="sobre">
                  <p align="justify">&nbsp A Universidade Federal de Uberlândia, campus Monte Carmelo, criou no ano de 2013 o 
                banco de Germoplasma de <i> Capsicum</i> (BG <i>Capsicum</i> UFU), com o objetivo de conservar, preservar, documentar e 
                manter intercâmbio de germoplasma do gênero <i>Capsicum</i>. Os recursos genéticos armazenados são oriundos de
                coleta ou doação, sendo caracterizados quanto aos aspectos morfológicos e moleculares.
                Atualmente o BG <i>Capsicum</i> UFU possui mais de 250 acessos cadastrados e caracterizados.</p>
                <br>
               
                 <p align="justify">&nbsp Os acessos são caracterizados conforme <i> International Plant Genetic Resources Institute - Descriptors for Capsicum</i> (IPGRI, 1995)
                     utilizando um programa computacional denominado BG <i>Capsicum</i> UFU, desenvolvido na linguagem JSP (<i>JavaServer Pages</i>) com armazenamento de
                     informações no SGBD MariaDB. O sistema foi implementado como resultado da iniciação científica do aluno Valdomiro Caetano Martins orientado
				     pelos professores Ana Cláudia Martinez e Thiago Pirola Ribeiro da FACOM em parceiria com o professor Gabriel Mascarenhas Maciel do ICIAG.</p>
               
                <br>
                <p align="justify"> &nbsp A Universidade Federal de Uberlândia, na categoria de mantenedora do BG <i>Capsicum</i> UFU se resguarda o 
                direito de intercambiar recursos genéticos de seu acervo com instituições de pesquisa de caráter privado
                ou público. 
                Para tanto, os interessados devem entrar em contato com o curador do BG <i>Capsicum</i> UFU, Prof. Gabriel Mascarenhas Maciel, mediante o e-mail: <b>gabrielmaciel@iciag.ufu.br</b></p>
                </div>
                <br>
                <br>
                
                <div class="posicaoLogo">
                    
                    <a href="http://www.ufu.br/" title="Universidade Federal de Uberlândia"> <img src="imagens/logoufu_sobre.png" /></a>&nbsp&nbsp&nbsp&nbsp
                    <a href="http://www.portal.facom.ufu.br" title="Faculdade de Computação"> <img src="imagens/logofacom_sobre.png" /></a>&nbsp&nbsp&nbsp&nbsp
                    <a href="http://www.iciag.ufu.br/" title="Instituto de Ciências Agrárias"> <img src="imagens/logoiciag_sobre.png"/></a>
                    
                </div>
                
                
                
                
                
                
                
            </form>
        </div>
        
        
        </div>
            <br>
            <br>
        <%@include file="rodape.jsp" %>
    </body>
</html>
