set I; #set for location points



var y { i in I }  binary; # binary varialbe for facilicty i if open 1 else 0

var z { i in I, j in I } binary;# binary varialbe if facilicty i serve to location j then 1 else 0

var x { i in I, j in I } >= 0; # perportion of demand satisfied 

param t { i in I }; # as the number of weekly bulk meal-delivery trips needed by location j ∈ I.

param f { i in I }; # e fixed weekly cost to operate a cloud kitchen i

#param y { i in I };

param d{i in I,j in I}; # the distance between stations i and j a

#objective function
minimize cost: sum{ i in I , j in I }(t[j]*z[i,j]*d[i,j]*x[i,j]) + sum{ i in I}(f[i]*y[i]);



#constrains
subject to DepotUpper:sum {i in I}y[i] <= 15;

subject to DepotLower:sum {i in I}y[i] >= 10;

subject to ForMaxLoc{i in I , j in I}: x[i, j]<= y[i];

subject to ForMaxStat{i in I , j in I}: z[i, j]<= y[i];

subject to MaxStationLimit{i in I}: sum{j in I}z[i, j]<= 15*y[i];

subject to ConXZ{i in I,j in I}: x[i,j] <= z[i,j];


subject to MaxDemand{i in I,j in I}: x[i,j] <= 0.5;

subject to TotalDemand{j in I}: sum{i in I}x[i, j] = 1;
