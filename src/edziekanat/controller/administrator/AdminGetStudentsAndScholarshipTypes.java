package edziekanat.controller.administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.ScholarshipTypeDAO;
import edziekanat.databasemodel.dao.StudentDAO;

/**
 * Servlet implementation class AdminGetStudentsAndScholarshipTypes
 */
@WebServlet("/admingetstudentsandscholarshiptypes")
public class AdminGetStudentsAndScholarshipTypes extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGetStudentsAndScholarshipTypes()
    {
	super();
    }

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
	request.setAttribute("students", new StudentDAO().getAllEntities());
	request.setAttribute("scholarships", new ScholarshipTypeDAO().getAllEntities());
	request.getRequestDispatcher("admin/newscholarship").forward(request, response);
    }

}
