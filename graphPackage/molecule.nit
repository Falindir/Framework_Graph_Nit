module molecule
import virtualGraphTemplate::templategraph

class Molecule
	super VGraph
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
	redef fun getClassName : String
	do
		return "Molecule"
	end
	
end

class Atom
	super VNode
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
	redef fun getClassName : String
	do
		return "Atom"
	end
	
end

class Bond
	super VEdge
	
	redef type VG : Molecule
	redef type VN : Atom
	redef type VE : Bond
	
	redef fun getClassName : String
	do
		return "Bond"
	end	
end