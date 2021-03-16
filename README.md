# Metro
rutas óptimas para redes del metro

## Ejecución
```ruby
ruby main.rb
```
## Representación de rutas
* Cada tipo de dato debe ir en una determinada fila
* Los comentarios no cuentan como filas
* Para hacer comentarios se debe anteponer "#"
* Tipos por filas:
  * Fila 1: estación inicial. Por ejemplo: A. Partiría en la estación de nombre "A"
  * Fila 2: estación de destino. Por ejemplo: F. Significa que debe llegar hasta la estación de nombre "F"
  * Fila 3: color del tren. Puede ser Rojo, verde o blanco, los cuales se representan como R, V y B, respectivamente
  * Fila 4: estaciones de color blanco. Deben ir separadas por coma. Por ejemplo: A,B,C,D,E,F
  * Fila 5: estaciones color verde. Debe ir separadas por coma. Por ejemplo: G,I
  * Fila 6: estaciones color rojo. Debe ir separadas por coma. Por ejemplo: H
  * Fila 7: la ruta base. Representa el principio común del camino. Existen estaciones y **bifurcaciones**. Se representan de la siguiente manera: A,B,B12. Lo anterior significa que se tiene la estación A, B y luego una bifurcación:
    * Estaciones: se representan separadas por coma. Por ejemplo: A,B,C
    * Bifurcaciones: se representan, igual que las estaciones, pero tienen la siguiente sintaxis: B<número-de-bifurcación><número-de-caminos>. Por ejemplo: B12 (Primera bifurcación que tiene 2 caminos)

