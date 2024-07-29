library(tidyverse)
library(HistData)
data("GaltonFamilies")

set.seed(1983)

# some basic grouping and analysis
galton_heights <- GaltonFamilies %>%
  group_by(family) %>%
  slice_sample(n = 1)  %>% 
  ungroup() %>%
  group_by(gender)

# summary
galton_heights %>%
  summarize(mean(father), sd(father), mean(childHeight), sd(childHeight))

# correlation
galton_heights %>%
  summarize(rho_father = cor(father, childHeight), rho_mother = cor(mother, childHeight))

# plot showing father child relationship
galton_heights %>% ggplot(aes(father, childHeight)) +
  geom_point(alpha = 0.5)

