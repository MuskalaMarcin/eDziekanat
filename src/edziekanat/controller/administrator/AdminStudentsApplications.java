package edziekanat.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.ApplicationDAO;
import edziekanat.databasemodel.dao.StudentDAO;
import edziekanat.databasemodel.dto.ApplicationDTO;

/**
 * Servlet implementation class AdminStudentsApplications
 */
@WebServlet("/adminstudentapplications")
public class AdminStudentsApplications extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	List<ApplicationDTO> appsStudent = new ApplicationDAO().getApplications(Integer.parseInt(request.getParameter("studentId")));

	appsStudent.addAll(new ApplicationDAO().getWaitingApplications(Integer.parseInt(request.getParameter("studentId"))));
	request.setAttribute("appsStudent", appsStudent);
	request.setAttribute("student", new StudentDAO().getEntity(Integer.parseInt(request.getParameter("studentId"))));
	request.getRequestDispatcher("administrator/studentsapplications.jsp").forward(request, response);
    }

}
