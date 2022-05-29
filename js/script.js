/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function sucess()
{
    alert("Concluido com sucesso!!");
    window.location.href="search3.jsp"; 
}

function aux(a)
{
    return a;
}
function goBack3()
{
    window.location.href="imagens3.jsp"; 
}
function goNext4()
{
     window.location.href="CadastroImg.jsp"; 
}
function goBack4()
{
   window.location.href="fasereprodutiva3.jsp"; 
}
function goNext3()
{
    window.location.href="imagens3.jsp";
}
function goNext2()
{
    window.location.href="imagens2.jsp";
}
function delet()
{
    window.location.href="delete.jsp";
}
function search()
{
    window.location.href="search.jsp"; 
}
function voltar()
{
   window.location.href="CadPimenta.jsp"; 
}
function voltar2()
{
    window.location.href="CadPimenta2.jsp";
}
function voltar3()
{
    window.location.href="CadPimenta3.jsp";
}
function NewConsult()
{
    window.location.href="busca2.jsp";
}
 function goBack1()
 {
    window.location.href="localizacao3.jsp";
 } 
 function goBack2()
 {
    window.location.href="faseplantula3.jsp";
 }
 function goBack3()
 {
    window.location.href="fasevegetativa3.jsp";
 }
function goNext() {
    window.history.forward()
}
function goBack() {
    window.history.back()
}
/*------------*/

function selecionarInclude()
{
    var x = document.getElementById("Selecionado").value;
    
     
     if(x=="1")
     {
        for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[i].checked=1 
     }else if(x=="2")
     {
         clear();
         for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[13].checked=1 
              document.f1.elements[14].checked=1
             
     }
     else if(x=="3")
     {
         clear();
         for (i=0;i<document.f1.elements.length;i++)
		if(document.f1.elements[i].type == "checkbox")	
                        //document.f1.elements[14].checked=1
                        document.f1.elements[15].checked=1
                        document.f1.elements[16].checked=1
			document.f1.elements[19].checked=1
                        document.f1.elements[20].checked=1
                        document.f1.elements[21].checked=1
                        document.f1.elements[22].checked=1
                        document.f1.elements[23].checked=1
                        document.f1.elements[24].checked=1
                        document.f1.elements[27].checked=1
                        document.f1.elements[28].checked=1
                        document.f1.elements[29].checked=1
                        document.f1.elements[30].checked=1
                        document.f1.elements[31].checked=1
                        
     } 
     else if(x=="0")
     {
         clear();
     }
    
}
function selecionar_tudo()
 { 
     
     var x = document.getElementById("Selecionado").value;
    
     
     if(x=="1")
     {
        for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[i].checked=1 
     }else if(x=="2")
     {
         desmarcar();
         for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[12].checked=1 
              document.f1.elements[13].checked=1
             
     }
     else if(x=="3")
     {
         desmarcar();
         for (i=0;i<document.f1.elements.length;i++)
		if(document.f1.elements[i].type == "checkbox")	
                        document.f1.elements[14].checked=1
                        document.f1.elements[15].checked=1
                        document.f1.elements[18].checked=1
			document.f1.elements[19].checked=1
                        document.f1.elements[20].checked=1
                        document.f1.elements[21].checked=1
                        document.f1.elements[22].checked=1
                        document.f1.elements[23].checked=1
                        document.f1.elements[26].checked=1
                        document.f1.elements[27].checked=1
                        document.f1.elements[28].checked=1
                        document.f1.elements[29].checked=1
                        document.f1.elements[30].checked=1
                        
     } 
     else if(x=="0")
     {
         desmarcar();
     }
    
     
     
}
function clear()
{
    for (i=0;i<document.f1.elements.length;i++){
            if(document.f1.elements[i].type == "checkbox")
            {
                document.f1.elements[i].checked=0
            }
        }
}
function desmarcar()
{
     $('#op').each(
         function(){
             $("input:checkbox").attr("checked",false);
            //$(this).attr("checked", false);
         });
   
}
function marcar(pos)
{
   $("input:checkbox")[pos].attr("checked",true);
}
function mark(pos)
{
   /* $('#tp').each(
         function(){
           if ($(this).prop( "checked")) 
           $(this).prop("checked", false);
           else $(this).prop("checked", true);               
         }
    );*/
    
}

/*function selecionar_tudo()
 { 
     
     var x = document.getElementById("Selecionado").value;
    
     
     if(x=="1")
     {
        for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[i].checked=1 
     }else if(x=="2")
     {
         desmarcar();
         for (i=0;i<document.f1.elements.length;i++) 
           if(document.f1.elements[i].type == "checkbox")	
              document.f1.elements[13].checked=1 
              document.f1.elements[14].checked=1
              document.f1.elements[15].checked=1
     }
     else if(x=="3")
     {
         desmarcar();
         for (i=0;i<document.f1.elements.length;i++)
		if(document.f1.elements[i].type == "checkbox")	
			document.f1.elements[19].checked=1
                        document.f1.elements[20].checked=1
                        document.f1.elements[21].checked=1
     }
     else if(x=="0")
     {
         desmarcar();
     }
} 
function desmarcar()
{
    for (i=0;i<document.f1.elements.length;i++)
		if(document.f1.elements[i].type == "checkbox")	
			document.f1.elements[i].checked=0
}
function marcar(pos)
{
    var x = document.getElementById("op").value;
   
    if(x=="1")
    {
        document.f1.elements[pos].checked=0
    }else
    {
        document.f1.elements[pos].checked=1
    }
}
*/

