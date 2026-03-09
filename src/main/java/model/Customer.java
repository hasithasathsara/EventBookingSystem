package model;

//User Management
//Inheritance
public class Customer extends User {
    // Child Class
    private String membershipType;

    // Default Constructor
    public Customer() {
        super(); // call the Parent class constructor
    }

    //Parameterized Constructor
    public Customer(int id, String name, String email, String password, String role, String membershipType) {
        // super keyword - get the data that in the parent class
        super(id, name, email, password, role);
        this.membershipType = membershipType;
    }

    // Getter and Setter for Child class variable
    public String getMembershipType() { return membershipType; }
    public void setMembershipType(String membershipType) { this.membershipType = membershipType; }
}