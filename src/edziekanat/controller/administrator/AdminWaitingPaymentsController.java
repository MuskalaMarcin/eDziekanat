package edziekanat.controller.administrator;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edziekanat.bean.LoginBean;
import edziekanat.databasemodel.dao.PaymentDAO;

/**
 * Servlet implementation class AdminWaitingPaymentsController
 */
@WebServlet("/adminwaitingpayments")
public class AdminWaitingPaymentsController extends HttpServlet
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
	request.setAttribute("waitingPayments", new PaymentDAO()
		.getWaitingAdminPayments(((LoginBean) request.getSession().getAttribute("loginBean")).getPersonId()));

	request.getRequestDispatcher("administrator/waitingpayments.jsp").forward(request, response);
    }

}
