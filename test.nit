module test

import testABC::aa
import graphPackage::graph
import graphPackage::molecule
import graphPackage::network

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
s1.printSelf

s2.addGraph(g1)
g1.printSelf
s2.printSelf

g1.addEdge(a1, s1, s2)
g1.printSelf
s1.printSelf
s2.printSelf
a1.printSelf


var a = new A("r")

a.whoamI



var m = new Molecule("MO1")
m.whoamI

var r = new Network("RES1")
r.whoamI


