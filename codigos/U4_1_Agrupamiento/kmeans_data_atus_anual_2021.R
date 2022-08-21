# ALREADY AVAILABLE
View(atus_anual_2021)

atus_anual_data = atus_anual_2021
total_registros = nrow(atus_anual_data)
anio = "(2021)"


accidentes_por_estado = atus_anual_data %>% 
                        group_by(NOM_ENTIDAD) %>% 
                        summarise(total = length(NOM_ENTIDAD)) %>%
                        arrange(desc(total))
accidentes_por_estado


accidentes_por_estado$categoria = 
  cut(accidentes_por_estado$total, 
      breaks = c(0, 7000, 20000, Inf), 
      labels = c("Bajo", "Medio", "Alto"))

View(accidentes_por_estado)


View(atus_anual_data)



