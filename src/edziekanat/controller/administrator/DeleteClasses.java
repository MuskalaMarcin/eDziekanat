package edziekanat.controller.administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.ScheduledClassesDAO;
import edziekanat.databasemodel.dto.ScheduledClassesDTO;

/**
 * Servlet implementation class DeleteClasses
 */
@WebServlet("/deleteclasses")
public class DeleteClasses extends HttpServlet
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
	ScheduledClassesDAO scDAO = new ScheduledClassesDAO();
	ScheduledClassesDTO sc = scDAO.getEntity(Integer.parseInt(request.getParameter("classes")));
	scDAO.remove(sc);

	request.setAttribute("msgshort", "Usuni�to zaj�cia");
	request.setAttribute("msglong", "Usuni�to zaplanowane zaj�cia z przedimotu: " + sc.getSubject().getName());
	request.getRequestDispatcher("info.jsp").forward(request, response);
    }

}
