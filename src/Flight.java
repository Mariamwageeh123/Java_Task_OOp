public class Flight extends User {

    @Override
    void Book(int id, String name, String phone, String country, String card,String f_name) {
        // Adding the booking data into the list (data field inherited from User)
        data.add(new Object[]{id, name, phone, country, card,f_name});
        System.out.println("Booking successful: " + name + "  " + country+" "+ id+" "+card+" "+phone +" "+ f_name);
    }
    @Override
    void Cancel(int id){

        if (id<0){
            System.out.println("no id in here");
        }
        else if(id==0){
            data.remove(id);
        }
        else{
            data.remove(id-1);
        }
        System.out.println("Canceling successful: ");
        for (Object[] booking : data) {
            System.out.println("ID: " + booking[0] + ", Name: " + booking[1] + ", Phone: " + booking[2] + ", Country: " + booking[3] + ", Card: " + booking[4]+ ",Flight Name: " + booking[5] );
        }
    }
    @Override
    void Update(){

    }
}
