Optimization by Simulated Annealing
Physics of Spin Glasses - 
a spin glass is a magnetic material that is disordered 
(similar to glass in that the spins are all disordered like glass molecules are)
if you took a magnetic material, cooling it quickly gets you to a higher energy state
rather than if you cooled it slower. Slower cooling gets it to a lower energy state
samurai sword example with cooling, the line on the sword due to cooling

finding the lowest energy state of a spin glass (computationally modeling)
starting with a random orientation of spins, find the energy E for that
change a spin, if E goes down, keep the change
but if E increases, keep that change accoring to Boltzmann's exp(-dE/kT), where T is "temperature", dE = Eflip - E
when temperature is high, the system can get to some unfavorable states, it just gets less likely as temperature decreases
%% if exp(dE/kT) > rand(0 to 1) then keep the change. k is set to 1.
the system runs through a bunch of flips and tests the energies. Then the temp drops by some percentage until energy stops dropping
getting the lowest possible energy is essentially a "cost function"
in limit of infinitely slow cooling, you will always reach the min cost

Traveling Salesman Problem
Find the shortest path for a Traveling Salesman between N cities with coordinates x,y
The number of combinations for the path is (N-1)!
The cost function is the total path length for the 50 states round trip
sum of r = ((x(k=N) - x(k-1))^2 + (y(k=N) - y(k-1))^2)^1/2

Define "temperature" T. Maybe have T be 5 or so times dcost then decrease as loops go on
Find cost old
Exchange the order of 2 cities
find cost new then dcost = new - old
if dcost is negative then keep
if dcost if positive keep if exp(-dcost/T) > rand(0 to 1)

maybe continue loop until dcost is only negative so many times
have y vs x plot periodically to see