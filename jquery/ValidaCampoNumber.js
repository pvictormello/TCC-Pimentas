

$(document).ready(function(){
 
   function onlyNumber(fields){
			
			
      $("fields").bind('keyup mouseup',function(e){
	var thisVal = $(this).val(); 
	var tempVal = "";
 
	for(var i = 0; i<thisVal.length; i++){
	
	     if(RegExp(/^[0-9]{0,15}[,]{0,1}[0-9]{0,4}?$/).test(thisVal.charAt(i))){
		 tempVal += thisVal.charAt(i); 
 
		   if(e.keyCode == 8 ){
			tempVal = thisVal.substr(0,i); 
		   }						
		}
					
	   }			
	  $(this).val(tempVal); 
	});
    }
    onlyNumber($('input[type="number"]')); 
 
});

