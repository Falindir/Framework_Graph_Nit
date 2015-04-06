module molecule
import templategraph

class Molecule
	super VGraph
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
end

class Atom
	super VNode
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
end

class Bond
	super VEdge
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
end