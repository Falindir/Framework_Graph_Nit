module test

#import testABC::aa
import graphPackage::graph
import graphPackage::molecule
import graphPackage::network

print "Debut test type virtuel nit\n"

var g1 = new Graph ("G1")

var a1 = new Edge ("A1")

var s1 = new Node ("S1")
var s2 = new Node ("S2")

print "\nTest 1 - Ajout des sommets S1 S2 au graphe G1"
	g1.addNode(s1)
	s2.addGraph(g1)
	
	g1.printSelf
	s1.printSelf
	s2.printSelf

print "\nTest 2 - Ajout de l'aretes A1 de S1 a S2 par G1" 
	g1.addEdge(a1, s1, s2)
	#a1.addNodes(s1, s2)
	#s1.addEdge(a1, s2)
	
	g1.printSelf
	s1.printSelf
	s2.printSelf
	a1.printSelf
	
print "\nTest 3 - Ajout d'un atom AT1 a la molecule MOL1"
	var molecule1 = new Molecule("MOL1")
	var atom1 = new Atom("AT1")

	molecule1.addNode(atom1)
	molecule1.printSelf
	atom1.printSelf

print "\nTest 4 - Test chimère"

#Jean Privat

	var bond1 = new Bond("BON1")

	#g1.addNode(atom1)
	#s1.addGraph(molecule1)
	
	#g1.addNode(atom1.as(Node))
	#s1.addGraph(molecule1.as(Graph))
	

