function stepCounts = qLearningExperiment()

    global TRIALS_NUMOF;
    global EPISODES_NUMOF;
    
    TRIALS_NUMOF = 50;
    
    trialStepCounts = [];
    for tidx = 1:TRIALS_NUMOF
        stepCounts = qLearningTrial();
        trialStepCounts = [trialStepCounts; stepCounts];
    end
    stepCountMeans = mean(trialStepCounts);
    stepCountStds = std(trialStepCounts);
    shadedErrorBar([1:EPISODES_NUMOF],stepCountMeans,stepCountStds);
    xlabel('Episode number');
    ylabel('Number of steps');
end

