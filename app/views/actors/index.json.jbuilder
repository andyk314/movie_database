json.actors do |json|
	json.array!(@actors) do |actor|
		json.extract! actor, :name, :picture
	end
end

