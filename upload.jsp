<%-- 
    Document   : upload
    Created on : 23/12/2014, 14:29:38
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUploadBase"%>
<%@page import="java.io.RandomAccessFile"%> 

<%@page import="java.io.ByteArrayOutputStream"%> 

<%@page import="java.io.FileOutputStream"%> 

<%@page import="java.io.DataInputStream"%> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 

         pageEncoding="ISO-8859-1"%> 

<% 
    
    

        String savePath ="C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\ROOT\\fotos\\"; //"C:\\Users\\Valdomiro\\Documents\\NetBeansProjects\\SistemaGermo\\fotos\\";   // o diretório onde os arquivos carregados serão salvos 
        String filename = "";
        ServletInputStream in = request.getInputStream(); //uma referencia do objeto da solicitaçao http onde tem o conteudo do arquivo carregado 
        //o inicio do arquivo carregado  e separado pelo limite e uma sequencia de caracteres 
        //de carros de retorno-alimentador de linha ledo o HttpServeltRequest linha a linha 
        String resultado="";
       
        
       
            
        byte[] line = new byte[128];  // define um array de byte chamado line 
        int i = in.readLine(line, 0, 128);  //usar o metodo readLine de ServeltInputStream para ler a 1a linha do conteudo do objeto http 
        int boundaryLength = i - 2; //o comprimeto atual da linha -2 do que o num de bytes retornado do metodo readLine 
        String boundary = new String(line, 0, boundaryLength);   //Descarta os 2 ultimos caracteres da linha 
        //tendo recuperado o limite, entao pode iniciar a extraçao do elemento de valor de formulario, lendo o conteudo do objeto 

        // http linha por linha, usando a loop while, ate q ela atinja o final, qdo o medoto readLine retorna -1 
         while (i != -1) 
         {   

           String newLine = new String(line, 0, i);    

           if (newLine.startsWith("Content-Disposition: form-data; name=\"")) {   

             String s = new String(line, 0, i-2);//agora pode conseguir o nome de arquivo a partir da string de leitura 

             int pos = s.indexOf("filename=\"");    

             if (pos != -1) 
             {   

               String filepath = s.substring(pos+10, s.length()-1);    
               pos = filepath.lastIndexOf("\\");    
               if (pos != -1)    
                 filename = filepath.substring(pos + 1);    

               else    
                 filename = filepath;    

             }  
             resultado= session.getValue("index").toString();
             int contador=0;
             try{
                  contador = Integer.parseInt(session.getValue("cont").toString());
             }catch(Exception e)
             {
                 contador = (int)(1 + Math.random() * 100);
             }
             //int contador=12;
             //resultado="16";
             
             String temp= filename;
             filename= resultado+"_"+contador+"_"+temp;
             contador++;
             session.setAttribute("cont",contador);
             //este é o conteúdo do arquivo 

             i = in.readLine(line, 0, 128);  //depois de conseguir o nome de arquivo, notara os dois pares de caracteres 

             i = in.readLine(line, 0, 128); //carro de retorno-alimentador de linha antes do inico do conteudo do arquivo carregado 

             // blank line                  //pois isto chama o metodo readLine duas vezes 

             i = in.readLine(line, 0, 128);    



             ByteArrayOutputStream buffer = new  //depois inicia o conteudo atual do arquivo, que e armazenado em um ByteArrayOutputStream 

             ByteArrayOutputStream(); 

             newLine = new String(line, 0, i); // que continua lendo a linha ate encontrar um outro limite 



             while (i != -1 && !newLine.startsWith(boundary)) {   

              // o problema é a última linha do conteúdo do arquivo contém o caractere nova linha. 
              // Então, nós precisamos verificar se a linha atual é a última linha 

               buffer.write(line, 0, i);    
               i = in.readLine(line, 0, 128);    
               newLine = new String(line, 0, i);    

             }    

             try {   

               // salvar o arquivo carregado               //o limite sinaliza o final do arquivo carregado 

               RandomAccessFile f = new RandomAccessFile(  //sendo sua etapa e salvar o buffer em um arquivo 

                 savePath + filename, "rw");    

               byte[] bytes = buffer.toByteArray();    

               f.write(bytes, 0, bytes.length - 2);    

               f.close();    

             }    

            catch (Exception e) {}    

           }    

           i = in.readLine(line, 0, 128);    

         } // fim do while
         
         Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
          
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("INSERT INTO imagens"+" VALUES('"+filename+"','"+resultado+"')");
              
              
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

%>


