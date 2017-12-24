# ServletHundirLaFlota
Project from EI1021-Sistemas Distribuidos. Battleship using Java Servlets

Juego de Hundir la flota implementando MVC mediante Servlets y archivos jsp.

- Modelo(/src/modelo): el juego en sí.
  - Barco.java
  - Partida.java
- Controlador(/src/controlador): conjunto de servlets.
  - HundirFlotaServlet.java: Obtiene la sesión actual, busca la partida del cliente (o la crea si no existe), comprueba si se ha disparado a una casilla para acutalizar el estado de la partida y redirige a TableroActual.jsp.
  - NuevaPartidaServlet.java: Invalida la sesión actual y redirige a HundirFlotaServlet.java.
  - SolucionPartidaServlet.java: Obtiene la partida en juego, invalida la sesión y redirige a TableroSolucion.jsp pasándole la partida.
  - SalirPartidaServlet.java: Invalida la sesión actual y redirige a index.html.
- Vista(/WebContent): archivos html y jsp (HTML con código Java insertado) para presentar los resultados.
  - index.html: página que se mostrará al inicio, conteniendo un botón que al pulsarse invocará al servlet HundirFlotaServlet.java.
  - TableroActual.jsp: página que mostrará el estado del tablero (número de disparos, barcos hundidos, el tablero de juego...) como un formulario de radio buttons. Al seleccionar un radio y clicar el botón se invocará a HundirFlotaServlet.java. 
  - TableroSolución.jsp: página que mostrará la solución del tablero y algunos enlaces para invocar otros servlets.
