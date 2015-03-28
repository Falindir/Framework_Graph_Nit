module test
import graphe
import molecule
import reseau

var g1 = new Graphe ("G1")

var a1 = new Arete ("A1")

print g1.getName

g1.whoamI

print a1.getName

a1.whoamI

print a1.haveGraphe

a1.addGraphe(g1)

print a1.haveGraphe

print a1.getGraphe.getName

var m1 = new Molecule ("M1")

m1.whoamI

#a1.addGraphe(m1)






