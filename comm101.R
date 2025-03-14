library(marinecs100b)


# Distributions of continuous variables -----------------------------------

# P1 What type of visualization is appropriate for a single continuous variable?
# A histogram would be a good visual as it shows the distribution of a single
# value is spread across different ranges.

# P2 What type of visualization is appropriate for a continuous variable across
# categorical variables?
# A boxplot would be a good option because it compares and contrasts the median
#quartiles and outliers and would be efficient in comparing categorial variables.


# P3 Use ggplot to visualize the distribution of sea surface salinity. Save your
# figure as “comm101p3.png”.
library(ggplot2)

ggplot(woa_sal, aes(x = salinity)) +
  geom_histogram() +
  labs(title = "Distribution of Sea Surface Salinity",
       x = "Sea Surface Salinity",
       y = "Count")

ggsave("comm101p3.png")

# P4 Use ggplot to visualize the distribution of sea surface salinity by ocean
# basin. Save your figure as “comm101p4.png”.
ggplot(woa_sal, aes(x = salinity, ocean)) +
  labs(title = "Distribution of Sea Surface Salinity",
       x = "Sea Surface Salinity",
       y = "Count") +
  geom_boxplot()
ggsave('comm101p4.png')


# P5 Interpret your figures from P3 and P4. What patterns do you notice?

#The figure I made in P3 is a histogram because it compares one continuous variables
#while in P4 I made a box and whisker plot because this figure compares one continuous and one
#categorization variable. A pattern I notice is that the sea surface salinity for
#the Mediterranean Region is much saltier than the other ocean basins.

# P6 Critique your figures from P3 and P4. What changes would highlight the
# patterns you interpreted in P5? You don’t need to write code for these
# changes, just describe them verbally.

#In P4 (Box-and-Whisker Plot), I could improve clarity by ordering the categories
#logically (e.g., from lowest to highest median values) to make trends easier to interpret.
#Additionally adding different colors for each category could enhance readability. For both
#graphs I would improve clarity by changing the background color to white and improving
#the overall quality of the graph by creating clear titles.

# Relationships between continuous variables ------------------------------

# P7 Visualize the relationship between salinity and latitude by ocean basin.
scatter plot to measure continues varaibles (salinity and latitude) and use color
to categorize ocean basin

okabe_ito <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2")

ggplot(woa_sal, aes(x = salinity,
                    y= latitude,
                    fill = ocean,
                    shape = ocean)) +
  geom_point() +
  scale_fill_manual(values = okabe_ito) +
  scale_shape_manual(values = 21:25) +
  labs(title = "Distribution of Sea Surface Salinity",
       x = "Sea Surface Salinity",
       y = "Count",
       fill = "Species",
       shape = "Species") +
  theme_bw() +
  theme(legend.position = "inside",
        legend.position.inside = c(0.99, 0.01),
        legend.justification = c(1,0))
ggsave('comm101p4.png')




# P8 Edit your figure from P7 to improve its interpretability in at least one of
# the following categories: visually differentiating the oceans, appropriateness
# of the labels, or use of negative space. Save this figure as “comm101p8.png”.


#**This is a scatter plot which I thought would be the correct graph type but the points
#overlapped a lot

#I fixed the range to make the graph more centered and changed the position of the legend as well as edited
#shapes and colors of the graph
ggplot(woa_sal, aes(x = salinity,
                    y = latitude,
                    fill = ocean,
                    shape = ocean)) +
  geom_jitter(width = 0.2, height = 0.2, size = 2.5, alpha = 0.7) +  # Added jitter and transparency
  scale_fill_manual(values = okabe_ito) +
  scale_shape_manual(values = 21:25) +
  labs(title = "Distribution of Sea Surface Salinity",
       x = "Sea Surface Salinity",
       y = "Latitude",  # Fixed from "Count" to "Latitude"
       fill = "Ocean",  # Fixed legend label to match data
       shape = "Ocean") +
  scale_x_continuous(limits = c(25, 40)) +  # Restrict x-axis from 25 to 40
  theme_bw() +
  theme(legend.position = c(0.05, 0.05),  # Moves legend to bottom-left corner
        legend.justification = c(0, 0),  # Aligns legend inside the plot area
        legend.background = element_rect(fill = "white", color = "black"))

ggsave("comm101p8.png")


# *This is a box plot which looks a lot cleaner and is much more legible but I feel like its the
#wrong graph to represent the data given that we are dealing with two continues and one categorical variables.
ggplot(woa_sal, aes(x = salinity,
                    y = latitude,
                    fill = ocean,
                    shape = ocean)) +
  geom_boxplot() +
  scale_fill_manual(values = okabe_ito) +
  scale_shape_manual(values = 21:25) +
  labs(title = "Distribution of Sea Surface Salinity",
       x = "Sea Surface Salinity",
       y = "Latitude",
       fill = "Ocean",
       shape = "Ocean") +
  scale_x_continuous(limits = c(25, 40)) +  # Restrict x-axis from 25 to 40
  theme_bw() +
  theme(legend.position = c(0.002, 0.03),  # Moves legend to bottom-left corner
        legend.justification = c(0, 0),  # Aligns legend inside the plot area
        legend.background = element_rect(fill = "white", color = "black"))  # Improves readability

ggsave("comm101p8.png")

