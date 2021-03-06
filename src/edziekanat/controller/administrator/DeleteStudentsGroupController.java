package edziekanat.controller.administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.StudentsGroupDAO;
import edziekanat.databasemodel.dto.StudentsGroupDTO;

/**
 * Servlet implementation class DeleteStudentsGroupController
 */
@WebServlet("/deletestudentsgroup")
public class DeleteStudentsGroupController extends HttpServlet
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
	try
	{
	    StudentsGroupDAO sgDAO = new StudentsGroupDAO();
	    StudentsGroupDTO studentsGroup = sgDAO.getEntity(Integer.parseInt(request.getParameter("studentsGroupId")));
	    sgDAO.remove(studentsGroup);

	    request.setAttribute("msgshort", "Usuni�to grupe studenck�");
	    request.setAttribute("msglong", "Usuni�to grup� studenck�: " + studentsGroup.getId());
	    request.getRequestDispatcher("info.jsp").forward(request, response);
	}
	catch (Exception e)
	{
	    request.setAttribute("msgshort", "B��d");
	    request.setAttribute("msglong", "Podczas usuwania grupy studenckiej"
		    + " wyst�pi� nieznany b��d. Przepraszamy.");
	    request.getRequestDispatcher("error.jsp").forward(request, response);
	}
    }

}
