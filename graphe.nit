module graphe
import templategraphe

class Graphe 
	super VGraphe
	
	redef type VG : Graphe
	redef type VS : VSommet
	redef type VA : Arete
	
end

class Sommet 
	super VSommet
	
	redef type VG : Graphe
	redef type VS : VSommet
	redef type VA : Arete
	
end

class Arete
	super VArete
	
	redef type VG : Graphe
	redef type VS : VSommet
	redef type VA : Arete
	
end