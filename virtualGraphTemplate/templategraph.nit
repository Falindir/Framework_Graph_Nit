module templategraph
import root

#///////////////////////////////////////////#
#					Graph					#																		 #
#///////////////////////////////////////////#

abstract class VGraph 
	super Root
	 
	type VG: nullable VGraph
	type VN: nullable VNode
	type VE: nullable VEdge
	
	init
	do
		print "Creation d'un GGraph : {getClassName} -> {getName}"
	end
	
	private var edges = new Array [ VE ]
	private var nodes = new Array [ VN ]
	
	#////////////////////////////////////////////////////////////////
	
	fun addNode(node : VN)
	do
		if not haveNode(node) then
            print "Ajout du sommet {node.getName} au graphe {getName}"
            nodes.add(node)
            node.addGraph(self.as(VG))
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun deleteNode(node : VN)
	do
		if haveNode(node) then
            print "Suppression de {node.getName} du graphe {getName}"
            nodes.remove(node)
            node.delete
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun addEdge(edge : VE, node1 : VN, node2 : VN)
	do
		if not haveEdge(edge) then
			if node1 != node2 then
				if node1.haveSameGraph(node2) then
					print "Ajout de l'arete {edge.getName} au graphe {getName}"
                    edges.add(edge)
                    addNode(node1)
                    addNode(node2)
                    edge.addNodes(node1, node2)
				else
					print "Impossible d'ajouter une arete {edge.getName} de {node1.getName} " + 
                          " a {node2.getName} car les deux sommets ne sont pas dans le même graphe"
				end			
			else 
				print "Impossible d'ajouter une arete {edge.getName} de {node1.getName}" +  
						" a {node2.getName} au graphe {getName} car c'est le même sommet"
			end		
		end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun deleteEdge(edge : VE)
	do
		if haveEdge(edge) then
            print "Suppression de l'arete {edge.getName} du graphe {getName}"
            edges.remove(edge)
            edge.delete
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun delete
	do
		print "Suppression du graphe {getName}"
        var tempNode = new Array [ VN ]
        tempNode.add_all(nodes)
        nodes.clear
        
        var tempEdge = new Array [ VE ]
        tempEdge.add_all(edges)
        edges.clear
        
        for node in tempNode
        do
            print "Suppression du sommet {node.getName} du graphe {getName}"
            node.delete
        end
        
        for edge in tempEdge
        do
            print "Suppression de l'arete {edge.getName} du graphe {getName}"
            edge.delete
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveEdge (edge : VE) : Bool
	do
		return edges.has(edge)
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveNode (node : VN) : Bool
	do
		return nodes.has(node)
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printSelf
	do
		print "\nPrint {getName} : "
		printNodes
		printEdges
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printNodes
	do
		var result : String = ""
		
		if nodes.is_empty then
			result = "aucun sommet dans {getName}"
		else
			for node in nodes
			do
				result += "{node.getName} , "
			end
		end
		
		print "\tSommets de {getName} : {result}"
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printEdges
	do
		var result : String = ""
		
		if edges.is_empty then
			result = "aucune aretes dans {getName}"
		else
			for edge in edges
			do
				result += "{edge.getName} , "
			end
		end
		
		print "\tAretes de {getName} : {result}"
	end	
end

#///////////////////////////////////////////#
#					Node					#																		 #
#///////////////////////////////////////////#

