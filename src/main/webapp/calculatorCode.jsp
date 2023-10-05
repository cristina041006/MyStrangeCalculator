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
  <h1>My Strange Calculator</h1>
<form method="get" action="calculatorCode.jsp">
  <div class="form-group row">

    <label for="numbers" class="col-4 col-form-label">Numbers</label> 
    <div class="col-8">
    <%--Variables globales donde almacenamos: la cadena que mostramos, el resultado final y un mensaje de alerta para los errores --%>
    <%! String numbers=""; %>
    <%! double result=0; %>
    <%! String alert=""; %>
    <%--Bloque de codigo donde captutamos cada boton:
    Submit: Te añade un operador, un numero o ambos a la casilla de visualizacion y si ambos estan vacias saltara un mensaje de alerta
    Reset: Limpia la cadena de texto
    Calculate: Calcula el resultado y te muestra la cadena de operaciones igualada al resultado o a error si no es valida y resetea todo --%>
	<%
		if(request.getParameter("submit")!=null){
			alert="";
			if(request.getParameter("operator")!=null && !request.getParameter("operator").equals("nothing") && !request.getParameter("num1").isEmpty()){
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
	 		}else{
	 			out.println( numbers);
	 			alert = "Debes añadir algo";
	 		}
		}

		if(request.getParameter("reset")!=null){
		numbers="";
		}
		
		if(request.getParameter("calculate")!=null){
			
			result = Calculator.calculate(result);
			if (!Calculator.showNumber().contains("error")) {
				out.println(Calculator.showNumber() + " = " + result);
			}else{
				numbers="";
				out.println(Calculator.showNumber());
			}
			
			Calculator.deleteString();
			result =0;
		}
	 
	 %>
    </div>
    
  </div>
  <div class="form-group row">
  
    <label for="num1" class="col-4 col-form-label">Number</label> 
    <div class="col-8">
      <input id="num1" name="num1" placeholder="Write your first number" step="any" type="number" class="form-control">
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
      <%=alert %>
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
    <%--Codigo para habilitar o deshabilitar el boton de enviar numeros cuando pulsamos el de calculars --%>
    <%if(request.getParameter("calculate")!=null){%>
    	
      <button name="submit" type="submit" class="btn btn-primary" disabled>Send</button>
    <%}else{%>
     <button name="submit" type="submit" class="btn btn-primary" enabled>Send</button>
     <%} %>
      <button name="reset" type="submit" class="btn btn-primary">Delete</button>
      <button name="calculate" type="submit" class="btn btn-primary">Calculate</button>
    </div>
  </div>
</form>
</body>
</html>