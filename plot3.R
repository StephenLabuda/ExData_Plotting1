library("ggplot2")
read <- readLines("household_power_consumption.txt")
pts <- c()
for(i in 66638:69517){
  splits <- strsplit(read[i], ";")
  pts <- c(pts, splits)
}
date <- c()
time <- c()
global_active_power <- c()
global_reactive_power <- c()
voltage <- c()
global_intensity <- c()
sub_metering_1 <- c()
sub_metering_2 <- c()
sub_metering_3 <- c()
for(i in 1:length(pts)){
  date <- c(date, pts[[i]][1])
  time <- c(time, pts[[i]][2])
  global_active_power <- c(global_active_power, as.numeric(pts[[i]][3]))
  global_reactive_power <- c(global_reactive_power, as.numeric(pts[[i]][4]))
  voltage <- c(voltage, as.numeric(pts[[i]][5]))
  global_intensity <- c(global_intensity, as.numeric(pts[[i]][6]))
  sub_metering_1 <- c(sub_metering_1, as.numeric(pts[[i]][7]))
  sub_metering_2 <- c(sub_metering_2, as.numeric(pts[[i]][8]))
  sub_metering_3 <- c(sub_metering_3, as.numeric(pts[[i]][9]))
}
weekday <- c()
for(i in 1:length(date)){
  if(date[1] == "1/2/2007"){
    weekday <- c(weekday, "Thu")
  }else{
    weekday <- c(weekday, "Fri")
  }
}
plot(x = 1:length(weekday), y = sub_metering_1, type = "l", col = "black", 
     ylab = "Energy sub metering", xlab = "")
points(x = 1:length(weekday), y = sub_metering_2, type = "l", col = "red")
points(x = 1:length(weekday), y = sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("sub_metering_1,", "sub_metering_2", 
                              "sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
