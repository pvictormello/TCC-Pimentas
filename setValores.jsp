<%-- 
    Document   : setValores
    Created on : 21/11/2014, 20:26:57
    Author     : Valdomiro
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%
  
   
    String val = request.getParameter("valor");
    String id = request.getParameter("id");
    
    byte[] bytes = val.getBytes(StandardCharsets.ISO_8859_1);
    val= new String(bytes,"UTF-8");
     
   
    if(val==null){
       session.putValue(id,"");
    }else
        session.putValue(id,val);//val
 
    
    if(val.isEmpty()||id.isEmpty()){
        out.print('0');
    }
%>
   
    
