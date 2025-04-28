package DTO;

public class UserDTO {
    private int userID;
    private String fullName;
    private String phoneNumber;
    private String username;
    private String passwordHash;
    private String roleName;

    public UserDTO() {
    }

    public UserDTO(int userID, String fullName, String phoneNumber, String username, String passwordHash, String roleName) {
        this.userID = userID;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.passwordHash = passwordHash;
        this.roleName = roleName;
    }
    public UserDTO(String fullName, String phoneNumber, String username, String passwordHash, String roleName) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.passwordHash = passwordHash;
        this.roleName = roleName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
