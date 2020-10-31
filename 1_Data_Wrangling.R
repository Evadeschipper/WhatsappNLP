
# https://unicode.org/emoji/charts/full-emoji-list.html

txt <- readLines("Janne.txt", encoding = "UTF-8")
txt <- txt[-1]

# Extract timestamp
timestamp <- as.POSIXct(substr(txt, 1, 17), format = "%d/%m/%Y, %H:%M")

message <- rep(NA, length(txt))
author <- rep(NA, length(txt))

# Split the strings into date/time, author, and message. 
splitstr <- regmatches(txt, regexpr("(?<=- )([A-z0-9_ ]*)(?=:)", txt, perl = TRUE), invert = NA) 

for (m in 1:length(txt)){
    if (length(splitstr[[m]]) == 3){
        author[m] <- splitstr[[m]][2]
        message[m] <- substr(splitstr[[m]][3], 3, nchar(splitstr[[m]][3]))
    } else {
        message[m] <- splitstr[[m]][1]
    }
}

# create dataframe
dat <- data.frame(timestamp, author, message, stringsAsFactors = F)

# Presence of media
dat$media <- ifelse(dat$message == "<Media omitted>", T, F)
dat$message[dat$message == "<Media omitted>"] <- NA

write.table(dat, file = "dat.csv", row.names = F, sep = "##@@##")
save(dat, file = "dat.Rdata")