abstract class VNode
	super Root
	
	type VG: nullable VGraph
	type VN: nullable VNode
	type VE: nullable VEdge
	
	init
	do
		print "Creation d'un GNode : {getClassName} -> {getName}"
	end
	
	private var graph : nullable VG = null
	private var edges = new Array [ VE ]
	
	#////////////////////////////////////////////////////////////////
	
	fun getGraph : VG
	do
		return graph
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun addGraph(g : VG)
	do
		if haveGraph then
			if isSameGraph(g) then
				g.addNode(self.as(VN))
			else
				delete
				print "Ajout du graphe {g.getName} au sommet {getName}"
				graph = g
            	g.addNode(self.as(VN))			
			end		
		else 
		    print "Ajout du graphe {g.getName} au sommet {getName}"
            graph = g
            g.addNode(self.as(VN))	
		end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun addEdge(edge : VE, node2 : VN)
	do
		if (not haveEdge(edge)) and (edge.haveGraph) and (self == edge.getNeighborOfNode(node2)) then
			if self != node2 then
				if haveSameGraph(node2) then
					print "Ajout de l'arete {edge.getName} au sommet {getName}"
                    edges.add(edge)
                    edge.addNodes(self.as(VN), node2)
				else
					print "Impossible d'ajouter une arete {edge.getName} de {getName} " + 
                          " a {node2.getName} car les deux sommets ne sont pas dans le même graphe"					
				end			
			else
				print "Impossible d'ajouter une arete {edge.getName} de {getName}" +  
						" a {node2.getName} au graphe {graph.getName} car c'est le même sommet"
			end		
		else if (not haveEdge(edge)) and (not edge.haveGraph) then
            edge.addNodes(self.as(VN), node2)
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun deleteEdge(edge : VE)
	do
		if haveEdge(edge) then 
            print "Suppression de l'arete {edge.getName} du sommet {getName}"
            edges.remove(edge)
            edge.delete
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun delete
	do
		if haveGraph then
			print "Suppression du graphe {graph.getName} de {getName}"
            var tempGraph = graph
            graph = null
            var tempEdges = new Array [ VE ]
            tempEdges.add_all(edges)
            edges.clear
            tempGraph.deleteNode(self.as(VN))
            for edge in tempEdges
            do
                print "Suppression de l'arete {edge.getName} de {getName}"
                edge.delete
            end
		end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveGraph : Bool
	do
		return graph != null
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printSelf
	do
		print "\nPrint {getName} : "
        printGraph
        printEdges
        printNeighbors
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printGraph
	do
        if haveGraph then
            print "\tGraphe de {getName} : {graph.getName}"
        else
            print "\tGraphe de {getName} : null"
        end
    end
    
    #////////////////////////////////////////////////////////////////
    
    fun printEdges
	do
		var result : String = ""
		
		if edges.is_empty then
			result = "aucune aretes dans {getName}"
		else
			for edge in edges
			do
				result += "{edge.getName} , "
			end
		end
		
		print "\tAretes de {getName} : {result}"
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printNeighbors
	do
		var result : String = ""
        if edges.is_empty then
            result = "aucun sommets voisin de {getName}"
        else
            for node in getNeighbors
            do
                result += "{node.getName} par l'arete {node.getEdgeWithNeighbor(self).getName} , "
       		end
       	end
       		
       print "\tVoisins de {getName} : {result}"
	end
	
	#///////////////////////////////////////////////////////////////
	
	fun haveSameGraph(node2 : VN) : Bool
	do
		if haveGraph and node2.haveGraph then
			return graph == node2.getGraph
		end
	
		return false
	end
	
	#///////////////////////////////////////////////////////////////
	
	fun isSameGraph(g : VG) : Bool
	do
		if haveGraph then
			return graph == g
		end
		
		return false
	end
	
	#///////////////////////////////////////////////////////////////
	
	fun haveEdge(edge : VE) : Bool
	do
		return edges.has(edge)
	end
	
	#///////////////////////////////////////////////////////////////
	
	fun getNeighbors : Array[ VN ]
	do
		var neighbors = new Array[ VN ]
		
		for edge in edges
		do
			neighbors.add(edge.getNeighborOfNode(self.as(VN)))
		end
	
		return neighbors
	end
	
	#///////////////////////////////////////////////////////////////
	
	fun getEdgeWithNeighbor(node2 : VN) : VE
	do
		for edge in edges
		do
			var node = edge.getNeighborOfNode(self.as(VN))
			
			if node2 == node then
				return edge
			end		
		end
	
		return null
	end
	
end

#///////////////////////////////////////////#
#					Edge					#																		 #
#///////////////////////////////////////////#

abstract class VEdge
	super Root
	
	type VG: nullable VGraph
	type VN: nullable VNode 
	type VE: nullable VEdge
	
	init
	do
		print "Creation d'un GNode : {getClassName} -> {getName}"
	end
		
	private var graph : nullable VG = null
	private var node1 : nullable VN = null
	private var node2 : nullable VN = null
	
	#////////////////////////////////////////////////////////////////
	
	fun delete
	do
		if haveGraph then
			print "Suppression du graphe {graph.getName} de {getName}"
            print "Suppression du sommet {node1.getName} de {getName}"
            print "Suppression du sommet {node2.getName} de {getName}"
            var tempGraph = graph
            graph = null
            var tempNode1 = node1
            node1 = null
            var tempNode2 = node2
            node2 = null
            tempGraph.deleteEdge(self.as(VE))
            tempNode1.deleteEdge(self.as(VE))
            tempNode2.deleteEdge(self.as(VE))		
		end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun addNodes(node1 : VN, node2 : VN)
	do
		if not haveNodes then
			if node1 != node2 then
				if node1.haveSameGraph(node2) then
					print "Ajout des sommets {node1.getName} et {node2.getName} à l'arète {getName}"
                    print "Ajout du graphe {node1.getGraph.getName} à l'arète {getName}"
                    self.graph = node1.getGraph
                    self.node1 = node1
                    self.node2 = node2
                    graph.addEdge(self.as(VE), node1, node2)
                    node1.addEdge(self.as(VE), node2)
                    node2.addEdge(self.as(VE), node1)
				else
					print "Impossible d'ajouter une arete {getName} de {node1.getName} " + 
                          " a {node2.getName} car les deux sommets ne sont pas dans le même graphe"
				end			
			else 
				print "Impossible d'ajouter une arete {getName} de {node1.getName}" +  
						" a {node2.getName} au graphe {node1.getGraph.getName} car c'est le même sommet"
			end		
		end
 	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveGraph : Bool 
	do
		 return graph != null
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveNode1 : Bool
	do 
		return node1 != null
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveNode2 : Bool
	do 
		return node2 != null
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun haveNodes : Bool
	do
		return haveNode1 and haveNode2
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printSelf
	do
		print "\nPrint {getName} : "
        printGraph
        printNodes
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun printGraph
	do
        if haveGraph then
            print "\tGraphe de {getName} : {graph.getName}"
        else
            print "\tGraphe de {getName} : null"
        end
    end
    
    #////////////////////////////////////////////////////////////////
    
	fun printNodes
	do
		if node1 != null then
            print "\tSommet 1 : {node1.getName}"
        else
            print "\tSommet 1 : null "
        end

        if node2 != null then
            print "\tSommet 2 : {node2.getName}"
        else
            print "\tSommet 2 : null "
        end
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun getNeighborOfNode(node : VN) : VN
	do
		if haveNodes then
			if node1 == node then
				return node2
			else if node2 == node then
				return node1
			end
		end
		
		return null
	end
end