
import java.util.*;
import java.util.stream.Collectors;

public class PersonRecordExample {
    
    record Person(String name, int age) {}

    public static void main(String[] args) {
        List<Person> people = List.of(
            new Person("Alice", 22),
            new Person("Bob", 30),
            new Person("Charlie", 17),
            new Person("Diana", 25)
        );

       
        System.out.println("All Persons:");
        people.forEach(System.out::println);

       
        List<Person> adults = people.stream()
                                    .filter(p -> p.age() >= 21)
                                    .collect(Collectors.toList());

        System.out.println("\nAdults (age >= 21):");
        adults.forEach(System.out::println);
    }
}
