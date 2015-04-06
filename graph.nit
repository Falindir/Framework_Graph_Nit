module graph
import templategraphe

class Graph 
	super VGraphe
	
	redef type VG : Graph
	redef type VS : VSommet
	redef type VA : Arete
	
end

class Sommet 
	super VSommet
	
	redef type VG : Graph
	redef type VS : VSommet
	redef type VA : Arete
	
end

class Arete
	super VArete
	
	redef type VG : Graph
	redef type VS : VSommet
	redef type VA : Arete
	
end