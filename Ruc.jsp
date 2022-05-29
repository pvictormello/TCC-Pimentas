<%-- 
    Document   : Ruc
    Created on : 10/06/2015, 18:03:58
    Author     : Valdomiro
--%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfStamper"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="temp" class="meupacote.processaDB" />
<jsp:useBean id="res" class="meupacote.processa" />
<%

       if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permis= (String) session.getValue("permissaoUsuario");
           String array2[] = new String[4];  
           array2 = permis.split("-");
           if(array2[2].toString().charAt(1)!='1'){
             response.sendRedirect("Home.jsp");
           }else{
        String escolha="";
        escolha = request.getParameter("escolhido");
        byte[] bytes = escolha.getBytes(StandardCharsets.ISO_8859_1);
       escolha = new String(bytes,"UTF-8");
    
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
     String permissao="";
     String op1="";
     String op2="";
     String op3="";
     String op4="";
     String resultado="";
     int tam=0;
     String str="";
     String RESULT = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\pdfs\\relatorio.pdf";
     
     document = new Document(PageSize.A4, 72, 72, 72, 72);
     ByteArrayOutputStream baos = new ByteArrayOutputStream();
     
     PdfWriter.getInstance(document, baos);
        Font f = new Font(FontFamily.COURIER, 20, Font.BOLD);
        Font f2 = new Font(FontFamily.TIMES_ROMAN, 10, Font.BOLD);
        Font ff = new Font(FontFamily.TIMES_ROMAN, 9, Font.NORMAL);
        Font fp = new Font(FontFamily.COURIER, 10, Font.BOLDITALIC);
        Font fpe = new Font(FontFamily.COURIER, 10, Font.NORMAL);
     
     
    //Document document = new Document(); 
    try { 
        
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
              rs = st.executeQuery("Select* from usuario where cidade='"+escolha+"' ORDER BY cidade");
        PdfWriter.getInstance(document, new FileOutputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\pdfs\\relatorio.pdf"));
        
 
        //response.setContentType("application/pdf");
        //PdfWriter.getInstance(document, response.getOutputStream());
        
        document.open(); 
        
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
        
        
      
         
         Paragraph p1 = new Paragraph(res.traduz(258,traducao)+" ",f);// adicionando um parágrafo ao documento
         p1.setAlignment(Element.ALIGN_CENTER);
         p1.setSpacingAfter(20); //Solta espaçamento depois do paragrafo
         document.add(p1);
                 
          while(rs.next()){
             Paragraph p = new Paragraph("* "+res.traduz(187,traducao)+": "+rs.getString("nome"),f2); 
             document.add(p);
             Paragraph p2 = new Paragraph("     "+res.traduz(196,traducao)+" : "+rs.getString("email"),ff);
             document.add(p2);
             Paragraph p3 = new Paragraph("     "+res.traduz(188, traducao)+" : "+rs.getString("cidade"),ff);
             document.add(p3);
             Paragraph p4 = new Paragraph("     "+res.traduz(190,traducao)+" : "+rs.getString("pais"),ff);
             document.add(p4);
             Paragraph p5 = new Paragraph("     "+res.traduz(189,traducao)+" : "+rs.getString("estado"),ff);
             document.add(p5);
             if(!rs.getString("tipousuario").isEmpty()){
                Paragraph p7 = new Paragraph("     "+res.traduz(191,traducao)+" : "+rs.getString("tipousuario"),ff);
                document.add(p7);
             }
             Paragraph p8 = new Paragraph("     "+res.traduz(212,traducao )+" : "+rs.getString("localidade"),ff);
             document.add(p8);
             //p8.setSpacingAfter(10);
             Paragraph pp = new Paragraph("-"+res.traduz(202,traducao )+" ",fp);
             document.add(pp);
             
             String tabela1="1A";
             String tabela2="2A";
             String tabela3="3A";
             String tabela4="4A";
             
             permissao = rs.getString("permissao");
             String array[] = new String[4];  
             array = permissao.split("-");
              
                for(int i=0;i<array[0].toString().length();i++)
                {
                    if(array[0].toString().charAt(i)=='1'){
                      resultado+= res.traduz(temp.buscaPermissao(i,tabela1),traducao)+"-";
                    }
                }
                if(!resultado.isEmpty()){
                Paragraph usu = new Paragraph("  "+res.traduz(201,traducao)+"  ("+resultado+")",fpe);
                document.add(usu);
                }
                resultado="";
             for(int i=0;i<array[1].toString().length();i++)
             {
                 if(array[1].toString().charAt(i)=='1'){
                   resultado+=  res.traduz(temp.buscaPermissao(i,tabela2),traducao)+"-";
                 }
             }
             if(!resultado.isEmpty()){
             Paragraph pim = new Paragraph("  "+res.traduz(211,traducao)+" ("+resultado+")",fpe);
       
             document.add(pim);
             }
             
              resultado="";
             for(int i=0;i<array[2].toString().length();i++)
             {
                 if(array[2].toString().charAt(i)=='1'){
                   resultado+=  res.traduz(temp.buscaPermissao(i,tabela3),traducao)+"-";
                 }
             }
                if(!resultado.isEmpty()){
                Paragraph ru = new Paragraph("  "+res.traduz(258,traducao)+" ("+resultado+")",fpe);
         
                document.add(ru);
                }
              resultado="";  
            for(int i=0;i<array[3].toString().length();i++)
             {
                 if(array[3].toString().charAt(i)=='1'){
                   resultado+=  res.traduz(temp.buscaPermissao(i,tabela4),traducao)+"-";
                 }
             }
             if(!resultado.isEmpty()){
                Paragraph rp = new Paragraph("  "+res.traduz(262,traducao)+" ("+resultado+")",fpe);
               
                document.add(rp);
             }
             //Paragraph p6 = new Paragraph(rs.getString("permissao"),ff);
             //p6.setSpacingAfter(10);
             //document.add(p6);
             resultado="";
             str="";
             Paragraph linha = new Paragraph("_______________________________________________________________________________________________",ff); 
             document.add(linha);
             
             
          }
    } catch(DocumentException de) {
        
      System.err.println(de.getMessage()); 
    } 
     catch(IOException ioe) {
       System.err.println(ioe.getMessage());
     } 
     //-----------------------Data do relatorio-------------------------------------//
        Date dataAtual = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
        String dataStr = sdf.format(dataAtual); 
        
  
       SimpleDateFormat hformatador = new SimpleDateFormat("HH:mm:ss");
       String sHora = hformatador.format(dataAtual);
        
        Paragraph rodape = new Paragraph(res.traduz(259,traducao)+": "+dataStr+" "+res.traduz(260,traducao)+" "+sHora,ff); 
        document.add(rodape);
        document.close();
        
        //-------------------Gerando o cabeçalho e paginação------------------------------//
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
                
            
		
        for (int i = 1; i <= n; i++) {
            temp.getHeaderTable(i, n,res.traduz(186,traducao)).writeSelectedRows(
                    0, -1, 34, 803, stamper.getOverContent(i));
             
            
	     add_watermark = stamper.getUnderContent(i);
             add_watermark.addImage(watermark_image);
	     foote2= stamper.getUnderContent(i);
             foote2.addImage(foote);
        }
        // Close the stamper
        stamper.close();
        reader.close();
   
      
  response.sendRedirect("MeuServlet");  
		   }
	   }

%>