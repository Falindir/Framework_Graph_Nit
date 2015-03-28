module templategraphe
import racine

abstract class VGraphe 
	super Racine
	 
	type VG: VGraphe
	type VS: VSommet
	type VA: VArete
	
	var aretes = new Array [ VA ]
	var sommets = new Array [ VS ]

end

abstract class VSommet
	super Racine
	
	type VG: nullable VGraphe
	type VS: VSommet
	type VA: VArete
	
	var graphe : nullable VG = null
	var aretes = new Array [ VA ]
	
end

abstract class VArete
	super Racine
	
	type VG: nullable VGraphe
	type VS: VSommet
	type VA: VArete
	
	private var graphe : nullable VG = null
	private var sommets = new Array [ VS ]
	
	fun addGraphe (graphe : VG) 
	do
		self.graphe = graphe
	end
	
	fun getGraphe : VG
	do
		return graphe
	end
	
	fun haveGraphe : Bool 
	do
		return graphe != null
	end
	
end