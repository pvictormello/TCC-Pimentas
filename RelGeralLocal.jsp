<%-- 
    Document   : RelGeralLocal
    Created on : 12/05/2015, 13:25:11
    Author     : Valdomiro
--%>

<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.pdf.PdfStamper"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
     <jsp:useBean id="res" class="meupacote.processa" />
     <jsp:useBean id="acess" class="meupacote.processaDB" />
     <%
	      
		  if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permis= (String) session.getValue("permissaoUsuario");
           String array2[] = new String[4];  
           array2 = permis.split("-");
           if(array2[3].toString().charAt(0)!='1'){
             response.sendRedirect("Home.jsp");
           }else{
		  
           String escolha="";
           escolha = request.getParameter("escolhido");
    
            String traducao="";
               Cookie cookie = null; 
               Cookie[] cookies = null;
               cookies = request.getCookies(); 
           
           if(traducao.isEmpty()){
               
               if(cookies.length<=1){
                    Cookie trad= new Cookie("Traducao","por");
                    trad.setMaxAge(60*60*24);
                    response.addCookie(trad);
                    
                    
               }
                Cookie ck = null; 
                Cookie[] cks = null;
                cks = request.getCookies();
                 for (int i = 0; i < cks.length; i++)
                        { 
                            ck = cks[i]; 
                            if(ck.getName().equals("Traducao")){

                                traducao = ck.getValue();
                                

                            }
                            //out.print("Traducao cabecalho "+ ck.getValue());
                        }
                 
                 
                
           }
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          Document document = null;
          OutputStream os = null;
          String RESULT = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\pdfs\\relatorioPimenta.pdf"; 
          
          
          document = new Document(PageSize.A4, 72, 72, 72, 72);// Cria novo documento
          ByteArrayOutputStream baos = new ByteArrayOutputStream();
          PdfWriter.getInstance(document, baos);
           
          PdfWriter.getInstance(document, new FileOutputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\pdfs\\relatorioPimenta.pdf")); 
        
       //---------------Cria estilos de fontes diferentes-------------------//
        Font f = new Font(FontFamily.COURIER, 20, Font.BOLD);
        Font f2 = new Font(FontFamily.TIMES_ROMAN, 10, Font.BOLD);
        Font ff = new Font(FontFamily.TIMES_ROMAN, 9, Font.NORMAL);
        Font fp = new Font(FontFamily.COURIER, 10, Font.BOLDITALIC);
        Font fpe = new Font(FontFamily.COURIER, 10, Font.NORMAL);
Font fi = new Font(FontFamily.TIMES_ROMAN,10,Font.ITALIC);
        
        document.open();// Abre o documento para escrita
        
        try{
            Image img = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\logotipo.png");
			img.scaleAbsolute(150,100);
            img.setAlignment(Element.ALIGN_CENTER);
            document.add(img);
        }catch(Exception e)
                {
                  e.printStackTrace();
                  out.print(e);
                }
        
         Paragraph p1 = new Paragraph(res.traduz(262,traducao),f);// adicionando um parágrafo ao documento  Relátorio de Pimentas
         p1.setAlignment(Element.ALIGN_CENTER);
         p1.setSpacingBefore(10);
         p1.setSpacingAfter(20); //Solta espaçamento depois do paragrafo
         document.add(p1);
         
         try { 
        
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("select* from local_coleta as l,faseplantula as fp, fasevegetativa as fv,fasereprodutiva as fr where l.Codigo=fp.ID_Plantula and fp.ID_Plantula=fv.Identificador and fv.Identificador=fr.Identif order by localizacao ");
              
              
              
              while(rs.next())
              {
                  //-------------------------------------Local de coleta-----------------------------------------------//
                  Paragraph p = new Paragraph(""+res.traduz(229,traducao),f2); 
                  document.add(p);
                  if(!rs.getString("IDAmostra").isEmpty()){
                        Paragraph p2 = new Paragraph("    "+res.traduz(228,traducao)+" :     "+rs.getString("IDAmostra"),ff); 
                        document.add(p2);
                  }
                  //document.isMarginMirroring();
                  if(!rs.getString("especie").isEmpty()){
                        Paragraph p3 = new Paragraph("    "+res.traduz(230,traducao)+" :     "+rs.getString("especie"),fi); 
                        document.add(p3);
                  }
                  if(!rs.getString("variedade").isEmpty()){
                        Paragraph p4 = new Paragraph("    "+res.traduz(231,traducao)+" :     "+rs.getString("variedade"),ff); 
                        document.add(p4);
                  }
                  if(!rs.getString("cor").isEmpty()){
                        Paragraph p5 = new Paragraph("    "+res.traduz(232,traducao)+" :     "+rs.getString("cor"),ff); 
                        document.add(p5);
                  }
                  if(!rs.getString("geracao").isEmpty()){
                        Paragraph p6 = new Paragraph("    "+res.traduz(233,traducao)+" :     "+rs.getString("geracao"),ff); 
                        document.add(p6);
                  }
                  if(!rs.getString("nomeProdutor").isEmpty()){
                        Paragraph p7 = new Paragraph("    "+res.traduz(234,traducao)+" :     "+rs.getString("nomeProdutor"),ff); 
                        document.add(p7);
                  }
                  if(!rs.getString("coordenadas").isEmpty()){
                        Paragraph p8 = new Paragraph("    "+res.traduz(235,traducao)+" :     "+rs.getString("coordenadas"),ff); 
                        document.add(p8);
                  }
                  if(!rs.getString("localizacao").isEmpty()){
                        Paragraph p9 = new Paragraph("    "+res.traduz(236,traducao)+" :     "+rs.getString("localizacao"),ff); 
                        document.add(p9);
                  }
                  if(!rs.getString("telefone").isEmpty()){
                        Paragraph p10 = new Paragraph("    "+res.traduz(237,traducao)+" :     "+rs.getString("telefone"),ff); 
                        document.add(p10);
                  }
                  if(!rs.getString("dataColeta").isEmpty()){
                        Paragraph p11 = new Paragraph("    "+res.traduz(238,traducao)+" :     "+rs.getString("dataColeta"),ff); 
                        document.add(p11);
                  }
                  if(!rs.getString("observacao").isEmpty()){
                        Paragraph p12 = new Paragraph("    "+res.traduz(239,traducao)+" :     "+rs.getString("observacao"),ff); 
                        document.add(p12);
                  }
                  //document.newPage();
         
                  //---------------------------------------------Fase Plântula-------------------------------------------------//
                  
                  if(acess.verificaStatus(0,"faseplantula",Integer.parseInt(rs.getString("Codigo")))==0){
                      
                      
                  Paragraph p13 = new Paragraph(""+res.traduz(4,traducao),f2); 
                  p13.setSpacingAfter(10);
                  p13.setSpacingBefore(10);
                  document.add(p13);
                  
                  //Paragraph pg = new Paragraph("Valor de status"+acess.verificaStatus(0,"faseplantula",Integer.parseInt(rs.getString("Codigo"))),f2);
                  //document.add(pg);
                  }
                  if(!rs.getString("cod5").equals("0")){
                        if(rs.getString("cod5").equals("1")){
                            Paragraph p14 = new Paragraph("    "+res.traduz(5,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p14);
                        }else if(rs.getString("cod5").equals("2")){
                            Paragraph p14 = new Paragraph("    "+res.traduz(5,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p14);
                        }else if(rs.getString("cod5").equals("1")){
                            Paragraph p14 = new Paragraph("    "+res.traduz(5,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p14);
                        }
                  }
                  
                  if(!rs.getString("cod9").equals("0")){
                        if(rs.getString("cod9").equals("3")){
                            Paragraph p15 = new Paragraph("    "+res.traduz(9,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p15);
                        }else if(rs.getString("cod9").equals("5")){
                            Paragraph p15 = new Paragraph("    "+res.traduz(9,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p15);
                        }else if(rs.getString("cod9").equals("7")){
                            Paragraph p15 = new Paragraph("    "+res.traduz(9,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p15);
                        }
                  }
                  
                  if(!rs.getString("cod13").equals("0")){
                        if(rs.getString("cod13").equals("1")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(14,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("2")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("3")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(15,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("4")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(16,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("5")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("6")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(17,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("7")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(18,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("8")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p16);
                        }else if(rs.getString("cod13").equals("9")){
                            Paragraph p16 = new Paragraph("    "+res.traduz(13,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p16);
                        }
                  }
                  
                  if(!rs.getString("cod21").equals("0")){
                      
                      
                        if(rs.getString("cod21").equals("1")){
                            Paragraph p21 = new Paragraph("    "+res.traduz(21,traducao)+" :     "+res.traduz(22,traducao),ff); 
                            document.add(p21);
                            Image img1 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\img1.png");
                            img1.setAlignment(Element.ALIGN_LEFT);
                            img1.setSpacingAfter(15);
                            img1.setSpacingBefore(25);
                            img1.scaleAbsolute(80,100);
                           // img1.scalePercent(30,30);
                            document.add(img1);
                        }else if(rs.getString("cod21").equals("2")){
                            Paragraph p21 = new Paragraph("    "+res.traduz(21,traducao)+" :     "+res.traduz(23,traducao),ff); 
                            document.add(p21);
                            Image img1 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\img2.png");
                            img1.setAlignment(Element.ALIGN_LEFT);
                            img1.setSpacingAfter(15);
                            img1.setSpacingBefore(25);
                            img1.scaleAbsolute(80,100);
                            document.add(img1);
                        }else if(rs.getString("cod21").equals("3")){
                            Paragraph p21 = new Paragraph("    "+res.traduz(21,traducao)+" :     "+res.traduz(24,traducao),ff); 
                            document.add(p21);
                            Image img1 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\img4.png");
                            img1.setAlignment(Element.ALIGN_LEFT);
                            img1.setSpacingAfter(15);
                            img1.setSpacingBefore(25);
                            img1.scaleAbsolute(80,100);
                            document.add(img1);
                        }else if(rs.getString("cod21").equals("4")){
                            Paragraph p21 = new Paragraph("    "+res.traduz(21,traducao)+" :     "+res.traduz(25,traducao),ff); 
                            document.add(p21);
                            Image img1 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\img5.png");
                            img1.setAlignment(Element.ALIGN_LEFT);
                            img1.setSpacingAfter(15);
                            img1.setSpacingBefore(25);
                            img1.scaleAbsolute(80,100);
                            document.add(img1);
                        }
                  }
                 
                   if(Double.parseDouble(rs.getString("cod26").toString())>=0){
                        
                            Paragraph p16 = new Paragraph("    "+res.traduz(26,traducao)+" :     "+rs.getString("cod26"),ff); 
                            document.add(p16);
                        
                  }
                  
                   if(Double.parseDouble(rs.getString("cod27").toString())>=0){
                        
                            Paragraph p17 = new Paragraph("    "+res.traduz(27,traducao)+" :     "+rs.getString("cod27"),ff); 
                            document.add(p17);
                        
                  }
                   //document.newPage(); 
                  
                   //--------------------------Fase Vegetativa-------------------------------------------//
                   
                   if(acess.verificaStatus(0,"fasevegetativa",Integer.parseInt(rs.getString("Codigo")))==0){
                   Paragraph p1v = new Paragraph(""+res.traduz(28,traducao),f2); 
                   p1v.setSpacingAfter(10);
                   p1v.setSpacingBefore(10);
                   document.add(p1v);
                   }
                   
                   if(!rs.getString("cod29").equals("0")){
                       
                       if(rs.getString("cod29").equals("1"))
                       {
                           
                            Paragraph p29 = new Paragraph("    "+res.traduz(29,traducao)+" :     "+res.traduz(30,traducao),ff); 
                            document.add(p29);
                       }else if(rs.getString("cod29").equals("2"))
                       {
                          Paragraph p29 = new Paragraph("    "+res.traduz(29,traducao)+" :     "+res.traduz(31,traducao),ff); 
                            document.add(p29); 
                       }else if(rs.getString("cod29").equals("3"))
                       {
                           Paragraph p29 = new Paragraph("    "+res.traduz(29,traducao)+" :     "+res.traduz(32,traducao),ff); 
                            document.add(p29);
                       }
                       
                   }
                   
                   if(!rs.getString("cod33").equals("0")){
                       
                       if(rs.getString("cod33").equals("1"))
                       {
                           
                            Paragraph p33 = new Paragraph("    "+res.traduz(33,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p33);
                       }else if(rs.getString("cod33").equals("2"))
                       {
                          Paragraph p33 = new Paragraph("    "+res.traduz(33,traducao)+" :     "+res.traduz(34,traducao),ff); 
                            document.add(p33); 
                       }else if(rs.getString("cod33").equals("3"))
                       {
                           Paragraph p33 = new Paragraph("    "+res.traduz(33,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p33);
                       }else if(rs.getString("cod33").equals("4"))
                       {
                           Paragraph p33 = new Paragraph("    "+res.traduz(33,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p33);
                       }
                       
                   }
                  
                   if(!rs.getString("cod36").equals("0")){
                       
                       if(rs.getString("cod36").equals("1"))
                       {
                           
                            Paragraph p36 = new Paragraph("    "+res.traduz(36,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p36);
                       }else if(rs.getString("cod36").equals("3"))
                       {
                          Paragraph p36 = new Paragraph("    "+res.traduz(36,traducao)+" :     "+res.traduz(16,traducao),ff); 
                            document.add(p36); 
                       }else if(rs.getString("cod36").equals("5"))
                       {
                           Paragraph p36 = new Paragraph("    "+res.traduz(36,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p36);
                       }else if(rs.getString("cod36").equals("7"))
                       {
                           Paragraph p36 = new Paragraph("    "+res.traduz(36,traducao)+" :     "+res.traduz(17,traducao),ff); 
                            document.add(p36);
                       }
                       
                   }
                   
                   if(!rs.getString("cod37").equals("0")){
                       
                       if(rs.getString("cod37").equals("1"))
                       {
                           
                            Paragraph p37 = new Paragraph("    "+res.traduz(37,traducao)+" :     "+res.traduz(38,traducao),ff); 
                            document.add(p37);
                       }else if(rs.getString("cod37").equals("2"))
                       {
                          Paragraph p37 = new Paragraph("    "+res.traduz(37,traducao)+" :     "+res.traduz(39,traducao),ff); 
                            document.add(p37); 
                       }else if(rs.getString("cod37").equals("3"))
                       {
                           Paragraph p37 = new Paragraph("    "+res.traduz(37,traducao)+" :     "+res.traduz(40,traducao),ff); 
                            document.add(p37);
                       }
                       
                   }
                   
                   if(!rs.getString("cod41").equals("0")){
                      
                      
                        if(rs.getString("cod41").equals("3")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(41,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p41);
                            Image img2 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\figura1.png");
                            //img2.setWidthPercentage(30);
                            img2.setAlignment(Element.ALIGN_LEFT);
                            img2.setSpacingAfter(15);
                            img2.setSpacingBefore(25);
                            img2.scaleAbsolute(80,100);
                            document.add(img2);
                        }else if(rs.getString("cod41").equals("5")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(41,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p41);
                            Image img2 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\figura2.png");
                            //img2.setWidthPercentage(30);
                            img2.setAlignment(Element.ALIGN_LEFT);
                            img2.setSpacingAfter(15);
                            img2.setSpacingBefore(25);
                            img2.scaleAbsolute(80,100);
                            document.add(img2);
                        }else if(rs.getString("cod41").equals("7")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(41,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p41);
                            Image img2 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\figura3.png");
                            //img2.setWidthPercentage(30);
                            img2.setAlignment(Element.ALIGN_LEFT);
                            img2.setSpacingAfter(15);
                            img2.setSpacingBefore(25);
                            img2.scaleAbsolute(80,100);
                            document.add(img2);
                        }
                  }
                   
                   if(!rs.getString("cod42").equals("0")){
                       
                       if(rs.getString("cod42").equals("1"))
                       {
                           
                            Paragraph p42 = new Paragraph("    "+res.traduz(42,traducao)+" :     "+"1",ff); 
                            document.add(p42);
                       }else if(rs.getString("cod42").equals("2"))
                       {
                          Paragraph p42 = new Paragraph("    "+res.traduz(42,traducao)+" :     "+"2",ff); 
                            document.add(p42); 
                       }else if(rs.getString("cod42").equals("3"))
                       {
                           Paragraph p42 = new Paragraph("    "+res.traduz(42,traducao)+" :     "+"3",ff); 
                            document.add(p42);
                       }else if(rs.getString("cod42").equals("4"))
                       {
                           Paragraph p42 = new Paragraph("    "+res.traduz(42,traducao)+" :     "+"4",ff); 
                            document.add(p42);
                       }else if(rs.getString("cod42").equals("5"))
                       {
                           Paragraph p42 = new Paragraph("    "+res.traduz(42,traducao)+" :     "+"5",ff); 
                            document.add(p42);
                       }
                       
                   }
                   
                   if(!rs.getString("cod48").equals("0")){
                       
                       if(rs.getString("cod48").equals("3"))
                       {
                           
                            Paragraph p48 = new Paragraph("    "+res.traduz(48,traducao)+" :     "+res.traduz(49,traducao),ff); 
                            document.add(p48);
                       }else if(rs.getString("cod48").equals("5"))
                       {
                          Paragraph p48 = new Paragraph("    "+res.traduz(48,traducao)+" :     "+res.traduz(50,traducao),ff); 
                            document.add(p48); 
                       }else if(rs.getString("cod48").equals("7"))
                       {
                           Paragraph p48 = new Paragraph("    "+res.traduz(48,traducao)+" :     "+res.traduz(51,traducao),ff); 
                            document.add(p48);
                       }else if(rs.getString("cod48").equals("9"))
                       {
                           Paragraph p48 = new Paragraph("    "+res.traduz(48,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p48);
                       }
                       
                   }
                   
                   if(Double.parseDouble(rs.getString("cod52").toString())>=0){
                        
                            Paragraph p52 = new Paragraph("    "+res.traduz(52,traducao)+" :     "+rs.getString("cod52"),ff); 
                            document.add(p52);
                        
                  }
                   
                   if(Double.parseDouble(rs.getString("cod53").toString())>=0){
                        
                            Paragraph p53 = new Paragraph("    "+res.traduz(53,traducao)+" :     "+rs.getString("cod53"),ff); 
                            document.add(p53);
                        
                  }
                   
                   if(Double.parseDouble(rs.getString("cod54").toString())>=0){
                        
                            Paragraph p54 = new Paragraph("    "+res.traduz(54,traducao)+" :     "+rs.getString("cod54"),ff); 
                            document.add(p54);
                        
                  }
                   
                   if(!rs.getString("cod55").equals("0")){
                      
                      
                        if(rs.getString("cod55").equals("3")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(55,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p41);
                            Image img02 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig1.png");
                            img02.setAlignment(Element.ALIGN_LEFT);
                            img02.setSpacingAfter(15);
                            img02.setSpacingBefore(25);
                            img02.scaleAbsolute(120,40);
                            document.add(img02);
                        }else if(rs.getString("cod55").equals("5")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(55,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p41);
                            Image img02 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig2.png");
                            img02.setAlignment(Element.ALIGN_LEFT);
                            img02.setSpacingAfter(15);
                            img02.setSpacingBefore(25);
                            img02.scaleAbsolute(120,40);
                            document.add(img02);
                        }else if(rs.getString("cod55").equals("7")){
                            Paragraph p41 = new Paragraph("    "+res.traduz(55,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p41);
                            Image img02 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig3.png");
                            img02.setAlignment(Element.ALIGN_LEFT);
                            img02.setSpacingAfter(15);
                            img02.setSpacingBefore(25);
                            img02.scaleAbsolute(80,120);
                            document.add(img02);
                        }
                  }
                   
                   if(!rs.getString("cod56").equals("0")){
                       
                       if(rs.getString("cod56").equals("3"))
                       {
                           
                            Paragraph p56 = new Paragraph("    "+res.traduz(56,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p56);
                       }else if(rs.getString("cod56").equals("5"))
                       {
                          Paragraph p56 = new Paragraph("    "+res.traduz(56,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p56); 
                       }else if(rs.getString("cod56").equals("7"))
                       {
                           Paragraph p56 = new Paragraph("    "+res.traduz(56,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p56);
                       }
                       
                   }
                   
                   if(!rs.getString("cod57").equals("0")){
                       
                       if(rs.getString("cod57").equals("3"))
                       {
                           
                            Paragraph p57 = new Paragraph("    "+res.traduz(57,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p57);
                       }else if(rs.getString("cod57").equals("5"))
                       {
                          Paragraph p57 = new Paragraph("    "+res.traduz(57,traducao)+" :     "+res.traduz(50,traducao),ff); 
                            document.add(p57); 
                       }else if(rs.getString("cod57").equals("7"))
                       {
                           Paragraph p57 = new Paragraph("    "+res.traduz(57,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p57);
                       }
                       
                   }
                   
                   if(!rs.getString("cod58").equals("0")){
                       
                       if(rs.getString("cod58").equals("1"))
                       {
                           
                            Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("2"))
                       {
                          Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(14,traducao),ff); 
                            document.add(p58); 
                       }else if(rs.getString("cod58").equals("3"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("4"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(15,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("5"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(16,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("6"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("7"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(18,traducao),ff); 
                            document.add(p58);
                       }else if(rs.getString("cod58").equals("8"))
                       {
                           Paragraph p58 = new Paragraph("    "+res.traduz(58,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p58);
                       }
                       
                   }
                   
                   if(!rs.getString("cod59").equals("0")){
                      
                      
                        if(rs.getString("cod59").equals("1")){
                            Paragraph p59 = new Paragraph("    "+res.traduz(59,traducao)+" :     "+res.traduz(22,traducao),ff); 
                            document.add(p59);
                            Image img59 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafshape1.png");
                            img59.setAlignment(Element.ALIGN_LEFT);
                            img59.setSpacingAfter(15);
                            img59.setSpacingBefore(25);
                            img59.scaleAbsolute(80,100);
                            document.add(img59);
                        }else if(rs.getString("cod59").equals("2")){
                            Paragraph p59 = new Paragraph("    "+res.traduz(59,traducao)+" :     "+res.traduz(23,traducao),ff); 
                            document.add(p59);
                            Image img59 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafshape2.png");
                            img59.setAlignment(Element.ALIGN_LEFT);
                            img59.setSpacingAfter(15);
                            img59.setSpacingBefore(25);
                            img59.scaleAbsolute(80,100);
                            document.add(img59);
                        }else if(rs.getString("cod59").equals("3")){
                            Paragraph p59 = new Paragraph("    "+res.traduz(59,traducao)+" :     "+res.traduz(24,traducao),ff); 
                            document.add(p59);
                            Image img59 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafshape3.png");
                            img59.setAlignment(Element.ALIGN_LEFT);
                            img59.setSpacingAfter(15);
                            img59.setSpacingBefore(25);
                            img59.scaleAbsolute(80,100);
                            document.add(img59);
                        }
                  }
                   
                   if(!rs.getString("cod60").equals("0")){
                       
                       if(rs.getString("cod60").equals("1"))
                       {
                           
                            Paragraph p60 = new Paragraph("    "+res.traduz(60,traducao)+" :     "+res.traduz(61,traducao),ff); 
                            document.add(p60);
                       }else if(rs.getString("cod60").equals("2"))
                       {
                          Paragraph p60 = new Paragraph("    "+res.traduz(60,traducao)+" :     "+res.traduz(62,traducao),ff); 
                            document.add(p60); 
                       }else if(rs.getString("cod60").equals("3"))
                       {
                           Paragraph p60 = new Paragraph("    "+res.traduz(60,traducao)+" :     "+res.traduz(63,traducao),ff); 
                            document.add(p60);
                       }
                       
                   }
                   
                   if(!rs.getString("cod64").equals("0")){
                      
                      
                        if(rs.getString("cod64").equals("3")){
                            Paragraph p64 = new Paragraph("    "+res.traduz(64,traducao)+" :     "+res.traduz(10,traducao),ff); 
                            document.add(p64);
                            Image img64 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafpubescence1.png");
                            img64.setAlignment(Element.ALIGN_LEFT );
                            img64.setSpacingAfter(15);
                            img64.setSpacingBefore(25);
                            img64.scaleAbsolute(80,100);
                            document.add(img64);
                        }else if(rs.getString("cod64").equals("5")){
                            Paragraph p64 = new Paragraph("    "+res.traduz(64,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p64);
                            Image img64 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafpubescence2.png");
                            img64.setAlignment(Element.ALIGN_LEFT);
                            img64.setSpacingAfter(15);
                            img64.setSpacingBefore(25);
                            img64.scaleAbsolute(80,100);
                            document.add(img64);
                        }else if(rs.getString("cod64").equals("7")){
                            Paragraph p64 = new Paragraph("    "+res.traduz(64,traducao)+" :     "+res.traduz(12,traducao),ff); 
                            document.add(p64);
                            Image img64 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\leafpubescence3.png");
                            img64.setAlignment(Element.ALIGN_LEFT);
                            img64.setSpacingAfter(15);
                            img64.setSpacingBefore(25);
                            img64.scaleAbsolute(80,100);
                            document.add(img64);
                        }
                  }
                   
                   if(Double.parseDouble(rs.getString("cod65").toString())>=0){
                        
                            Paragraph p65 = new Paragraph("    "+res.traduz(65,traducao)+" :     "+rs.getString("cod65"),ff); 
                            document.add(p65);
                        
                  }
                   
                   if(Double.parseDouble(rs.getString("cod66").toString())>=0){
                        
                            Paragraph p66 = new Paragraph("    "+res.traduz(66,traducao)+" :     "+rs.getString("cod66"),ff); 
                            document.add(p66);
                        
                  }
                   //--------------------------------Fase reprodutiva--------------------------------------------//
                   
                   if(acess.verificaStatus(0,"fasereprodutiva",Integer.parseInt(rs.getString("Codigo")))==0){
                   Paragraph pr = new Paragraph(""+res.traduz(67,traducao),f2); 
                    document.add(pr);
                   }
                    
                    if(Integer.parseInt(rs.getString("cod68").toString())>=0){
                        
                            Paragraph p68 = new Paragraph("    "+res.traduz(68,traducao)+" :     "+rs.getString("cod68"),ff); 
                            document.add(p68);
                        
                  }
                    
                   if(!rs.getString("cod69").equals("0")){
                       
                       if(rs.getString("cod69").equals("1"))
                       {
                           
                            Paragraph p69 = new Paragraph("    "+res.traduz(69,traducao)+" :     "+res.traduz(70,traducao),ff); 
                            document.add(p69);
                       }else if(rs.getString("cod69").equals("2"))
                       {
                          Paragraph p69 = new Paragraph("    "+res.traduz(69,traducao)+" :     "+res.traduz(71,traducao),ff); 
                            document.add(p69); 
                       }else if(rs.getString("cod69").equals("3"))
                       {
                           Paragraph p69 = new Paragraph("    "+res.traduz(69,traducao)+" :     "+res.traduz(72,traducao),ff); 
                            document.add(p69);
                       }else if(rs.getString("cod69").equals("4"))
                       {
                           Paragraph p69 = new Paragraph("    "+res.traduz(69,traducao)+" :     "+res.traduz(73,traducao),ff); 
                            document.add(p69);
                       }else if(rs.getString("cod69").equals("5"))
                       {
                           Paragraph p69 = new Paragraph("    "+res.traduz(69,traducao)+" :     "+res.traduz(74,traducao),ff); 
                            document.add(p69);
                       }
                       
                   }
                   
                   if(!rs.getString("cod75").equals("0")){
                      
                      
                        if(rs.getString("cod75").equals("3")){
                            Paragraph p75 = new Paragraph("    "+res.traduz(75,traducao)+" :     "+res.traduz(76,traducao),ff); 
                            document.add(p75);
                            Image img75 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\flower1.png");
                            img75.setAlignment(Element.ALIGN_LEFT);
                            img75.setSpacingAfter(15);
                            img75.setSpacingBefore(25);
                            img75.scaleAbsolute(100,140);
                            document.add(img75);
                        }else if(rs.getString("cod75").equals("5")){
                            Paragraph p75 = new Paragraph("    "+res.traduz(75,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p75);
                            Image img75 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\flower2.png");
                            img75.setAlignment(Element.ALIGN_LEFT);
                            img75.setSpacingAfter(15);
                            img75.setSpacingBefore(25);
                            img75.scaleAbsolute(100,140);
                            document.add(img75);
                        }else if(rs.getString("cod75").equals("7")){
                            Paragraph p75 = new Paragraph("    "+res.traduz(75,traducao)+" :     "+res.traduz(51,traducao),ff); 
                            document.add(p75);
                            Image img75 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\flower3.png");
                            img75.setAlignment(Element.ALIGN_LEFT);
                            img75.setSpacingAfter(15);
                            img75.setSpacingBefore(25);
                            img75.scaleAbsolute(100,140);
                            document.add(img75);
                        }
                  }
                   
                   if(!rs.getString("cod77").equals("0")){
                       
                       if(rs.getString("cod77").equals("1"))
                       {
                           
                            Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("2"))
                       {
                          Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(14,traducao),ff); 
                            document.add(p77); 
                       }else if(rs.getString("cod77").equals("3"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("4"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(78,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("5"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(79,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("6"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(80,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("7"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(81,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("8"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p77);
                       }else if(rs.getString("cod77").equals("9"))
                       {
                           Paragraph p77 = new Paragraph("    "+res.traduz(77,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p77);
                       }
                       
                   }
                   
                   if(!rs.getString("cod82").equals("0")){
                       
                       if(rs.getString("cod82").equals("1"))
                       {
                            Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p82);
                       }else if(rs.getString("cod82").equals("2"))
                       {
                          Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p82); 
                       }else if(rs.getString("cod82").equals("3"))
                       {
                           Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(78,traducao),ff); 
                            document.add(p82);
                       }else if(rs.getString("cod82").equals("4"))
                       {
                           Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p82);
                       }else if(rs.getString("cod82").equals("5"))
                       {
                           Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p82);
                       }else if(rs.getString("cod82").equals("6"))
                       {
                           Paragraph p82 = new Paragraph("    "+res.traduz(82,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p82);
                       }
                       
                   }
                   
                   if(!rs.getString("cod83").equals("0")){
                       
                       if(rs.getString("cod83").equals("1"))
                       {
                            Paragraph p83 = new Paragraph("    "+res.traduz(83,traducao)+" :     "+res.traduz(84,traducao),ff); 
                            document.add(p83);
                       }else if(rs.getString("cod83").equals("2"))
                       {
                          Paragraph p83 = new Paragraph("    "+res.traduz(83,traducao)+" :     "+res.traduz(85,traducao),ff); 
                            document.add(p83); 
                       }else if(rs.getString("cod83").equals("3"))
                       {
                           Paragraph p83 = new Paragraph("    "+res.traduz(83,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p83);
                       }
                   }
                   
                   if(!rs.getString("cod86").equals("0")){
                       
                       if(rs.getString("cod86").equals("1"))
                       {
                            Paragraph p86 = new Paragraph("    "+res.traduz(86,traducao)+" :     "+"1",ff); 
                            document.add(p86);
                       }else if(rs.getString("cod86").equals("2"))
                       {
                          Paragraph p86 = new Paragraph("    "+res.traduz(86,traducao)+" :     "+"2",ff); 
                            document.add(p86); 
                       }else if(rs.getString("cod86").equals("3"))
                       {
                           Paragraph p86 = new Paragraph("    "+res.traduz(86,traducao)+" :     "+"3",ff); 
                            document.add(p86);
                       }
                   }
                   
                   if(!rs.getString("cod90").equals("0")){
                       
                       if(rs.getString("cod90").equals("1"))
                       {
                            Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p90);
                       }else if(rs.getString("cod90").equals("2"))
                       {
                          Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p90); 
                       }else if(rs.getString("cod90").equals("3"))
                       {
                           Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(91,traducao),ff); 
                            document.add(p90);
                       }else if(rs.getString("cod90").equals("4"))
                       {
                           Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(92,traducao),ff); 
                            document.add(p90);
                       }else if(rs.getString("cod90").equals("5"))
                       {
                           Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p90);
                       }else if(rs.getString("cod90").equals("6"))
                       {
                           Paragraph p90 = new Paragraph("    "+res.traduz(90,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p90);
                       }
                   }
                   
                   if(Double.parseDouble(rs.getString("cod93").toString())>=0){
                        
                            Paragraph p93 = new Paragraph("    "+res.traduz(93,traducao)+" :     "+rs.getString("cod93"),ff); 
                            document.add(p93);
                        
                  }
                   
                   if(!rs.getString("cod222").equals("0")){
                       
                       if(rs.getString("cod222").equals("1"))
                       {
                            Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p222);
                       }else if(rs.getString("cod222").equals("2"))
                       {
                          Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p222); 
                       }else if(rs.getString("cod222").equals("3"))
                       {
                           Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p222);
                       }else if(rs.getString("cod222").equals("4"))
                       {
                           Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(92,traducao),ff); 
                            document.add(p222);
                       }else if(rs.getString("cod222").equals("5"))
                       {
                           Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(16,traducao),ff); 
                            document.add(p222);
                       }else if(rs.getString("cod222").equals("6"))
                       {
                           Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p222);
                       }else if(rs.getString("cod222").equals("7"))
                       {
                           Paragraph p222 = new Paragraph("    "+res.traduz(222,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p222);
                       }
                   }
                   
                    if(Double.parseDouble(rs.getString("cod94").toString())>=0){
                        
                            Paragraph p94 = new Paragraph("    "+res.traduz(94,traducao)+" :     "+rs.getString("cod94"),ff); 
                            document.add(p94);
                        
                  }
                    
                    if(!rs.getString("cod95").equals("0")){
                       
                       if(rs.getString("cod95").equals("3"))
                       {
                            Paragraph p95 = new Paragraph("    "+res.traduz(95,traducao)+" :     "+res.traduz(96,traducao),ff); 
                            document.add(p95);
                       }else if(rs.getString("cod95").equals("5"))
                       {
                          Paragraph p95 = new Paragraph("    "+res.traduz(95,traducao)+" :     "+res.traduz(97,traducao),ff); 
                            document.add(p95); 
                       }else if(rs.getString("cod95").equals("7"))
                       {
                           Paragraph p95 = new Paragraph("    "+res.traduz(95,traducao)+" :     "+res.traduz(98,traducao),ff); 
                            document.add(p95);
                       }
                   }
                    
                    if(!rs.getString("cod99").equals("0")){
                       
                       if(rs.getString("cod99").equals("1"))
                       {
                            Paragraph p99 = new Paragraph("    "+res.traduz(99,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p99);
                       }else if(rs.getString("cod99").equals("2"))
                       {
                          Paragraph p99 = new Paragraph("    "+res.traduz(99,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p99); 
                       }
                   }
                    
                    if(!rs.getString("cod102").equals("0")){
                       
                       if(rs.getString("cod102").equals("1"))
                       {
                            Paragraph p102 = new Paragraph("    "+res.traduz(102,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p102);
                       }else if(rs.getString("cod102").equals("2"))
                       {
                          Paragraph p102 = new Paragraph("    "+res.traduz(102,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p102); 
                       }
                   }
                    
                   if(!rs.getString("cod103").equals("0")){
                      
                      
                        if(rs.getString("cod103").equals("1")){
                            Paragraph p103 = new Paragraph("    "+res.traduz(103,traducao)+" :     "+res.traduz(104,traducao),ff); 
                            document.add(p103);
                            Image img103 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\calyx3.png");
                            img103.setAlignment(Element.ALIGN_LEFT);
                            img103.setSpacingAfter(15);
                            img103.setSpacingBefore(25);
                            img103.scaleAbsolute(70,90);
                            document.add(img103);
                        }else if(rs.getString("cod103").equals("2")){
                            Paragraph p103 = new Paragraph("    "+res.traduz(103,traducao)+" :     "+res.traduz(11,traducao),ff); 
                            document.add(p103);
                            Image img103 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\calyx5.png");
                            img103.setAlignment(Element.ALIGN_LEFT );
                            img103.setSpacingAfter(15);
                            img103.setSpacingBefore(25);
                            img103.scaleAbsolute(70,90);
                            document.add(img103);
                        }else if(rs.getString("cod103").equals("3")){
                            Paragraph p103 = new Paragraph("    "+res.traduz(103,traducao)+" :     "+res.traduz(105,traducao),ff); 
                            document.add(p103);
                            Image img103 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\calyx7.png");
                            img103.setAlignment(Element.ALIGN_LEFT );
                            img103.setSpacingAfter(15);
                            img103.setSpacingBefore(25);
                            img103.scaleAbsolute(70,90);
                            document.add(img103);
                        }else if(rs.getString("cod103").equals("4")){
                            Paragraph p103 = new Paragraph("    "+res.traduz(103,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p103);
                        }
                  }
                   
                   
                   if(!rs.getString("cod106").equals("0")){
                      
                      
                        if(rs.getString("cod106").equals("1")){
                            Paragraph p106 = new Paragraph("    "+res.traduz(106,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p106);
                            Image img106 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\calyx0.png");
                            img106.setAlignment(Element.ALIGN_LEFT);
                            img106.setSpacingAfter(15);
                            img106.setSpacingBefore(25);
                            img106.scaleAbsolute(80,100);
                            document.add(img106);
                        }else if(rs.getString("cod106").equals("2")){
                            Paragraph p106 = new Paragraph("    "+res.traduz(106,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p106);
                            Image img106 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\calyx1.png");
                            img106.setAlignment(Element.ALIGN_LEFT);
                            img106.setSpacingAfter(15);
                            img106.setSpacingBefore(25);
                            img106.scaleAbsolute(80,100);
                            document.add(img106);
                        }
                   }
                   
                   if(Integer.parseInt(rs.getString("cod107").toString())>=0){
                        
                            Paragraph p107 = new Paragraph("    "+res.traduz(107,traducao)+" :     "+rs.getString("cod107"),ff); 
                            document.add(p107);
                        
                  }
                   
                  if(!rs.getString("cod108").equals("0")){
                       
                       if(rs.getString("cod108").equals("1"))
                       {
                            Paragraph p108 = new Paragraph("    "+res.traduz(108,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p108);
                       }else if(rs.getString("cod108").equals("2"))
                       {
                          Paragraph p108 = new Paragraph("    "+res.traduz(108,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p108); 
                       }
                   } 
                  
                  if(!rs.getString("cod109").equals("0")){
                       
                       if(rs.getString("cod109").equals("1"))
                       {
                            Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p109);
                       }else if(rs.getString("cod109").equals("2"))
                       {
                          Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(19,traducao),ff); 
                            document.add(p109); 
                       }else if(rs.getString("cod109").equals("3"))
                       {
                           Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(7,traducao),ff); 
                            document.add(p109);
                       }else if(rs.getString("cod2109").equals("4"))
                       {
                           Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(120,traducao),ff); 
                            document.add(p109);
                       }else if(rs.getString("cod109").equals("5"))
                       {
                           Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p109);
                       }else if(rs.getString("cod109").equals("6"))
                       {
                           Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(17,traducao),ff); 
                            document.add(p109);
                       }else if(rs.getString("cod109").equals("7"))
                       {
                           Paragraph p109 = new Paragraph("    "+res.traduz(109,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p109);
                       }
                   }
                  
                  if(!rs.getString("cod110").equals("0")){
                       
                       if(rs.getString("cod110").equals("3"))
                       {
                            Paragraph p110 = new Paragraph("    "+res.traduz(110,traducao)+" :     "+res.traduz(111,traducao),ff); 
                            document.add(p110);
                       }else if(rs.getString("cod110").equals("5"))
                       {
                          Paragraph p110 = new Paragraph("    "+res.traduz(110,traducao)+" :     "+res.traduz(112,traducao),ff); 
                            document.add(p110); 
                       }else if(rs.getString("cod110").equals("7"))
                       {
                           Paragraph p110 = new Paragraph("    "+res.traduz(110,traducao)+" :     "+res.traduz(113,traducao),ff); 
                            document.add(p110);
                       }
                   }
                  
                  if(Integer.parseInt(rs.getString("cod114").toString())>=0){
                        
                            Paragraph p114 = new Paragraph("    "+res.traduz(114,traducao)+" :     "+rs.getString("cod114"),ff); 
                            document.add(p114);
                        
                  }
                  
                  if(!rs.getString("cod115").equals("0")){
                       
                       if(rs.getString("cod115").equals("1"))
                       {
                            Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(6,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("2"))
                       {
                          Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(116,traducao),ff); 
                            document.add(p115); 
                       }else if(rs.getString("cod115").equals("3"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(117,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("4"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(118,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("5"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(119,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("6"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(120,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("7"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(121,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("8"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(122,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("9"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(123,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("10"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(8,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("11"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(124,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("12"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(125,traducao),ff); 
                            document.add(p115);
                       }else if(rs.getString("cod115").equals("13"))
                       {
                           Paragraph p115 = new Paragraph("    "+res.traduz(115,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p115);
                       }
                   }
                  
                  if(!rs.getString("cod126").equals("0")){
                      
                      
                        if(rs.getString("cod126").equals("1")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(127,traducao),ff); 
                            document.add(p126);
                            Image img126 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\elongate.png");
                            img126.setAlignment(Element.ALIGN_CENTER);
                            img126.setSpacingAfter(15);
                            img126.setSpacingBefore(25);
                            img126.scaleAbsolute(250,80);
                            document.add(img126);
                        }else if(rs.getString("cod126").equals("2")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(128,traducao),ff); 
                            document.add(p126);
                            Image img126 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\almost.png");
                            img126.setAlignment(Element.ALIGN_LEFT);
                            img126.setSpacingAfter(15);
                            img126.setSpacingBefore(25);
                            img126.scaleAbsolute(100,80);
                            document.add(img126);
                        }else if(rs.getString("cod126").equals("3")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(129,traducao),ff); 
                            document.add(p126);
                            Image img126 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\triangular.png");
                            img126.setAlignment(Element.ALIGN_CENTER);
                            img126.setSpacingAfter(15);
                            img126.setSpacingBefore(25);
                            img126.scaleAbsolute(250,80);
                            document.add(img126);
                        }else if(rs.getString("cod126").equals("4")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(85,traducao),ff); 
                            document.add(p126);
                            Image img126 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\companulate.png");
                            img126.setAlignment(Element.ALIGN_LEFT);
                            img126.setSpacingAfter(15);
                            img126.setSpacingBefore(25);
                            img126.scaleAbsolute(150,80);
                            document.add(img126);
                        }else if(rs.getString("cod126").equals("5")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(130,traducao),ff); 
                            document.add(p126);
                            Image img126 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\blocky.png");
                            img126.setAlignment(Element.ALIGN_LEFT);
                            img126.setSpacingAfter(15);
                            img126.setSpacingBefore(25);
                            img126.scaleAbsolute(150,80);
                            document.add(img126);
                        }else if(rs.getString("cod126").equals("6")){
                            Paragraph p126 = new Paragraph("    "+res.traduz(126,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p126);
                        }
                  }
                  
                  if(Double.parseDouble(rs.getString("cod131").toString())>=0){
                        
                            Paragraph p131 = new Paragraph("    "+res.traduz(131,traducao)+" :     "+rs.getString("cod131"),ff); 
                            document.add(p131);
                        
                  }
                  
                  if(Double.parseDouble(rs.getString("cod132").toString())>=0){
                        
                            Paragraph p132 = new Paragraph("    "+res.traduz(132,traducao)+" :     "+rs.getString("cod132"),ff); 
                            document.add(p132);
                        
                  }
                  
                  if(Double.parseDouble(rs.getString("cod133").toString())>=0){
                        
                            Paragraph p133 = new Paragraph("    "+res.traduz(133,traducao)+" :     "+rs.getString("cod133"),ff); 
                            document.add(p133);
                        
                  }
                  
                  if(Double.parseDouble(rs.getString("cod134").toString())>=0){
                        
                            Paragraph p134 = new Paragraph("    "+res.traduz(134,traducao)+" :     "+rs.getString("cod134"),ff); 
                            document.add(p134);
                        
                  }
                  
                  if(Double.parseDouble(rs.getString("cod135").toString())>=0){
                        
                            Paragraph p135 = new Paragraph("    "+res.traduz(135,traducao)+" :     "+rs.getString("cod135"),ff); 
                            document.add(p135);
                        
                  }
                  
                  if(!rs.getString("cod136").equals("0")){
                      
                      
                        if(rs.getString("cod136").equals("1")){
                            Paragraph p136 = new Paragraph("    "+res.traduz(136,traducao)+" :     "+res.traduz(137,traducao),ff); 
                            document.add(p136);
                            Image img136 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig12.1.png");
                            img136.setAlignment(Element.ALIGN_LEFT);
                            img136.setSpacingAfter(15);
                            img136.setSpacingBefore(25);
                            img136.scaleAbsolute(70,100);
                            document.add(img136);
                        }else if(rs.getString("cod136").equals("2")){
                            Paragraph p136 = new Paragraph("    "+res.traduz(136,traducao)+" :     "+res.traduz(138,traducao),ff); 
                            document.add(p136);
                            Image img136 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig12.2.png");
                            img136.setAlignment(Element.ALIGN_LEFT);
                            img136.setSpacingAfter(15);
                            img136.setSpacingBefore(25);
                            img136.scaleAbsolute(70,100);
                            document.add(img136);
                        }else if(rs.getString("cod136").equals("3")){
                            Paragraph p136 = new Paragraph("    "+res.traduz(136,traducao)+" :     "+res.traduz(139,traducao),ff); 
                            document.add(p136);
                            Image img136 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig12.3.png");
                            img136.setAlignment(Element.ALIGN_LEFT);
                            img136.setSpacingAfter(15);
                            img136.setSpacingBefore(25);
                            img136.scaleAbsolute(70,100);
                            document.add(img136);
                        }else if(rs.getString("cod136").equals("4")){
                            Paragraph p136 = new Paragraph("    "+res.traduz(136,traducao)+" :     "+res.traduz(140,traducao),ff); 
                            document.add(p136);
                            Image img136 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig12.4.png");
                            img136.setAlignment(Element.ALIGN_LEFT);
                            img136.setSpacingAfter(15);
                            img136.setSpacingBefore(25);
                            img136.scaleAbsolute(70,100);
                            document.add(img136);
                        }else if(rs.getString("cod136").equals("5")){
                            Paragraph p136 = new Paragraph("    "+res.traduz(136,traducao)+" :     "+res.traduz(141,traducao),ff); 
                            document.add(p136);
                            Image img136 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fig12.5.png");
                            img136.setAlignment(Element.ALIGN_LEFT);
                            img136.setSpacingAfter(15);
                            img136.setSpacingBefore(25);
                            img136.scaleAbsolute(70,100);
                            document.add(img136);
                        }
                  }
                  
                  if(!rs.getString("cod142").equals("0")){
                      
                      
                        if(rs.getString("cod142").equals("1")){
                            Paragraph p142 = new Paragraph("    "+res.traduz(142,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p142);
                            Image img142 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\neck1.png");
                            img142.setAlignment(Element.ALIGN_LEFT);
                            img142.setSpacingAfter(15);
                            img142.setSpacingBefore(25);
                            img142.scaleAbsolute(80,80);
                            document.add(img142);
                        }else if(rs.getString("cod142").equals("2")){
                            Paragraph p142 = new Paragraph("    "+res.traduz(142,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p142);
                            Image img142 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\neck2.png");
                            img142.setAlignment(Element.ALIGN_LEFT);
                            img142.setSpacingAfter(15);
                            img142.setSpacingBefore(25);
                            img142.scaleAbsolute(80,80);
                            document.add(img142);
                        }
                   }
                  
                    if(!rs.getString("cod143").equals("0")){
                      
                      
                        if(rs.getString("cod143").equals("1")){
                            Paragraph p143 = new Paragraph("    "+res.traduz(143,traducao)+" :     "+res.traduz(144,traducao),ff); 
                            document.add(p143);
                            Image img143 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\pointed.png");
                            img143.setAlignment(Element.ALIGN_LEFT);
                            img143.setSpacingAfter(15);
                            img143.setSpacingBefore(25);
                            img143.scaleAbsolute(40,50);
                            document.add(img143);
                        }else if(rs.getString("cod136").equals("2")){
                            Paragraph p143 = new Paragraph("    "+res.traduz(143,traducao)+" :     "+res.traduz(145,traducao),ff); 
                            document.add(p143);
                            Image img143 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\blunt.png");
                            img143.setAlignment(Element.ALIGN_LEFT);
                            img143.setSpacingAfter(15);
                            img143.setSpacingBefore(25);
                            img143.scaleAbsolute(40,50);
                            document.add(img143);
                        }else if(rs.getString("cod143").equals("3")){
                            Paragraph p143 = new Paragraph("    "+res.traduz(143,traducao)+" :     "+res.traduz(146,traducao),ff); 
                            document.add(p143);
                            Image img143 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\sunken.png");
                            img143.setAlignment(Element.ALIGN_LEFT);
                            img143.setSpacingAfter(15);
                            img143.setSpacingBefore(25);
                            img143.scaleAbsolute(40,50);
                            document.add(img143);
                        }else if(rs.getString("cod143").equals("4")){
                            Paragraph p143 = new Paragraph("    "+res.traduz(143,traducao)+" :     "+res.traduz(147,traducao),ff); 
                            document.add(p143);
                            Image img143 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\sunkenandpointed.png");
                            img143.setAlignment(Element.ALIGN_LEFT);
                            img143.setSpacingAfter(15);
                            img143.setSpacingBefore(25);
                            img143.scaleAbsolute(40,50);
                            document.add(img143);
                        }else if(rs.getString("cod143").equals("5")){
                            Paragraph p143 = new Paragraph("    "+res.traduz(143,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p143);
                            
                        }
                  }
                    
                    if(!rs.getString("cod148").equals("0")){
                       
                       if(rs.getString("cod148").equals("1"))
                       {
                            Paragraph p148 = new Paragraph("    "+res.traduz(148,traducao)+" :     "+res.traduz(100,traducao),ff); 
                            document.add(p148);
                       }else if(rs.getString("cod148").equals("2"))
                       {
                          Paragraph p148 = new Paragraph("    "+res.traduz(148,traducao)+" :     "+res.traduz(101,traducao),ff); 
                            document.add(p148); 
                       }
                   } 
                    
                    if(!rs.getString("cod149").equals("0")){
                      
                      
                        if(rs.getString("cod149").equals("3")){
                            Paragraph p149 = new Paragraph("    "+res.traduz(149,traducao)+" :     "+res.traduz(150,traducao),ff); 
                            document.add(p149);
                            Image img149 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fruit3.png");
                            img149.setAlignment(Element.ALIGN_LEFT);
                            img149.setSpacingAfter(15);
                            img149.setSpacingBefore(25);
                            img149.scaleAbsolute(80,80);
                            document.add(img149);
                        }else if(rs.getString("cod149").equals("5")){
                            Paragraph p149 = new Paragraph("    "+res.traduz(149,traducao)+" :     "+res.traduz(112,traducao),ff); 
                            document.add(p149);
                            Image img149 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fruit5.png");
                            img149.setAlignment(Element.ALIGN_LEFT);
                            img149.setSpacingAfter(15);
                            img149.setSpacingBefore(25);
                            img149.scaleAbsolute(80,80);
                            document.add(img149);
                        }else if(rs.getString("cod149").equals("7")){
                            Paragraph p149 = new Paragraph("    "+res.traduz(149,traducao)+" :     "+res.traduz(151,traducao),ff); 
                            document.add(p149);
                            Image img149 = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\fruit7.png");
                            img149.setAlignment(Element.ALIGN_LEFT);
                            img149.setSpacingAfter(15);
                            img149.setSpacingBefore(25);
                            img149.scaleAbsolute(80,80);
                            document.add(img149);
                        }
                  }
                  
                  if(Integer.parseInt(rs.getString("cod152").toString())>=0){
                        
                            Paragraph p152 = new Paragraph("    "+res.traduz(152,traducao)+" :     "+rs.getString("cod152"),ff); 
                            document.add(p152);
                        
                  }
                  
                  if(!rs.getString("cod153").equals("0")){
                       
                       if(rs.getString("cod153").equals("1"))
                       {
                            Paragraph p153 = new Paragraph("    "+res.traduz(153,traducao)+" :     "+res.traduz(154,traducao),ff); 
                            document.add(p153);
                       }else if(rs.getString("cod153").equals("2"))
                       {
                          Paragraph p153 = new Paragraph("    "+res.traduz(153,traducao)+" :     "+res.traduz(155,traducao),ff); 
                            document.add(p153); 
                       }else if(rs.getString("cod153").equals("3"))
                       {
                           Paragraph p153 = new Paragraph("    "+res.traduz(153,traducao)+" :     "+res.traduz(156,traducao),ff); 
                            document.add(p153);
                       }
                   }
                  
                  if(!rs.getString("cod158").equals("0")){
                       
                       if(rs.getString("cod158").equals("3"))
                       {
                            Paragraph p158 = new Paragraph("    "+res.traduz(158,traducao)+" :     "+res.traduz(159,traducao),ff); 
                            document.add(p158);
                       }else if(rs.getString("cod158").equals("5"))
                       {
                          Paragraph p158 = new Paragraph("    "+res.traduz(158,traducao)+" :     "+res.traduz(112,traducao),ff); 
                            document.add(p158); 
                       }else if(rs.getString("cod158").equals("7"))
                       {
                           Paragraph p158 = new Paragraph("    "+res.traduz(158,traducao)+" :     "+res.traduz(160,traducao),ff); 
                            document.add(p158);
                       }
                   }
                  
                  
                  if(!rs.getString("cod161").equals("0")){
                       
                       if(rs.getString("cod161").equals("3"))
                       {
                            Paragraph p161 = new Paragraph("    "+res.traduz(161,traducao)+" :     "+res.traduz(159,traducao),ff); 
                            document.add(p161);
                       }else if(rs.getString("cod161").equals("5"))
                       {
                          Paragraph p161 = new Paragraph("    "+res.traduz(161,traducao)+" :     "+res.traduz(112,traducao),ff); 
                            document.add(p161); 
                       }else if(rs.getString("cod161").equals("7"))
                       {
                           Paragraph p161 = new Paragraph("    "+res.traduz(161,traducao)+" :     "+res.traduz(160,traducao),ff); 
                            document.add(p161);
                       }
                   }
                  
                  if(!rs.getString("cod162").equals("0")){
                       
                       if(rs.getString("cod162").equals("1"))
                       {
                            Paragraph p162 = new Paragraph("    "+res.traduz(162,traducao)+" :     "+"1",ff); 
                            document.add(p162);
                       }else if(rs.getString("cod162").equals("2"))
                       {
                          Paragraph p162 = new Paragraph("    "+res.traduz(162,traducao)+" :     "+"2",ff); 
                            document.add(p162); 
                       }else if(rs.getString("cod162").equals("3"))
                       {
                           Paragraph p162 = new Paragraph("    "+res.traduz(162,traducao)+" :     "+"3",ff); 
                            document.add(p162);
                       }
                   }
                  
                  
                  if(!rs.getString("cod180").equals("0")){
                       
                       if(rs.getString("cod180").equals("3"))
                       {
                            Paragraph p180 = new Paragraph("    "+res.traduz(180,traducao)+" :     "+res.traduz(181,traducao),ff); 
                            document.add(p180);
                       }else if(rs.getString("cod180").equals("5"))
                       {
                          Paragraph p180 = new Paragraph("    "+res.traduz(180,traducao)+" :     "+res.traduz(182,traducao),ff); 
                            document.add(p180); 
                       }else if(rs.getString("cod180").equals("7"))
                       {
                           Paragraph p180 = new Paragraph("    "+res.traduz(180,traducao)+" :     "+res.traduz(183,traducao),ff); 
                            document.add(p180);
                       }
                   }
                  
                  if(!rs.getString("cod167").equals("0")){
                       
                       if(rs.getString("cod167").equals("1"))
                       {
                            Paragraph p167 = new Paragraph("    "+res.traduz(167,traducao)+" :     "+res.traduz(168,traducao),ff); 
                            document.add(p167);
                       }else if(rs.getString("cod167").equals("2"))
                       {
                          Paragraph p167 = new Paragraph("    "+res.traduz(167,traducao)+" :     "+res.traduz(124,traducao),ff); 
                            document.add(p167); 
                       }else if(rs.getString("cod167").equals("3"))
                       {
                           Paragraph p167 = new Paragraph("    "+res.traduz(167,traducao)+" :     "+res.traduz(125,traducao),ff); 
                            document.add(p167);
                       }else if(rs.getString("cod167").equals("4"))
                       {
                           Paragraph p167 = new Paragraph("    "+res.traduz(167,traducao)+" :     "+res.traduz(20,traducao),ff); 
                            document.add(p167);
                       }
                   }
                  
                  if(!rs.getString("cod169").equals("0")){
                       
                       if(rs.getString("cod169").equals("1"))
                       {
                            Paragraph p169 = new Paragraph("    "+res.traduz(169,traducao)+" :     "+res.traduz(154,traducao),ff); 
                            document.add(p169);
                       }else if(rs.getString("cod169").equals("2"))
                       {
                          Paragraph p169 = new Paragraph("    "+res.traduz(169,traducao)+" :     "+res.traduz(170,traducao),ff); 
                            document.add(p169); 
                       }else if(rs.getString("cod169").equals("3"))
                       {
                           Paragraph p169 = new Paragraph("    "+res.traduz(169,traducao)+" :     "+res.traduz(156,traducao),ff); 
                            document.add(p169);
                       }
                  }
                  
                  if(!rs.getString("cod171").equals("0")){
                       
                       if(rs.getString("cod171").equals("3"))
                       {
                            Paragraph p171 = new Paragraph("    "+res.traduz(171,traducao)+" :     "+res.traduz(172,traducao),ff); 
                            document.add(p171);
                       }else if(rs.getString("cod171").equals("5"))
                       {
                          Paragraph p171 = new Paragraph("    "+res.traduz(171,traducao)+" :     "+res.traduz(50,traducao),ff); 
                            document.add(p171); 
                       }else if(rs.getString("cod171").equals("7"))
                       {
                           Paragraph p171 = new Paragraph("    "+res.traduz(171,traducao)+" :     "+res.traduz(173,traducao),ff); 
                            document.add(p171);
                       }
                  }
                  
                  if(Double.parseDouble(rs.getString("cod174").toString())>=0){
                        
                            Paragraph p174 = new Paragraph("    "+res.traduz(174,traducao)+" :     "+rs.getString("cod174"),ff); 
                            document.add(p174);
                        
                  }
                  if(Double.parseDouble(rs.getString("cod175").toString())>=0){
                        
                            Paragraph p175 = new Paragraph("    "+res.traduz(175,traducao)+" :     "+rs.getString("cod175"),ff); 
                            document.add(p175);
                        
                  }
                  
                  if(!rs.getString("cod176").equals("0")){
                       
                       if(rs.getString("cod176").equals("1"))
                       {
                            Paragraph p176 = new Paragraph("    "+res.traduz(176,traducao)+" :     "+"1",ff); 
                            document.add(p176);
                       }else if(rs.getString("cod176").equals("2"))
                       {
                          Paragraph p176 = new Paragraph("    "+res.traduz(176,traducao)+" :     "+"2",ff); 
                            document.add(p176); 
                       }else if(rs.getString("cod176").equals("3"))
                       {
                           Paragraph p176 = new Paragraph("    "+res.traduz(176,traducao)+" :     "+"3",ff); 
                            document.add(p176);
                       }
                  }
                  
                  if(acess.getTamanho(Integer.parseInt(rs.getString("Codigo")))>0)
                  {
                      Connection conn2 =null;
                      Statement st2= null;
                      ResultSet rs2 =null;
                       Paragraph linha = new Paragraph("*"+res.traduz(261,traducao),f2); //Imagens 
                       linha.setSpacingAfter(20);
                       linha.setSpacingBefore(20); 
                       document.add(linha);
                       int x=0;
                  
                      try{
              
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        conn2 = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
                        st2 = conn2.createStatement();
                        rs2 = st2.executeQuery("Select* from imagens where identificador = '"+rs.getString("Codigo")+"'");
                        
                        //PdfPTable table =  new PdfPTable(2);
                       
                       //Table t = new Table(3,3);
                         //table.getDefaultCell().setBackgroundColor(BaseColor.YELLOW);
                        
                         //table.getDefaultCell().setBorder(3);
                         //table.getDefaultCell().setBorderColor(BaseColor.BLACK);
                       
                        while(rs2.next()){
                           
                             
                            Image var = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\"+rs2.getString("nome"));
                            var.setAlignment(Element.ALIGN_LEFT);
                            //table.addCell(var);
                            // var.setAbsolutePosition(absoluteX, absoluteY);
                             //var.setAbsolutePosition(var.getAbsoluteX(),var.getAbsoluteY());
                             var.scaleAbsolute(170,200);
                             
                                
                               document.add(var);
                              
                           }
                        
                      }catch(Exception e){
                          out.print("Exceção"+e);
                          e.printStackTrace();
                      }
                      
                  }
                  
                  
                   
                   
                   
                  
                    
                    
                    
                    
                   
                   
                    
                    
                   
                   Paragraph linha = new Paragraph("____________________________________________________________________________________________________",ff); 
                   document.add(linha);
                   
                   
                  
                  
                  
              }// fim do while
              
         }catch(Exception e)
         {
             e.printStackTrace();
         }finally{
             if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
         }
         //-----------------------Data do relatorio-------------------------------------//
        Date dataAtual = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
        String dataStr = sdf.format(dataAtual); 
        
  
       SimpleDateFormat hformatador = new SimpleDateFormat("HH:mm:ss");
       String sHora = hformatador.format(dataAtual);
        
        
        Paragraph rodape = new Paragraph(res.traduz(259,traducao)+": "+dataStr+" "+res.traduz(260,traducao)+" "+sHora,ff);		
        document.add(rodape);
        
        document.close();//fecha o documento
        
         PdfReader reader = new PdfReader(baos.toByteArray());
        // Create a stamper
        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(RESULT));
        // Loop over the pages and add a header to each page
        int n = reader.getNumberOfPages();
		
		Image watermark_image = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\BG_marca_dagua.png");
		watermark_image.setAbsolutePosition(20, 280);
		watermark_image.scaleAbsolute(580,220);
		PdfContentByte add_watermark;
                
		Image foote = Image.getInstance("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\imagens\\marca_rodape.png");
		foote.scaleAbsolute(180,32);
                foote.setAbsolutePosition(400,3);
                PdfContentByte foote2;
                
            String frase = res.traduz(291,traducao)+":\n"+"International Plant Genetic Resources Institute (IPGRI) (1995) Descriptors for Capsicum (Capsicum spp.).\n"+"International Plant Genetic Resources Institute, Rome, Italy, 110 p.";      
            Font ffont = new Font(Font.FontFamily.TIMES_ROMAN, 8, Font.ITALIC);
            Phrase rod = new Phrase(frase, ffont);
		
        for (int i = 1; i <= n; i++) {
            acess.getHeaderTable(i, n,res.traduz(186,traducao)).writeSelectedRows(
                    0, -1, 34, 803, stamper.getOverContent(i));
	     acess.getFooterTable(rod).writeSelectedRows(0,-1,34,34,stamper.getOverContent(i));
             
	     add_watermark = stamper.getUnderContent(i);
             add_watermark.addImage(watermark_image);
	     foote2= stamper.getUnderContent(i);
             foote2.addImage(foote);
        }
        // Close the stamper
        stamper.close();
        reader.close();
        
        
        response.sendRedirect("GeraRelatorioPimentas"); 
		   }
	   }
%>
       
    </body>
</html>


