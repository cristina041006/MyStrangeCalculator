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
	
	/**
	 * Metodo donde pasamos el nombre del operador (add o subtract) y nos devuelve su simbolo correspondiente
	 * @param operator
	 * @return simbolo
	 * @throws Exception
	 */
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
	
	/**
	 * Metodo que te añade a la lista de parametros un numero
	 * @param num1
	 */
	public static void addNumber (String num1) {
		numberList.add(num1);
	}
	
	/**
	 * Metodo que te añade a la lista de parametros el operador que recibe que llama al metodo getOperator() para saber su simbolo
	 * @param operator
	 * @throws Exception
	 */
	public static void addOperator (String operator) throws Exception {
		numberList.add(Calculator.getOperator(operator));
	}
	/**
	 * Metodo para borrar la lista de parametros que solo se puede utilizar dentro de la misma clase
	 */
	private static void deleteList() {
		numberList.clear();
	}
	
	/**
	 * Metodo que lista en un StringBuilder los parametros contenidos en la lista. A continuacion borra dicha lista para reiniciarla
	 * @return parametros
	 */
	public static String showNumber() {
	
		for (int i=0; i<numberList.size(); i++) {
			numbers.append(numberList.get(i));
		}
		Calculator.deleteList();
		return numbers.toString();
	}
	
	/**
	 * Metodo para borrar la cadena que se muestra
	 */
	public static void deleteString() {
		numbers.setLength(0);
	}
	
	/**
	 * Metodo para sumar o restar numeros secuencialmente dependiendo del operador
	 * @param result
	 * @param operador
	 * @param num1
	 * @return resultado
	 */
	public static double getResult (double result, String operador, String num1) {			
		
		if (operador.charAt(0)=='+') {
			result += Double.parseDouble(num1);
		}else if(operador.charAt(0)=='-') {
			result -= Double.parseDouble(num1);
		}
		
		return result;
	}
	
	/**
	 * Metodo que le pasamos desde jsp un numero inicial y que recorre la lista donde yo tengo los parametros de numeros y operadores y se los paso al metodo getResult() para que me haga las operaciones
	 * una a una. Si en la lista hay dos operadores seguidos, hay dos numeros seguidos, o hay una letra u otro simbolo que no contemple a los operadores
	 * capturamos la excepcion y la cadena mostrara la secuencia igualada a "error"
	 * @param result
	 * @return result
	 */
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
			Calculator.showNumber();
			numbers.append(" = error");
			
		}
		
		return result;
		
	}
	

}
