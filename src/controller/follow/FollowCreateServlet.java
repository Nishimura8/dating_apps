package controller.follow;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.Room;
import models.User;
import utils.DBUtil;

/**vlet implementation class ReportsCreateServlet
 */
@WebServlet("/follow/create")
public class FollowCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String _token = (String)request.getParameter("_token");
        System.out.println("id：" + request.getSession().getId());
        System.out.println("_token：" + _token);
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Follow f = new Follow();
            Room r = new Room();
            User u = em.find(User.class, Integer.parseInt(request.getParameter("follower_id")));

            f.setFollow((User)request.getSession().getAttribute("login_user"));
            f.setFollower(u);
            f.setRoom(r);
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            r.setCreated_at(currentTime);

                em.getTransaction().begin();
                em.persist(r);            
                em.persist(f);
                em.getTransaction().commit();
                em.close();
                response.sendRedirect(request.getContextPath() + "/users/index");
            }
        }
    }

