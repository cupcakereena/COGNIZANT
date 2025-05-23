import java.util.ArrayList;
import java.util.Scanner;

public class StudentNamesList {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<String> studentNames = new ArrayList<>();

        System.out.println("Enter student names (type 'done' to finish):");

        while (true) {
            System.out.print("Enter name: ");
            String name = scanner.nextLine();

            // Exit condition
            if (name.equalsIgnoreCase("done")) {
                break;
            }

            // Add name to the list
            studentNames.add(name);
        }

        // Display all names entered
        System.out.println("\nList of student names:");
        for (String studentName : studentNames) {
            System.out.println(studentName);
        }

        scanner.close();
    }
}
