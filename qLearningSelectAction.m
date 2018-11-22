function action = qLearningSelectAction(qTable, state)

    x = rand;
    
    if x <= 0.8
        
        %create a matrix of [state, action] and asign action index its
        [s,a] = max(qTable(state,:));
    

        action = a;
        
    else
        action = randi(4);
    end
    
end