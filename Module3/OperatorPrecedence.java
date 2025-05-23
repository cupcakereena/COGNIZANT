public class OperatorPrecedence {
    public static void main(String[] args) {
        int result1 = 11 + 5 * 2;      
        int result2 = (10 + 5) * 2;    
        int result3 = 100 / 5 + 3 * 2; 
        System.out.println("Result 1 (11 + 5 * 2): " + result1);
        System.out.println("Result 2 ((10 + 5) * 2): " + result2);
        System.out.println("Result 3 (100 / 5 + 3 * 2): " + result3);
    }
}
