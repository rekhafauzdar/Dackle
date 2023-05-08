<!-- <%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%> -->
    
    
    <%@page import="java.util.Map.Entry"%>
<%@page import="java.text.DecimalFormat" %>
   

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<!-- <%@ page import="java.util.Map" %> -->
<%@page import="java.util.Map"%>


<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dackle System</title>
<meta content="" name="description">
<meta content="" name="keywords">

<link rel="stylesheet" href="assets/style.css" type="text/css">


<!-- Favicons -->
<!--  <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="assets/script.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous">
	</script>
	
	<style type="text/css">
	@media print{
	
	#hiddendiv{display:none;}
	.topnav{display:none;}
	#orders{display:true;}
	
	
	.btn{
	width:100%;
	}
	
	
	
	}
	
	</style>
	
	
	
<script type="text/javascript">
	
	 function Myprint() {
	    
		 window.print();
		 
	};
	
	</script>
	
	
	

</head>

<body  >



<div class="topnav">
 
  <a active="true" class="active" href="/home"> Add New Orders</a>
  <a href="/order_preview">View Orders</a>
   <a style="float:right;" href="/">Log Out</a>
</div>

<div class="container1">
	
		<main id="main" class="style" >
		
		
		 <section id="about" class="about"> <!-- <form action="/calculate" method="post"> -->
		

		<div id="hiddendiv" >
			<div class="mb-3 row">
			<div class="col-lg-1 col-md-3 col-sm-3" >
					<label for="exampldeFormControlInput1" class="form-label">Order_Date</label>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-3" >
					<input type="date" name="date" class="form-control" id="orderdate">
				</div>
				
				
				
				
				<div class="col-lg-1 col-md-2 col-sm-2">
					<label for="exampleFormControlInput1" class="form-label">Paper_Type</label>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2">
					<select name="paper_type" class="form-select" aria-label="Default select example" id="papertype" style="border-radius: 8px;">
						<option value="1">Classic Grey Back</option>
						<option value="2">Crystal White Back</option>
					</select>
				</div>
			
				<div class="col-lg-1 col-md-1 col-sm-1">
					<label for="exampleFormControlInput1" class="form-label">GSM</label>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<input type="text" name="gsm" class="form-control" id="gsm"	placeholder="GSM" required />
				</div>
				
				<div class="col-lg-1 col-md-2 col-sm-2">
					<label for="exampleFormControlInput1" class="form-label">Party_Name</label>
				</div>
				
				<div class="col-lg-3 col-md-2 col-sm-2">
					<input name="partyname" type="text" class="form-control" id="partyname" placeholder="Party Name" required>
				</div>
						
			</div>
			<div class="row">
			<div class="col-lg-1 col-md-2 col-sm-2">
					<label for="exampleFormControlInput1" class="form-label">Order_Qty</label>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<input name="quantity" type="text" class="form-control"	id="quantity" placeholder="Qty" required>
				</div>
			
				<div class="col-lg-1 col-md-1 col-sm-1">
					<label for="exampleFormControlInput1" class="form-label">Size:width</label>
				</div>

				<div class="col-lg-1 col-md-1 col-sm-1">
					<input name="paper_width" type="text" class="form-control"	id="paper_width" placeholder="Width" required>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<label for="exampleFormControlInput1" class="form-label">Length</label>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<input name="paper_length" type="text" class="form-control"	id="paper_length" placeholder="Length" required>
				</div>
				
				<div class="col-lg-1 col-md-1 col-sm-1" hidden="true">
					<label for="exampleFormControlInput1" class="form-label">Priority</label>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2" hidden="true">
					<select name="priority" class="form-select" aria-label="Default select example" id="priority">
						<option value="1">High</option>
						<option value="2">Medium</option>
						<option value="3">Low</option>
					</select>
				</div>


				<div class="col-auto" id="hiddendiv">
					<button type="submit" class="btn btn-success mb-4" style="border-radius:40px; width:100%;" fdprocessedid="280s4d" onclick="AddOrder();">Add Order</button>
				</div>
				
				

			</div>
		</div>	
			
			<%
			Map<String, Map<String, Object>> orderDetails = (Map<String, Map<String, Object>>) request.getAttribute("orderDetails");
			Map<String, Map<String, Object>> production = (Map<String, Map<String, Object>>) request.getAttribute("prod");						
			
			%>

			<form action="/calculate" method="post">
				<input type="hidden" name="order_ids" id = "order_ids"/>
				
				<div class="container1">
			<lable hidden="true" id="orders">Orders</lable>	
				<table class="table orders" >
					<thead>
						<tr>
						
							<th scope="col">Paper Type</th>
							<th scope="col">GSM</th>
							<th scope="col">Party Name</th>
							<th scope="col">Size</th>
							<th scope="col">Qty.(Ton)</th>							
							<th scope="col" hidden="true" id="hiddendiv" >Action</th>
						</tr>
					</thead>
					<tbody id="tbody">
					
					<%
						if(orderDetails!=null && orderDetails.size()>0){
							for (Map.Entry<String, Map<String,Object>> map :orderDetails.entrySet()) {	
								
								Integer paperType = (Integer)map.getValue().get("papertype");
								Object orderdate = map.getValue().get("orderdate");
					 			Object gsm = map.getValue().get("gsm");
					 			Object partyName = map.getValue().get("partyName");
					 			Object width = map.getValue().get("width");
					 			Object length = map.getValue().get("length");
					 			Object quantity = map.getValue().get("quantity");
					 			Integer priority = (Integer)map.getValue().get("priority");
								
								%>
									<tr>
									
									   <td><%=paperType==1?"Classic":"Crystal" %></td>
										<td><%=gsm %></td>
										<td><%=partyName %></td>
										<td><%=width + "x" + length%></td>
										<td><%=quantity%></td>
										 <td hidden="true"><%=priority==1?"High":priority==2?"Medium":"Low"%></td>
										<td hidden="true"><a style="color:green;" href="editRow()">Edit</a>&nbsp;/&nbsp;<a style="color:red;" href="deleteRow()">Delete</a></td>  

									
									</tr>
								
								<%
					            
					        }							
						}					
					%>

					</tbody>
				</table>
				
				</div>
				
				<div class="button input-box" style="text-align:center;">
					<button id="dacklePlanning" type="submit" class="btn btn-success mb-3" style="width:20%; border-radius:40px">Dackle Planning</button>
				<button  id="hiddendiv" type="button" class="btn btn-primary mb-3" style="width:20%; border-radius:40px" onClick="Myprint();" >Print</button>
				</div>
				
				
			</form>
		
		



