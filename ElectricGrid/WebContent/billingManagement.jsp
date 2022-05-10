<%@page import="com.elecgrid.crud.billingManagement.services.billingServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<% 
	 
//Save---------------------------------
if (request.getParameter("bill_no") != null) 
{ 
	billingServices billObj = new billingServices();
	String stsMsg = ""; 
	
	//Insert--------------------------
	if (request.getParameter("hidBillingIDSave") == "") 
	{ 
		stsMsg = billObj.insertBill(request.getParameter("bill_no"), 
		request.getParameter("bill_desc"), 
		request.getParameter("bill_type"), 
		request.getParameter("unit"), 
		request.getParameter("cus_id")); 
	} 
	else//Update----------------------
	{ 
		stsMsg = billObj.updateBill(request.getParameter("hidBillingIDSave"), 
		request.getParameter("bill_no"), 
		request.getParameter("bill_desc"), 
		request.getParameter("bill_type"), 
		request.getParameter("unit"));
	} 
	
	session.setAttribute("statusMsg", stsMsg); 
} 
	
//Delete-----------------------------
if (request.getParameter("hidBillingIDDelete") != null) 
{ 
	billingServices billObj = new billingServices();
	String stsMsg = 
	billObj.deleteBill(request.getParameter("hidBillingIDDelete")); 
	session.setAttribute("statusMsg", stsMsg); 
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/billingManagement.js"></script>
</head>
<body> 

<div class="container"><div class="row"><div class="col-6"> 

	<h1>Billing Management</h1>
	
	<form id="formbilling" name="formbilling" method="post" action="billingManagement.jsp">
	 	Bill No: 
	 	<input id="bill_no" name="bill_no" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Bill Description: 
	 	<input id="bill_desc" name="bill_desc" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Bill Type: 
	 	<input id="bill_type" name="bill_type" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Units: 
	 	<input id="unit" name="unit" type="text" 
	 		class="form-control form-control-sm">
	 	
	 	<br> Customer ID: 
	 	<input id="cus_id" name="cus_id" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br>
	 	<input id="btnSave" name="btnSave" type="button" value="Save" 
	 		class="btn btn-primary">
	 	<input type="hidden" id="hidBillingIDSave" 
	 		name="hidBillingIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	<div id="divBillingGrid">
		<%
			billingServices billObj = new billingServices(); 
	 		out.print(billObj.viewBills()); 
	 	%>
	</div>
	
</div> </div> </div> 
</body>
</html>
