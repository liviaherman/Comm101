library(palmerpenguins)
library(ggplot2)

# Make the following changes to this basic boxplot.
# 1) Change the grey background to white
ggplot(penguins, aes(island, body_mass_g)) +
  geom_boxplot() +
  theme_bw()

# 2) Clean up the axis labels
ggplot(penguins, aes(island, body_mass_g)) +
  labs (x = "Island",
        y = "Body mass (g)") +
  geom_boxplot() +
  theme_bw()

# 3) Make the color vary by island
ggplot(penguins, aes(island, body_mass_g)) +
  labs (x = "Island",
        y = "Body mass (g)",
        color = "Island") +
  geom_boxplot() +
  theme_bw()

# 4) Choose a color palette that you enjoy!
okabe_ito <- c("#B39DDB", "#BAE1FF", "#ACD8A8", "#F0E442", "#FFB347")

ggplot(penguins, aes(island, body_mass_g, color = island)) +
  labs(x = "Island",
       y = "Body mass (g)",
       color = "Island") +
  geom_boxplot() +
  scale_color_manual(values = okabe_ito) +  # Apply custom color palette here
  theme_bw()



ggplot(penguins, aes(island, body_mass_g)) +
  geom_boxplot()

