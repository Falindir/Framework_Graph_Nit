module root

abstract class Root
	private var name : String
	
	fun getName : String
	do
		return name
	end
	
	fun whoamI
	do
		print "Object : name -> " + name + " , class -> " + self.to_s
	end

end  




