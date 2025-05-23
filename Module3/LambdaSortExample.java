
import java.util.*;
public class LambdaSortExample {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>(Arrays.asList("Zara", "Alex", "John", "Maria", "Ben"));

     
        Collections.sort(names, (s1, s2) -> s1.compareTo(s2));

        System.out.println("Sorted List:");
        for (String name : names) {
            System.out.println(name);
        }
    }
}
