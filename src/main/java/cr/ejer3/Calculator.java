package cr.ejer3;



import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Data
@AllArgsConstructor


public class Calculator {
	
	private static ArrayList numberList = new ArrayList();
	private double num1;
	private double num2;
	private char operador;
	
	
	public static String getOperator(String operator) throws Exception {
		String character = "";
		if (operator!=null) {
			if(operator.equals("add")) {
				character = "+";
			}else if (operator.equals("subtract")) {
				character = "-";
			}
		}else {
			throw new Exception ("El operador no puede ser nulo");
		}
	
		
		return character;
	}
	
	public static void addNumber (String num1) {
		numberList.add(num1);
	}
	public static void addOperator (String operator) throws Exception {
		numberList.add(Calculator.getOperator(operator));
	}
	
	public static double getResult (String num1, String num2, String operador) {			
		
		double result = Double.parseDouble(num1);
		if (operador.charAt(0)=='+') {
			result += Double.parseDouble(num2);
		}else if(operador.charAt(0)=='-') {
			result -= Double.parseDouble(num2);
		}
		
		return result;
	}
	

}
