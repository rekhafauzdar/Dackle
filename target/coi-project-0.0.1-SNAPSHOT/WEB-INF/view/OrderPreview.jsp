<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.coi.entity.DackleOrders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <title>View Orders</title>
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
        crossorigin="anonymous"></script>
    
    </head>
<body>
<div class="topnav">
 
  <a href="/home"> Add New Orders</a>
  <a class="active" active="true" href="/order_preview">View Orders</a>
   <a style="float:right;" href="/">Log Out</a>
</div>


<div class="container1">
 <main  class="style">
 	<%
 		List<DackleOrders> orders = (List<DackleOrders>) request.getAttribute("orders");
 		Integer pageno = (Integer) request.getAttribute("pageno");
 		
 		String formdate = (String) request.getAttribute("formdate");
 		String todate = (String) request.getAttribute("todate");
 		String PartyName = (String) request.getAttribute("partyname");
 		String gsm = (String) request.getAttribute("gsm");
 		String quantity = (String) request.getAttribute("quantity");
 		
 		
 		
 		
 	
 	%>
 
            <section  class="about"> <!-- <form action="/calculate" method="post"> -->

			<form action="/order_preview">
				<input type="hidden" name="pageno" value="<%=pageno%>"/>
			
                <div class="row">
                    <div class="mb-3 row">
                                                <div class="col-lg-1 col-md-3 col-sm-3">
                            <label for="exampleFormControlInput1" class="form-label">From_Date</label>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-3">
                            <input type="date" name="date" class="form-control" id="formdate" value="<%=formdate%>">
                        </div>
                        <div class="col-lg-1 col-md-3 col-sm-3">
                            <label for="exampleFormControlInput1" class="form-label">To_Date</label>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-3">
                            <input type="date" name="date" class="form-control" id="todate" value="<%=todate%>">
                        </div>
                        
                        <div class="col-lg-1 col-md-2 col-sm-2">
                            <label for="exampleFormControlInput1" class="form-label">GSM</label>
                        </div>
                        <div class="col-lg-1 col-md-2 col-sm-2">
                            <input type="text" name="gsm" class="form-control" id="gsm" placeholder="GSM" value="<%=gsm%>">
                        </div>
                        <div class="col-lg-1 col-md-2 col-sm-2">
                            <label for="exampleFormControlInput1" class="form-label">Order Qty</label>
                        </div>
                        <div class="col-lg-1 col-md-2 col-sm-2">
                            <input name="quantity" type="text" class="form-control" id="quantity"  placeholder="Qty." value="<%=quantity%>">
                        </div>
                        
                     </div> 
                 <div class="row">
                    <div class="mb-3 row">  
                        <div class="col-lg-1 col-md-2 col-sm-2">
                            <label for="exampleFormControlInput1" class="form-label">Party_Name</label>
                        </div>
                        <div class="col-lg-3 col-md-2 col-sm-2">
                            <input name="partyname" type="text" class="form-control" id="partyname"
                                placeholder="Party Name" value="<%=PartyName%>">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2">
                            <button type="submit" class="btn btn-success" style="border-radius:40px; width:100%;" onclick="showOrder()">View Orders</button>
                        </div>
                    </div>
                </div>
			<!--  <nav aria-label="Page navigation example" style="float:right;">
				<ul class="pagination" style="margin-bottom:0px">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1 to 10 of 1000</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>-->
			
			</form>
			
		<div class="container1">	
			<table class="table orders">
                        <thead>
                            <tr>
                             <th scope="col">Paper Type</th>    
                                <th scope="col">Gsm</th>                                                          
                                <th scope="col">Party Name</th>
                                <th scope="col">size</th>
                                <th scope="col">Qty.(Ton)</th>                               
                            </tr>
                        </thead>
                        
                        
                        <tbody id="tbody">
                        
                       		<%
                       		for(DackleOrders order:orders){
                       			%>
                       			 <tr>
                                      
                                        <td><%=order.getPapertype()==1?"Classic":"Crystal" %></td>
                                           <td><%=order.getGsm() %></td>
                                            
                                            <td><%=order.getPartyName() %></td>
                                            <td><%=order.getWidth()+"*"+order.getLength() %></td>
                                            <td><%=order.getQuantity() %></td>
                                                                                
                                        
                                        </tr>
                       			
                       			<%
                       			
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