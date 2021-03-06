package payment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.DBAccess;
import dbAccess.Delete;
import dbAccess.Insert;
import dbAccess.Select;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DBAccess dbAccess;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String year = request.getParameter("year");
		String day = request.getParameter("day");
		String month =request.getParameter("month");
		
		request.setAttribute("year", year);
		request.setAttribute("day", day);
		request.setAttribute("month", month);
		
		DBAccess dbAccess = new Select();
		
		try {
			dbAccess.execute(request);
		}catch(SQLException e){
			e.printStackTrace();
		
	}
		ServletContext context = getServletContext();
		RequestDispatcher dis = context.getRequestDispatcher("/payment.jsp");
		dis.forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String btn =request.getParameter("btn");//押されたボタンを取得している
		if(btn.equals("登録")) {
			dbAccess = new Insert();
			
			try {
				dbAccess.execute(request);
			}catch(SQLException e){
				e.printStackTrace();
			
			} 	
		}
		if(btn.equals("削除")) {
			dbAccess = new Delete();
		
			try {
				dbAccess.execute(request);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		doGet(request, response);
	}

}
