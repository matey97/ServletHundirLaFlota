package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * Servlet implementation class SolucionPartidaServlet
 */
public class SolucionPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SolucionPartidaServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		//Invalidamos la sesion para evitar tramposos
		HttpSession session = request.getSession(true);
		Partida partida =(Partida)session.getAttribute("partida");
		session.invalidate();
		
		
		//Redireccionamos a TableroSolucion.jsp, pasaldole la partida
		request.setAttribute("partida", partida);
		RequestDispatcher vista = request.getRequestDispatcher("TableroSolucion.jsp");
		vista.forward(request, response);
	}

}
