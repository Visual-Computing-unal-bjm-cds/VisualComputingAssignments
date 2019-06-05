# Taller raster



## Propósito



Comprender algunos aspectos fundamentales del paradigma de rasterización.



## Tareas



Emplee coordenadas baricéntricas para:


1. Rasterizar un triángulo.

2. Sombrear su superficie a partir de los colores de sus vértices.

3. (opcional para grupos menores de dos) 

Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/nakednous/nub/releases).



## Integrantes



Complete la tabla:


|       Integrantes       |  github nick  |
| ----------------------- | ------------- |
|   Brian Julian Moreno   |   bjmorenon   |
| Christan David Sanabria |	 cdsanabriar  |



## Discusión


La rasterizacion del triangulo se realizó calculando la orientación del triangulo por medio de sus vertices, para identificar si un pixel estaba adentro o no del triangulo, donde inicialmente sabiendo la ubicación de cada uno de sus vértices, miramos si el resultado de esta orientación es positiva para así buscar la orientación de el punto con dos vértices de los tres triángulos que se forman de manera interna al realizar la coneccion de estos, en este caso si la orientación es positiva el punto esta dentro de el triangulo, pero si la orientación del triangulo es negativa e igualmente cada orientación de los triángulos formados por dos puntos y el pixel señalado es negativa también esta dentro del triangulo, esto se observa mediante la función puntoTriangulo() que es llamada desde triangleRaster(), Luego de haber identificado de que el pixel se encuentra en el triangulo se busca pintarlo realizando los contrastes para pintarlos del con mas intensidad desde el vértice mas cercano, calculando la coordenada baricentrica y mirando que tan lejos esta el pixel de los vértices.