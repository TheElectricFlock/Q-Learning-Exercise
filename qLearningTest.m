function tests = qLearningTest
    tests = functiontests(localfunctions);
end

%% Test: reward
function rewardTest(testCase)
    r = reward(5,3);
    assert(r == 10, 'Expected reward 10 for state 5, action 3, got %d.',r);
    r = reward(5,2);
    assert(r == 0, 'Expected reward 10 for state 5, action 2, got %d.',r);
    r = reward(1,1);
    assert(r == 0, 'Expected reward 10 for state 1, action 1, got %d.',r);
    r = reward(1,2);
    assert(r == 0, 'Expected reward 10 for state 1, action 2, got %d.',r);
end

%% Test: qTableMaxAction
function qTableMaxActionTest(testCase)
  qTable = 0.1*ones(11,4);
  qTable(5,3) = 10;
  a = qTableMaxAction(qTable,5);
  assert(a == 3,'Expecet max action from state 5 to be 2, got %d.',a);
end

%% Test: qLearningSelectAction
function qLearningSelectActionTest(testCase)
    qTable = 0.1*ones(11,4);
    qTable(5,3) = 10;
    ac = [0 0 0 0];
    for i = 1:1000
        a = qLearningSelectAction(qTable,5);
        ac(a) = ac(a)+1;
    end
    ac = ac/1000;
    error = 0.05;
    assert((ac(3) <= 0.85+error & ac(3) >= 0.85-error),'Expected action 3 selection rate 0.85, got %d.',ac(3));
    assert((ac(1) <= 0.05+error & ac(1) >= 0.05-error),'Expected action 1 selection rate 0.05, got %d.',ac(1));
    assert((ac(2) <= 0.05+error & ac(2) >= 0.05-error),'Expected action 2 selection rate 0.05, got %d.',ac(2));
    assert((ac(4) <= 0.05+error & ac(4) >= 0.05-error),'Expected action 4 selection rate 0.05, got %d.',ac(4));
end

%% Test: qTableUpdate
function qTableUpdateTest(testCase)
    qTable = 0.1*ones(11,4);
    qTable(2,:) = [0 0 0 0];
    for i = 1:100
        qTable = qTableUpdate(qTable,5,3,10,2);
    end
    error = 0.000001;
    assert((qTable(5,3) <= 10.0+error & qTable(5,3) >= 10.0-error),'Expected final Q(5,3) to be 10.0, got %d.',qTable(5,3));
    for i = 1:100
        qTable = qTableUpdate(qTable,5,2,0,5);
    end
    assert((qTable(5,2) <= 9.0+error & qTable(5,2) >= 9.0-error),'Expected final Q(5,2) to be 9.0, got %d.',qTable(5,2));
end

%% Test: qLearningEpisode
function qLearningEpisodeTest(testCase)
    
    qTable = 0.1*ones(11,4);
    qTable(2,:) = [0 0 0 0];
    allSteps = [];
    for i = 1:100
        [steps, qTable] = qLearningEpisode(qTable);
        allSteps = [allSteps steps];
    end
    assert((steps > 0 & steps < 1000),'Expected step count between 0 and 1000, got %d.',steps);
    ls = allSteps(90:100);
    lsm = mean(ls);
    error = 3.0;
    assert((lsm <= 5.0+error & lsm >= 5.0-error),'Expected avg number of steps to be ~5, got %d.',lsm);
    error = 0.000001;
    assert((qTable(5,3) <= 10.0+error & qTable(5,3) >= 10.0-error),'Expected final Q(5,3) to be 10.0, got %d.',qTable(5,3));
end