<div class="container1">

		<table class="table orders">
			<thead>				
				<tr>

					<th scope="col">Cuts (Paper1)</th>
					<th scope="col">Cuts (Paper2)</th>
					<th scope="col">Total Wt.(Ton)</th>
					<th scope="col">Party1  (T Wt.)  (Total sheets)</th>
					<th scope="col">Party2  (T Wt.)  (Total Sheets)</th>
					<th scope="col">Wastage(cm.)</th>
					

				</tr>
			</thead>
			<tbody>
			
			<tr><td colspan="6"><h6 style="color:#04888d;"><u style="color:green;"> Results with Wastage less than or equal to  8cm.</u></h6></td></tr>
				
				<%
				
				
				if(production!=null && production.size()>0){
					
				
					
					for (Map.Entry<String, Map<String,Object>> prod :production.entrySet()) {		
						
						System.out.println("-----------------------------------");
						System.out.println(prod);
						String order1Key = (String) prod.getValue().get("paper1");
						String order2Key = (String) prod.getValue().get("paper2");
						Integer order1Cut = (Integer) prod.getValue().get("paperCust1");
						Integer order2Cut = (Integer) prod.getValue().get("paperCust2");
						double wastage = (double) prod.getValue().get("wastage");
						
						if(wastage<=8){
						
						Map<String,Object> order1 = orderDetails.get(order1Key); 
			 			Object gsm = order1.get("gsm");
			 			Object partyName = order1.get("partyName");
			 			Object width = order1.get("width");
			 			Object length = order1.get("length");
			 			Object quantity = order1.get("quantity");
			 			Integer priority = (Integer)order1.get("priority");	
			 			//double prodingram =  (double) prod.getValue().get("prod1");
			 			double produced =  ((double) prod.getValue().get("prod1"))/1000000;	
			 			double sheets1 = (double)prod.getValue().get("sheets1");			 			
			 			
			 			
			 			Map<String,Object> order2 = orderDetails.get(order2Key);
			 			Object gsm2 = order2.get("gsm");
			 			Object partyName2 = order2.get("partyName");
			 			Object width2 = order2.get("width");
			 			Object length2 = order2.get("length");
			 			Object quantity2 = order2.get("quantity");
			 			Integer priority2 = (Integer)order2.get("priority");	
			 			//double prodingram2 =  (double) prod.getValue().get("prod2");
			 			double produced2 =  ((double) prod.getValue().get("prod2"))/1000000;
			 			double sheets2 = (double)prod.getValue().get("sheets2");
			 			
			 			
			 			
			 			DecimalFormat format = new DecimalFormat("#0.000");
			 			DecimalFormat format2 = new DecimalFormat("#0.00");
			 			DecimalFormat format1 = new DecimalFormat("#0");
						
				
				%>	
				
				
				
				
					<tr>
						<td><%= order1Cut  +"("+width+"X"+length+")" %></td>
						<td><%= order2Cut  +"("+width2+"X"+length2+")" %></td>
						<td><%= format.format(produced+produced2)   %></td>
						
						<td><%= partyName +"("+format.format(produced)+")" + "("+format1.format(sheets1)+")" %></td>
						<td><%= partyName2 +"("+format.format(produced2)+")" + "("+format1.format(sheets2)+")"%></td>
						<td><%= format2.format(wastage)  %></td>	
						
											
					</tr>
				
				<%
					}
				}
				}
				%>
				
			
			
				<tr><td colspan="6"><h6 style="color:#04888d;"><u style="color:green;"> Results with Wastage more than 8cm.</u></h6></td></tr>
				
		       
               
             


				
				<%
				
				
				if(production!=null && production.size()>0){
					
				
					
					for (Map.Entry<String, Map<String,Object>> prod :production.entrySet()) {		
						
						System.out.println("-----------------------------------");
						System.out.println(prod);
						String order1Key = (String) prod.getValue().get("paper1");
						String order2Key = (String) prod.getValue().get("paper2");
						Integer order1Cut = (Integer) prod.getValue().get("paperCust1");
						Integer order2Cut = (Integer) prod.getValue().get("paperCust2");
						double wastage = (double) prod.getValue().get("wastage");
						
						if(wastage>8){
						
						Map<String,Object> order1 = orderDetails.get(order1Key); 
			 			Object gsm = order1.get("gsm");
			 			Object partyName = order1.get("partyName");
			 			Object width = order1.get("width");
			 			Object length = order1.get("length");
			 			Object quantity = order1.get("quantity");
			 			Integer priority = (Integer)order1.get("priority");	
			 			//double prodingram =  (double) prod.getValue().get("prod1");
			 			double produced =  ((double) prod.getValue().get("prod1"))/1000000;	
			 			double sheets1 = (double)prod.getValue().get("sheets1");			 			
			 			
			 			
			 			Map<String,Object> order2 = orderDetails.get(order2Key);
			 			Object gsm2 = order2.get("gsm");
			 			Object partyName2 = order2.get("partyName");
			 			Object width2 = order2.get("width");
			 			Object length2 = order2.get("length");
			 			Object quantity2 = order2.get("quantity");
			 			Integer priority2 = (Integer)order2.get("priority");	
			 			//double prodingram2 =  (double) prod.getValue().get("prod2");
			 			double produced2 =  ((double) prod.getValue().get("prod2"))/1000000;
			 			double sheets2 = (double)prod.getValue().get("sheets2");
			 			
			 			
			 			
			 			DecimalFormat format = new DecimalFormat("#0.000");
			 			DecimalFormat format2 = new DecimalFormat("#0.00");
			 			DecimalFormat format1 = new DecimalFormat("#0");
						
				
				%>	
				
				
				
				
					<tr>
						<td><%= order1Cut +"("+width+"X"+length+")" %></td>
						<td><%= order2Cut + "("+width2+"X"+length2+")" %></td>
						<td><%= format.format(produced+produced2)   %></td>
						
						<td><%= partyName + "("+format.format(produced)+")" + "("+format1.format(sheets1)+")" %></td>
						<td><%= partyName2 + "("+format.format(produced2)+")" + "("+format1.format(sheets2)+")"%></td>
						<td><%= format2.format(wastage)  %></td>	
						
											
					</tr>
				
				<%
					}
				}
				}
				%>
				
			</tbody>
		</table>




