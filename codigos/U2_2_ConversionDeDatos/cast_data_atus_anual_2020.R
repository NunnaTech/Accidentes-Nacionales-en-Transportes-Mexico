atus_anual_2020

## LOCATION

### GET DATA
states <- read.csv("tc_entidad.csv", header = TRUE,sep = ",")
municipality <- read.csv("tc_municipio.csv")


### CAST ID FIELDS TO INTEGER
atus_anual_2020$ID_ENTIDAD <- as.integer(atus_anual_2020$ID_ENTIDAD)
atus_anual_2020$ID_MUNICIPIO <- as.integer(atus_anual_2020$ID_MUNICIPIO)

### DELETE USELESS COLUMS
municipality <- select(municipality,-MM)

### QUERY JOIN( States - Municipality )
locations <- inner_join(states, municipality, by = NULL)

### DELETE USELESS COLUMS AGAIN...
locations <- select(locations,-MM)

### QUERY JOIN(Municipality - Atus_anual_2021_merge)
atus_anual_2020_merge <- inner_join(locations, atus_anual_2020, by = NULL)

### DELETE USELESS COLUMS AGAIN...
#atus_anual_2020_merge <- select(atus_anual_2020_merge,-MM)

## DAY

### GET DATA
days  <- read.csv("tc_dia.csv", header = TRUE,sep = ",")


### CAST ID FIELDS TO INTEGER
atus_anual_2020_merge$ID_DIA <- as.integer(atus_anual_2020_merge$ID_DIA)

### DELETE USELESS COLUMNS
days <- select(days,-MM)

### QUERY JOIN(Hours - Atus_anual_2021_merge)
atus_anual_2020_merge <- inner_join(days, atus_anual_2020_merge, by = NULL)

### CHANGE COLUMNS
atus_anual_2020_merge$ID_DIA <- atus_anual_2020_merge$DESC_DIA
atus_anual_2020_merge <- select(atus_anual_2020_merge,-DESC_DIA)


## HOUR

### GET DATA
hours  <- read.csv("tc_hora.csv", header = TRUE,sep = ",")


### CAST ID FIELDS TO INTEGER
atus_anual_2020_merge$ID_HORA <- as.integer(atus_anual_2020_merge$ID_HORA)

### DELETE USELESS COLUMS
hours <- select(hours,-MM)

### QUERY JOIN(Hours - Atus_anual_2021_merge)
atus_anual_2020_merge <- inner_join(hours, atus_anual_2020_merge, by = NULL)

### CHANGE COLUMNS
atus_anual_2020_merge$ID_HORA <- atus_anual_2020_merge$DESC_HORA
atus_anual_2020_merge <- select(atus_anual_2020_merge,-DESC_HORA)

## MINUTES

### GET DATA
minutes  <- read.csv("tc_minuto.csv", header = TRUE,sep = ",")

### CAST ID FIELDS TO INTEGER
atus_anual_2020_merge$ID_MINUTO <- as.integer(atus_anual_2020_merge$ID_MINUTO)

### DELETE USELESS COLUMS
minutes <- select(minutes,-MM)

### QUERY JOIN(Hours - Atus_anual_2021_merge)
atus_anual_2020_merge <- inner_join(minutes, atus_anual_2020_merge, by = NULL)

### CHANGE COLUMNS
atus_anual_2020_merge$ID_MINUTO <- atus_anual_2020_merge$DESC_MINUTO
atus_anual_2020_merge <- select(atus_anual_2020_merge,-DESC_MINUTO)


## AGE

### GET DATA
ages  <- read.csv("tc_edad.csv", header = TRUE,sep = ",")

### CAST ID FIELDS TO INTEGER
atus_anual_2020_merge$ID_EDAD <- as.integer(atus_anual_2020_merge$ID_EDAD)

### DELETE USELESS COLUMS
ages <- select(ages,-MM)

### QUERY JOIN(Hours - Atus_anual_2021_merge)
atus_anual_2020_merge <- inner_join(ages, atus_anual_2020_merge, by = NULL)

### CHANGE COLUMNS
atus_anual_2020_merge$ID_EDAD <- atus_anual_2020_merge$DESC_EDAD
atus_anual_2020_merge <- select(atus_anual_2020_merge,-DESC_EDAD)


# Cast to integer
View(atus_anual_2020_merge)

     