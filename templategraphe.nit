module templategraphe
import root

abstract class VGraph 
	super Root
	 
	type VG: VGraph
	type VN: VNode
	type VE: VEdge
	
	private var edges = new Array [ VE ]
	private var nodes = new Array [ VN ]
	
end

abstract class VNode
	super Root
	
	type VG: nullable VGraph
	type VN: VNode
	type VE: VEdge
	
	private var graph : nullable VG = null
	private var edge = new Array [ VE ]
	
end

abstract class VEdge
	super Root
	
	type VG: nullable VGraph
	type VN: nullable VNode
	type VE: nullable VEdge
	
	private var graphe : nullable VG = null
	private var node1 : nullable VN = null
	private var node2 : nullable VN = null
	


end