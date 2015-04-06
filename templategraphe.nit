module templategraphe
import racine

abstract class VGraphe 
	super Racine
	 
	type VG: VGraphe
	type VS: VSommet
	type VA: VArete
	
	var aretes = new Array [ VA ]
	var sommets = new Array [ VS ]
	
	fun addSommet (s : VS) 
	do
		if not haveSommet(s) then
			print "Ajout du sommet {s.getName} au graphe {getName}"
			sommets.add(s)
			s.addGraphe(self)
		end
	end
	
	fun deleteSommet (s : VS)
	do
	
	
	end
	
	fun addArete(a : VA, s1 : VS, s2 : VS)
	do
		if (not haveArete(a)) and (s1.haveSameGraphe(s2)) and (s1.getGraphe == self) then
			print "Ajout de l'arete {a.getName} au graphe {getName}"
			aretes.add(a)
			a
		else
			aretes.add(a)
		end	
	end
	
	fun deleteArete(a : VA)
	do
	
	end
	
	fun haveSommet (s : VS) : Bool
	do
		for sommet in sommets do
			if sommet == s then
				return true	
			end	
		end
		
		return false
	end
	
	fun haveArete (a : VA) : Bool
	do
		for arete in aretes do
			if arete == a then
				return true	
			end	
		end
		
		return false
	end
	
	fun affiche
	do 
		print "\nPrint Graphe : "
		afficheSommets
		afficheAretes
	end 
	
	fun afficheSommets
	do
		if sommets.length > 0 then
			var res : String = ""
			
			for s in sommets do
				res += "{s.getName} , "		
			end
			
			print "\tSommets de {getName} : {res}"
		else 
			print "\tSommets de {getName} : aucun sommets dans {getName}"
		end
	end
	
	fun afficheAretes
	do
		if aretes.length > 0 then
			var res : String = ""
			
			for a in aretes do
				res += "{a.getName} , "		
			end
			
			print "\tAretes de {getName} : {res}" 
		else 
			print "\tAretes de {getName} : aucun aretes dans {getName}"
		end
	end
	
end

abstract class VSommet
	super Racine
	
	type VG: nullable VGraphe
	type VS: VSommet
	type VA: VArete
	
	var graphe : nullable VG = null
	var aretes = new Array [ VA ]
	
	fun addGraphe (g : VG)
	do
		if haveGraphe then
			if graphe == g then
				g.addSommet(self)
			else
				#TODO changement de graphe 
			end		
		else
			print "Ajout du graphe {g.getName} au sommet {getName}"
			graphe = g
			g.addSommet(self)
		end
	end
	
	fun deleteGraphe
	do
	
	end
	
	fun addArete (a : VA, s : VS)
	do
	
	end
	
	fun deleteArete (a : VA)
	do
	
	end
	
	fun getGraphe : VG
	do
		return graphe
	end
	
	fun haveGraphe : Bool 
	do
		return graphe != null
	end
	
	fun haveSameGraphe (s : VS) : Bool
	do
		if haveGraphe and s.haveGraphe then
			return graphe == s.getGraphe
		end
		return false
	end
		
	fun affiche 
	do
		print "\nPrint Sommet : "
		afficheGraphe
		afficheAretes 
	end
	
	fun afficheGraphe 
	do
		if haveGraphe then
			print "\tGraphe de {getName} : {graphe.getName}"
		else
			print "\tGraphe de {getName} : null"
		end
	end
	
	fun afficheAretes 
	do
		if aretes.length > 0 then
			var res : String = ""
			
			for a in aretes do
				res += "{a.getName} , "		
			end
			
			print "\tAretes de {getName} : {res}"
		else 
			print "\tAretes de {getName} : aucun aretes dans {getName}"
		end
	end	
end

abstract class VArete
	super Racine
	
	type VG: nullable VGraphe
	type VS: nullable VSommet
	type VA: nullable VArete
	
	private var graphe : nullable VG = null
	private var s1 : nullable VS = null
	private var s2 : nullable VS = null
	
	fun addGraphe (graphe : VG, s1 : VS, s2 : VS) 
	do
		self.graphe = graphe
	end
	
	fun deleteGraphe 
	do
		if haveGraphe then 
		
		end
		
		
	end
	
	fun addSommet (s1 : VS, s2 : VS)
	do
	
	
	end
	
	fun deleteSommets
	do
	
	
	end
	
	fun getGraphe : VG
	do
		return graphe
	end
	
	fun getSommetS1 : VS
	do 
		return s1
	end
	
	fun getSommeetS2 : VS
	do 
		return s2
	end
	
	fun getSommets : Array[ VS ]
	do 
		var sommets = new Array [ VS ]
		sommets.add(s1)
		sommets.add(s2)		
		return sommets
	end
	
	fun haveGraphe : Bool 
	do
		return graphe != null
	end
	
	fun haveSommetS1 : Bool
	do
		return s1 != null
	end
	
	fun haveSommetS2 : Bool
	do
		return s2 != null
	end
	
	fun haveSommets : Bool
	do
		return haveSommetS1 and haveSommetS2
	end
	
	fun getVoisin (s : VS) : VS
	do
		if haveSommets then
			if s == s1 then 
				return s2
			else
				return s1
			end
		else 
			return null
		end
	end
	
	fun affiche
	do 
		print "\nPrint Arete : "
		afficheGraphe
		afficheSommets
	end 
	
	fun afficheGraphe 
	do
		if haveGraphe then
			print "\tGraphe de {getName} : {graphe.getName}"
		else
			print "\tGraphe de {getName} : null"
		end
	end
	
	fun afficheSommets
	do
		if haveSommetS1 then
			print "\tSommet 1 : {s1.getName}"
		else
			print "\tSommet 1 : null"
		end
		
		if haveSommetS2 then
			print "\tSommet 2 : {s2.getName}"
		else
			print "\tSommet 2 : null"
		end
	end
		
	
end