package cr.ejer3;



import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Data
@AllArgsConstructor


public class Calculator {
	
	private static List<String> numberList = new ArrayList();
	private double num1;
	private double num2;
	private char operador;
	private static StringBuilder numbers = new StringBuilder();
	
	
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
	private static void deleteList() {
		numberList.clear();
	}
	
	public static String showNumber() {
	
		for (int i=0; i<numberList.size(); i++) {
			numbers.append(numberList.get(i));
		}
		Calculator.deleteList();
		return numbers.toString();
	}
	
	public static void deleteString() {
		numbers.setLength(0);
	}
	
	public static double getResult (double result, String operador, String num1) {			
		
		if (operador.charAt(0)=='+') {
			result += Double.parseDouble(num1);
		}else if(operador.charAt(0)=='-') {
			result -= Double.parseDouble(num1);
		}
		
		return result;
	}
	
	
	public static double calculate(double result) {
		boolean stop = false;
		try {
			
			for (int i=0; i<=numberList.size()-1 && !stop; i+=2) {
				if(result==0 && i==0) {
					result = Double.parseDouble(numberList.get(i));
				}
				if(i+2==numberList.size()-1) {
					result = Calculator.getResult(result, numberList.get(i+1), numberList.get(i+2));
					stop=true;
				}else {
					result = Calculator.getResult(result, numberList.get(i+1), numberList.get(i+2));
				}
				
			}
			
			
		}catch (Exception e) {
			Calculator.deleteList();
			numbers.setLength(0);
			numbers.append("error");
			
		}
		
		return result;
		
	}
	

}
