library(tidyverse)

# Read in data previously cleaned
ohldf <- read_csv("ohldata_seasons08-00.csv")

# Select columns required
# Filter only players who had >0 ppg
ohldf_parsed <- ohldf %>%
  select(player, pos, `DY+/-`, ppg, age.group) %>%
  filter(ppg >0)

# Pivot wide so I can see how players performed in seasons
# Analyze ev.ppg from DY-1 to DY
trend <- ohldf_parsed %>%
  arrange(player) %>%
  select(pos, age.group, player, `DY+/-`, ppg) %>%
  pivot_wider(names_from  = `DY+/-`,
              values_from = ppg) %>%
  select(pos, age.group, player, `DY-2`, `DY-1`, `DY`,
         `DY+1`, `DY+2`, `DY+3`)
