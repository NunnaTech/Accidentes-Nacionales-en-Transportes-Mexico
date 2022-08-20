# ALREADY AVAILABLE
View(atus_anual_2021)

atus_anual_data = atus_anual_2021
total_registros = nrow(atus_anual_data)

# 1 Total de acccidentes provocados por cada tipo de accidente de mayor a menor
accidentes_por_tipo = atus_anual_data %>% 
                      group_by(TIPACCID) %>% 
                      summarise(total = length(TIPACCID)) %>% 
                      arrange(desc(total))
accidentes_por_tipo


  
ggplot(
  data = accidentes_por_tipo, 
  mapping = aes(x = TIPACCID, y = total, fill = TIPACCID)
) + geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0) + 
  coord_flip() +
  theme_minimal() +
  guides(fill = guide_legend(title = "Tipos de accidentes")) + 
  scale_fill_manual(values = paletteer_d("ggthemes::Hue_Circle")) +
  labs(title = "Total de acccidentes provocados por cada tipo de accidente (2021)", 
       x = "Tipo de accidnete", y = "Número total")




# 2 Porcentajes de accidentes con o sin cinturón de seguridad
accidentes_con_cinturon = atus_anual_data %>% 
                          group_by(CINTURON) %>% 
                          summarise(total = length(CINTURON), 
                                    porcentaje = total*100/nrow(atus_anual_data))
accidentes_con_cinturon


#3 Porcentajes de accidentes con estado de ebriedad
estado_de_ebriedad = atus_anual_data %>% 
                     group_by(ALIENTO) %>% 
                     summarise(total = length(ALIENTO),
                              pocentake = total*100/nrow(atus_anual_data)) %>%
                    arrange(desc(total))
estado_de_ebriedad


#5 Top 5 estados con más accidentes automovilístico
accidentes_por_estado = atus_anual_data %>% 
                        group_by(NOM_ENTIDAD) %>% 
                        summarise(total = length(NOM_ENTIDAD)) %>%
                        arrange(desc(total)) %>%
                        top_n(5)
accidentes_por_estado


#6 Género que suele tener más accidentes
accidentes_por_genero = atus_anual_data %>% 
                        group_by(SEXO) %>%
                        summarise(total = length(SEXO), 
                                  porcentaje = total * 100 / nrow(atus_anual_data)) %>%
                        arrange(desc(total))
accidentes_por_genero


#7 Causa del accidente
causas_de_accidentes = atus_anual_data %>% group_by(CAUSAACCI) %>%
                       summarise(total = length(CAUSAACCI)) %>%
                       arrange(total)
causas_de_accidentes


#8 Accidente más común en urbanos y suburbanos
# URBANO
accidentes_urbanos = atus_anual_data %>% 
                     group_by(URBANA) %>%
                     summarise(total = length(URBANA)) %>%
                     arrange(desc(total)) %>%
                     top_n(1)
accidentes_urbanos #Accidente en intersección 282483


accidentes_suburbanos = atus_anual_data %>% 
                     group_by(SUBURBANA) %>%
                     summarise(total = length(SUBURBANA)) %>%
                     arrange(desc(total))
accidentes_suburbanos[2,]  #Accidente en carretera estatal 19684


#9 y 10 Dia y hora con más probabilidad para tener un accidente(ID_HORA)
horas_de_accidente = atus_anual_data %>% 
                     group_by(ID_HORA) %>%
                     summarise(total = length(ID_HORA)) %>%
                     arrange(desc(total)) %>%
                     top_n(3)
horas_de_accidente


dias_de_accidente = atus_anual_data %>% 
                    group_by(DIASEMANA) %>%
                    summarise(total = length(DIASEMANA)) %>%
                    arrange(desc(total))
dias_de_accidente


" 
 Lunes a las 15 horas (3:00 pm)
 y Viernes y Sábado a las 23 horas (11:00 pm) de la noche.
"



#11 Media y moda de edad
edad_en_accidentes = atus_anual_data %>% 
                     group_by(ID_EDAD) %>%
                     summarise(total = length(ID_EDAD)) %>%
                     arrange(desc(total))
edad_en_accidentes = edad_en_accidentes[-c(1,2),]
View(edad_en_accidentes)


media_de_edad = mean(atus_anual_data$ID_EDAD ,rm = TRUE)
media_de_edad #Edad promedio 38 años.

moda_de_edad = edad_en_accidentes %>% arrange(desc(total)) %>% top_n(1) 
moda_de_edad #30 años, 9502


#12 Saber el porcentaje de muertes basándonos en el cinturón
conductores_muertos = atus_anual_data %>%
                      group_by(CINTURON) %>%
                      summarise(total = length(CINTURON), 
                                muertos = sum(as.numeric(CONDMUERTO)))
conductores_muertos = conductores_muertos %>% 
                      summarise(CINTURON, total, muertos, 
                                porcentaje = muertos*100/sum(muertos))
conductores_muertos


#14 Sobriedad del conductor presunto responsable (ALIENTO) 
aliento_alcoholico = atus_anual_data %>% 
                     group_by(ALIENTO) %>%
                     summarise(total = length(ALIENTO), porcentaje = total * 100 /total_registros)
aliento_alcoholico
