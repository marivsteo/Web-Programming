package servlets;

import Database.Manager;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
    @Override
    protected synchronized void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        checkNoOfPlayers();
        User user=(User) req.getSession().getAttribute("user");
        deleteLoggedUser(user.getUsername());
        resp.sendRedirect("/index.jsp");

    }
    private void checkNoOfPlayers()
    {
        String sql="SELECT * FROM loggedplayers";
        try {
            PreparedStatement stmt = Manager.getConnection().prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                int PlayersLogged = result.getInt("nrplayers");
                int decrement = PlayersLogged - 1;
                if(decrement<=0) {
                    DestroyBoard();
                    decrement = 0;
                }
                sql = "UPDATE loggedplayers SET nrplayers=" + decrement + ";";
                stmt = Manager.getConnection().prepareStatement(sql);
                stmt.execute();
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    private void DestroyBoard() {
        String update = "UPDATE board SET state='---------', player=0;";
        try {
            PreparedStatement stmt = Manager.getConnection().prepareStatement(update);
            stmt.execute();


        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
    }


    public synchronized void deleteLoggedUser(String username) {
        String sql = "SELECT * FROM users  WHERE username='" + username + "';";
        int id = -1;
        try {
            PreparedStatement stmt = Manager.getConnection().prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                id = result.getInt("uid");

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (id != -1) {
            sql = "DELETE FROM loggedin where uid='" + id + "';";
            try {
                PreparedStatement stmt = Manager.getConnection().prepareStatement(sql);
                stmt.execute();

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}