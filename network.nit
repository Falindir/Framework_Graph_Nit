module network
import templategraph 

class Network
	super VGraph
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
end

class NetworkNode
	super VNode
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
end

class Link
	super VEdge
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
end
	