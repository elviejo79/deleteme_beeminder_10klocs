--@+leo-ver=5-thin
--@+node:agarciafdz.20240415152433.1: * @file ./connecting.e
note
    goal: It creates a mechanism on which objects can automatically connect with each others
    
class CONNECTABLE
feature {NONE} 
    listeners:ACTION_SEQUENCE
        attribute
            Result.make
        end

feature
    connect, "->" (aListener:PROCEDURE)
        require
            not_listening_already: subscriber ∉ subscribers
        do
            listeners.extend(listener)
        ensure
            subscribed: subscriber ∈ subscribers
        end

    feature notify(data:EVENT_DATA)
    do
        listeners.call(data)
    end
    
end
    
--@-leo
