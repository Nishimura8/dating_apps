package controller.room;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class EmployeesIndexServlet
 */
@WebServlet("/rooms/index")
public class RoomIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        User login_user = (User)request.getSession().getAttribute("login_user");
        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e) { }
        List<Follow> follows = em.createNamedQuery("checkMyRoom", Follow.class)
                                     .setFirstResult(15 * (page - 1))
                                     .setMaxResults(15)
                                     .setParameter("follower", login_user)
                                     .setParameter("follow", login_user)
                                     .getResultList();

        long rooms_count = (long)em.createNamedQuery("getRoomsCount", Long.class)
                                       .getSingleResult();

        em.close();

        request.setAttribute("follows", follows);
        request.setAttribute("rooms_count", rooms_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/rooms/index.jsp");
        rd.forward(request, response);
    }
}