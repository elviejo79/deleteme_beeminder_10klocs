--@+leo-ver=5-thin
--@+node:agarciafdz.20240415234913.1: * @file action_cell.e
--@@language eiffel
note
	description: "Summary description for {ACTION_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

--@+<<action_cell_declaration>>
--@+node:agarciafdz.20240415235024.1: ** <<action_cell_declaration>>
class
	ACTION_CELL [G]

inherit
	CELL [G]
		redefine
			put
		end
	CONNECTABLE [G]
--@-<<action_cell_declaration>>

create
	put

feature --accesors

--@+<<put_updated>>
--@+node:agarciafdz.20240416000028.1: ** <<put_updated>>
	put (v: G)
		-- update value and notify listeners
		do
			Precursor (v)
			tell_listeners (v)
		end
--@-<<put_updated>>

end
--@-leo
