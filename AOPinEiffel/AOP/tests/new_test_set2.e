--@+leo-ver=5-thin
--@+node:agarciafdz.20240415232400.1: * @file new_test_set2.e
--@@language eiffel
note
	description: "[
			Eiffel tests that can be executed by testing tool.
		]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	NEW_TEST_SET2

inherit
	EQA_TEST_SET

feature -- Test routines

--@+<<a_connect_b>>
--@+node:agarciafdz.20240415233859.1: ** <<a_connect_b>>
	TEST_ACTION_CELL
			-- can connect and remain in sync
		local
			Alice, Bob: ACTION_CELL [STRING]
		do
			create Alice.put ("")
			create Bob.put ("")

			Alice.connect (agent Bob.put)
			Alice.put ("1st text")

			assert ("bob got updated with ilecs value", Bob.item ~ Alice.item)

			Alice.put ("2nd text")
			assert ("they remain in sync", Bob.item ~ Alice.item)
		end
--@-<<a_connect_b>>

end
--@-leo
