module network
import templategraph 

class Network
	super VGraph
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
	redef fun getClassName : String
	do
		return "Network"
	end	
	
end

class NetworkNode
	super VNode
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
	redef fun getClassName : String
	do
		return "NetworkNode"
	end
	
end

class Link
	super VEdge
	
	redef type VG : Network
	redef type VN : NetworkNode
	redef type VE : Link
	
	redef fun getClassName : String
	do
		return "Link"
	end
	
end
	