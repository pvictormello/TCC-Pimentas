<%-- 
    Document   : enviar
    Created on : 14/05/2015, 14:06:27
    Author     : Valdomiro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projetoemail.email.SendMail"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }
    %>
<%
    String nome= request.getParameter("nome");
     byte[] bytes = nome.getBytes(StandardCharsets.ISO_8859_1);
     nome= new String(bytes,"UTF-8");
    String cpf = request.getParameter("cpf");
    String tel= request.getParameter("tel");
    String end = request.getParameter("end");
     byte[] bytes3 = end.getBytes(StandardCharsets.ISO_8859_1);
    end = new String(bytes3,"UTF-8");
    String inst = request.getParameter("inst");
    byte[] bytes4 = inst.getBytes(StandardCharsets.ISO_8859_1);
    inst = new String(bytes4,"UTF-8");
    String assunto = request.getParameter("mensagem");
    byte[] bytes2 = assunto.getBytes(StandardCharsets.ISO_8859_1);
    assunto = new String(bytes2,"UTF-8");
    String email = request.getParameter("email");
    
     
    
   String destinatario="sisgermoufumc2015@gmail.com";
    email="jose@gmail.com";
    
    SendMail mail = new SendMail();
       try { 
               mail.sendMail(destinatario , "sisgermoufumc2015@gmail.com", "SisGermo FaleConosco","Nome: \n"+nome+"\n CPF: \n"+cpf+"\n Email: \n"+email+"\n Endereço: \n"+end+"\n Telefone: \n"+tel+"\n Instituicao: \n"+inst+"\n Mensagem: \n"+assunto+"\n"); 
               out.print('1');
            } catch (Exception e) 
            {
                e.printStackTrace();
                out.print('0');
             }
    
%>
    
