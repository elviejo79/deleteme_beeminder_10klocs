--@+leo-ver=5-thin
--@+node:agarciafdz.20240413144210.1: * @file ./connector.e
class Connector 
    inherit
        SUBJECT
    
    feature attach alias "->"(o:OBSERVER)
        do
            predecesor
        end
--@-leo
