<%-- 
    Document   : altera
    Created on : 10/10/2014, 21:24:38
    Author     : Valdomiro
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.Driver"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[0].toString().charAt(1)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; URL=busca3.jsp" >
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <title></title>
        <script>
  $(function() {
    $( "#dialog" ).dialog();
  });
  </script>
    </head>
    <body>
        <%
           String str;
            String u1= request.getParameter("u1");
            String u2= request.getParameter("u2");
            String u3= request.getParameter("u3");
            String u4= request.getParameter("u4");
            String p1= request.getParameter("p1");
            String p2= request.getParameter("p2");
            String p3= request.getParameter("p3");
            String p4= request.getParameter("p4");
            String ru1= request.getParameter("ru1");
            String ru2= request.getParameter("ru2");
            String ru3= request.getParameter("ru3");
            String ru4= request.getParameter("ru4");
            String ru5= request.getParameter("ru5");
            String rp1= request.getParameter("rp1");
            String rp2= request.getParameter("rp2");
            String rp3= request.getParameter("rp3");
            String rp4= request.getParameter("rp4");
            String rp5= request.getParameter("rp5");
            String rp6= request.getParameter("rp6");
            if(u1==null || u1=="0")
            {
                u1="0";
            }else u1="1";
            if(u2==null || u2=="0")
            {
                u2="0";
            }else u2="1";
            if(u3==null || u3=="0")
            {
                u3="0";
            }else u3="1";
            if(u4==null|| u4=="0")
            {
                u4="0";
            }else u4="1";
            if(p1==null || p1=="0")
            {
                p1="0";
            }else p1="1";
            if(p2==null || p2=="0")
            {
                p2="0";
            }else p2="1";
            if(p3==null || p3=="0")
            {
                p3="0";
            }else p3="1";
            if(p4==null || p4=="0")
            {
                p4="0";
            }else p4="1";
            if(ru1==null || ru1=="0")
            {
                ru1="0";
            }else ru1="1";
            if(ru2==null || ru2=="0")
            {
                ru2="0";
            }else ru2="1";
            if(ru3==null|| ru3=="0")
            {
                ru3="0";
            }else ru3="1";
            if(ru4==null|| ru4=="0")
            {
                ru4="0";
            }else ru4="1";
            if(ru5==null ||ru5=="0")
            {
                ru5="0";
            }else ru5="1";
            if(rp1==null ||rp1=="0")
            {
				rp1="0";
                //rp1="0";
            }else rp1="1";
            if(rp2==null ||rp2=="0")
            {
                rp2="3";
            }else rp2="1";
            if(rp3==null ||rp3=="0")
            {
                rp3="3";
            }else rp3="1";
            if(rp4==null ||rp4=="0")
            {
                rp4="3";
            }else rp4="1";
            if(rp5==null ||rp5=="0")
            {
                rp5="3";
            }else rp5="1";
            if(rp6==null ||rp6=="0")
            {
                rp6="3";
            }else rp6="1";
            str = u1+u2+u3+u4+"-"+p1+p2+p3+p4+"-"+ru1+ru2+ru3+ru4+ru5+"-"+rp1+rp2+rp3+rp4+rp5+rp6;
            
            //out.println("Valor da permissao  "+str);
           
            String x= request.getParameter("cod");
            String name= request.getParameter("nome");
            String city=request.getParameter("cidade");
            String uf= request.getParameter("estado");
            String p=request.getParameter("pais");
            String tp = request.getParameter("tipousuario");
            String rad=request.getParameter("estudante");
            String local = request.getParameter("localidade");
            String em =request.getParameter("email");
           
            Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Update  usuario set nome= '"+name+"',cidade= '"+city+"',estado= '"+uf+"',pais= '"+p+"',tipousuario='"+rad+"',localidade= '"+local+"',email= '"+em+"',permissao= '"+str+"' where email = '"+x+"'");
              %>
               <div id="dialog" title="Mensagem" style="display:none">
                   <p>Alterado com Sucesso !</p>
               </div>
               <%
          }catch(Exception ex)
          {
              %>
                <div id="dialog" title="Mensagem" style="display:none">
                   <p>Ops acontenceu um erro !!!</p>
               </div>
              <%
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
        
            
    </body>
</html>

