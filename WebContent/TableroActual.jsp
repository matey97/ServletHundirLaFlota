<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="modelo.Partida"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hundir la flota</title>
<style>
	table{
    	width:100%;
    	heigth:100%;
    	margin: auto;
    }
	#blanco {
	   background-color:white
	}
    #rojo {
       background-color:red
    }
    #naranja{
       background-color:orange
    }
    #azul{
       background-color:blue
    }
</style>
</head>
<body>
	<h1>Hundir la flota</h1>
	<%	
		//Obtenemos la sesion y la partida en juego
		final int AGUA = -1, TOCADO = -2, HUNDIDO = -3;
		session = request.getSession();
		Partida partida = (Partida) session.getAttribute("partida");
		int fila = -1, columna = -1;
		
		//Si se ha disparado a una casilla obtenemos su posicion
		if (request.getParameter("casilla")!=null){
			String posicionesCasilla[] = request.getParameter("casilla").split("#");
			fila = Integer.valueOf(posicionesCasilla[0]);
			columna = Integer.valueOf(posicionesCasilla[1]);
		}
		
		//Si no se ha disparado, significa que la partida es nueva
		if (partida.getDisparos()==0){
			out.println("NUEVA PARTIDA<br>");	
		//Si no quedan barcos, la partida se acabó
		}else if (partida.getBarcosRestantes()==0){
			out.println("GAME OVER<br>");
		//Si la casilla disparada ya lo habia sido anteriormente...
		}else if ((boolean)request.getAttribute("disparada")){
			out.println("Pagina de resultados del disparo en ("+(fila+1)+","+(char)(columna+65)+"): Ya había sido disparada<br>");
		//Casilla disparada por primera vez...
		}else{
			out.println("Pagina de resultados del disparo en ("+(fila+1)+","+(char)(columna+65)+"): Ok!<br>");
		}
		
		//Mensajes de estado
		out.println("Barcos navegando: "+partida.getBarcosRestantes()+"<br>");
		out.println("Barcos hundidos: "+(6-partida.getBarcosRestantes())+"<br>");
		out.println("Numero de disparos efectuados: "+partida.getDisparos()+"<br>");
		
		out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td></td>");
		//Añadimos la primera fila, las letras.
		for (int i = 0; i<8; i++){
			char letra= (char) (i+65);
			out.println("<th>"+letra+"</th>");
		}
		out.println("</tr>");
		String color = null;
		//Añadimos el resto de filas, su primera columna un número
		for (int i = 0; i<8; i++){
			out.println("<tr>");
			out.println("<th>"+(i+1)+"</th>");
			for(int j = 0; j<8; j++){
				//Si la casilla que estamos poniendo ha sido disparada obtenemos su valor para seleccionar color
				if (partida.casillaDisparada(i, j)){
					switch (partida.getCasilla(i,j)){
						case AGUA:
							color = "azul";
							break;
						case TOCADO:
							color = "naranja";
							break;
						case HUNDIDO:
							color = "rojo";
							break;		
					}
				//Si no ha sido disparada, color blanco
				}else{
					color = "blanco";
				}
				out.println("<td id=\""+color+"\""+"><input type=\"radio\" name=\"casilla\" value=\""+i+"#"+j+"\"required> </td>");
			}
			out.println("</tr>");
		}
		
		out.println("</table>");
		out.println("<input type=\"submit\" value=\"Prueba casilla\">");
		out.println("</form>");
		
	%>
	<br><a href="SolucionPartidaServlet">Muestra solucion</a><br>
	<a href="NuevaPartidaServlet">Nueva partida</a><br>
	<a href="SalirPartidaServlet">Salir</a><br>
</body>
</html>