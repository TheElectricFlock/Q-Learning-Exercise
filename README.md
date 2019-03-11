# Q-Learning-Exercise
An example of a successful Q learning algorithm. This project was made as part of my Intelligent Systems Module.
This Example implements a Q-learning algorithm on a grid world of varying states, as shown by the diagram below.
![GridWorld](https://github.com/TheElectricFlock/Q-Learning-Exercise/blob/master/GridWorld.png)

## Usage
To run a single episode, i.e. one traversal of the world from start state to goal, run the command:
```Matlab
qLearningEpisode(qTableInit())
```
This will return the number of steps taken. To run a trial, in this case 100 episodes, use the command:
```Matlab
qLearningTrial()
```
This will return an array containing the number of steps taken for each episode. This can be plotted onto a graph with the command:
```Matlab
plot(qLearningTrial())
```
To run an experiment, i.e, 50 trials, run the command:
```Matlab
qLearningExperiment()
```
This function returns a 2D array containing the number of steps taken for each episode in each trial. The function also plots the mean and standard
deviation of the number of steps taken for each episode across trials.

This Example also has some unit tests which you can run with the command
```Matlab
runtests('qLearningTest')
```
