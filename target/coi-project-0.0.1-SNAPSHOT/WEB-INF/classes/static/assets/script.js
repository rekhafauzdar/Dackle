function AddOrder(){     
    
    var gsm = $("#gsm").val();
    var partyname= $("#partyname").val();
    var width= $("#paper_width").val();
    var length = $("#paper_length").val();
    var quantity = $('#quantity').val();
    var papertype = $("#papertype").val()=='1'?"Classic":"Crystal";
    var priority = $("#priority").val()=='1'?"High":$("#priority").val()=='2'?"Medium":"Low";
    
    var size = $("#tbody").children().length;
    var id;
    
    
    
    
    
    if(size==0){
    	id = 1;
    } else{
    	id = parseInt($("#tbody").children()[parseInt($("#tbody").children().length)-1].id)+1;
    }     
    
    var orderids = $("#order_ids").val();
    
    $("#order_ids").val(orderids+","+id);   
    
     if(gsm!=0 && partyname!="" && width!=0 && length!=0 && quantity!=0 && papertype!=0 ){       
    
	var tableRow = '<tr id='+id+'> <td>'+papertype+'<input name="papertype_'+id+'" type="hidden" value='+$("#papertype").val()+'></input></td><td>'+gsm+'<input name="gsm_'+id+'" type="hidden" value='+gsm+'></input></td> <td>'+partyname+'<input name="partyname_'+id+'" type="hidden" value='+partyname+'></input></td><td>'+width+'*'+length+'<input name="size_'+id+'" type="hidden" value='+width+'-'+length+'></input> </td> <td>'+quantity+'<input name="quantity_'+id+'" type="hidden" value='+quantity+'></input></td> <td hidden="ture">'+priority+'<input name="priority_'+id+'" type="hidden" value='+$("#priority").val()+'></input></td> <td><a style="color:green;" href="#" onclick="editOrder('+id+')">Edit</a>&nbsp;/&nbsp;<a style="color:red;" href="#" onclick="deleteOrder('+id+')">Delete</a></td></tr>';	
	$("#tbody").append(tableRow); 
	}                      
}

function editOrder(orderId){
	$("#partyname").val($("#"+orderId+"").find('input[name="partyname_'+orderId+'"]').val());
	$("#gsm").val($("#"+orderId+"").find('input[name="gsm_'+orderId+'"]').val());
	$("#paper_width").val($("#"+orderId+"").find('input[name="size_'+orderId+'"]').val().split("-")[0]);
	$("#paper_length").val($("#"+orderId+"").find('input[name="size_'+orderId+'"]').val().split("-")[1]);	
	$("#quantity").val($("#"+orderId+"").find('input[name="quantity_'+orderId+'"]').val());
	$("#papertype").val($("#"+orderId+"").find('input[name="papertype_'+orderId+'"]').val());
	$("#"+orderId+"").remove();
	
}


function deleteOrder(orderId){
	$("#"+orderId+"").remove();
}


function registration(){
	
}


