<%-- 
    Document   : SetAlteracaoPimentas
    Created on : 19/12/2014, 14:28:36
    Author     : Valdomiro
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% 
      if(session.getValue("loginUsuario") == null && session.getValue("senhaUsuario") == null){
            response.sendRedirect("Home.jsp");
       }else 
       {
           String permissao= (String) session.getValue("permissaoUsuario");
           String array[] = new String[4];  
           array = permissao.split("-");
           if(array[1].toString().charAt(1)!='1'){
             response.sendRedirect("Home.jsp");
           }
       }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            int cod;
            int status=0;
            cod = Integer.parseInt(session.getValue("esc").toString());
             String idAmostra;
             String especie;
             String variedade;
             String cor;
             String geracao;
             String produtor;
             String coordenadas;
             String local_Ref;
             String tel;
             String data;
             String obs;
             
                   if((session.getValue("loc1")!=null)&&(!session.getValue("loc1").toString().isEmpty()))
                   {
                       idAmostra= session.getValue("loc1").toString();
                   }else{
                       idAmostra="";
                   }
                   if((session.getValue("loc2")!=null)&&(!session.getValue("loc2").toString().isEmpty()))
                   {
                       especie= session.getValue("loc2").toString();
                   }else{
                       especie ="";
                   }
                   if((session.getValue("loc3")!=null)&&(!session.getValue("loc3").toString().isEmpty()))
                   {
                       variedade= session.getValue("loc3").toString();
                   }else{
                       variedade="";
                   }
                   if((session.getValue("loc4")!=null)&&(!session.getValue("loc4").toString().isEmpty()))
                   {
                       cor = session.getValue("loc4").toString();
                   }else{
                       cor="";
                   }
                   if((session.getValue("loc5")!=null)&&(!session.getValue("loc5").toString().isEmpty()))
                   {
                       geracao = session.getValue("loc5").toString();
                   }else{
                       geracao="";
                   }
                   if((session.getValue("loc6")!=null)&&(!session.getValue("loc6").toString().isEmpty()))
                   {
                       produtor = session.getValue("loc6").toString();
                   }else{
                       produtor="";
                   }
                   if((session.getValue("loc7")!=null)&&(!session.getValue("loc7").toString().isEmpty()))
                   {
                       coordenadas = session.getValue("loc7").toString();
                   }else{
                       coordenadas="";
                   }
                   if((session.getValue("loc8")!=null)&&(!session.getValue("loc8").toString().isEmpty()))
                   {
                       local_Ref = session.getValue("loc8").toString();
                   }else{
                       local_Ref="";
                   }
                   if((session.getValue("loc9")!=null)&&(!session.getValue("loc9").toString().isEmpty()))
                   {
                       tel = session.getValue("loc9").toString();
                   }else{
                       tel="";
                   }
                   if((session.getValue("loc10")!=null)&&(!session.getValue("loc10").toString().isEmpty()))
                   {
                       data = session.getValue("loc10").toString();
                   }else{
                       data="";
                   }
                   if((session.getValue("loc11")!=null)&&(!session.getValue("loc11").toString().isEmpty()))
                   {
                       obs = session.getValue("loc11").toString();
                   }else{
                       obs="";
                       
                   }
                   session.setAttribute("loc1", null);
                   session.setAttribute("loc2", null);
                   session.setAttribute("loc3", null);
                   session.setAttribute("loc4", null);
                   session.setAttribute("loc5", null);
                   session.setAttribute("loc6", null);
                   session.setAttribute("loc7", null);
                   session.setAttribute("loc8", null);
                   session.setAttribute("loc9", null);
                   session.setAttribute("loc10", null);
                   session.setAttribute("loc11", null);
                   
           
             
          Connection conn =null;
          Statement st= null;
          ResultSet rs =null;
         
          try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Update  local_coleta set IDAmostra= '"+idAmostra+"',especie= '"+especie+"',variedade= '"+variedade+"',cor= '"+cor+"',geracao='"+geracao+"',nomeProdutor= '"+produtor+"',coordenadas= '"+coordenadas+"',localizacao= '"+local_Ref+"',telefone= '"+tel+"',dataColeta='"+data+"',observacao='"+obs+"' where Codigo = '"+cod+"'");
               status++;
          }catch(Exception ex){
              //out.println("Exceção aqui");
              ex.printStackTrace();
          }finally{
              if(rs!=null) 
                  rs.close();
              if(st!=null)
                  st.close();
              if(conn!=null) 
                  conn.close();
          }
            int at1;
            int at2;
            int at3;
            int at4;
            Double at5;
            Double at6;
          
               if((session.getValue("fp1")!=null)&&(!session.getValue("fp1").toString().isEmpty()))
                {
                    at1= Integer.parseInt(session.getValue("fp1").toString());
                }else
                {
                    at1=0;
                }
                if((session.getValue("fp2")!=null)&&(!session.getValue("fp2").toString().isEmpty()))
                {
                    at2=Integer.parseInt(session.getValue("fp2").toString());
                }else
                {
                    at2=0;
                }
                 if((session.getValue("fp3")!=null)&&(!session.getValue("fp3").toString().isEmpty()))
                {
                    at3=Integer.parseInt(session.getValue("fp3").toString());
                }else
                {
                    at3=0;
                } 
                 if((session.getValue("fp4")!=null)&&(!session.getValue("fp4").toString().isEmpty()))
                {
                    at4 =Integer.parseInt(session.getValue("fp4").toString());
                }else
                {
                    at4=0;
                }
                  
                if((session.getValue("fp5")!=null)&&(!session.getValue("fp5").toString().isEmpty()))
                {
                    at5= Double.parseDouble(session.getValue("fp5").toString());
                }else
                {
                    at5=-1.0;
                }
                if((session.getValue("fp6")!=null)&&(!session.getValue("fp6").toString().isEmpty()))
                {
                    at6 = Double.parseDouble(session.getValue("fp6").toString());
                }else
                {
                    at6= -1.0;
                }
                 session.setAttribute("fp1",null);
                 session.setAttribute("fp2",null);
                 session.setAttribute("fp3",null);
                 session.setAttribute("fp4",null);
                 session.setAttribute("fp5",null);
                 session.setAttribute("fp6",null);
                 
                 
         try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Update  faseplantula set IDF='"+idAmostra+"',cod5='"+at1+"',cod9='"+at2+"',cod13='"+at3+"',cod21='"+at4+"',cod26="+at5+",cod27="+at6+" where ID_Plantula='"+cod+"'");
               status++;
          }catch(Exception ex){
   
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
                 
           String v1;
            String v2;
            String v3;
            String v4;
            String v5;
            String v6;
            String v7;
            String v8;
            String v9;
            String v10;
            String v11;
            String v12;
            String v13;
            String v14;
            String v15;
            String v16;
            String v17;
            String v18;
            String v19;
            
            if((session.getValue("fv1")!=null)&&(!session.getValue("fv1").toString().isEmpty())){
                v1=session.getValue("fv1").toString();
            }else{
                v1="0";
            }
            if((session.getValue("fv2")!=null)&&(!session.getValue("fv2").toString().isEmpty())){
                v2=session.getValue("fv2").toString();
            }else{
                v2="0";
            }
            if((session.getValue("fv3")!=null)&&(!session.getValue("fv3").toString().isEmpty())){
                v3=session.getValue("fv3").toString();
            }else{
                v3="0";
            }
            if((session.getValue("fv4")!=null)&&(!session.getValue("fv4").toString().isEmpty())){
                v4=session.getValue("fv4").toString();
            }else{
                v4="0";
            }
            if((session.getValue("fv5")!=null)&&(!session.getValue("fv5").toString().isEmpty())){
                v5=session.getValue("fv5").toString();
            }else{
                v5="0";
            }      
            if((session.getValue("fv6")!=null)&&(!session.getValue("fv6").toString().isEmpty())){
                v6=session.getValue("fv6").toString();
            }else{
                v6="0";
            }
             if((session.getValue("fv7")!=null)&&(!session.getValue("fv7").toString().isEmpty())){
                v7=session.getValue("fv7").toString();
            }else{
                v7="0";
            }
            if((session.getValue("fv8")!=null)&&(!session.getValue("fv8").toString().isEmpty())){
                v8=session.getValue("fv8").toString();
            }else{
                v8="-1";
            }
            if((session.getValue("fv9")!=null)&&(!session.getValue("fv9").toString().isEmpty())){
                v9=session.getValue("fv9").toString();
            }else{
                v9="-1";
            }
            if((session.getValue("fv10")!=null)&&(!session.getValue("fv10").toString().isEmpty())){
                v10=session.getValue("fv10").toString();
            }else{
                v10="-1";
            }
            if((session.getValue("fv11")!=null)&&(!session.getValue("fv11").toString().isEmpty())){
                v11=session.getValue("fv11").toString();
            }else{
                v11="0";
            }
            if((session.getValue("fv12")!=null)&&(!session.getValue("fv12").toString().isEmpty())){
                v12=session.getValue("fv12").toString();
            }else{
                v12="0";
            }
            if((session.getValue("fv13")!=null)&&(!session.getValue("fv13").toString().isEmpty())){
                v13=session.getValue("fv13").toString();
            }else{
                v13="0";
            }
            if((session.getValue("fv14")!=null)&&(!session.getValue("fv14").toString().isEmpty())){
                v14=session.getValue("fv14").toString();
            }else{
                v14="0";
            }
            if((session.getValue("fv15")!=null)&&(!session.getValue("fv15").toString().isEmpty())){
                v15=session.getValue("fv15").toString();
            }else{
                v15="0";
            }
            if((session.getValue("fv16")!=null)&&(!session.getValue("fv16").toString().isEmpty())){
                v16=session.getValue("fv16").toString();
            }else{
                v16="0";
            }
            if((session.getValue("fv17")!=null)&&(!session.getValue("fv17").toString().isEmpty())){
                v17=session.getValue("fv17").toString();
            }else{
                v17="0";
            }
            if((session.getValue("fv18")!=null)&&(!session.getValue("fv18").toString().isEmpty())){
                v18=session.getValue("fv18").toString();
            }else{
                v18="-1";
            }
            if((session.getValue("fv19")!=null)&&(!session.getValue("fv19").toString().isEmpty())){
                v19=session.getValue("fv19").toString();
            }else{
                v19="-1";
            }
            
            try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Update  fasevegetativa set idf= '"+idAmostra+"',cod29='"+v1+"',cod33='"+v2+"',cod36='"+v3+"',cod37='"+v4+"',cod41='"+v5+"',cod42='"+v6+"',cod48='"+v7+"',cod52='"+v8+"',cod53='"+v9+"',cod54='"+v10+"',cod55='"+v11+"',cod56='"+v12+"',cod57='"+v13+"',cod58='"+v14+"',cod59='"+v15+"',cod60='"+v16+"',cod64='"+v17+"',cod65='"+v18+"',cod66='"+v19+"' where Identificador = '"+cod+"'");
               status++;
          }catch(Exception ex){
   
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
            String r1;  
            String r2;  
            String r3;  
            String r4;  
            String r5;  
            String r6;  
            String r7;  
            String r8;  
            String r9;  
            String r10; 
            String r11; 
            String r12; 
            String r13; 
            String r14; 
            String r15; 
            String r16; 
            String r17; 
            String r18; 
            String r19; 
            String r20; 
            String r21; 
            String r22;
            String r23;
            String r24;
            String r25;
            String r26;
            String r27;
            String r28;
            String r29;
            String r30;
            String r31;
            String r32;
            String r33;
            String r34;
            String r35;
            String r36;
            String r37; 
            String r38;
            String r39;
            String r40;
            String r41;
            String r42;
            String r43;
            String r44;
            String r45;
            if((session.getValue("fr1")!=null)&&(!session.getValue("fr1").toString().isEmpty())){
                r1=session.getValue("fr1").toString();
            }else{
                r1="-1";
            }
            if((session.getValue("fr2")!=null)&&(!session.getValue("fr2").toString().isEmpty())){
                r2=session.getValue("fr2").toString();
            }else{
                r2="0";
            }
            if((session.getValue("fr3")!=null)&&(!session.getValue("fr3").toString().isEmpty())){
                r3=session.getValue("fr3").toString();
            }else{
                r3="0";
            }
            if((session.getValue("fr4")!=null)&&(!session.getValue("fr4").toString().isEmpty())){
                r4=session.getValue("fr4").toString();
            }else{
                r4="0";
            }
            if((session.getValue("fr5")!=null)&&(!session.getValue("fr5").toString().isEmpty())){
                r5=session.getValue("fr5").toString();
            }else{
                r5="0";
            }
            if((session.getValue("fr6")!=null)&&(!session.getValue("fr6").toString().isEmpty())){
                r6=session.getValue("fr6").toString();
            }else{
                r6="0";
            }
            if((session.getValue("fr7")!=null)&&(!session.getValue("fr7").toString().isEmpty())){
                r7=session.getValue("fr7").toString();
            }else{
                r7="0";
            }
            if((session.getValue("fr8")!=null)&&(!session.getValue("fr8").toString().isEmpty())){
               r8 =session.getValue("fr8").toString();
            }else{
               r8="0";
            }
            if((session.getValue("fr9")!=null)&&(!session.getValue("fr9").toString().isEmpty())){
                r9=session.getValue("fr9").toString();
            }else{
                r9="-1";
            }
            if((session.getValue("fr10")!=null)&&(!session.getValue("fr10").toString().isEmpty())){
               r10=session.getValue("fr10").toString();
            }else{
                r10="0";
            }
            if((session.getValue("fr11")!=null)&&(!session.getValue("fr11").toString().isEmpty())){
                r11=session.getValue("fr11").toString();
            }else{
                r11="-1";
            }
            if((session.getValue("fr12")!=null)&&(!session.getValue("fr12").toString().isEmpty())){
               r12 =session.getValue("fr12").toString();
            }else{
                r12="0";
            }
            if((session.getValue("fr13")!=null)&&(!session.getValue("fr13").toString().isEmpty())){
               r13 =session.getValue("fr13").toString();
            }else{
                r13="0";
            }
            if((session.getValue("fr14")!=null)&&(!session.getValue("fr14").toString().isEmpty())){
                r14=session.getValue("fr14").toString();
            }else{
                r14="0";
            }
            if((session.getValue("fr15")!=null)&&(!session.getValue("fr15").toString().isEmpty())){
                r15=session.getValue("fr15").toString();
            }else{
                r15="0";
            }
            if((session.getValue("fr16")!=null)&&(!session.getValue("fr16").toString().isEmpty())){
                r16=session.getValue("fr16").toString();
            }else{
                r16="0";
            }
            if((session.getValue("fr17")!=null)&&(!session.getValue("fr17").toString().isEmpty())){
                r17=session.getValue("fr17").toString();
            }else{
                r17="-1";
            }
            if((session.getValue("fr18")!=null)&&(!session.getValue("fr18").toString().isEmpty())){
                r18=session.getValue("fr18").toString();
            }else{
                r18="0";
            }
            if((session.getValue("fr19")!=null)&&(!session.getValue("fr19").toString().isEmpty())){
                r19=session.getValue("fr19").toString();
            }else{
                r19="0";
            }
            if((session.getValue("fr20")!=null)&&(!session.getValue("fr20").toString().isEmpty())){
                r20=session.getValue("fr20").toString();
            }else{
                r20="0";
            }
            if((session.getValue("fr21")!=null)&&(!session.getValue("fr21").toString().isEmpty())){
               r21=session.getValue("fr21").toString();
            }else{
                r21="-1";
            }
            if((session.getValue("fr22")!=null)&&(!session.getValue("fr22").toString().isEmpty())){
               r22=session.getValue("fr22").toString();
            }else{
                r22="0";
            }
            if((session.getValue("fr23")!=null)&&(!session.getValue("fr23").toString().isEmpty())){
               r23=session.getValue("fr23").toString();
            }else{
                r23="0";
            }
            if((session.getValue("fr24")!=null)&&(!session.getValue("fr24").toString().isEmpty())){
                r24=session.getValue("fr24").toString();
            }else{
                r24="-1";
            }
            if((session.getValue("fr25")!=null)&&(!session.getValue("fr25").toString().isEmpty())){
               r25=session.getValue("fr25").toString();
            }else{
                r25="-1";
            }
            if((session.getValue("fr26")!=null)&&(!session.getValue("fr26").toString().isEmpty())){
               r26=session.getValue("fr26").toString();
            }else{
               r26="-1";
            }
            if((session.getValue("fr27")!=null)&&(!session.getValue("fr27").toString().isEmpty())){
                r27=session.getValue("fr27").toString();
            }else{
               r27="-1";
            }
            if((session.getValue("fr28")!=null)&&(!session.getValue("fr28").toString().isEmpty())){
               r28 =session.getValue("fr28").toString();
            }else{
                r28="-1";
            }
            if((session.getValue("fr29")!=null)&&(!session.getValue("fr29").toString().isEmpty())){
               r29=session.getValue("fr29").toString();
            }else{
                r29="0";
            }
            if((session.getValue("fr30")!=null)&&(!session.getValue("fr30").toString().isEmpty())){
               r30=session.getValue("fr30").toString();
            }else{
               r30="0";
            }
            if((session.getValue("fr31")!=null)&&(!session.getValue("fr31").toString().isEmpty())){
               r31=session.getValue("fr31").toString();
            }else{
               r31="0";
            }
            if((session.getValue("fr32")!=null)&&(!session.getValue("fr32").toString().isEmpty())){
               r32=session.getValue("fr32").toString();
            }else{
               r32="0";
            }
            if((session.getValue("fr33")!=null)&&(!session.getValue("fr33").toString().isEmpty())){
               r33=session.getValue("fr33").toString();
            }else{
               r33="0";
            }
            if((session.getValue("fr34")!=null)&&(!session.getValue("fr34").toString().isEmpty())){
                r34=session.getValue("fr34").toString();
            }else{
                r34="-1";
            }
            if((session.getValue("fr35")!=null)&&(!session.getValue("fr35").toString().isEmpty())){
                r35=session.getValue("fr35").toString();
            }else{
               r35="0";
            }
            if((session.getValue("fr36")!=null)&&(!session.getValue("fr36").toString().isEmpty())){
               r36=session.getValue("fr36").toString();
            }else{
               r36="0";
            }
            if((session.getValue("fr37")!=null)&&(!session.getValue("fr37").toString().isEmpty())){
               r37=session.getValue("fr37").toString();
            }else{
               r37="0";
            }
            if((session.getValue("fr38")!=null)&&(!session.getValue("fr38").toString().isEmpty())){
                r38=session.getValue("fr38").toString();
            }else{
                r38="0";
            }
            if((session.getValue("fr39")!=null)&&(!session.getValue("fr39").toString().isEmpty())){
               r39=session.getValue("fr39").toString();
            }else{
               r39="0";
            }
           if((session.getValue("fr40")!=null)&&(!session.getValue("fr40").toString().isEmpty())){
               r40=session.getValue("fr40").toString();
            }else{
               r40="0";
            }
            if((session.getValue("fr41")!=null)&&(!session.getValue("fr41").toString().isEmpty())){
               r41=session.getValue("fr41").toString();
            }else{
               r41="0";
            }
           if((session.getValue("fr42")!=null)&&(!session.getValue("fr42").toString().isEmpty())){
               r42=session.getValue("fr42").toString();
            }else{
               r42="0";
            }
            if((session.getValue("fr43")!=null)&&(!session.getValue("fr43").toString().isEmpty())){
                r43=session.getValue("fr43").toString();
            }else{
               r43="-1";
            }
            if((session.getValue("fr44")!=null)&&(!session.getValue("fr44").toString().isEmpty())){
               r44=session.getValue("fr44").toString();
            }else{
               r44="-1";
            }
            if((session.getValue("fr45")!=null)&&(!session.getValue("fr45").toString().isEmpty())){
               r45=session.getValue("fr45").toString();
            }else{
               r45="0";
            }
            
                 session.setAttribute("fr1",null);
                  session.setAttribute("fr2",null);
                  session.setAttribute("fr3",null);
                  session.setAttribute("fr4",null);
                  session.setAttribute("fr5",null);
                  session.setAttribute("fr6",null);
                  session.setAttribute("fr7",null);
                  session.setAttribute("fr8",null);
                  session.setAttribute("fr9",null);
                  session.setAttribute("fr10",null);
                  session.setAttribute("fr11",null);
                  session.setAttribute("fr12",null);
                  session.setAttribute("fr13",null);
                  session.setAttribute("fr14",null);
                  session.setAttribute("fr15",null);
                  session.setAttribute("fr16",null);
                  session.setAttribute("fr17",null);
                  session.setAttribute("fr18",null);
                  session.setAttribute("fr19",null);
                  session.setAttribute("fr20",null);
                  session.setAttribute("fr21",null);
                  session.setAttribute("fr22",null);
                  session.setAttribute("fr23",null);
                  session.setAttribute("fr24",null);
                  session.setAttribute("fr25",null);
                  session.setAttribute("fr26",null);
                  session.setAttribute("fr27",null);
                  session.setAttribute("fr28",null);
                  session.setAttribute("fr29",null);
                  session.setAttribute("fr30",null);
                  session.setAttribute("fr31",null);
                  session.setAttribute("fr32",null);
                  session.setAttribute("fr33",null);
                  session.setAttribute("fr34",null);
                  session.setAttribute("fr35",null);
                  session.setAttribute("fr36",null);
                  session.setAttribute("fr37",null);
                  session.setAttribute("fr38",null);
                  session.setAttribute("fr39",null);
                  session.setAttribute("fr40",null);
                  session.setAttribute("fr41",null);
                  session.setAttribute("fr42",null);
                  session.setAttribute("fr43",null);
                  session.setAttribute("fr44",null);
                  session.setAttribute("fr45",null);
                  
        try{
              
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection("jdbc:mysql://localhost/sisgermo","root","");
              st = conn.createStatement();
               st.executeUpdate("Update  fasereprodutiva set idf= '"+idAmostra+"',cod68='"+r1+"',cod69='"+r2+"',cod75='"+r3+"',cod77='"+r4+"',cod82='"+r5+"',cod83='"+r6+"',cod86='"+r7+"',cod90='"+r8+"',cod93='"+r9+"',cod222='"+r10+"',cod94='"+r11+"',cod95='"+r12+"',cod99='"+r13+"',cod102='"+r14+"',cod103='"+r15+"',cod106='"+r16+"',cod107='"+r17+"',cod108='"+r18+"',cod109='"+r19+"',cod110='"+r20+"',cod114='"+r21+"',cod115='"+r22+"',cod126='"+r23+"',cod131='"+r24+"',cod132='"+r25+"',cod133='"+r26+"',cod134='"+r27+"',cod135='"+r28+"',cod136='"+r29+"',cod142='"+r30+"',cod143='"+r31+"',cod148='"+r32+"',cod149='"+r33+"',cod152='"+r34+"',cod153='"+r35+"',cod158='"+r36+"',cod161='"+r37+"',cod162='"+r38+"',cod180='"+r39+"',cod167='"+r40+"',cod169='"+r41+"',cod171='"+r42+"',cod174='"+r43+"',cod175='"+r44+"',cod176='"+r45+"' where Identif = '"+cod+"'");
               status++;
          }catch(Exception ex){
   
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
         
          if(status<4)
           {
               %>
                <div id="dialog" title="Mensagem" style="display:none">
                   <p>Ops acontenceu um erro !!!</p>
               </div>
              <%
           }else
           {
               session.setAttribute("index",cod);
               session.setAttribute("cont",0);
               %>
               <div id="dialog" title="Mensagem" style="display:none" onload="executa()" >
                   <p>Alteração realizada com Sucesso !</p>
               </div>
			   
						<script>
				 function executa() {
				   
					 var r = confirm("Deseja alterar imagens ?");
					if (r == true) {
						location.href="imagens3.jsp";
						
						
					} else {
						location.href="Home.jsp";
					}

				}
				</script>
               
               <%
           }
           
            
         %>
         
           <script>
             window.executa();
          </script>
         
    </body>
</html>
