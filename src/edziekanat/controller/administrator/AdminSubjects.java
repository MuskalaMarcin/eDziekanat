package edziekanat.controller.administrator;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.SubjectDAO;
import edziekanat.databasemodel.dto.SubjectDTO;

/**
 * Servlet implementation class AdminSubjects
 */
@WebServlet("/adminsubjects")
public class AdminSubjects extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSubjects()
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
	if (request.getParameter("lecturerId") == null)
	{
	    List<SubjectDTO> subjects = new SubjectDAO().getAllEntities();
	    Collections.sort(subjects, (x, y) -> x.getName().compareTo(y.getName()));
	    request.setAttribute("subjects", subjects);
	}
	else
	{
	    List<SubjectDTO> subjects = new SubjectDAO()
		    .getLecturerSubjects(Integer.parseInt(request.getParameter("lecturerId")));
	    Collections.sort(subjects, (x, y) -> x.getName().compareTo(y.getName()));
	    request.setAttribute("subjects", subjects);
	}
	request.getRequestDispatcher("administrator/subjects.jsp").forward(request, response);
    }

}
