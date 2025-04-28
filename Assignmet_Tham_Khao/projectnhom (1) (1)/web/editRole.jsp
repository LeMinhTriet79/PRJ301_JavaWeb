<%@ page import="java.sql.*" %>
<%@ page import="DButils.utils" %>
<%
    String userId = request.getParameter("userID");
    String action = request.getParameter("action");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = utils.getConnection();

        if ("grantAdmin".equals(action)) {
            String query = "UPDATE Users SET RoleName = 'Admin' WHERE UserID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(userId));
            pstmt.executeUpdate();
        } else if ("delete".equals(action)) {
            String query = "DELETE FROM Users WHERE UserID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(userId));
            pstmt.executeUpdate();
        }

        response.sendRedirect("maUser.jsp");
    } catch (Exception e) {
        out.println("L?i: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
