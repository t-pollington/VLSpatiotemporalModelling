rm(list = ls())
studytime = 36 #mo. 12mo beforehand and then interruption in first yr and see what happens in second year
t2 = studytime - 12; t1 = t2 - studytime + 1;
state = array(data = NA, dim = c(1,studytime), dimnames = list("Rx.rate",seq.int(t1,t2))) # district-specific Rx rate

# set rate----
state[1:11] = 20:10 # descending Rx.rate in preceding 11 mo as case count falls
state[(1:12 + abs(t1))] = 0 # interruption
Rx.thresh = max(state[1:11]) # Rx.thresh defined as maximum counts seen in last 11 mo
plot(x = strtoi(colnames(state)), y = state, type = "o", yaxt = "n", xaxs = "i",
     yaxs = "i", xlab = "time (mo)", ylab = "treatment rate (cases/mo)", 
     ylim = c(0,Rx.thresh+2), col = "blue")
axis(2,pos = 0)
abline(h = Rx.thresh, lty = 2)