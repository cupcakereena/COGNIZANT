public class TypeCastingExample {
    public static void main(String[] args) {
        double myDouble = 9.78;
        int myInt = (int) myDouble;
        System.out.println("Double value: " + myDouble);
        System.out.println("After casting to int: " + myInt);
        int myInt2 = 51;
        double myDouble2 = (double) myInt2;
        System.out.println("Int value: " + myInt2);
        System.out.println("After casting to double: " + myDouble2);
    }
}
