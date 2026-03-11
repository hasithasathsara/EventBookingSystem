package model;

/**
 * AdminUser class demonstrates Inheritance by extending the User class.
 * It includes specific permissions for administrative tasks.
 */
public class AdminUser extends User {

    // Encapsulated fields for admin-specific permissions
    private boolean canManageEvents;
    private boolean canApproveBookings;
    private boolean canAddAdmins;

    public AdminUser() {
        super(); // Calls the constructor of the parent User class
    }

    // --- Getters and Setters for Encapsulation ---

    public boolean isCanManageEvents() { return canManageEvents; }
    public void setCanManageEvents(boolean canManageEvents) { this.canManageEvents = canManageEvents; }

    public boolean isCanApproveBookings() { return canApproveBookings; }
    public void setCanApproveBookings(boolean canApproveBookings) { this.canApproveBookings = canApproveBookings; }

    public boolean isCanAddAdmins() { return canAddAdmins; }
    public void setCanAddAdmins(boolean canAddAdmins) { this.canAddAdmins = canAddAdmins; }
}
