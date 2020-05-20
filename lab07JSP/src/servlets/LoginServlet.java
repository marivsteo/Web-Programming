package servlets;

import Login.LoginManager;
import Controller.UserController;
import Database.Manager;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected synchronized void  doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String authentication = LoginManager.authenticate(username,password);

        if(authentication.equals("success")){
            int playersLogged=checkNoOfPlayers();

            User user= login(req.getSession(), username, playersLogged);
            if(user==null) {
                resp.sendRedirect("/error.jsp");
            }
            resp.sendRedirect("/success.jsp");
        }
        else {
            resp.sendRedirect("/index.jsp");
        }
    }
    private int checkNoOfPlayers()
    {
        String sql="SELECT * FROM loggedplayers";
        try {
            PreparedStatement stmt = Manager.getConnection().prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            int PlayersLogged=-1;
            if (result.next()) {
                PlayersLogged = result.getInt("nrplayers");
                int increment = PlayersLogged + 1;
                sql = "UPDATE loggedplayers SET nrplayers=" + increment + ";";
                stmt = Manager.getConnection().prepareStatement(sql);
                stmt.execute();
            }
            return PlayersLogged;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }

    }

    private User login(HttpSession session, String username, int PlayersLogged) {

        User user= UserController.createUserWithLoggedPlayers(username,PlayersLogged);
        session.setAttribute("user",user);
        return user;

    }
}