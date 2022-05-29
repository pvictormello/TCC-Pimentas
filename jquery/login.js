/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
   var x;	
      $("#submit").click(function() {
          
          var email= $('#email').val();
          var senha= $('#pass').val();
          
          $.post('validaLogin.jsp',{email: email,senha: senha},function(data){
               x = parseInt(data);
             
              if(x==0)
              {
                 
                  alert("Email ou senha inv\u00e1lidos !");
                  $('#email').css('border', '3px #C33 solid');
                  $('#pass').css('border', '3px #C33 solid');
                  $("#invalido").addClass("invalido");
                  $("#invalido").html("Email ou senha inv\u00e1lidos !");
                  //$('#logado').hide();
                  //$('#cross').fadeIn();
                  $('#logoff').attr('disabled', 'disabled');
              }else
              {
                 
                  $('#email').css('border', '1px #25a4b0 solid ');
                  $('#pass').css('border', '1px #25a4b0 solid ');
                  $("#invalido").removeClass("invalido");
                  $("#invalido").html("").remove("Email ou senha inv\u00e1lidos !");
                  $("#logado").addClass("logado");
                  $('#logoff').removeAttr('disabled');
                  
                  //$(location).attr("href","Home.jsp");
                  
              }
              
                  
          });
         
         if(x==1)
         {
             
             $(location).attr("href","Home.jsp");
             
         }
          
          
      });  
      $("#bt_sair").click(function(){
          $(location).attr("href","Home.jsp");
      });
      
      
                
});
