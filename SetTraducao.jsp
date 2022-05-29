<%-- 
    Document   : SetTradaucao
    Created on : 14/11/2014, 08:03:53
    Author     : Valdomiro
--%>



<jsp:useBean id="res" class="meupacote.traducao" /> 


<%
         String val = request.getParameter("name");
         String traducao="";
         
         Cookie cookie = null; 
         Cookie[] cookies = null;
         cookies = request.getCookies(); 
         
         if(val.equals("0")){
             for (int i = 0; i < cookies.length; i++)
                { 
                    cookie = cookies[i]; 
                    if(cookie.getName().equals("Traducao")){
                      cookie.setValue("por");
                      response.addCookie(cookie);
                      out.print('0');
                    }
                }
         }else if(val.equals("1"))
         {
             for (int i = 0; i < cookies.length; i++)
                { 
                    cookie = cookies[i]; 
                    if(cookie.getName().equals("Traducao")){
                      cookie.setValue("esp");
                      response.addCookie(cookie);
                      
                    }
                }
             out.print('1');
         }else if(val.equals("2")){
             for (int i = 0; i < cookies.length; i++)
                { 
                    cookie = cookies[i]; 
                    if(cookie.getName().equals("Traducao")){
                      cookie.setValue("eng");
                      response.addCookie(cookie);
                      
                    }
                }
             out.print('2');
         }else if(val.isEmpty())
         {
             out.print('3');
         }
      
        /* if(val.equals("0"))
         {
             
             session.setAttribute("traducao","por");
             traducao="por";
              out.print('0');
         }else if(val.equals("1"))
         {
             
             session.setAttribute("traducao","esp");
             traducao="esp";
              out.print('1');
         }else if(val.equals("2"))
         {
            
             
             session.setAttribute("traducao","eng");
             traducao="eng";
              out.print('2');
         }else{
         out.print('3');}
                */
       //res.setTraducao(traducao);
%>

