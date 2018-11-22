function next_state = transition(state, action)
    % Returns the next state given an initial state and action
    next_state = state;
    switch action
        case 1
            if find([1 2 3 4]==state) 
                next_state = state+3;
            elseif state == 5
                next_state = 9;
            elseif state == 6
                next_state = 11;
            end
        case 2
            if find([7 8 9 10]==state)
                next_state = state+1;
            end
        case 3
            if find([4 5 6 7]==state)
                next_state = state-3;
            elseif state == 9
                next_state = 5;
            elseif state == 11
                next_state = 6;
            end
        case 4
            if find([8 9 10 11]==state)
                next_state = state-1;
            end
    end     
end
