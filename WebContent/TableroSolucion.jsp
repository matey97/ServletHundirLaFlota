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
    #rojo {
       background-color:red
    }
    #azul{
       background-color:blue
    }
</style>
</head>
<body>
	<h1>Hundir la flota</h1>
	<%
		//Obtenemos la sesion y la partida
		final int AGUA=-1;
		Partida partida = (Partida) request.getAttribute("partida");
		
		
		//Mensajes de estado
		out.println("Solucion PARTIDA<br>");
		out.println("Barcos navegando: "+partida.getBarcosRestantes()+"<br>");
		out.println("Barcos hundidos: "+(6-partida.getBarcosRestantes())+"<br>");
		out.println("Numero de disparos efectuados: "+partida.getDisparos()+"<br>");
		
		out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td></td>");
		//Añadimos la primera fila, las letras
		for (int i = 0; i<8; i++){
			char letra= (char) (i+65);
			out.println("<th>"+letra+"</th>");
		}
		out.println("</tr>");
		String color = null;
		//Añadimos las siguientes filas
		for (int i = 0; i<8; i++){
			out.println("<tr>");
			out.println("<th>"+(i+1)+"</th>");
			for(int j = 0; j<8; j++){
				//Si una casilla no tiene barco, color azul.
				if (partida.getCasilla(i, j) == AGUA){
					color = "azul";
				//Si tiene barco, color rojo.
				}else{
					color = "rojo";
				}
				out.println("<td id=\""+color+"\""+"></td>");
			}
			out.println("</tr>");
		}
		
		out.println("</table>");
		out.println("</form>");
		
	%>
	
	<br><a href="NuevaPartidaServlet">Nueva partida</a><br>
	<a href="SalirPartidaServlet">Salir</a><br>
</body>
</html>