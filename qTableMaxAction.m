function action = qTableMaxAction(qTable, state)
    

    %create a table of [state, action] and asign 'a' index to action 
    [s,a] = max(qTable(state,:));

    action = a;

end

