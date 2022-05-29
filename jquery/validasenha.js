$(document).ready(function() {
    
      $("input[name='senha2']").blur( function(){  
	
   var s1 = $("#senha").val();
   var s2 =$("#senha2").val();
   
   if(s1!=s2){
       alert("Senhas n\u00e3o conferem");
       $("#senha2").val("");
   }
    });
                        
});