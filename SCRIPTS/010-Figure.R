###------Figure-----
## @knitr Figure


a<- ggplot(data = dat, aes(x = ElectionYear, y = AGE, color = Association, label = l)) +
  geom_smooth(span = 1, aes(fill = Association)) +
  geom_point(aes(shape = Sex, size = Sex)) +
  # scale_colour_brewer(palette = "Dark2") +
  # scale_fill_brewer(palette = "Dark2") +
  scale_size_manual(values = c(2.5,.75)) +
  geom_text_repel(data = subset(dat, !l == ""),
                  size=2,
                  nudge_x = 2060 - subset(dat, !l == "")$ElectionYear,
                  direction    = "y") +
  annotate("text", x=1883, y = 83, label = paste(fems2, sep="", collapse=""), size = 2, hjust = 0) +
  ylim(38,85) +
  # geom_rug(data = women,sides="b", aes(color = Association, linetype=Association), alpha=0.7, position = "jitter", size = 0.75) +
  scale_x_continuous(breaks = seq(1880, 2020, 20), limits = c(1880,2060), expand= c(0,0)) +
  coord_capped_cart(bottom='right') +
  theme(legend.position="bottom") +
  labs(x = "Presidential Year",
       y = "Age")

legend <- get_legend(a)

dat2 <- dat %>% filter(Sex == "Female")
b <- ggplot(data = dat2, aes(x = ElectionYear, y = AGE, color = Association, label = l)) +
  geom_smooth(data=dat, span = 1, fill = "gray", color = "gray", se= FALSE) +
  geom_point(data = dat, aes(x = ElectionYear, y = AGE, shape = Sex), color = "grey", alpha = 0.5) +
  geom_smooth(span = 1, aes(fill = Association)) +
  geom_point(aes(shape = Sex, size = Sex)) +
  facet_wrap(~ Association) +
  scale_size_manual(values = 1.5) +
  # geom_text_repel(data = subset(dat, !l == ""),
  #                 size=2,
  #                 nudge_x = 2060 - subset(dat, !l == "")$ElectionYear,
  #                 direction    = "y") +
  # annotate("text", x=1883, y = 83, label = paste(fems2, sep="", collapse=""), size = 2, hjust = 0) +
  ylim(38,85) +
  # geom_rug(data = women,sides="b", aes(color = Association, linetype=Association), alpha=0.7, position = "jitter", size = 0.75) +
  scale_x_continuous(breaks = seq(1880, 2020, 20), limits = c(1880,2025), expand= c(0,0)) +
  coord_capped_cart(bottom='right') +
  guides(color = FALSE) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust=1)) +
  labs(x = "Presidential Year",
       y = "Age")

plot_grid(a+ theme(legend.position="none"),
          b+ theme(legend.position="none"),
          legend,
          ncol=1, rel_heights = c(1,0.3, 0.1),
          labels = c("a","b"))