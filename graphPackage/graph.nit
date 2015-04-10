module graph

import virtualGraphTemplate::templategraph



class Graph 
	super VGraph
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
	redef fun getClassName : String
	do
		return "Graph"
	end
	
end

class Node 
	super VNode
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
	redef fun getClassName : String
	do
		return "Node"
	end
	
end

class Edge
	super VEdge
	
	redef type VG : Graph
	redef type VN : Node
	redef type VE : Edge
	
	redef fun getClassName : String
	do
		return "Edge"
	end
	
end