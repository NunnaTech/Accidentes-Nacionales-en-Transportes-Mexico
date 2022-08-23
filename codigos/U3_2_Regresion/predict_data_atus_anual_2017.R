atus_anual_2017 = read_csv(file = ".//conjunto_de_datos//datos_tratados//atus_2017.CSV")
atus_anual_data = atus_anual_2017
total_registros = nrow(atus_anual_data)
anio = "(2017)"

accidentes_por_tipo_2017 = atus_anual_2017 %>% 
  group_by(TIPACCID) %>% 
  summarise(total = length(TIPACCID)) %>% 
  arrange(desc(total))
accidentes_por_tipo_2017