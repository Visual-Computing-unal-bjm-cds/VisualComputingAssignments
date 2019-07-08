
# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Implementar un modelo de iluminación que combine luz ambiental con varias fuentes puntuales de luz especular y difusa. Tener presente _factores de atenuación_ para las fuentes de iluminación puntuales.
3. (grupos de dos o más) Implementar el [bump mapping](https://en.wikipedia.org/wiki/Bump_mapping).





## Integrantes



Complete la tabla:


|       Integrantes       |  github nick  |
| ----------------------- | ------------- |
|   Brian Julian Moreno   |   bjmorenon   |
| Christan David Sanabria |	 cdsanabriar  |

## Informe

Carpeta light: Contiene el punto dos, donde se representa un modelo cilíndrico(can) por medio de shaders, este cilindro se puede mover para ver desde arriba o desde abajo con las flechas UP y DOWN. También por medio de shaders se realiza la luz(lightShader) que se va a mostrar en el cilindro, esta luz se configura con la función "loadShader" la cual recibe como parámetros los archivos de configuración, estos archivos se encuentran en la carpeta data, teniendo en sí, dos ejemplos de fuentes de luz difusa(los cuales se puede ver con las teclas "d" y "c") y dos ejemplos de fuentes de luz especular(los cuales se puede ver con las teclas "s" y "x"). Con las teclas "+" y "-" se puede variar la profundidad de la luz reflejada en el cilindro.

## Entrega

Fecha límite Lunes 1/7/19 a las 24h.

