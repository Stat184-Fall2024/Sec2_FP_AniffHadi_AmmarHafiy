# NBA Viewership Over The Years

Introduction: This project examines the decline in the average viewership and ratings of the NBA Finals over the years, exploring the factors contributing to this trend. For instance, in 1998, the NBA Finals averaged 29.04 million viewers, whereas in 2024, the average viewership dropped to 11.31 million.

Implementation: 
1. Data collection: The data was sourced from Basketball Reference, using the rvest library to scrape the statistics table. The raw data included league averages for various metrics per game for all seasons.
2. Data wrangling: Using the tidyverse package, the data was processed as follows:
   
   i) Renamed columns using the first row for better clarity.
   
   ii) Filtered out unnecessary rows and restricted the dataset to seasons from 1980 onwards.
   
   iii) Converted the Season column into numeric format, distinguishing between 20th and 21st centuries.
   
   iv) Selected relevant columns: Season, FGA, 3PA, and PTS.
4. Challenges and Solutions:
   
   i) Issue: Handling ambiguous century notation in the Season column (e.g., "98" could mean 1998 or 2098).
   
      Solution: Assumed seasons with a value greater than 46 belong to the 20th century (1900s) and the rest to the 21st century (2000s).
   
   ii) Issue: The presence of unwanted rows (e.g., headers repeated within the table).
   
      Solution: Applied filter() to exclude rows containing "Per Game" or "Season".
   
Result/Conclusion: The processed data revealed significant trends in NBA gameplay:

   i) A noticeable increase in three-point attempts (3PA) over time, indicating the league's shift toward perimeter shooting.
                  
   ii) Field goal attempts (FGA) and points scored (PTS) have also evolved, reflecting changes in game pace and scoring efficiency.

Contact: For questions, feel free to reach out via email: amh8394@psu.edu or ama8594@psu.edu
