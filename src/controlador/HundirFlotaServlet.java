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
 * Servlet implementation class HundirFlotaServlet
 */
public class HundirFlotaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HundirFlotaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		//Cargamos la sesion o la creamos si no existe
		HttpSession session = request.getSession(true);
		Partida partida;
		boolean disparada = false;
		
		//Si no habia partida en la sesion creamos una nueva
		if (session.getAttribute("partida")==null) {
			partida = new Partida(8,8,6);
		//Si habia partida disparamos a una casilla
		}else {
			partida = (Partida) session.getAttribute("partida");
			if (request.getParameter("casilla")!=null){
				String posicionesCasilla[] = request.getParameter("casilla").split("#");
				int fila = Integer.valueOf(posicionesCasilla[0]);
				int columna = Integer.valueOf(posicionesCasilla[1]);
				disparada = partida.casillaDisparada(fila, columna);
				int resultado = partida.pruebaCasilla(fila, columna);	
				
			}	
		}
		//Guardamos la partida en la sesion
		session.setAttribute("partida", partida);
		
		//Redirigimos a TableroActual.jsp, añadiendo en la peticion el atributo disparada que indica si la casilla habia sido disparada
		request.setAttribute("disparada", disparada);
		RequestDispatcher vista = request.getRequestDispatcher("TableroActual.jsp");
		vista.forward(request, response);	
		
	}

}
