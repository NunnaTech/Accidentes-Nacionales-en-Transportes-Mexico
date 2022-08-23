atus_anual_2018 = read_csv(file = ".//conjunto_de_datos//datos_tratados//atus_2018.CSV")
atus_anual_data = atus_anual_2018
total_registros = nrow(atus_anual_data)
anio = "(2018)"

accidentes_por_tipo_2018 = atus_anual_2018 %>% 
  group_by(TIPACCID) %>% 
  summarise(total = length(TIPACCID)) %>% 
  arrange(desc(total))
accidentes_por_tipo_2018