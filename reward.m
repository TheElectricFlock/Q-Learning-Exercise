function rewardOutput = reward(state, action)

    %if else statements to retun values on state and action parameters
    if state == 5 && action == 3
        rewardOutput = 10.00;
    else
        rewardOutput = 0;
    end

end