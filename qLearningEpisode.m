function [stepsNumof, qTable] = qLearningEpisode(qTable)
    
    
    GOAL_STATE = 2;

    
    
    %initialise a random start state
    state = rndStartState();
    
    stepsNumof = 1;

    %while loop until the goal state is reached
    while state ~= GOAL_STATE
        
        
        action = qTableMaxAction(qTable, state);
    
        %generate a reward
        rewardOutput = reward(state, action);

        %generate the next step
        nextStep = transition(state,action);
        
        %implement Q-learning update function
        qTable = qTableUpdate(qTable, state, action, rewardOutput, nextStep);
        
        %increment the number of steps
        stepsNumof = stepsNumof + 1;
        
        
        state = nextStep;
    end
end

