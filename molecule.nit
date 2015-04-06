module molecule
import templategraphe

class Molecule
	super VGraphe
	
	redef type VG : Molecule
	redef type VS : Atom
	redef type VA : Liaison
	
end

class Atom
	super VSommet
	
	redef type VG : Molecule
	redef type VS : Atom
	redef type VA : Liaison
	
end

class Liaison
	super VArete
	
	redef type VG : Molecule
	redef type VS : Atom
	redef type VA : Liaison
	
end