## GET DATA
atus_anual_2020 <- read_csv("atus_anual_2020.csv")
View(atus_anual_2020)

## DELETE NA cases and replase for the average if exist...

# funtion to delete Na 
delete_na = function(x){ifelse(is.na(x), mfv(x, na_rm = TRUE), x)}

atus_anual_2020_checked = data.frame(sapply(atus_anual_2020,delete_na))

# Caught duplicated values
values <- duplicated(atus_anual_2020_checked)
# Obtained values
atus_anual_2020_no_duplicated = atus_anual_2020_checked[!values,]

atus_anual_2020 = atus_anual_2020_no_duplicated
rm(atus_anual_2020_no_duplicated)
rm(atus_anual_2020_checked)
rm(values)

# Save on CSV
write.csv(atus_anual_2020, row.names = FALSE)
