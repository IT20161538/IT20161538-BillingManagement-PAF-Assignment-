$(document).ready(function() 
{ 
	if ($("#alertSuccess").text().trim() == "") 
	{ 
		$("#alertSuccess").hide(); 
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
	// Clear alerts---------------------
	 $("#alertSuccess").text(""); 
	 $("#alertSuccess").hide(); 
	 $("#alertError").text(""); 
	 $("#alertError").hide(); 
	 
	// Form validation-------------------
	var status = validateBillingForm(); 
	if (status != true) 
	 { 
	 $("#alertError").text(status); 
	 $("#alertError").show(); 
	 return; 
	 } 
	
	// If valid------------------------
	 $("#formbilling").submit(); 
}); 

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
	 $("#hidBillingIDSave").val($(this).closest("tr").find('#hidBillingIDUpdate').val()); 
	 $("#bill_no").val($(this).closest("tr").find('td:eq(0)').text()); 
	 $("#bill_desc").val($(this).closest("tr").find('td:eq(1)').text()); 
	 $("#bill_type").val($(this).closest("tr").find('td:eq(2)').text()); 
	 $("#unit").val($(this).closest("tr").find('td:eq(3)').text()); 
}); 


//CLIENT-MODEL================================================================
function validateBillingForm() 
{ 
	// Bill no-----------------------------
	if ($("#bill_no").val().trim() == "") 
	 { 
	 return "Insert Bill No."; 
	 } 
	
	// is numerical value
	var tmpNo = $("#bill_no").val().trim(); 
	if (!$.isNumeric(tmpNo)) 
	 { 
	 return "Insert a numerical value for Bill No."; 
	 } 
	
	// Bill desc----------------------------
	if ($("#bill_desc").val().trim() == "") 
	 { 
	 return "Insert Bill Description."; 
	 } 
	
	// Bill Type-------------------------------
	if ($("#bill_type").val().trim() == "") 
	 { 
	 return "Insert Bill Type."; 
	 } 
	
	//UNIT -----------------------------------
	 if ($("#unit").val().trim() == "") 
	 { 
	 return "Insert Unit."; 
	 } 
	
	// is numerical value
	var tmpUnit = $("#unit").val().trim(); 
	if (!$.isNumeric(tmpUnit)) 
	 { 
	 return "Insert a numerical value for Unit."; 
	 } 
	
	 
	// Customer id ------------------------
	if ($("#cus_id").val().trim() == "") 
	 { 
	 return "Insert Customer ID."; 
	 } 
	
	// is numerical value
	var tmpCusID = $("#cus_id").val().trim(); 
	if (!$.isNumeric(tmpCusID)) 
	 { 
	 return "Insert a numerical value for Customer ID."; 
	 } 
	
	return true; 
}
