<%-- 
    Document   : setValores2
    Created on : 15/12/2014, 13:27:52
    Author     : Valdomiro
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>


        <%

            String val = request.getParameter("valor");
            String id = request.getParameter("id"); 
             byte[] bytes = val.getBytes(StandardCharsets.ISO_8859_1);
            val= new String(bytes,"UTF-8");

            if(val==null){
               session.putValue(id,"");
            }else
                session.setAttribute(id,val);//val


            if(val.isEmpty()||id.isEmpty()){
                out.print('0');
            }
        %>

