module root

abstract class Root
	private var name : String
	
	fun getName : String
	do
		return name
	end
	
	fun getClassName : String 
	do
		return self.to_s
	end
	
	fun whoamI
	do
		print "Object : name -> " + name + " , class -> " + getClassName
	end

end  




