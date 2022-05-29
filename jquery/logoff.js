/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
		
      $("#bt_sair").click(function() {

             var val= $(this).attr('id');
             $.post('logoff.jsp',{valor:val},function(data){
              var x = parseInt(data);
             
              
       });  
  
       });         
});

