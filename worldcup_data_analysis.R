# This r script will use piping and dplyr to analyse the football world cup data. 
#In addition we are creating a sample plot out of this dataset to visualize.

#Load necessary packages
if (!require("dplyr")) {
  install.packages("dplyr")
}
library(dplyr)


# Download and load the World Cup dataset
download.file(url = "https://projects.fivethirtyeight.com/soccer-api/international/2022/wc_matches.csv", destfile = "WorldCup.csv")
WorldCup <- read.csv("WorldCup.csv")

# Preview the dataset
head(WorldCup)

# create a random sample of the data & save as csv
mysample <- sample_n(WorldCup, size = 15, replace = FALSE)
write.csv(mysample, "SampleWorldCup.csv", row.names = FALSE)

#---------- Piping functions to manipulate the sample data ---------#

# renaming a column, filtering and getting dimensions
piping <- mysample %>% 
  rename(SoccerPowerIndex = spi1) %>%
  filter(SoccerPowerIndex > 60) %>%
  summarise(count = n(), mean_spi = mean(SoccerPowerIndex)) %>%
  print()

# Revise code chunk using piping
mysample2 <- mysample %>%
  arrange(date) %>%
  filter(spi1 < 80) %>%
  rename(Index1 = spi1, Index2 = spi2) %>%
  select(Index1, Index2, team1, team2) %>%
  summary() %>%
  print()

#---------- Additional example operations -------------#

# Calculate the average Soccer Power Index for both teams
average_spi <- mysample %>% 
  mutate(average_spi = (spi1 + spi2) / 2) %>%
  select(date, team1, team2, average_spi) %>%
  arrange(desc(average_spi)) %>%
  print()

# Group by team and summarize data
team_summary <- mysample %>% 
  group_by(team1) %>%
  summarise(average_spi1 = mean(spi1, na.rm = TRUE),
            games_played = n()) %>%
  arrange(desc(average_spi1)) %>%
  print()

# Check the structure and summary of data
str(WorldCup)
summary(WorldCup)

# Data cleaning: Check for missing values
sum(is.na(WorldCup))

colnames(WorldCup)

# Data exploration: Summary of numeric fields
WorldCup %>% summarise(across(where(is.numeric), list(mean = ~mean(., na.rm = TRUE), sd = ~sd(., na.rm = TRUE))))

# Grouped analysis: Average goals by team
team_stats <- WorldCup %>%
  group_by(team1) %>%
  summarise(total_goals = sum(score1, na.rm = TRUE),  # Using the correct column name
            matches_played = n()) %>%
  arrange(desc(total_goals))

print(team_stats)

# Combined total goals by each team (both as team1 and team2)
total_team_stats <- WorldCup %>%
  mutate(team = team1, goals = score1) %>%
  bind_rows(WorldCup %>% mutate(team = team2, goals = score2)) %>%
  group_by(team) %>%
  summarise(total_goals = sum(goals, na.rm = TRUE), matches_played = n()) %>%
  arrange(desc(total_goals))

print(total_team_stats)

library(ggplot2)

# Visualization: Goals distribution
ggplot(team_stats, aes(x = reorder(team1, total_goals), y = total_goals)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Total Goals by Team", x = "Team", y = "Total Goals")
