## GET DATA
atus_anual_2017 <- read_csv("atus_anual_2017.csv")
View(atus_anual_2017)

## DELETE NA cases and replase for the average if exist...

# funtion to delete Na 
delete_na = function(x){ifelse(is.na(x), mfv(x, na_rm = TRUE), x)}

atus_anual_2017_checked = data.frame(sapply(atus_anual_2017,delete_na))

# Caught duplicated values
values <- duplicated(atus_anual_2017_checked)

# Obtained values
atus_anual_2017_no_duplicated = atus_anual_2017_checked[!values,]

atus_anual_2017 = atus_anual_2017_no_duplicated
rm(atus_anual_2017_no_duplicated)
rm(atus_anual_2017_checked)
rm(values)

# Save on CSV
write.csv(atus_anual_2017, row.names = FALSE)
