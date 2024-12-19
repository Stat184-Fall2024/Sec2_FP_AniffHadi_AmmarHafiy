# summary table viewership
summary_table <- ratingViewershipData %>%
  summarize(
    n = n(),
    Min = min(AvgViews_M, na.rm = TRUE),
    Q1 = quantile(AvgViews_M, 0.25, na.rm = TRUE),
    Median = median(AvgViews_M, na.rm = TRUE),
    Q3 = quantile(AvgViews_M, 0.75, na.rm = TRUE),
    Max = max(AvgViews_M, na.rm = TRUE),
    Mean = mean(AvgViews_M, na.rm = TRUE),
    SD = sd(AvgViews_M, na.rm = TRUE)
  )

# Display summary table with kableExtra viewership
summary_table %>%
  kbl(caption = "Summary Statistics for Average Views (in Millions)") %>%
  kable_classic(full_width = FALSE, html_font = "Times New Roman") %>%
  row_spec(0, bold = TRUE)


# summary table 3PA
summary_table <- nbaLeagueAveragesPolished %>%
  summarize(
    n = n(),
    Min = min(`3PA`, na.rm = TRUE),
    Q1 = quantile(`3PA`, 0.25, na.rm = TRUE),
    Median = median(`3PA`, na.rm = TRUE),
    Q3 = quantile(`3PA`, 0.75, na.rm = TRUE),
    Max = max(`3PA`, na.rm = TRUE),
    Mean = mean(`3PA`, na.rm = TRUE),
    SD = sd(`3PA`, na.rm = TRUE)
  )

# Display summary table with kableExtra 3PA
summary_table %>%
  kbl(caption = "Summary Statistics for Three-Points Shot Attempts") %>%
  kable_classic(full_width = FALSE, html_font = "Times New Roman") %>%
  row_spec(0, bold = TRUE)