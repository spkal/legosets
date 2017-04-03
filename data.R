library("dplyr")
library("ggplot2")
library("lego")
legosets <- legosets %>%
  mutate(PricePerPiece = USD_MSRP / Pieces)

# Drop: Education, Mindstorm, Power Functions themes
# others?
DropThemes <- read.table("droptheme.txt", sep="\n", stringsAsFactors=FALSE)
names(DropThemes) <- "Theme"

legosets <- legosets %>%
  anti_join(DropThemes, by="Theme")
