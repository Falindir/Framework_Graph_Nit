module templategraph
import root

#///////////////////////////////////////////#
#					Graph					#																		 #
#///////////////////////////////////////////#

abstract class VGraph 
	super Root
	 
	type VG: VGraph
	type VN: VNode
	type VE: VEdge
	
	init
	do
		print "Creation d'un GGraph {getClassName} -> {getName}"
	end
	
	private var edges = new Array [ VE ]
	private var nodes = new Array [ VN ]
	
		
end

#///////////////////////////////////////////#
#					Node					#																		 #
#///////////////////////////////////////////#

abstract class VNode
	super Root
	
	type VG: nullable VGraph
	type VN: VNode
	type VE: VEdge
	
	init
	do
		print "Creation d'un GNode {getClassName} -> {getName}"
	end
	
	private var graph : nullable VG = null
	private var edge = new Array [ VE ]
	
	
	
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
		print "Creation d'un GNode {getClassName} -> {getName}"
	end
		
	private var graph : nullable VG = null
	private var node1 : nullable VN = null
	private var node2 : nullable VN = null
	
	#////////////////////////////////////////////////////////////////
	
	fun delete
	do
	
	end
	
	#////////////////////////////////////////////////////////////////
	
	fun addNodes(node1 : VN, node2 : VN)
	do
	
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