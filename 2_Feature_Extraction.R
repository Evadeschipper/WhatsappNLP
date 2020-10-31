
library(tokenizers)
library(openNLP)
library(stringr)

load("dat.Rdata")

# Presence of media
dat$media <- ifelse(dat$message == "<Media omitted>", T, F)
dat$message[dat$message == "<Media omitted>"] <- NA

# Number of characters used in message
dat$nchar <- nchar(dat$message)

# Tokenize
words_punctuation <- tokenize_words(dat$message, strip_punct = F, simplify = T)
words <- tokenize_words(dat$message, simplify = T)
sentences <- tokenize_sentences(dat$message, simplify = T)
characters <- tokenize_characters(dat$message, simplify = T)

# Number of words
dat$nwords <- sapply(words, length)

# Number of sentences
dat$nsentences <- sapply(sentences, length)

# Number of words per sentence
dat$nwords_per_sentence <- dat$nwords / dat$nsentences

# Number of emojis
dat$nEmoji[!(is.na(dat$message))] <- sapply(stringr::str_extract_all(dat$message[!(is.na(dat$message))], "[^[:ascii:]]"), length)

save(dat, characters, sentences, words, words_punctuation, file = "dat_with_features.Rdata")
