<%-- 
    Document   : SetCadastroPimenta
    Created on : 11/11/2014, 12:58:02
    Author     : Valdomiro
--%>



<%@page import="java.sql.Date"%>
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
           if(array[1].toString().charAt(0)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- <meta http-equiv="refresh" content="2; URL=CadPimenta.jsp" >-->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <title></title>
        <script>
  $(function() {
    $( "#dialog" ).dialog();
  });
  </script>
  <script>
 function executa() {
   
     var r = confirm("Deseja cadastrar imagens ?");
    if (r == true) {
        location.href="CadImagens.jsp";
        
        
    } else {
        location.href="Home.jsp";
    }

}
</script>
    </head>
    <body>
        
        <%
            
              
            
              int resultado=0;
              int status=0;
              String identificador="";
               String id="";//=request.getParameter("id");
              String esp="";// =request.getParameter("esp"); 
              String var="";//= request.getParameter("variedade"); 
              String cor="";//=request.getParameter("cor");
              String ger="";//=request.getParameter("geracao"); 
              String prod="";//=request.getParameter("produtor"); 
              String coo="";//=request.getParameter("coordenadas"); 
              String loc="";//=request.getParameter("localiza"); 
              String tel="";//=request.getParameter("tel"); 
              String dat="";//=request.getParameter("data");
              String obs="";//=request.getParameter("obs"); 
              if(session.getValue("nome")!= null){
                  id = session.getValue("nome").toString();
                  session.setAttribute("nome",null);
              }
              if(session.getValue("especie")!= null){
                  esp = session.getValue("especie").toString();
                  session.setAttribute("especie",null);
              }
              if(session.getValue("var")!= null){
                  var = session.getValue("var").toString();
                  session.setAttribute("var",null);
              }
              if(session.getValue("cor")!= null){
                  cor = session.getValue("cor").toString();
                  session.setAttribute("cor",null);
              }
              if(session.getValue("ger")!= null){
                  ger = session.getValue("ger").toString();
                  session.setAttribute("ger",null);
              }
              if(session.getValue("prod")!= null){
                  prod = session.getValue("prod").toString();
                  session.setAttribute("prod",null);
              }
              if(session.getValue("cord")!= null){
                  coo = session.getValue("cord").toString();
                  session.setAttribute("cord",null);
              }
              if(session.getValue("localiz")!= null){
                  loc = session.getValue("localiz").toString();
                  session.setAttribute("localiz",null);
              }
              if(session.getValue("tele")!= null){
                   tel= session.getValue("tele").toString();
                  session.setAttribute("tele",null);
              }
              if(session.getValue("data")!= null){
                  dat = session.getValue("data").toString();
                  session.setAttribute("data",null);
              }
              if(session.getValue("obs")!= null){
                  obs = session.getValue("obs").toString();
                  session.setAttribute("obs",null);
              }
             
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO local_coleta"+" VALUES('"+0+"','"+id+"','"+esp+"','"+var+"','"+cor+"','"+ger+"','"+prod+"','"+coo+"','"+loc+"','"+tel+"','"+dat+"','"+obs+"')");
               status++;
              
          }catch(Exception ex)
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
          String cod5 ="";// request.getParameter("corhipo");
          if(session.getValue("corhipo1")!= null){
                  cod5 = session.getValue("corhipo1").toString();
                  session.setAttribute("corhipo1",null);
              }
	      else{cod5="0";}
         
          String cod9=""; //request.getParameter("presTricoma"); 
          if(session.getValue("pt")!= null){
                  cod9 = session.getValue("pt").toString();
                  session.setAttribute("pt",null);
              }
	      else{cod9="0";} 
          String cod13="";// request.getParameter("corcotiledone"); 
          if(session.getValue("7.1.1.3")!= null){
                  cod13 = session.getValue("7.1.1.3").toString();
                  session.setAttribute("7.1.1.3",null);
              }
	      else{cod13="0";} 
          
          String cod21=""; //request.getParameter("formacoti"); 
          if(session.getValue("7.1.1.4")!= null){
                  cod21 = session.getValue("7.1.1.4").toString();
                  session.setAttribute("7.1.1.4",null);
              }
	      else{cod21="0";} 
          String cod26=""; //request.getParameter("cod26"); 
          if(session.getValue("codi26")!= null && !session.getValue("codi26").toString().isEmpty()){
                  cod26 = session.getValue("codi26").toString();
                  session.setAttribute("codi26",null);
              }
	      else{cod26="-1";} 
          
          String cod27=""; //request.getParameter("cod27");
          if(session.getValue("codi27")!= null && !session.getValue("codi27").toString().isEmpty()){
                  cod27 = session.getValue("codi27").toString();
                  session.setAttribute("codi27",null);
              }
	      else{cod27="-1";} 
          
          

          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               rs = st.executeQuery("Select Codigo from local_coleta where IDAmostra = '"+id+"'");
   
              while(rs.next()){
                  
                  resultado = Integer.parseInt(rs.getString("Codigo"));
                  
              }
          }catch(Exception e)
                 {
                     e.printStackTrace();
                     out.println(e);
                 }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
          
         
          try{
              //out.print("Chave da tabela local "+resultado);
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO faseplantula"+" VALUES('"+resultado+"','"+id+"','"+cod5+"','"+cod9+"','"+cod13+"','"+cod21+"','"+cod26+"','"+cod27+"')");
               status++;
          }catch(Exception e)
          {
              
              e.printStackTrace();
              out.print(e);
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
          
          String cod29 =""; //request.getParameter("cicloplanta");
          if(session.getValue("7.1.2.1")!= null){
                  cod29 = session.getValue("7.1.2.1").toString();
                  session.setAttribute("7.1.2.1",null);
              }
	      else{cod29="0";} 
         
          String cod33 ="";//request.getParameter("corTronco"); 
          if(session.getValue("7.1.2.2")!= null){
                  cod33 = session.getValue("7.1.2.2").toString();
                  session.setAttribute("7.1.2.2",null);
              }
	      else{cod33="0";} 
         
          String cod36 ="";// request.getParameter("AntocianinaNodal");
          if(session.getValue("7.1.2.3")!= null){
                  cod36 = session.getValue("7.1.2.3").toString();
                  session.setAttribute("7.1.2.3",null);
              }
	      else{cod36="0";} 
          String cod37 ="";// request.getParameter("FormaTronco"); 
          if(session.getValue("7.1.2.4")!= null){
                  cod37 = session.getValue("7.1.2.4").toString();
                  session.setAttribute("7.1.2.4",null);
              }
	      else{cod37="0";} 
      
          String cod41 ="";// request.getParameter("TricomaCaule");
          if(session.getValue("7.1.2.5")!= null){
                  cod41 = session.getValue("7.1.2.5").toString();
                  session.setAttribute("7.1.2.5",null);
              }
	      else{cod41="0";} 
          
          String cod42 =""; //request.getParameter("ComprimentoPlanta");
          if(session.getValue("7.1.2.6")!= null){
                  cod42 = session.getValue("7.1.2.6").toString();
                  session.setAttribute("7.1.2.6",null);
              }
	      else{cod42="0";} 
          
          String cod48 =""; //request.getParameter("HDCDP");
          if(session.getValue("7.1.2.7")!= null){
                  cod48 = session.getValue("7.1.2.7").toString();
                  session.setAttribute("7.1.2.7",null);
              }
	      else{cod48="0";} 
       
          String cod52 =""; //request.getParameter("cod52");
          if(session.getValue("cod52")!= null && !session.getValue("cod52").toString().isEmpty()){
                  cod52 = session.getValue("cod52").toString();
                  session.setAttribute("cod52",null);
              }
	      else{cod52="-1";} 
          String cod53 =""; //request.getParameter("cod53");
          if(session.getValue("cod53")!= null && !session.getValue("cod53").toString().isEmpty()){
                  cod53 = session.getValue("cod53").toString();
                  session.setAttribute("cod53",null);
              }
	      else{cod53="-1";} 
          String cod54 =""; //request.getParameter("cod54");
          if(session.getValue("cod54")!= null && !session.getValue("cod54").toString().isEmpty()){
                  cod54 = session.getValue("cod54").toString();
                  session.setAttribute("cod54",null);
              }
	      else{cod54="-1";} 
         
          String cod55 =""; //request.getParameter("HDR");
          if(session.getValue("7.1.2.11")!= null){
                  cod55 = session.getValue("7.1.2.11").toString();
                  session.setAttribute("7.1.2.11",null);
              }
	      else{cod55="0";} 
        
          String cod56 =""; //request.getParameter("perfilhamento");
          if(session.getValue("7.1.2.12")!= null){
                  cod56 = session.getValue("7.1.2.12").toString();
                  session.setAttribute("7.1.2.12",null);
              }
	      else{cod56="0";} 
          
          String cod57 =""; //request.getParameter("DensidadeFolha");
          if(session.getValue("7.1.2.13")!= null){
                  cod57 = session.getValue("7.1.2.13").toString();
                  session.setAttribute("7.1.2.13",null);
              }
	      else{cod57="0";} 
          
          String cod58 =""; //request.getParameter("corFolha");
          if(session.getValue("7.1.2.14")!= null){
                  cod58 = session.getValue("7.1.2.14").toString();
                  session.setAttribute("7.1.2.14",null);
              }
	      else{cod58="0";} 
          
          String cod59 =""; //request.getParameter("FormaFolha");
          if(session.getValue("7.1.2.15")!= null){
                  cod59 = session.getValue("7.1.2.15").toString();
                  session.setAttribute("7.1.2.15",null);
              }
	      else{cod59="0";} 
          
          String cod60 =""; //request.getParameter("MargemFolha");
          if(session.getValue("7.1.2.16")!= null){
                  cod60 = session.getValue("7.1.2.16").toString();
                  session.setAttribute("7.1.2.16",null);
              }
	      else{cod60="0";} 
          
          String cod64="";//request.getParameter("PDTNF");
          if(session.getValue("7.1.2.17")!= null){
                  cod64 = session.getValue("7.1.2.17").toString();
                  session.setAttribute("7.1.2.17",null);
              }
	      else{cod64="0";} 
         
          String cod65="";//request.getParameter("cod65");
          if(session.getValue("cod65")!= null && !session.getValue("cod65").toString().isEmpty()){
                  cod65 = session.getValue("cod65").toString();
                  session.setAttribute("cod65",null);
              }
	      else{cod65="-1";} 
          
          String cod66="";//request.getParameter("cod66"); 
          if(session.getValue("cod66")!= null && !session.getValue("cod66").toString().isEmpty()){
                  cod66 = session.getValue("cod66").toString();
                  session.setAttribute("cod66",null);
              }
	      else{cod66="-1";} 
          
          
           try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               rs = st.executeQuery("Select ID_Plantula,IDF from faseplantula where IDF = '"+id+"'");
   
              while(rs.next()){
                  
                  resultado = Integer.parseInt(rs.getString("ID_Plantula"));
                  identificador = rs.getString("IDF");
                  
                  
              }
          }catch(Exception e)
                 {
                     e.printStackTrace();
                     out.println(e);
                 }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
          //***-----------------------------Insere na tabela fasevegetativa--------------------------//
           //out.println("Codigo  "+resultado);
           //out.println("IDF  "+identificador);
           try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO fasevegetativa"+" VALUES('"+resultado+"','"+identificador+"','"+cod29+"','"+cod33+"','"+cod36+"','"+cod37+"','"+cod41+"','"+cod42+"','"+cod48+"','"+cod52+"','"+cod53+"','"+cod54+"','"+cod55+"','"+cod56+"','"+cod57+"','"+cod58+"','"+cod59+"','"+cod60+"','"+cod64+"','"+cod65+"','"+cod66+"')");
               status++;
          }catch(Exception e)
          {
              e.printStackTrace();
              out.print(e);
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
           String cod68="";
           String cod69="";
           String cod75="";
           String cod77="";
           String cod82="";
           int cod83=0;
	   int cod86=0;
	   int cod90=0;
	   String cod93="";
	   int cod222=0;
	   String cod94=""; 
	   int cod95=0;
	   int cod99=0;
           int cod102=0;
	   int cod103=0;
	   int cod106=0;
	   int cod107=0;
	   int cod108=0;
	   int cod109=0;
	   int cod110=0;
	   int cod114=0;
	   int cod115=0;
           int cod126=0;
	   String cod131="";
           String cod132="";
	   String cod133="";
           String cod134="";
           String cod135="";
	   int cod136=0;
           int cod142=0;
	   int cod143=0;
	   int cod148=0;
           int cod149=0;
	   int cod152=0;
	   int cod153=0;
           int cod158=0;
	   int cod161=0;
	   int cod162=0;
	   int cod180=0;
	   int cod167=0;
	   int cod169=0;
	   int cod171=0;
	   String cod174="";
	   String cod175="";
	   int cod176=0;          
          
             
             if(session.getValue("cod68")!=null && !session.getValue("cod68").toString().isEmpty()){ 
              cod68= session.getValue("cod68").toString();
              session.setAttribute("cod68",null);
             }else cod68="-1";
            
            if(session.getValue("7.2.1.2")!=null){
               cod69 = session.getValue("7.2.1.2").toString();
               session.setAttribute("7.2.1.2",null);
            }else cod69="0";
    
            if(session.getValue("7.2.1.3")!=null){
                cod75 = session.getValue("7.2.1.3").toString();
                session.setAttribute("7.2.1.3",null);
            }else cod75="0";
   
                      if(session.getValue("7.2.1.4")!=null){
			   cod77 = session.getValue("7.2.1.4").toString();
                           session.setAttribute("7.2.1.4",null);
			}else cod77="0";
                       if(session.getValue("7.2.1.5")!=null){
			   cod82 = session.getValue("7.2.1.5").toString();
                           session.setAttribute("7.2.1.5",null);  
			}else cod82="0";
			
			if(session.getValue("7.2.1.6")!=null){
			   cod83 = Integer.parseInt(session.getValue("7.2.1.6").toString());
                           session.setAttribute("7.2.1.6",null);
			}else cod83=0;
			if(session.getValue("7.2.1.7")!=null){
			   cod86 = Integer.parseInt(session.getValue("7.2.1.7").toString());
                           session.setAttribute("7.2.1.7",null);
			}else cod86=0;
			if(session.getValue("7.2.1.8")!=null){
			   cod90= Integer.parseInt(session.getValue("7.2.1.8").toString());
                           session.setAttribute("7.2.1.8",null);
			}else cod90=0;
			if(session.getValue("cod93")!=null && !session.getValue("cod93").toString().isEmpty()){
			  cod93 = session.getValue("cod93").toString();
                          session.setAttribute("cod93",null);
			}else cod93="-1";
			if(session.getValue("7.2.1.10")!=null){
			 cod222 = Integer.parseInt(session.getValue("7.2.1.10").toString());
                         session.setAttribute("7.2.1.10",null);
			}else cod222=0;
			if(session.getValue("cod94")!=null && !session.getValue("cod94").toString().isEmpty()){
			   cod94 = session.getValue("cod94").toString();
                           session.setAttribute("cod94",null);
			}else cod94="-1";
			if(session.getValue("7.2.1.12")!=null){
			  cod95 = Integer.parseInt(session.getValue("7.2.1.12").toString());
                          session.setAttribute("7.2.1.12",null);
			}else cod95=0;
			if(session.getValue("7.2.1.13")!=null){
			  cod99 = Integer.parseInt(session.getValue("7.2.1.13").toString());
                          session.setAttribute("7.2.1.13",null);
			}else cod99=0;
			if(session.getValue("7.2.1.14")!=null){
			    cod102 = Integer.parseInt(session.getValue("7.2.1.14").toString());
                            session.setAttribute("7.2.1.14",null);
			}else cod102=0;
			if(session.getValue("7.2.1.15")!=null){
			   cod103 = Integer.parseInt(session.getValue("7.2.1.15").toString());
                           session.setAttribute("7.2.1.15",null);
			}else cod103=0;
			if(session.getValue("7.2.1.16")!=null){
			   cod106 = Integer.parseInt(session.getValue("7.2.1.16").toString());
                           session.setAttribute("7.2.1.16",null);
			}else cod106=0;
			if(session.getValue("cod107")!=null && !session.getValue("cod107").toString().isEmpty()){
			    cod107 = Integer.parseInt(session.getValue("cod107").toString());
                            session.setAttribute("cod107",null);
			}else cod107=-1;
			if(session.getValue("7.2.2.2")!=null){
			   cod108 = Integer.parseInt(session.getValue("7.2.2.2").toString());
                           session.setAttribute("7.2.2.2",null);
			}else cod108=0;
			if(session.getValue("7.2.2.3")!=null){
			    cod109 = Integer.parseInt(session.getValue("7.2.2.3").toString());
                            session.setAttribute("7.2.2.3",null);
			}else cod109=0;
			if(session.getValue("7.2.2.4")!=null){
			    cod110 = Integer.parseInt(session.getValue("7.2.2.4").toString());
                            session.setAttribute("7.2.2.4",null);
			}else cod110=0;
			if(session.getValue("cod114")!=null && !session.getValue("cod114").toString().isEmpty()){
			   cod114= Integer.parseInt(session.getValue("cod114").toString());
                           session.setAttribute("cod114",null);
			}else cod114=-1;
			
			if(session.getValue("7.2.2.6")!=null){
			   cod115= Integer.parseInt(session.getValue("7.2.2.6").toString());
                           session.setAttribute("7.2.2.6",null);
			}else cod115=0;
			if(session.getValue("7.2.2.7")!=null){
			   cod126 = Integer.parseInt(session.getValue("7.2.2.7").toString());
                           session.setAttribute("7.2.2.7",null);
			}else cod126=0;
			if(session.getValue("cod131")!=null && !session.getValue("cod131").toString().isEmpty()){
			   cod131= session.getValue("cod131").toString();
                           session.setAttribute("cod131",null);
			}else cod131="-1";
			if(session.getValue("cod132") !=null && !session.getValue("cod132").toString().isEmpty()){
			   cod132= session.getValue("cod132").toString();
                           session.setAttribute("cod132",null);
			}else cod132="-1";
			if(session.getValue("cod133")!=null && !session.getValue("cod133").toString().isEmpty()){
			   cod133= session.getValue("cod133").toString();
                           session.setAttribute("cod133",null);
			}else cod133="-1";
			if(session.getValue("cod134")!=null && !session.getValue("cod134").toString().isEmpty()){
			   cod134= session.getValue("cod134").toString();
                           session.setAttribute("cod134",null);
			}else cod134="-1";
			if(session.getValue("cod135") !=null && !session.getValue("cod135").toString().isEmpty()){
			   cod135= session.getValue("cod135").toString();
                           session.setAttribute("cod135",null);
			}else cod135="-1";
			if(session.getValue("7.2.2.13") !=null){
			   cod136= Integer.parseInt(session.getValue("7.2.2.13").toString());
                           session.setAttribute("7.2.2.13",null);
			}else cod136=0;
			if(session.getValue("7.2.2.14") !=null){
			   cod142= Integer.parseInt(session.getValue("7.2.2.14").toString());
                           session.setAttribute("7.2.2.14",null);
			}else cod142=0;
			if(session.getValue("7.2.2.15")!=null){
			   cod143= Integer.parseInt(session.getValue("7.2.2.15").toString());
                           session.setAttribute("7.2.2.15",null);
			}else cod143=0;
			if(session.getValue("7.2.2.16") !=null){
			   cod148= Integer.parseInt(session.getValue("7.2.2.16").toString());
                           session.setAttribute("7.2.2.16",null);
			}else cod148=0;
			if(session.getValue("7.2.2.17")!=null){
			   cod149= Integer.parseInt(session.getValue("7.2.2.17").toString());
                           session.setAttribute("7.2.2.17",null);
			}else cod149=0;
			if(session.getValue("cod152")!=null&& !session.getValue("cod152").toString().isEmpty()){
			   cod152 = Integer.parseInt( session.getValue("cod152").toString());
                           session.setAttribute("cod152",null);
			}else cod152=-1;
		    if(session.getValue("7.2.2.19")!=null){
			   cod153= Integer.parseInt(session.getValue("7.2.2.19").toString());
                           session.setAttribute("7.2.2.19",null);
			}else cod153=0;
			if(session.getValue("7.2.2.20.1")!=null){
			   cod158= Integer.parseInt(session.getValue("7.2.2.20.1").toString());
                           session.setAttribute("7.2.2.20.1",null);
			}else cod158=0;
			if(session.getValue("7.2.2.20.2")!=null){
			   cod161 = Integer.parseInt(session.getValue("7.2.2.20.2").toString());
                           session.setAttribute("7.2.2.20.2",null);
			}else cod161=0;
			if(session.getValue("7.2.2.21")!=null){
			   cod162 = Integer.parseInt(session.getValue("7.2.2.21").toString());
                           session.setAttribute("7.2.2.21",null);
			}else cod162=0;
			if(session.getValue("7.2.2.22")!=null){
			   cod180 = Integer.parseInt(session.getValue("7.2.2.22").toString());
                           session.setAttribute("7.2.2.22",null);
			}else cod180=0;
			if(session.getValue("7.3.1")!=null){
			   cod167 = Integer.parseInt(session.getValue("7.3.1").toString());
                           session.setAttribute("7.3.1",null);
			}else cod167=0;
			if(session.getValue("7.3.2")!=null){
			   cod169 = Integer.parseInt( session.getValue("7.3.2").toString());
                           session.setAttribute("7.3.2",null);
			}else cod169=0;
			if(session.getValue("7.3.3")!=null){
			   cod171 = Integer.parseInt(session.getValue("7.3.3").toString());
                           session.setAttribute("7.3.3",null);
			}else cod171=0;
			if(session.getValue("cod174")!=null && !session.getValue("cod174").toString().isEmpty()){
			   cod174 = session.getValue("cod174").toString();
                           session.setAttribute("cod174",null);
			}else cod174="-1";
			if(session.getValue("cod175") !=null && !session.getValue("cod175").toString().isEmpty()){
			   cod175 = session.getValue("cod175").toString();
                           session.setAttribute("cod175",null);
			}else cod175="-1";
			if(session.getValue("7.3.6")!=null){
			   cod176 = Integer.parseInt(session.getValue("7.3.6").toString());
                           session.setAttribute("7.3.6",null);
			}else cod176=0;
            
           
            
            
            //***-----------------------------Insere na tabela faseReprodutiva--------------------------//
           try{
              //out.print("Codigo"+resultado);
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO fasereprodutiva"+" VALUES('"+resultado+"','"+identificador+"','"+cod68+"','"+cod69+"','"+cod75+"','"+cod77+"','"+cod82+"','"+cod83+"','"+cod86+"','"+cod90+"','"+cod93+"','"+cod222+"','"+cod94+"','"+cod95+"','"+cod99+"','"+cod102+"','"+cod103+"','"+cod106+"','"+cod107+"','"+cod108+"','"+cod109+"','"+cod110+"','"+cod114+"','"+cod115+"','"+cod126+"','"+cod131+"','"+cod132+"','"+cod133+"','"+cod134+"','"+cod135+"','"+cod136+"','"+cod142+"','"+cod143+"','"+cod148+"','"+cod149+"','"+cod152+"','"+cod153+"','"+cod158+"','"+cod161+"','"+cod162+"','"+cod180+"','"+cod167+"','"+cod169+"','"+cod171+"','"+cod174+"','"+cod175+"','"+cod176+"')");
               status++;
          }catch(Exception e)
          {
              e.printStackTrace();
              out.println(e);
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          } 
           
           if(status<4)
           {
               %>
                <div id="dialog" title="Mensagem" style="display:none">
                   <p>Ops acontenceu um erro !!!</p>
               </div>
              <%
           }else
           {
               session.putValue("index",resultado);
               session.putValue("cont",0);
               %>
               <div id="dialog" title="Mensagem" style="display:none">
                   <p>Cadastro realizado com Sucesso !</p>
               </div>
               
               <%
           }
            
         %>
         <script>
             window.executa();
          </script>
        
    </body>
</html>
