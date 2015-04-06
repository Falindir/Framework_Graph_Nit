module test

import graph 
import molecule
import network

print "Debut test type virtuel nit\n"

var g1 = new Graph ("G1")

var a1 = new Edge ("A1")

var s1 = new Node ("S1")
var s2 = new Node ("S2")

g1.printSelf
a1.printSelf
s1.printSelf
s2.printSelf

g1.addNode(s1)

g1.printSelf








