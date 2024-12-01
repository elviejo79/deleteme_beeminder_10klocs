note
	description: "AOP application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			my_cell: ACTION_CELL [STRING]
			-- Run application.
		do
				--| Add your code here
			print ("Hello 2 Eiffel World!%N")
			print ("anthoer 3 lie!%N")
			create my_cell.put ("one")
			my_cell.connect (agent my_print)
			my_cell.put ("two")
			my_cell.put ("three")
			my_cell.connect (agent my_2nd_print)
			my_cell.put ("four")
		end

	my_print (s: STRING)
		do
			print ("first subscriber: ")
			print (s)
			print ("%N")
		end

	my_2nd_print (s: STRING)
		do
			print ("2nd print:")
			print (s)
			print ("%N")
		end

end