/*---------------------*/
function verifica()
{
    var x=document.f1.senha.value;
    if(x=="")
    {
        alert("Informe a senha!");
        document.f1.senha.focus();
        return false;
    }
}
function validaSenha()
{
    var x=document.f1.senha.value;
    var y=document.f1.senha2.value;
    
    if( x!=y )
    {
        alert("Ops as senhas não correspondem !");
        document.f1.senha2.focus();
        return false;
    }
}
function validaData()
{
       var x= document.getElementById("data").value;
        var res= x[8]+x[9]+"/"+x[5]+x[6]+"/"+x[0]+x[1]+x[2]+x[3];
        var data=res;
    

      var objDate = new Date();
      objDate.setYear(data.split("/")[2]);
      objDate.setMonth(data.split("/")[1]  - 1);//- 1 pq em js é de 0 a 11 os meses
      objDate.setDate(data.split("/")[0]);

      if(objDate.getTime() > new Date().getTime()){
        alert("O data informada é maior que a data atual..");
        document.getElementById("data").value='';
        return false;
      }
      

}
function selecao()
{
   
    var x= document.getElementById("select").value;
    
    if(x == "0")
    {
        alert(unescape("Voc\u00ea ainda n\u00e3o selecionou um dado v\u00e1lido!"));
        return false;
    }
}
function validaEmail()
{
    var y =document.forms["form"]["email"].value;
	var i=y.indexOf("@");
	var i2=y.lastIndexOf("@");
	var p1=y.indexOf(".");
	var p2=y.lastIndexOf(".");
	//document.write(p1);
	//document.write(p2);
	if(i<1||!(i==i2)||p1<i+2||!(p1==p2)||p2+2>=y.length)
	{
	   alert(unescape("*E-mail inv\u00e1lido use o exempo: nome@gmail.com"));
        document.f1.email.focus();
        return false;
	}
	else
	{
	   return true;
	   }
}
//adiciona mascara ao telefone
function MascaraTelefone(tel){	
	if(mascaraInteiro(tel)==false){
		event.returnValue = false;
	}	
	return formataCampo(tel, '(00) 0000-0000', event);
}
//valida telefone
function ValidaTelefone(tel){
	exp = /\(\d{2}\)\ \d{4}\-\d{4}/
	if(!exp.test(tel.value))
		alert(unescape('Numero de Telefone Inv\u00e1lido!'));
}
//valida numero inteiro com mascara
function mascaraInteiro(){
	if (event.keyCode < 48 || event.keyCode > 57){
		event.returnValue = false;
		return false;
	}
	return true;
}
//formata de forma generica os campos
function formataCampo(campo, Mascara, evento) { 
	var boleanoMascara; 
	
	var Digitato = evento.keyCode;
	exp = /\-|\.|\/|\(|\)| /g
	campoSoNumeros = campo.value.toString().replace( exp, "" ); 
   
	var posicaoCampo = 0;	 
	var NovoValorCampo="";
	var TamanhoMascara = campoSoNumeros.length;; 
	
	if (Digitato != 8) { // backspace 
		for(i=0; i<= TamanhoMascara; i++) { 
			boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
								|| (Mascara.charAt(i) == "/")) 
			boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
								|| (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
			if (boleanoMascara) { 
				NovoValorCampo += Mascara.charAt(i); 
				  TamanhoMascara++;
			}else { 
				NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
				posicaoCampo++; 
			  }	   	 
		  }	 
		campo.value = NovoValorCampo;
		  return true; 
	}else { 
		return true; 
	}
}
var reDecimalPt = /^[+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+)$/;
var reDecimalEn = /^[+-]?((\d+|\d{1,3}(\,\d{3})+)(\.\d*)?|\.\d+)$/;
var reDecimal = reDecimalPt;
function isNumber(pStr,id)
{
  
  pLang="En";
	charDec = ( pLang != "En"? ",": "." );
	eval("reDecimal = reDecimal" + pLang);
	if (reDecimal.test(pStr)) {
		pos = pStr.indexOf(charDec);
		decs = pos == -1? 0: pStr.length - pos - 1;
		//alert(pStr + " é um float válido (" + pLang + ") com " + decs + " decimais.");
	} else  {
		alert(unescape("Valor n\u00e3o aceito !"));
		document.getElementById(id).value=null;
                //document.getElementById("cod27").value="";
                //document.getElementById(id).value="";
                return false;
	}
 
}
function validaBusca() {
  if (document.querySelector('#cod27').value == '') {
      document.querySelector('#cod27').style.background = 'green';
      return false;
  }  
}
//-----------------Atualizado em 11/05----------------------------//

function IsEmail(email){
    var exclude=/[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
    var check=/@[\w\-]+\./;
    var checkend=/\.[a-zA-Z]{2,3}$/;
    if(((email.search(exclude) != -1)||(email.search(check)) == -1)||(email.search(checkend) == -1)){
        alert(unescape("*E-mail inv\u00e1lido use o exempo: nome@gmail.com"));
        return false;
    }
    else {
        
        return true;
    }
}
//adiciona mascara ao CPF
function MascaraCPF(cpf){
	if(mascaraInteiro(cpf)==false){
		event.returnValue = false;
	}	
	return formataCampo(cpf, '000.000.000-00', event);
}
//valida o CPF digitado
function ValidarCPF(Objcpf){
	var cpf = Objcpf.value;
	exp = /\.|\-/g
	cpf = cpf.toString().replace( exp, "" ); 
	var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
	var soma1=0, soma2=0;
	var vlr =11;
	
	for(i=0;i<9;i++){
		soma1+=eval(cpf.charAt(i)*(vlr-1));
		soma2+=eval(cpf.charAt(i)*vlr);
		vlr--;
	}	
	soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
	soma2=(((soma2+(2*soma1))*10)%11);
	
	var digitoGerado=(soma1*10)+soma2;
	if(digitoGerado!=digitoDigitado)	
		alert(unescape('CPF Inv\u00e1lido!'));		
}

