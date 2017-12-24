package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SalirPartidaServlet
 */
public class SalirPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalirPartidaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		System.out.println("Salir:");
		HttpSession session = request.getSession(true);
		System.out.println(session.getAttribute("partida"));
		session.setAttribute("partida", null );
		session.invalidate();
		response.sendRedirect("index.html");
		//Redirigimos a index.html
		//RequestDispatcher vista = request.getRequestDispatcher("index.html");
		//vista.forward(request, response);
	}

}
