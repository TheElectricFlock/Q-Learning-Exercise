function state = rndStartState()
% Returns any state bar the goal state
    state = randi(11);
    while state == 2
        state = randi(11);
    end
end
