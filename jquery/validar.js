/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready( function() {
	$("#fileupload").validate({
		/* REGRAS DE VALIDAÃ‡ÃƒO DO FORMULÃRIO */
		rules:{
		
            files:{
                accept: "jpg|png" /* SÃ³ aceita arquivos com extensÃ£o .jpg e .png */
            }
		},
		/* DEFINIÃ‡ÃƒO DAS MENSAGENS DE ERRO */
		messages:{
			
            files:{
                accept: "Extensãoo de arquivo inválida"
            }
		}
	});
});