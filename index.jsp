<%-- 
    Document   : index
    Created on : 10/03/2015, 08:49:42
    Author     : Valdomiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="refresh" content="1; URL=Home.jsp" >
     
    </head>
    <body>
       <% 
           String traducao="";
               Cookie cookie = null; 
               Cookie[] cookies = null;
               cookies = request.getCookies(); 
           
           if(traducao.isEmpty()){
               
               
                    Cookie trad= new Cookie("Traducao","por");
                    trad.setMaxAge(60*60*24);
                    response.addCookie(trad);
                    
                    
               
                Cookie ck = null; 
                Cookie[] cks = null;
                try{
                    cks = request.getCookies();
                     for (int i = 0; i < cks.length; i++)
                            { 
                                ck = cks[i]; 
                                if(ck.getName().equals("Traducao")){

                                    traducao = ck.getValue();


                                }
                                //out.print("Traducao cabecalho "+ ck.getValue());
                            }
                }catch(Exception e)
                {
                    traducao="por";
                }
                 
                 
                
           }else{
               
              
                //out.print("Tamanho do cookie "+cookies.length);
                    for (int i = 0; i < cookies.length; i++)
                    { 
                        cookie = cookies[i]; 
                        if(cookie.getName().equals("Traducao")){

                            traducao = cookie.getValue();

                        }
                    }
              }
            
           
           
           %>
    </body>
</html>
