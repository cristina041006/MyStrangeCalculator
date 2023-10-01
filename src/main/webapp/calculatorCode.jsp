<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="cr.ejer3.Calculator"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<form method="get" action="calculatorCode.jsp">
  <div class="form-group row">
    <label for="numbers" class="col-4 col-form-label">Numbers</label> 
    <div class="col-8">
    <%! String numbers=""; %>
	<%
	 	if(request.getParameter("operator")!=null && !request.getParameter("operator").equals("nothing")){
	 		numbers += request.getParameter("num1") + Calculator.getOperator(request.getParameter("operator"));
	 		Calculator.addNumber(request.getParameter("num1"));
	 		Calculator.addOperator(request.getParameter("operator"));
		 	out.println( numbers);
	 	}else if (request.getParameter("operator")!=null && !request.getParameter("operator").equals("nothing") && request.getParameter("num1").isEmpty()){
	 		numbers += Calculator.getOperator(request.getParameter("operator"));
		 	out.println( numbers);
		 	Calculator.addOperator(request.getParameter("operator"));
	 	}else if (request.getParameter("operator")!=null && request.getParameter("operator").equals("nothing") && !request.getParameter("num1").isEmpty()){
	 		numbers += request.getParameter("num1");
		 	out.println( numbers);
		 	Calculator.addNumber(request.getParameter("num1"));
	 	}
	 
	 %>
    </div>
  </div>
  <div class="form-group row">
    <label for="num1" class="col-4 col-form-label">Number</label> 
    <div class="col-8">
      <input id="num1" name="num1" placeholder="Write your first number" type="number" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="operator" class="col-4 col-form-label">Operator</label> 
    <div class="col-8">
      <select id="operator" name="operator" class="custom-select">
      	<option value=nothing>Operator</option>
        <option value="add">Add</option>
        <option value="subtract">Subtract</option>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Send</button>
    </div>
  </div>

  
  
</form>

<form action="calculatorCode.jsp" method="get">
<button name="reset" type="reset" class="btn btn-primary">Delete</button>
<%

%>
</form>


<form method="get" action="calculatorCode.jsp">
  <button name="submit" type="submit" class="btn btn-primary">Calculate</button>
  
<%! double result=0; %>
<%
	if(request.getParameter("num1")!=null && (request.getParameter("operator").equals("Add") || request.getParameter("operator").equals("Subtract"))){
		result = Calculator.getResult(String.valueOf(result), request.getParameter("num1"), request.getParameter("operator"));
	}


%>
	  
</form>

</body>
</html>