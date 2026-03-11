package model;

/**
 * Customer class inherits from the User class.
 * It reuses common fields like name, email, and password from the parent.
 * This demonstrates the OOP concept of Inheritance.
 */
public class Customer extends User {

    // Default constructor
    public Customer() {
        // super() keyword calls the constructor of the parent class (User)
        super();
    }

    /* Note: We don't need to define name, email, or phone here
       because they are already available in the User class.
    */
}