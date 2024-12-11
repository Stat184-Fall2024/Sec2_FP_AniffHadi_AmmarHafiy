# load the packages

library(dplyr)
library(rvest)
library(ggplot2)
library(tidyverse)

# load data
url <- "https://en.wikipedia.org/wiki/NBA_Finals_television_ratings"
ratingViewershipDataset <- rvest::read_html(x = url) %>%
  html_elements(css = "table") %>%
  html_table()

# view data
ratingViewershipRaw <- ratingViewershipDataset[[4]]
view(ratingViewershipRaw)

# wrangling data
ratingViewershipData <- ratingViewershipRaw %>%
  select(
    "Year",
    "Network",
    "Avg",
    "Game 1",
    "Game 2",
    "Game 3",
    "Game 4",
    "Game 5",
    "Game 6"
    ) %>%
  filter(as.numeric(Year) > 1985) %>%
  mutate(
    Year = as.numeric(str_remove(Year, "\\[.*\\]")),
    AvgRating = str_extract(Avg, "^[^\\(]+"),
    AvgViews_M = str_extract(Avg, "\\(([^\\)]+)\\)") %>%
      str_remove_all("[\\(\\)]") %>%
      str_remove("M Viewers|MViewers|MHouseholds") %>%
      as.numeric()
  ) %>%
  select(
    Year,
    Network,
    AvgViews_M
  )

ggplot(
  data = ratingViewershipData,
  mapping = aes(
    x = Year,
    y = AvgViews_M,
  )
) +
  geom_line() +
  labs(
    x = "Year",
    y = "Average Views (Million)",
    title = "Average Finals Views Throughout the Years"
  ) +
  theme_minimal()
