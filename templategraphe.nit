module templategraphe
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
		
	private var graphe : nullable VG = null
	private var node1 : nullable VN = null
	private var node2 : nullable VN = null
	


end