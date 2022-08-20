## GET DATA
atus_anual_2018 <- read_csv("atus_anual_2018.csv")
View(atus_anual_2018)

## DELETE NA cases and replase for the average if exist...

# funtion to delete Na 
delete_na = function(x){ifelse(is.na(x), mfv(x, na_rm = TRUE), x)}

atus_anual_2018_checked = data.frame(sapply(atus_anual_2018,delete_na))

# Caught duplicated values
values <- duplicated(atus_anual_2018_checked)
# Obtained values

atus_anual_2018_no_duplicated = atus_anual_2018_checked[!values,]

atus_anual_2018 = atus_anual_2018_no_duplicated
rm(atus_anual_2018_no_duplicated)
rm(atus_anual_2018_checked)
rm(values)

# Save on CSV
write.csv(atus_anual_2018, row.names = FALSE)
