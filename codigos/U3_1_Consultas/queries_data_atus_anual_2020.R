atus_anual_data = atus_anual_2020
total_registros = nrow(atus_anual_data)
anio = "(2020)"

# 1 Total de acccidentes provocados por cada tipo de accidente de mayor a menor
accidentes_por_tipo = atus_anual_data %>% 
                      group_by(TIPACCID) %>% 
                      summarise(total = length(TIPACCID)) %>% 
                      arrange(desc(total))
accidentes_por_tipo

titulo = paste("Total de acccidentes provocados por cada tipo de accidente ", anio)
titulo_x = "Tipo de accidente"
titulo_y = "Número total"
categorias = "Tipos de accidentes"
ggplot(data = accidentes_por_tipo, 
       mapping = aes(x = TIPACCID, y = total, fill = TIPACCID)) + 
      geom_bar(stat='identity') + 
      geom_text(aes(label = paste(total)), hjust = 0.5, vjust = 0) + 
      theme_minimal() +
      guides(fill = guide_legend(title = categorias)) + 
      scale_fill_manual(values = paletteer_d("ggthemes::Hue_Circle")) +
      labs(title = titulo, x = titulo_x, y = titulo_y) +
      theme(axis.text.x = element_blank())




# 2 Porcentajes de accidentes con o sin cinturón de seguridad
accidentes_con_cinturon = atus_anual_data %>% 
                          group_by(CINTURON) %>% 
                          summarise(total = length(CINTURON), 
                                    porcentaje = total*100/nrow(atus_anual_data))
accidentes_con_cinturon

titulo = paste("Porcentaje de accidentes son o sin cínturon de seguridad ", anio)
titulo_x = ""
titulo_y = "Porcentaje"
categorias = "Categorías"
ggplot(data = accidentes_con_cinturon, 
       mapping = aes(x = CINTURON, y = porcentaje, fill = CINTURON)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = paste(as.integer(porcentaje), "%")), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 




#3 Porcentajes de accidentes con estado de ebriedad
estado_de_ebriedad = atus_anual_data %>% 
                     group_by(ALIENTO) %>% 
                     summarise(total = length(ALIENTO),
                              porcentaje = total*100/nrow(atus_anual_data)) %>%
                    arrange(desc(total))
estado_de_ebriedad

titulo = paste("Porcentaje de accidentes con estado de ebriedad ", anio)
titulo_x = ""
titulo_y = "Porcentaje"
categorias = "Categorías"
ggplot(data = estado_de_ebriedad, 
       mapping = aes(x = ALIENTO, y = porcentaje, fill = ALIENTO)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = paste(as.integer(porcentaje), "%")), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 



#5 Top 5 estados con más accidentes automovilístico
accidentes_por_estado = atus_anual_data %>% 
                        group_by(NOM_ENTIDAD) %>% 
                        summarise(total = length(NOM_ENTIDAD)) %>%
                        arrange(desc(total)) %>%
                        top_n(5)
accidentes_por_estado

titulo = paste("Los 5 estados con más accidentes automovilístico", anio)
titulo_x = ""
titulo_y = "Número total"
categorias = "Estados"
ggplot(data = accidentes_por_estado, 
       mapping = aes(x = NOM_ENTIDAD, y = total, fill = NOM_ENTIDAD)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 




#6 Género que suele tener más accidentes
accidentes_por_genero = atus_anual_data %>% 
                        group_by(SEXO) %>%
                        summarise(total = length(SEXO), 
                                  porcentaje = total * 100 / nrow(atus_anual_data)) %>%
                        arrange(desc(total))
accidentes_por_genero

"AQUÍ USAMOS MEJOR IMAGENES EN LA PRESENTACIÓN"




#7 Causa del accidente
causas_de_accidentes = atus_anual_data %>% group_by(CAUSAACCI) %>%
                       summarise(total = length(CAUSAACCI)) %>%
                       arrange(total)
causas_de_accidentes

titulo = paste("Causas de los accidentes automovilístico", anio)
titulo_x = "Causas"
titulo_y = "Número total"
categorias = "Causas"
ggplot(data = causas_de_accidentes, 
       mapping = aes(x = CAUSAACCI, y = total, fill = CAUSAACCI)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 




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

"AQUÍ USAMOS MEJOR IMAGENES EN LA PRESENTACIÓN"




#9 y 10 Dia y hora con más probabilidad para tener un accidente(ID_HORA)
horas_de_accidente = atus_anual_data %>% 
                     group_by(ID_HORA) %>%
                     summarise(total=length(ID_HORA)) %>%
                     arrange(desc(total)) %>%
                     top_n(3)
horas_de_accidente
View(horas_de_accidente)

titulo = paste("Las 3 horas con más accidentes registrados", anio)
titulo_x = "Horas"
titulo_y = "Número total"
categorias = "Horas"
ggplot(data = horas_de_accidente, 
       mapping = aes(x = as.character(ID_HORA), y = total, fill = as.character(ID_HORA))) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  scale_fill_manual(values = paletteer_d("colorBlindness::paletteMartin")) +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 



dias_de_accidente = atus_anual_data %>% 
                    group_by(DIASEMANA) %>%
                    summarise(total = length(DIASEMANA)) %>%
                    arrange(desc(total))
dias_de_accidente

titulo = paste("Número de accidentes por día de la semana", anio)
titulo_x = "Días"
titulo_y = "Número total"
categorias = "Días"
ggplot(data = dias_de_accidente, 
       mapping = aes(x = DIASEMANA, y = total, fill = DIASEMANA)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  scale_fill_manual(values = paletteer_d("colorBlindness::paletteMartin")) +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 


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

"AQUÍ USAMOS MEJOR IMAGENES EN LA PRESENTACIÓN"


#12 Saber el porcentaje de muertes basándonos en el cinturón
conductores_muertos = atus_anual_data %>%
                      group_by(CINTURON) %>%
                      summarise(total = length(CINTURON), 
                                muertos = sum(as.numeric(CONDMUERTO)))
conductores_muertos = conductores_muertos %>% 
                      summarise(CINTURON, total, muertos, 
                                porcentaje = muertos*100/sum(muertos))
conductores_muertos

"AQUÍ USAMOS MEJOR IMAGENES EN LA PRESENTACIÓN"


#14 Sobriedad del conductor presunto responsable (ALIENTO) 
aliento_alcoholico = atus_anual_data %>% 
                     group_by(ALIENTO) %>%
                     summarise(total = length(ALIENTO), porcentaje = total * 100 /total_registros)
aliento_alcoholico

"AQUÍ USAMOS MEJOR IMAGENES EN LA PRESENTACIÓN"


#15 Los 5 municipio con más de accidente en Morelos
datos_morelos = atus_anual_data[atus_anual_data$NOM_ENTIDAD=='Morelos', ]
accidentes_por_municipio = datos_morelos %>% 
  group_by(NOM_MUNICIPIO) %>% 
  summarise(total = length(NOM_MUNICIPIO)) %>%
  arrange(desc(total)) %>%
  top_n(5)

titulo = paste("Los 5 municipio con más de accidente en Morelos ", anio)
titulo_x = ""
titulo_y = "Número total"
categorias = "Municipio"
ggplot(data = accidentes_por_municipio, 
       mapping = aes(x = NOM_MUNICIPIO, y = total, fill = NOM_MUNICIPIO)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(label = total), hjust = 0.5, vjust = 0) + 
  theme_minimal() +
  guides(fill = guide_legend(title = categorias)) + 
  labs(title = titulo, x = titulo_x, y = titulo_y) 

View(accidentes_por_municipio)
