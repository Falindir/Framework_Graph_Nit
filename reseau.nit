module reseau
import templategraphe

class Reseau
	super VGraphe
	
	redef type VG : Reseau
	redef type VS : Noeud
	redef type VA : Lien
	
end

class Noeud
	super VSommet
	
	redef type VG : Reseau
	redef type VS : Noeud
	redef type VA : Lien
	
end

class Lien
	super VArete
	
	redef type VG : Reseau
	redef type VS : Noeud
	redef type VA : Lien
	
end
	