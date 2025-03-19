package Controller;

import dao.CategoriesDAO;
import dao.UserDAO;
import dto.CategoriesDTO;
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

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    // Khai báo CategoriesDAO
    public CategoriesDAO categoriesDAO = new CategoriesDAO();
    private static final String LOGIN_PAGE = "login.jsp";
    
    private UserDTO getUser(String strUserID){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyID(strUserID);
        return user;
    }
    
    private CategoriesDTO getCategory(String categoryId){
        CategoriesDAO catdao = new CategoriesDAO();
        CategoriesDTO cat = catdao.readbyID(categoryId);
        return cat;
    }
    
    private boolean isValidLogin(String txtUserID, String txtPassword){
        UserDTO user = getUser(txtUserID);
        return user != null && user.getPassword().equals(txtPassword);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if(action == null){
                url = LOGIN_PAGE;
            }
            
            if(action != null && action.equals("login")){
                String txtUsername = request.getParameter("txtUsername");
                String txtPassword = request.getParameter("txtPassword");
                if(isValidLogin(txtUsername, txtPassword)) {
                    url = "search.jsp";
                    UserDTO user = getUser(txtUsername);
                    request.getSession().setAttribute("user", user);
                    
                    String searchTerm = request.getParameter("searchTerm");
                    if (searchTerm == null) {
                        searchTerm = "";
                    }
                    request.setAttribute("searchTerm", searchTerm);
                    
                    List<CategoriesDTO> categories = categoriesDAO.search(searchTerm);
                    request.setAttribute("categories", categories);
                } else {
                    request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
                }
            } else if(action != null && action.equals("logout")){
               url = "MainController"; //trở lại đây để in dòng thông báo
                //Cái này để ghi thông báo
                 PrintWriter out = response.getWriter();
                 //Khai lệnh hủy phiên làm việc
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
            } else if(action.equals("search")){
                url = "search.jsp";
                
                String searchTerm = request.getParameter("searchTerm");
                if (searchTerm == null) {
                    searchTerm = "";
                }
                request.setAttribute("searchTerm", searchTerm);

                List<CategoriesDTO> categories = categoriesDAO.search(searchTerm);
                request.setAttribute("categories", categories);
            } else if(action.equals("add")){
                try {
                    boolean checkError = false;
                    String txtCategory_id = request.getParameter("txtCategory_id");
                    String txtCategory_name = request.getParameter("txtCategory_name");
                    String txtDescription = request.getParameter("txtDescription");
                    
                    request.setAttribute("txtCategory_id", txtCategory_id);
                    request.setAttribute("txtCategory_name", txtCategory_name);
                    request.setAttribute("txtDescription", txtDescription);

                    String categoryId = "";
                    
                    if (txtCategory_id == null || txtCategory_id.trim().isEmpty()) {
                        checkError = true;
                        request.setAttribute("CategoryID_error", "ID must not be empty.");
                    } else {
                        try {
                            categoryId = txtCategory_id;
                            CategoriesDTO existingCategory = getCategory(categoryId);
                            if (existingCategory != null) {
                                checkError = true;
                                request.setAttribute("CategoryID_error", "ID already exists.");
                            }
                        } catch (Exception e) {
                            checkError = true;
                            request.setAttribute("CategoryID_error", "Invalid ID format.");
                        }
                    }
                    
                    if(txtCategory_name == null || txtCategory_name.trim().isEmpty()){
                        checkError = true;
                        request.setAttribute("Category_name_error", "Category name cannot be empty.");
                    }
                    if(txtDescription == null || txtDescription.trim().isEmpty()){
                        checkError = true;
                        request.setAttribute("Description_error", "Description cannot be empty.");
                    }

                    CategoriesDTO category = new CategoriesDTO(categoryId, txtCategory_name, txtDescription);
                    

                    if(!checkError){
                        categoriesDAO.create(category);
                        url = "search.jsp";
                        String searchTerm = request.getParameter("searchTerm");
                        if (searchTerm == null) {
                            searchTerm = "";
                        }
                        request.setAttribute("searchTerm", searchTerm);
                        
                        List<CategoriesDTO> categories = categoriesDAO.search(searchTerm);
                        request.setAttribute("categories", categories);
                    } else {
                        request.setAttribute("category", category);
                        url = "category_form.jsp";
                    }
                } catch (Exception e) {
                    log(e.toString());
                }
            } else if(action.equals("update")){
                url = "update.jsp";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            if(!url.equals("MainController")){
                rd.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
