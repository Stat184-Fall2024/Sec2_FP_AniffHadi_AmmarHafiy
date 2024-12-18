# Combine the two datasets by aligning the x-axis attribute (Season/Year)
combinedData <- nbaLeagueAveragesPolished %>%
  rename(Year = Season) %>% 
  inner_join(ratingViewershipData, by = "Year") 

# Plot both lines
ggplot(data = combinedData) +
  geom_line(aes(x = Year, y = `3PA`, color = "Average 3PA per Game")) +
  geom_line(aes(x = Year, y = AvgViews_M, color = "Average Views (Million)")) +
  scale_y_continuous(
    name = "Average 3PA per Game",
    sec.axis = sec_axis(~ ., name = "Average Views (Million)")
  ) +
  labs(
    x = "Year",
    title = "NBA Trends: Three-Point Attempts vs. Finals Viewership"
  ) +
  scale_color_manual(
    name = "Legend",
    values = c("Average 3PA per Game" = "blue", "Average Views (Million)" = "red")
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")
