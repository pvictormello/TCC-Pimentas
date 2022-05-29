<%-- 
    Document   : logoff
    Created on : 22/06/2015, 10:05:59
    Author     : Valdomiro
--%>

<%
    String valor= request.getParameter("valor"); 
   //Destroi as sessions
    if(valor.equals("bt_sair")){
        //session.invalidate();
       
         session.setAttribute("loginUsuario",null);
        session.setAttribute("senhaUsuario", null);
        session.setAttribute("permissaoUsuario",null);
        session.setAttribute("User",null); 
        out.print('1');
    }else{
     out.print('0');
    }
   

%>
