public class WSClient {

    public static void main(String[] args) {
        try {
            System.out.println("Sum: " + add(5, 10));
        }
        catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    private static int add(int i, int j) {
        calculator.CalculatorWS_Service service = new calculator.CalculatorWS_Service();
        calculator.CalculatorWS port = service.getCalculatorWSPort();
        return port.add(i, j);
    }
    
}