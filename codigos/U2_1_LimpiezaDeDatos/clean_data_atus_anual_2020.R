## GET DATA
atus_anual_2020 <- read_csv(".//conjunto_de_datos//atus_anual_2020.csv")

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
# write.csv(atus_anual_2020, row.names = FALSE)
