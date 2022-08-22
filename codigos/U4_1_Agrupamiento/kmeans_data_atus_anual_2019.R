# ALREADY AVAILABLE
View(atus_anual_2019)

atus_anual_data = atus_anual_2019
total_registros = nrow(atus_anual_data)
anio = "(2019)"


accidentes_por_estado = atus_anual_data %>% 
                        group_by(NOM_ENTIDAD) %>% 
                        summarise(total = length(NOM_ENTIDAD))
accidentes_por_estado

agrupamiento = kmeans(accidentes_por_estado$total, 3)

View(accidentes_por_estado)

accidentes_por_estado$cluster = agrupamiento$cluster

accidentes_por_estado$etiqueta[accidentes_por_estado$cluster == 3 ] = "Alto"
accidentes_por_estado$etiqueta[accidentes_por_estado$cluster == 2 ] = "Medio"
accidentes_por_estado$etiqueta[accidentes_por_estado$cluster == 1 ] = "Bajo"

df_mxstate_2020$value = as.factor(accidentes_por_estado$etiqueta)
mxstate_choropleth(df_mxstate_2020,
                   legend = "Clasificacion",
                   title = paste("Accidentes por estado ", anio))






