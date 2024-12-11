library(tidyverse)
library(rvest)
library(dplyr)

# load data
nbaRawList <- read_html(x = "https://www.basketball-reference.com/leagues/NBA_stats_per_game.html") %>%
  html_elements(css = "table") %>%
  html_table()

# view data
nbaLeagueAveragesRaw <- nbaRawList[[2]]

# wrangling data
colnames(nbaLeagueAveragesRaw) <- nbaLeagueAveragesRaw[1, ] 
nbaLeagueAverages <- nbaLeagueAveragesRaw[-1, -1]

nbaLeagueAveragesPolished <- nbaLeagueAverages %>%
  mutate(
    Season = as.numeric(str_sub(Season, -2)), 
    Season = if_else(Season > 46, 1900 + Season, 2000 + Season)  
  )  %>%
  filter(MP != "Per Game", Season != "Season", Season >= 1980) %>%
  select("Season", "FGA", "3PA", "PTS")
  
