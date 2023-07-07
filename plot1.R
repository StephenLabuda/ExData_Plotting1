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
hist(global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")