## SATB1 only
satb1_only <- scan('satb1_only_250bp.txt', what = 'character')
satb1_only_at <- rep(0, 501)
for (i in 1:501){
  cnt <- 0
  for (j in 1:length(satb1_only)){
    str_tmp <- substr(satb1_only[j], i, i)
    if (str_tmp %in% c('a', 'A', 't', 'T'))
      cnt <- cnt + 1
  }
  satb1_only_at[i] <- cnt / length(satb1_only) * 100
}

## CTCF only
ctcf_only <- scan('ctcf_only_250bp.txt', what = 'character')
ctcf_only_at <- rep(0, 501)
for (i in 1:501){
  cnt <- 0
  for (j in 1:length(ctcf_only)){
    str_tmp <- substr(ctcf_only[j], i, i)
    if (str_tmp %in% c('a', 'A', 't', 'T'))
      cnt <- cnt + 1
  }
  ctcf_only_at[i] <- cnt / length(ctcf_only) * 100
}

## SATB1 & CTCF
satb1_ctcf <- scan('satb1_ctcf_250bp.txt', what = 'character')
satb1_ctcf_at <- rep(0, 501)
for (i in 1:501){
  cnt <- 0
  for (j in 1:length(satb1_ctcf)){
    str_tmp <- substr(satb1_ctcf[j], i, i)
    if (str_tmp %in% c('a', 'A', 't', 'T'))
      cnt <- cnt + 1
  }
  satb1_ctcf_at[i] <- cnt / length(satb1_ctcf) * 100
}

## Random control
random <- scan('random_250bp.txt', what = 'character')
random_at <- rep(0, 501)
for (i in 1:501){
  cnt <- 0
  for (j in 1:length(random)){
    str_tmp <- substr(random[j], i, i)
    if (str_tmp %in% c('a', 'A', 't', 'T'))
      cnt <- cnt + 1
  }
  random_at[i] <- cnt / length(random) * 100
}

dat <- rbind(data.frame(pos = -250:250, AT_content = satb1_only_at, idx = 'satb1_only'),
             data.frame(pos = -250:250, AT_content = ctcf_only_at, idx = 'ctcf_only'),
             data.frame(pos = -250:250, AT_content = satb1_ctcf_at, idx = 'satb1_ctcf'),
             data.frame(pos = -250:250, AT_content = random_at, idx = 'random'))

library(ggplot2)
library(ggthemes)

p <- ggplot(dat, aes(pos, AT_content, color = idx)) + geom_smooth(method = 'loess', span = 0.05, se = FALSE) + 
     scale_x_continuous(breaks = seq(-250, 250, 50)) + scale_y_continuous(limits = c(45, 65), breaks = seq(45, 65, 5)) + theme_few()
ggsave(p, file = "satb1_ctcf_AT_content_250bp_smooth.pdf")
