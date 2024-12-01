<!--@+leo-ver=5-thin-->
<!--@+node:agarciafdz.20240507230057.1: * @file mediator.e-->
<!--@+all-->
<!--@+node:agarciafdz.20240507192925.1: ** <<MEDIATOR_LIBRARY>>-->
class 
    MEDIATOR[C -> COLLEAGUE]
create
    make

feature
    make
        do
            create colleages.make
        end

feature
    colleagues: LINKED_LIST[C]

feature
    extend (a_colleague:C)
        -- extend colleagues
        -- update event subscription of colleagues
        require
            a_collegue_exists: attached a_colleague
            not_already_in_list: not colleagues.has(a_colleague)
        local
            other_colleague, new_colleague : COLLEAGUE
            a_cursor: CURSOR
        do
            new_colleague := a_colleague
            a_cursor := colleagues.cursor
            --subscribe existing colleagues 
            -- to a_colleague.do_something
            -- Subscribe a_colleague to other colleagues event.
            from colleagues.start until colleages.after loop
                other_colleague := colleagues.item
                other_colleague.event.subscribe(
                    agent other_colleague.do_something)
                colleages.forth
            end
            
            -- Add a_colleague to a list of colleages
            
            colleages.extend(a_colleage)
            colleages.go_to(a_cursor)
        ensure
            one_more: colleagues.count = old colleages.count+1
            is_last: colleagues.last = a_colleague
            subscribed: colleages.for_all(agent is_colleague_subscribed)

feature
    remove(a_colleague:C)
        require
            exists: attached a_colleague
            is_in_the_set: colleagues.has(a_colleague)
        local
            a_cursor:CURSOR
            old_colleague, other_colleague: COLLEAGUE
        do
            a_cursor := colleagues.cursor
            -- Unsubscribe remaining colleagues
            -- from a_college.do_something
            -- Unsubscribe events from a_colleague.
            -- Remove a_colleague from colleagues
            
            old_collegue := a_colleague
            from colleages.start until colleagues.after loop
                other_colleague := colleages.item
                if other_colleague = a_colleague then
                    colleages.remove
                else
                    other_colleague.event.unsubscribe(
                        agent old_colleage.do_something)
                    old_colleage.event.unsubscribe(
                        agent other_colleague.do_something)
                    colleagues.forth
                end
            end
            collegues.go_to(a_cursor)
        ensure
            one_less: colleagues.count = old colleagues.count-1
            not_has_colleague: not colleages.has(a_colleague)
            unsubscribed: a_colleague.unsubscribed
        end

feature
    is_collegue_subscribed(a_collegue:C):BOOLEAN
    require
        a_colleage_exists: attached a_colleague
    do
        Result := a_colleague.subscribed
    ensure
        definition: Result = a_colleague.subscribed
    end
    
    is_colleague_unsubscribed(a_colleague:C):BOOLEAN
        require
            a_colleage_not_void: attached a_colleague
        do
            Restult := a_college.unsubscribed
        ensure
            definition: Result = a_collegue.unsubscribed
        end
invariant
    has_colleagues: attached colleages
    college_exist: not colleages.has(void)
end
<!--@-all-->
<!--@-leo-->
