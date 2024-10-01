
library(dplyr)
library(tidyr)
library(palmerpenguins)
library(ggplot2)

#Get data
penguins_data <-penguins

write.csv(penguins_data,"data/penguins.csv",row.names = FALSE)

head(penguins)
str(penguins)

new_object <- penguins_data

#chain multiple lines of code together
new_object <- penguins_data |> head()
new_object

#subsetting data
#select (pull out columns by name or patterns)

penguin_locations <- penguins_data |> select(species, island)
penguin_mm_measurments <- penguins_data |> select(ends_with("mm"))

#Filter operates on rows

adelie_penguins <- penguins_data |> filter(species =="Adelie")

#adding or modifying columns - "mutate"

#Add column with data about ratio of bill length by depth
penguins_ratio <- penguins_data |> mutate(bill_length_depth_ratio = bill_length_mm/ bill_depth_mm)

#add column with bill length rounded
penguins_rounded <- penguins_data |> mutate(bill_length_mm_rounded = round(bill_length_mm, digits =2))

#modify existing penguins_rounded with rounded values 
penguins_rounded <- penguins_data |> mutate(across(ends_with("mm"), round))

#instead of rounding columns, add new column with rounded values, titiled rounded, and leave original values alone
penguins_rounded <- penguins_data |> mutate(across(ends_with("mm"), round, .names = "{.col}_rounded"))

#generate summaries of dataset (summary statistics)
#split-apply-combine

penguin_species_totals <- penguins_data |> group_by(species, island) |> summarize(total_penguins = n(), total_penguin_biomass = sum(body_mass_g, na.rm = TRUE)) |> ungroup()

## intermediate r programming


