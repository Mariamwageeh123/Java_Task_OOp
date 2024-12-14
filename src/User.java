
import java.util.ArrayList;
import java.util.List;
public abstract class User {
    List<Object[]> data = new ArrayList<>();
    abstract void Book(int id, String name, String phone, String country, String card,String h_name);

    abstract void Cancel(int id);

    abstract void Update();

}
