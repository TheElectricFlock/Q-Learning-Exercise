function qTable = qTableUpdate(qTable, state, action, reward, nextState)



    %where temporal discount factor (gamma) is 0.9
    g = 0.9;
    
    %where learning rate (alpha) is 0.2
    a = 0.2;

    qTableMax = max(qTable(nextState,:));    
    
    qTable(state,action) = qTable(state,action) + a * (reward + g* qTableMax - qTable(state,action));

    

end