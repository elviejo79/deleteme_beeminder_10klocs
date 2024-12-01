--@+leo-ver=5-thin
--@+node:agarciafdz.20240415152433.1: * @file connectable.e
--@@language eiffel
--@verbatim
--@+leo-ver=5-thin
--@verbatim
--@+node:agarciafdz.20240415152433.1: * @file connectable.e
note
	goal: "It creates a mechanism on which objects can automatically connect with each other"

deferred class CONNECTABLE [EVENT_DATA]


--@+<<what_is_to_connect>>
--@+node:agarciafdz.20240416000809.1: ** <<what_is_to_connect>>
feature
	connect(aListener: PROCEDURE [EVENT_DATA])
		require
			not_listening_already: not listeners.has (aListener)
		do
			listeners.extend (aListener)
		ensure
			ready_to_listen: listeners.has (aListener)
		end
--@-<<what_is_to_connect>>

--@+<<collection_of_listeners>>
--@+node:agarciafdz.20240416001143.1: ** <<collection_of_listeners>>
feature --collection of listeners
	listeners: ACTION_SEQUENCE [EVENT_DATA]
		attribute
			create Result.default_create
		end
--@-<<collection_of_listeners>>

--@+<<tell_listeners>>
--@+node:agarciafdz.20240416002014.1: ** <<tell_listeners>>
feature
    -- after upadating tell listeners
    tell_listeners (data: EVENT_DATA)
		do
			listeners.call (data)
		end
--@-<<tell_listeners>>

end

--@verbatim
--@-leo
--@-leo
