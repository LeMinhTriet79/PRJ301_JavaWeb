package pe.account;

public class AccountDTO {
    //your code here
    private String account;
    private String pass;
    private String roleDB;
    private String fullName;
    private int gender;
    private String birthDay;
    private String phone;
    private String addr;

    public AccountDTO(String account, String pass, String roleDB, String fullName, int gender, String birthDay, String phone, String addr) {
        this.account = account;
        this.pass = pass;
        this.roleDB = roleDB;
        this.fullName = fullName;
        this.gender = gender;
        this.birthDay = birthDay;
        this.phone = phone;
        this.addr = addr;
    }

    public AccountDTO() {
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRoleDB() {
        return roleDB;
    }

    public void setRoleDB(String roleDB) {
        this.roleDB = roleDB;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "account=" + account + ", pass=" + pass + ", roleDB=" + roleDB + ", fullName=" + fullName + ", gender=" + gender + ", birthDay=" + birthDay + ", phone=" + phone + ", addr=" + addr + '}';
    }
    
    
    
    
}
