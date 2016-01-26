package edziekanat.controller.administrator;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.databasemodel.dao.StudentDAO;
import edziekanat.databasemodel.dao.StudentsGroupDAO;
import edziekanat.databasemodel.dto.StudentDTO;
import edziekanat.databasemodel.dto.StudentsGroupDTO;

/**
 * Servlet implementation class AdminStudents
 */
@WebServlet("/adminstudents")
public class AdminStudents extends HttpServlet
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
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
	List<StudentDTO> students = new LinkedList<StudentDTO>();
	if (request.getParameter("students") == null && request.getParameter("studentsGroupId") == null)
	{
	    students = new StudentDAO().getAllEntities();

	}
	else if (request.getParameter("studentsGroupId") != null)
	{
	    StudentsGroupDTO studentsGroup = new StudentsGroupDAO().getEntity(Integer.parseInt(request.getParameter("studentsGroupId")));
	    students = studentsGroup.getStudent();
	    request.setAttribute("studentsgroup", studentsGroup);
	}
	else
	{
	    students = (List<StudentDTO>) request.getAttribute("students");
	}
	request.setAttribute("students", removeDuplicates(students));
	request.getRequestDispatcher("administrator/students.jsp").forward(request, response);
    }

    /**
     * Removes duplicated students, then sorts them by surname.
     * 
     * @param students
     * @return
     */
    private List<StudentDTO> removeDuplicates(List<StudentDTO> students)
    {
	Collections.sort(students, (x, y) -> x.getUser().getLogin().compareTo(y.getUser().getLogin()));
	for (int i = 1; i < students.size(); i++)
	{
	    StudentDTO previous = students.get(i - 1);
	    StudentDTO next = students.get(i);
	    if (previous.getUser().getLogin().equals(next.getUser().getLogin()))
	    {
		students.remove(previous);
		i--;
	    }
	}
	Collections.sort(students, (x, y) -> x.getSurname().compareTo(y.getSurname()));
	return students;
    }

}