<table class="table orders" >
			<thead>				
				<tr>

					<th scope="col">Party Name    (Size)   (Remaining Qty.)</th>					
					
					
					

				</tr>
			</thead>
			<tbody>
				
				
				
					<%
					if(orderDetails!= null){
				 for(Entry<String, Map<String, Object>> dataMap: orderDetails.entrySet()) {
						
				       if(!dataMap.getValue().containsKey("isDone")){
				    	   
				    	   double remain = (((double) dataMap.getValue().get("quantity"))*1000000) - (double) dataMap.getValue().get("produced");
				    	   double width = (double) dataMap.getValue().get("width");
				    	   double length = (double) dataMap.getValue().get("length");
				    	   
				    	  System.out.print(dataMap.getValue());
				    	  DecimalFormat format = new DecimalFormat("#0.000");
				    	   %>
				    	   		 <tr>
				    	   		 <td><%=dataMap.getValue().get("partyName")+"("+width+"X"+length+")"+"("+format.format((remain/1000000))+")" %></td>
				    	   		
				    	   		
				    	   		 </tr>				    	   		 
				    	   <%				    	   
				       }
			        }
					}
				%>
				
			
				
				
				
					
				
			</tbody>
		</table>


</div>
		
		
		
		</section>
		 </main>



</div>
</body>

</html>