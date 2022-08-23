atus_anual_2021 = read_csv(file = ".//conjunto_de_datos//datos_tratados//atus_2021.CSV")
atus_anual_data = atus_anual_2021
total_registros = nrow(atus_anual_data)
anio = "(2021)"

accidentes_por_tipo_2021 = atus_anual_2021 %>% 
  group_by(TIPACCID) %>% 
  summarise(total = length(TIPACCID)) %>% 
  arrange(desc(total))
accidentes_por_tipo_2021
