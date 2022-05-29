<%-- 
    Document   : Corpo
    Created on : 02/09/2014, 13:46:43
    Author     : Valdomiro
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
           <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Efeito.css" type="text/css" media="screen" />  
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
       <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
 
      margin: auto;
      width:460px;
      height:350px;
      
  }
  .carousel{
    margin-top: 50px;
}
.item{
   
    text-align: center;
   
}
.container{
    z-index: 1;
}
/*------------Rodape--------------------*/

.rodapeHome 
{
  
     margin-top: 20px;
	padding: 15px 0;
	color: #999;
	font-size: .9em;
	background: #2d2d2d;
	-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.05), 0 -1px 0 rgba(0,0,0,0.2), inset 1px 0 0 rgba(0,0,0,0.2), inset -1px 0 0 rgba(0,0,0,0.2);
	box-shadow: inset 0 1px 0 rgba(255,255,255,0.05), 0 -1px 0 rgba(0,0,0,0.2), inset 1px 0 0 rgba(0,0,0,0.2), inset -1px 0 0 rgba(0,0,0,0.2);
}
.rodapeHome a 
{
        margin-right: 40px;
	color: #fff;
	text-decoration: none;
	text-shadow: 0px 2px 0px #24282c;
}
.rodapeHome a:hover 
{
 color: #25b695;
}
.infoHome
{
 margin-left: 120px;
 float: left;
 text-shadow: 0px 2px 0px #24282c;
}
.creditoHome 
{
  float: right;
}

  </style>

     
    </head>
    <body>
        
        <%@include file="Cabecalho.jsp" %>
        <%@include file="menu.jsp" %>
        
        <div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
	  <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <% 
        Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          int status=0;
          //String diretorio="C:\\Users\\Valdomiro\\Documents\\NetBeansProjects\\SistemaGermo\\build\\web\\imagens\\";
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from home");
              while(rs.next()){
                  
                  if(status==0)
                  {
                      %>
                      <div class="item active">
                          <img src="./imagens/<% out.print(rs.getString("NomeImagem")); %>"  width="460" height="245">
                        <div class="carousel-caption">
                            <h3><% out.print(rs.getString("Titulo")); %></h3>
                          <p><% out.print(rs.getString("Descricao")); %></p>
                        </div>
                      </div>
                      <%
                     status++;
                  }else
                  {
                      %>
                        <div class="item">
                        <img src="./imagens/<% out.print(rs.getString("NomeImagem")); %>"  width="460" height="245">
                        <div class="carousel-caption">
                            <h3><% out.print(rs.getString("Titulo")); %></h3>
                           <p><% out.print(rs.getString("Descricao")); %></p>
                        </div>
                      </div>
                      
                      <%
                      
                  }
                  
              }
              
          }catch(SQLException e)
             {
                   status=-1;
                    e.printStackTrace();
             }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
          
          
          
    
    %>


      

      
    
     <!--- <div class="item">
        <img src="pimenta3.jpg"  width="460" height="245">
        <div class="carousel-caption">
          <h3>Pimenta3</h3>
          <p>pim pim, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="pimenta4.jpg"  width="460" height="245">
        <div class="carousel-caption">
          <h3>Pimenta4</h3>
          <p>pimenta pimenta asc, .</p>
        </div>
      </div>
	  
	  <div class="item">
        <img src="pimenta5.jpg"  width="460" height="245">
        <div class="carousel-caption">
          <h3>Pimenta5</h3>
          <p>pimenta pimenta asc, .</p>
        </div>
      </div>---->
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <br>
    <br>
        
        <!--Rodape-->
       
      <%@include file="rodape.jsp"%> 
      
        
        
    </body>
</html>
