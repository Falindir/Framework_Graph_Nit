module graph
import templategraphe

class Graph 
	super VGraph
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
end

class Node 
	super VNode
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
end

class Edge
	super VEdge
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
end