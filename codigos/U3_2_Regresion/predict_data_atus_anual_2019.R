atus_anual_2019 = read_csv(file = ".//conjunto_de_datos//datos_tratados//atus_2019.CSV")
atus_anual_data = atus_anual_2019
total_registros = nrow(atus_anual_data)
anio = "(2019)"

accidentes_por_tipo_2019 = atus_anual_2019 %>% 
  group_by(TIPACCID) %>% 
  summarise(total = length(TIPACCID)) %>% 
  arrange(desc(total))
accidentes_por_tipo_2019