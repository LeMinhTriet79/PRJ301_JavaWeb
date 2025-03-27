
package utils;

import dao.SnackDAO;
import dao.UserDAO;
import dto.SnackDTO;
import dto.UserDTO;
import java.util.List;
import javax.servlet.http.HttpSession;

public class AuthUtils {
    public static final String ADMIN_ROLE = "admin";
    public static final String USER_ROLE = "user";
    
    
    public static UserDTO getUser(String username) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyUsername(username);
        return user;
    }

    public static boolean isValidLogin(String username, String password) {
        UserDTO user = getUser(username);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user")!=null;
    }
    
    public static boolean isAdmin(HttpSession session){
        if(!isLoggedIn(session)){
            return false;
        }
        UserDTO user = (UserDTO)session.getAttribute("user");
        return user.getRole().trim().equals(ADMIN_ROLE);
    }
    
    public static boolean isAdminCheck(String test){
        
        UserDTO user = getUser(test);
        return user.getRole().trim().equals(ADMIN_ROLE);
    }
    
    
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        UserDTO ut = ud.readbyUsername("admin");
        System.out.println(ut);
        boolean check = isAdminCheck(ut.getUsername());
        System.out.println(check);
        SnackDAO sn = new SnackDAO();
        
                List<SnackDTO> foundList = sn.search("");
                for (SnackDTO snackDTO : foundList) {
                    System.out.println(snackDTO);
        }
    }
}
