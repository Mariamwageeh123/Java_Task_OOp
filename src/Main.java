//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.



public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.
//        System.out.printf("Hello and welcome!");
        Hotel H= new Hotel();
        H.Book(1,"roma","023991290","cairo","909-09198899","Stella");
        H.Book(2,"ali","028391290","alex","909-0344899","Roma");
        H.Book(3,"sara","023993311","tanta","9091123455","city");
        H.Cancel(1);
        Flight F= new Flight();
        F.Book(1,"roma","023991290","cairo","909-09198899","Stella");
        F.Book(2,"ali","028391290","alex","909-0344899","Roma");
        F.Book(3,"sara","023993311","tanta","9091123455","city");
        F.Cancel(1);

    }
}