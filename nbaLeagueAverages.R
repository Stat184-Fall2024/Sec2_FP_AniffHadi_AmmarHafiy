library(tidyverse)
library(rvest)
library(dplyr)
library(ggplot2)

# Load data
nbaRawList <- read_html(x = "https://www.basketball-reference.com/leagues/NBA_stats_per_game.html") %>%
  html_elements(css = "table") %>%
  html_table()

# View data
nbaLeagueAveragesRaw <- nbaRawList[[2]]

# Wrangling data
colnames(nbaLeagueAveragesRaw) <- nbaLeagueAveragesRaw[1, ] 
nbaLeagueAverages <- nbaLeagueAveragesRaw[-1, -1]

nbaLeagueAveragesPolished <- nbaLeagueAverages %>%
  mutate(
    Season = as.numeric(str_sub(Season, -2)), 
    Season = if_else(Season > 46, 1900 + Season, 2000 + Season),
    `FGA` = as.numeric(`FGA`),
    `3PA` = as.numeric(`3PA`),
    `PTS` = as.numeric(`PTS`)
  )  %>%
  filter(MP != "Per Game", Season != "Season", Season >= 1980) %>%
  select("Season", "FGA", "3PA", "PTS") %>%
  mutate(
    `3PAr` = as.numeric(`3PA`) / as.numeric(FGA)  # Create Three-Point Attempt Rate (3PAr)
  )

# Plot
ggplot(
  data = nbaLeagueAveragesPolished,
  mapping = aes(
    x = Season,
    y = `3PA`
  )
) + geom_line() +
  labs(
    x = "Year",
    y = "Average 3 Pointer per Game",
    title = "Average 3 Pointer Attempt per Game Throughout the Years"
  ) +
  theme_minimal()
  
