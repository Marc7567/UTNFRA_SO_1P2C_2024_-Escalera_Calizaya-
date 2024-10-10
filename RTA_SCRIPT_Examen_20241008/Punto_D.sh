#!/bin/bash
mkdir -p Estructura_Asimetrica/{correo/cartas_{1..100},clientes/{cartas_{1..100},carteros_{1..10}}}
tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4
