function [episodesSteps] = qLearningTrial()

    global EPISODES_NUMOF;
    EPISODES_NUMOF = 100;

    % runs the set number of episodes and returns the episode lengths
    qTable = qTableInit();
    episodesSteps = [];
    for eidx = 1:EPISODES_NUMOF
        [stepsNumOf, qTable] = qLearningEpisode(qTable);
        episodesSteps = [episodesSteps stepsNumOf];
    end
end
