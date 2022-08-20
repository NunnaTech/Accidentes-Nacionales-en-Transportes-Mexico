# Cast to integer
View(atus_anual_2021_merge)

# 1 Total de acccidentes provocados por cada tipo de accidente
accidentes_por_tipo = atus_anual_2021_merge %>% group_by(TIPACCID) %>%
  summarise(total = length(TIPACCID),
            .groups = 'drop')
accidentes_por_tipo

#ORDENADO DE MAYOR A MENOR
accidentes_por_tipo%>%
  arrange(desc(total))


#2 Porcentajes de accidentes con o sin cinturón de seguridad
accidentes_con_cinturon = atus_anual_2021_merge %>% group_by(CINTURON) %>%
  summarise(total = length(CINTURON),
            .groups = 'drop')
accidentes_con_cinturon

total_registros = nrow(atus_anual_2021_merge)
total_registros

porcentaje_con_cinturon = accidentes_con_cinturon[4,2] * 100 / total_registros
porcentaje_con_cinturon #14.31284

porcentaje_sin_cinturon = accidentes_con_cinturon[2,2] * 100 / total_registros
porcentaje_sin_cinturon #11.95113

porcentaje_se_ignora_cinturon = accidentes_con_cinturon[3,2] * 100 / total_registros
porcentaje_se_ignora_cinturon #69.26519

porcentaje_no_se_sabe = accidentes_con_cinturon[1,2] * 100 / total_registros
porcentaje_no_se_sabe #4.470845

#3 Porcentajes de accidentes con estado de ebriedad
estado_de_ebriedad = atus_anual_2021_merge %>% group_by(ALIENTO) %>%
  summarise(total = length(ALIENTO),
            .groups = 'drop')
estado_de_ebriedad

porcentaje_con_aliento = estado_de_ebriedad[4,2] * 100 / total_registros
porcentaje_con_aliento #5.0204

porcentaje_sin_aliento = estado_de_ebriedad[2,2] * 100 / total_registros
porcentaje_sin_aliento #62.478

porcentaje_se_ignora_aliento = estado_de_ebriedad[3,2] * 100 / total_registros
porcentaje_se_ignora_aliento #28.02

porcentaje_cero_aliento = estado_de_ebriedad[1,2] * 100 / total_registros
porcentaje_cero_aliento # 4.4708

#5 Top 5 estados con más accidentes automovilístico
accidentes_por_estado = atus_anual_2021_merge %>% group_by(NOM_ENTIDAD) %>%
  summarise(total = length(NOM_ENTIDAD),
            .groups = 'drop')

# Ordenados de mayor a menor.            
estados_ordenados_por_cantidad_de_accidentes = accidentes_por_estado%>%
       arrange(desc(total))

top_5_estados_con_mas_accidentes = estados_ordenados_por_cantidad_de_accidentes[1:5, ]
top_5_estados_con_mas_accidentes


#6 Género que suele tener más accidentes
accidentes_por_genero = atus_anual_2021_merge %>% group_by(SEXO) %>%
  summarise(total = length(SEXO),
            .groups = 'drop')
accidentes_por_genero

orden_de_genero_de_accidentes = 
  accidentes_por_genero%>%
  arrange(desc(total))

genero_con_mas_accidentes = orden_de_genero_de_accidentes[1,]
genero_con_mas_accidentes

#7 Tasa de porcentaje que suele darse a la fuga(SEXO)
porcentaje_se_fugo = accidentes_por_genero[4,2] * 100 / total_registros
porcentaje_se_fugo #9.7899

#8 Causa del accidente
causas_del_accidente = atus_anual_2021_merge %>% group_by(CAUSAACCI) %>%
  summarise(total = length(CAUSAACCI),
            .groups = 'drop')
causas_del_accidente

causa_tipo_accidente = causas_del_accidente[-c(1,5), ]
causa_tipo_accidente

#9 Accidente más comun en urbanos y suburbanos
accidentes_urbanos = atus_anual_2021_merge %>% group_by(URBANA) %>%
  summarise(total = length(URBANA),
            .groups = 'drop')
accidentes_urbanos
accidentes_urbanos[1,] #Accidente en intersección 282483

accidentes_suburbanos = atus_anual_2021_merge %>% group_by(SUBURBANA) %>%
  summarise(total = length(SUBURBANA),
            .groups = 'drop')
accidentes_suburbanos

accidentes_suburbanos[2,] #Accidente en carretera estatal 19684

#10 y 11 Dia y hora con más probabilidad para tener un accidente(ID_HORA)
horas_de_accidente = atus_anual_2021_merge %>% group_by(ID_HORA) %>%
  summarise(total = length(ID_HORA),
            .groups = 'drop')
View(horas_de_accidente)

dias_de_accidente = atus_anual_2021_merge %>% group_by(DIASEMANA) %>%
  summarise(total = length(DIASEMANA),
            .groups = 'drop')
dias_de_accidente

dias_de_accidente%>%
  arrange(desc(total))

#Lunes a las 15 horas y Viernes y Sábado a las 11 de la noche.

#12 Media y moda de edad
edad_en_accidentes = atus_anual_2021_merge %>% group_by(ID_EDAD) %>%
  summarise(total = length(ID_EDAD),
            .groups = 'drop')
View(edad_en_accidentes)


edad_en_accidentes = edad_en_accidentes[-c(1,88),]
media_de_edad = mean(atus_anual_2021_merge$ID_EDAD ,rm = TRUE)
media_de_edad #Edad promedio 38 años.
moda_de_edad = edad_en_accidentes %>% arrange(desc(total)) %>% top_n(1) 
moda_de_edad #30 años, 9502

#13 Saber el porcentaje de muertes basándonos en el cinturón
conductores_muertos = atus_anual_2021_merge %>% group_by(CINTURON) %>%
  summarise(total = sum(CONDMUERTO),
            .groups = 'drop')
conductores_muertos

#14 Sobriedad del conductor presunto responsable(ALIENTO) 
aliento_alcoholico = atus_anual_2021_merge %>% group_by(ALIENTO) %>%
  summarise(total = length(ALIENTO),
            .groups = 'drop')
aliento_alcoholico

si_aliento = aliento_alcoholico[4,2, ] * 100/total_registros
si_aliento #5% tenía aliento alcoholico

no_aliento = aliento_alcoholico[2,2, ] * 100/total_registros
no_aliento #62% NO tenía aliento alcoholico

no_se_sabe_aliento = (aliento_alcoholico[1,2] + aliento_alcoholico[3,2]) * 100/total_registros
no_se_sabe_aliento #32% NO se sabe si aliento alcoholico
