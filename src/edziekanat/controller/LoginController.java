package edziekanat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.bean.LoginBean;
import edziekanat.databasemodel.dao.UserDAO;
import edziekanat.databasemodel.dto.AdministratorDTO;
import edziekanat.databasemodel.dto.LecturerDTO;
import edziekanat.databasemodel.dto.StudentDTO;
import edziekanat.databasemodel.dto.UserDTO;

/**
 * Servlet maintaing logging in to application.
 */
@WebServlet("/loginaction")
public class LoginController extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	request.getSession().setMaxInactiveInterval(3600);
	try
	{
	    request.login((String) request.getParameter("username"), (String) request.getParameter("password"));
	    request.getSession().setAttribute("loginBean", getLoginBean(request));
	}
	catch (ServletException e)
	{
	    request.getSession().setAttribute("loginError", "true");
	}
	response.sendRedirect((String) request.getSession().getAttribute("backURL"));
    }

    private LoginBean getLoginBean(HttpServletRequest request)
    {
	UserDTO user = new UserDAO().getEntity(request.getUserPrincipal().getName());
	switch (user.getUserRole())
	{
	case "admin":
	    AdministratorDTO admin = user.getAdministrator();
	    return new LoginBean(user.getLogin(), user.geteMail(), user.isActive(), user.getUserRole(),
		    admin.getId(), admin.getName(), admin.getSurname(), admin.getAddress(),
		    admin.getAcademicDegree());
	case "student":
	    StudentDTO student = user.getStudent();
	    return new LoginBean(user.getLogin(), user.geteMail(), user.isActive(), user.getUserRole(),
		    student.getId(), student.getName(), student.getSurname(), student.getAddress(),
		    student.getAcademicDegree());
	case "lecturer":
	    LecturerDTO lecturer = user.getLecturer();
	    return new LoginBean(user.getLogin(), user.geteMail(), user.isActive(), user.getUserRole(),
		    lecturer.getId(), lecturer.getName(), lecturer.getSurname(), lecturer.getAddress(),
		    lecturer.getAcademicDegree());
	default:
	    return null;
	}
    }
}
