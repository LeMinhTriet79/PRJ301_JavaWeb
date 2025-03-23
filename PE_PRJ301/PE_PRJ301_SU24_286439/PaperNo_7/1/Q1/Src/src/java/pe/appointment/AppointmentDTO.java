package pe.appointment;

public class AppointmentDTO {
    //your code here
    private int idApp;
    private String account;
    private String partnerPhone;
    private String partnerName;
    private String timeToMeet;
    private String place;
    private int expense;
    private String note;

    public AppointmentDTO() {
    }

    public AppointmentDTO( String account, String partnerPhone, String partnerName, String timeToMeet, String place, int expense, String note) {
        
        this.account = account;
        this.partnerPhone = partnerPhone;
        this.partnerName = partnerName;
        this.timeToMeet = timeToMeet;
        this.place = place;
        this.expense = expense;
        this.note = note;
    }

   public AppointmentDTO(int idApp, String account, String partnerPhone, String partnerName, String timeToMeet, String place, int expense, String note) {
        this.idApp = idApp;
        this.account = account;
        this.partnerPhone = partnerPhone;
        this.partnerName = partnerName;
        this.timeToMeet = timeToMeet;
        this.place = place;
        this.expense = expense;
        this.note = note;
    }

    public int getIdApp() {
        return idApp;
    }

    public void setIdApp(int idApp) {
        this.idApp = idApp;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPartnerPhone() {
        return partnerPhone;
    }

    public void setPartnerPhone(String partnerPhone) {
        this.partnerPhone = partnerPhone;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getTimeToMeet() {
        return timeToMeet;
    }

    public void setTimeToMeet(String timeToMeet) {
        this.timeToMeet = timeToMeet;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getExpense() {
        return expense;
    }

    public void setExpense(int expense) {
        this.expense = expense;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "AppointmentDTO{" + "idApp=" + idApp + ", account=" + account + ", partnerPhone=" + partnerPhone + ", partnerName=" + partnerName + ", timeToMeet=" + timeToMeet + ", place=" + place + ", expense=" + expense + ", note=" + note + '}';
    }
    
    
    
    
}
