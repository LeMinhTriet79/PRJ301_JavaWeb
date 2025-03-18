/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Triet
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    //Khai báo ProjectDAO
    public ProjectDAO projectDAO = new ProjectDAO();
    //Một trang login mặc định
    private static final String LOGIN_PAGE = "login.jsp";
//=================================================================
//Đối chiếu, xác nhận tài khoản
    
    //Lấy ra thông tin từ DB, thông qua truyền cái thuộc tính UserID 
    //Nói thẳng là tìm cái user thông qua cái UserID, cái UserID là cái thuộc tính truyền vào
    //Mà cái strUserID là cái thằng Username nhâp bên cái login á 
    private UserDTO getUser(String strUserID){
     UserDAO udao = new UserDAO();
     //Đối tượng được khởi tạo mang cái dữ liệu vừa lấy ra từ DB
     UserDTO user = udao.readbyID(strUserID);
     return user;
    }
    //Hàm xác nhận tính đúng sai phải trái ba xàm ba láp
    private boolean isValidLogin(String txtUserID, String txtPassword){
       //getUser(txtUserID) - khứa này chính là cái nguyên thằng user
       //Nghĩa là cái hàm này nó trả về đối tượng user
       //Khởi tạo lại cái đối tượng từ lớp UserDTO để hứng cái user từ thằng hàm trên
       UserDTO user = getUser(txtUserID);//bỏ cái txtUserID vào hàm này nè
       //Nếu user nó không trống và nó bằng giống cái Passwork mà mình nhập vào ở Login thì trả về true(đúng)
       if(user != null && user.getPassword().equals(txtPassword)){ //txtPassword nằm trong if
           return true;
       }
        return false;       
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            //Khởi tạo các action
            String action = request.getParameter("action");
            //Nếu action không có gì hết thì giữ nguyên ở trang đăng nhập
            if(action == null){
                url = LOGIN_PAGE;
            }
            //=====================================================
            //Mở đầu phần đăng nhâp
            //nếu action là giá trị đăng nhập thì cho phép mấy nhận cái thứ nhập vào
            if(action != null && action.equals("login")){
                String txtUsername = request.getParameter("txtUsername");
                String txtPassword = request.getParameter("txtPassword");
                //Xong rồi thì kiểm tra những thứ nó nhập vào có đúng hay chưa?
                //coi tên đăng nhập và pass của nó
                //Nếu đúng thì đăng nhập thành công, nếu sai thì chặn cửa khỏi cho vô
             if(isValidLogin(txtUsername, txtPassword))  {
                 //Nếu nó đúng thì thay đổi cái url nó thành search, để cho phép vô trang search
                 url = "search.jsp";
                 //Sau khi vào trang search thì cần lấy ra cái tên của User từ cơ sở dữ liệu
                 //để nó CHÀO HỎI MỘT TIẾNG
                 //Phần này sẽ in ra bên trang Search
                 UserDTO user = getUser(txtUsername);
                 
                 //*****MỞ PHIÊN LÀM VIỆC*********
                 request.getSession().setAttribute("user", user);//cái thằng trong ngoặc kép là cái tên, nói ra là cái biến giống kiểu getParameter
                  url = "search.jsp";
                 /*
                 cách làm cũ
                 
                 
                 
                 */
                 
        //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
            searchTerm = "";
        } // sau khi if xong thì gán giá trị để truyền bên trang search.jsp luôn, phải để như vậy không thôi nó không giữ được giá trị
         request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

        //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
        List<ProjectDTO> project = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
        request.setAttribute("project", project); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
                 
             }else{
                 //Nếu đăng nhập sai thì in ra cái dòng thông báo trang login
                 request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
             }
      //=======================================================================================
     //Nút Đăng xuất, sau khi đăng nhập thành công
            } else if(action != null && action.equals("logout")){
                url = "MainController"; //trở lại đây để in dòng thông báo
                //Cái này để ghi thông báo
                 PrintWriter out = response.getWriter();
                 //Khai lệnh hủy phiên làm việc
                 request.getSession().invalidate(); //Giống lịnh mở nhưng buộc phải có đuôi .invalidate()
                 out.println("<b>Bạn đã đăng xuất</b><br/>");
                 out.println("<a href='MainController'>Back to login page!</b>");
                return;

            }else if(action.equals("search")){ //Sau khi bấm nút của form bên search.jsp thì action nó sẽ là search, nó sẽ ở lại trang, mà không bị thoát ra
                url = "search.jsp";
                
                 //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
            searchTerm = "";
        }
                request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

        //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
        List<ProjectDTO> project = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
        request.setAttribute("project", project); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
                 
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }finally{
            //Dù đúng hay sai cũng vẫn thực hiện chuyển trang
            RequestDispatcher rd = request.getRequestDispatcher(url); //chuyền cái url dô đây
            //Nếu thằng url không giống MainController thì chuyển trang
            if(!url.equals("MainController")){
                rd.forward(request, response);//thực hiện chuyển trang
            }
        }
        
            
            
            
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
