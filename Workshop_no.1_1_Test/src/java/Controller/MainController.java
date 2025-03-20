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
    
     private ProjectDTO getProject(int intProject_id){
     ProjectDAO prodao = new ProjectDAO();
     //Đối tượng được khởi tạo mang cái dữ liệu vừa lấy ra từ DB
     ProjectDTO pro = prodao.readbyIntProject_ID(intProject_id);
     return pro;
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
        List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
        request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
                 
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
                 //Khai lịnh hủy phiên làm việc
                 request.getSession().invalidate(); //Giống lịnh mở nhưng buộc phải có đuôi .invalidate()
                 out.println("<html>");
    out.println("<head>");
    out.println("<meta charset=\"UTF-8\">");
    out.println("<title>Login</title>");
    out.println("<style>");
    out.println("body { font-family: Tahoma, sans-serif; background-color: #dfdfdf; display: flex; justify-content: center; align-items: center; height: 100vh; }");
    out.println(".window { width: 300px; background: silver; border: 2px solid black; padding: 10px; box-shadow: 5px 5px 0px gray; }");
    out.println(".title-bar { background: navy; color: white; padding: 5px; font-weight: bold; font-size: 21px; width: 100%; margin: -10px; padding: 10px; }");
    out.println(".content { padding: 2px; margin: 10px 0px 0px -2px; font-size: 15px; font-weight: bold; }");
    out.println("</style>");
    out.println("</head>");
    out.println("<body>");
    out.println("<div class=\"window\">");
    out.println("<div class=\"title-bar\">Logout</div>");
    out.println("<div class=\"content\">");
    out.println("<p>You have logged out successfully.</p>");
    out.println("<p><a href=\"login.jsp\">Back to login page</a></p>");  // Liên kết quay lại trang đăng nhập
    out.println("</div>");
    out.println("</div>");
    out.println("</body>");
    out.println("</html>");
    
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
                List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
                request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
   //=============================================================================================      
//Thêm dự dán mới   - tạo trang project_form
            } else if(action.equals("add")){ // Cần phải tạp ra project_form.jsp để thực hiện việc thêm dự án
                //Mở try - catch để bắt lỗi nếu nhập không đúng kiểu dữ liệu
                try {
                    //Tạo một biến boolean để xét đúng sai phải trái
                    boolean checkError = false;//mặc định là false
                    //Lấy dữ liệu từ  bên trang project_form.jsp
                    String txtProject_id = request.getParameter("txtProject_id");
                    String txtProject_name = request.getParameter("txtProject_name");
                    String txtDescription = request.getParameter("txtDescription");
                    String txtStatus = request.getParameter("txtStatus");
                    String txtEstimated_launch = request.getParameter("txtEstimated_launch");
                    
                    //Lưu những thứ vừa nhập vào để đem nó qua trang kia, mục đích là giữ lại nó trên thanh nếu người dùng nhập tào lao.
                    //setAttribute
                    request.setAttribute("txtProject_id", txtProject_id);
                    request.setAttribute("txtProject_name", txtProject_name);
                    request.setAttribute("txtDescription", txtDescription);
                    request.setAttribute("txtStatus", txtStatus);
                    request.setAttribute("txtEstimated_launch", txtEstimated_launch);
                    //một biến để chuyển mã id dự án
                    int intProject_id = 0;
                    
                    //PHẦN BẮT LỖI
                    //1. ID project
                   //bỏ trống hoặc nhập sai kiểu dữ liệu
                   //Kiểm tra Mã số Dự Án
                    if (txtProject_id == null || txtProject_id.trim().isEmpty()) {
                        checkError = true; //có lỗi
                        request.setAttribute("ProjecID_error", " must be an integer data type");
                    } else {
                        try {
                            intProject_id = Integer.parseInt(txtProject_id);
                            if (intProject_id == 0) {
                                checkError = true;
                                request.setAttribute("ProjecID_error", " must be greater than 0");

                            }
                            // Kiểm tra tránh trùng lập ID của project, coi coi nguyên cái dữ liệu của project có trong db ko
                            ProjectDTO existingProject = getProject(intProject_id);
                            if (existingProject != null) {
                                checkError = true;
                                request.setAttribute("ProjecID_error", " already exists.");
                            }
                       } catch (NumberFormatException e) {
                           checkError = true;
                           request.setAttribute("ProjecID_error", " must be an integer data type");
                       }
                      
                   } 
                   
                   if(txtProject_name == null || txtProject_name.trim().isEmpty()){
                       checkError = true;
                      request.setAttribute("Project_name_error", "can not empty");
                   }
                   if(txtDescription == null || txtDescription.trim().isEmpty()){
                       checkError = true;
                      request.setAttribute("Description_error", "can not empty");
                   }
                   if(txtStatus == null || txtStatus.trim().isEmpty()){
                       checkError = true;
                      request.setAttribute("Status_error", "can not empty");
                   }
                   if(txtEstimated_launch == null || txtEstimated_launch.trim().isEmpty()){
                       checkError = true;
                      request.setAttribute("Estimated_launch_error", "can not empty");
                   }
                   
                   //Khởi tạo đối tượng từ ProjectDTO, rồi thêm nó vô cơ sở dữ liệu
                   //Thông qua dữ liệu được truyền từ bên trang project_form.jsp
                   ProjectDTO project = new ProjectDTO(intProject_id, txtProject_name, txtDescription, txtStatus, txtEstimated_launch);
                   //Sau khi khởi tạo được đối tượng xong thì tới phần check lỗi
                   //Nếu không bị lỗi thù tạo cái project vào DB rồi trở lại trang searh.jsp để hiển thị ra màn hình
                   if(!checkError){
                       projectDAO.create(project);
                       //trở lại trang search để hiện kết quả
                       url = "search.jsp";
       //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
            searchTerm = "";
        } // sau khi if xong thì gán giá trị để truyền bên trang search.jsp luôn, phải để như vậy không thôi nó không giữ được giá trị
         request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

        //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
        List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
        request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
                     
                      
                   } else { // ngược lại thì vẫn ở lại trang Project_form
                       request.setAttribute("project", project);//cái này để đem cái đối tượng vừa đúc khuôn quăng qua project_form.jsp
                       url = "project_form.jsp";
                       
                   }
                   
                } catch (Exception e) {
                    log(e.toString());
                }
            } else if (action != null && action.equals("updateStatus")) {
    String projectIdStr = request.getParameter("projectId");
    String newStatus = request.getParameter("status");

    if (projectIdStr != null && newStatus != null) {
        try {
            int projectId = Integer.parseInt(projectIdStr);
            ProjectDAO projectDAO = new ProjectDAO();
            boolean updated = projectDAO.updateStatus(projectId, newStatus);

            if (updated) {
                
                url = "search.jsp"; 
           //request.setAttribute("message", "Sucessful.");

                   //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
                String searchTerm = request.getParameter("searchTerm");
                if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
                    searchTerm = "";
                }
                request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

                //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
                List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
                request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
  
            } else {
                // Set an error message
               // request.setAttribute("message", "Failed to update project status.");
                url = "search.jsp";
                   //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
                String searchTerm = request.getParameter("searchTerm");
                if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
                    searchTerm = "";
                }
                request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

                //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
                List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
                request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
  
            }
        } catch (NumberFormatException e) {
         //  request.setAttribute("message", "Invalid project ID.");
            url = "search.jsp";
               //Lấy dữ liệu vừa nhập vào trên thanh tìm kiếm 
                String searchTerm = request.getParameter("searchTerm");
                if (searchTerm == null) {//Nếu không có gì trong thanh tìm kiếm thì trả về không gì hết(null)
                    searchTerm = "";
                }
                request.setAttribute("searchTerm", searchTerm); //Cái này tương tự vậy, mục đích của nó là để giữ lại cái dữ liệu vừa nhập trên thanh tìm kiếm, mà không bị mất đi

                //lấy dữ liệu của project, thông qua truyền giá trị từ biến searchTerm lấy từ thanh tìm kiếm bên trang search.jsp 
                List<ProjectDTO> projects = projectDAO.searchbyName(searchTerm);//Khởi tạo một danh sách để nhận các đối tượng được truy vấn từ DB
                request.setAttribute("projects", projects); //Tạo một biến để lưu project, và qua bên trang Search để GET lấy ra kết quá - truyền giá trị/liên lạc thông tin
  
        }
    }
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
