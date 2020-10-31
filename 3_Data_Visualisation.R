
library(ggplot2)

load("dat_with_features.Rdata")

ggplot(dat, aes(x=nchar, color=author)) +
    geom_histogram(fill="white", alpha=0.5, position="identity") +
    theme_bw()

ggplot(dat, aes(x=nwords, color=author)) +
    geom_histogram(fill="white", alpha=0.5, position="identity") +
    theme_bw()

ggplot(dat, aes(x=nsentences, color=author)) +
    geom_histogram(fill="white", alpha=0.5, position="identity") +
    theme_bw()

ggplot(dat, aes(x=nwords_per_sentence, color=author)) +
    geom_histogram(fill="white", alpha=0.5, position="identity") +
    theme_bw()

ggplot(dat, aes(x=nEmoji, color=author)) +
    geom_histogram(fill="white", alpha=0.5, position="identity") +
    theme_bw()