# Taller de an�lisis de im�genes por software

## Prop�sito

Introducir el an�lisis de im�genes/video en el lenguaje de [Processing](https://processing.org/).


## Trabajo Realizado


Implementar las siguientes operaciones de an�lisis para im�genes/video:

* Conversi�n a escala de grises.
* Aplicaci�n de algunas [m�scaras de convoluci�n](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para im�genes) Despliegue del histograma.
* (solo para im�genes) Segmentaci�n de la imagen a partir del histograma.
* (solo para video) Medici�n de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del an�lisis.

## Integrantes



|       Integrantes       |  github nick  |
| ----------------------- | ------------- |
|   Brian Julian Moreno   |   bjmorenon   |
| Christan David Sanabria |	 cdsanabriar  |


## Discusi�n

Inicialmente se crea este proyecto y se crean dos canvas fijos de igual tama�o que se ubican proporcionalmente en el canvas principal(uno al lado del otro), seguido a esto se crear un bot�n que cambia la funcionalidad de ver los resultados referentes a la imagen, o ver resultados trabajando con el video. Se cargan la imagen y el video, a los dos se le realiza el cambio a escala de grises de cada cuadro pintado por segundo.  En la imagen tambi�n se trabaja con filtros convolucionales los cuales se ven en la parte de derecha y pueden ser cambiados con las teclas de izquierda y derecha las cuales cambian el filtro que se le aplica a la imagen. En la imagen medimos el brillo(intensidad) de cada pixel obtenido en escala de grises y se guarda en un arreglo, este es mostrado en el canvas derecho de resultados. Para la segmentaci�n de la imagen a partir del histograma, inicialmente utilizamos las punciones de mousePressed() y mouseReleased() para saber las cordenadas de donde se presion� y donde se solt� el mouse y as� seleccionar la secci�n del histograma donde se eligen el rango de brillos que queremos segmentar en la imagen, donde la selecci�n denota el brillo original y lo que est� por fuera de la selecci�n, se cambia el color por amarillo para saber cual es.
Para el video y hacer el an�lisis de la eficiencia computacional, se puso la opci�n de que el usuario puede incrementar y decrementar los frameRate a la reproducci�n del video mediantes las flechas de arriba y abajo, y ah� mismo se estar� mostrando y actualizando el valor de los frames que est� realizando en cada instante, cabe aclarar y los frames que puede alcanzar dependen de la arquitectura del computador.

## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesi�n de taller.