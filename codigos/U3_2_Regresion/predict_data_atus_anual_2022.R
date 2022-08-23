comparacion =  compare_df(group_col = c("TIPACCID"),accidentes_por_tipo_2019,accidentes_por_tipo_2020 )

" Varibales (Columnas) a predeci
  - Caída de pasajero
  - Colisión con animal
  - Colisión con ciclista
  - Colisión con ferrocarril
  - Colisión con motocicleta
  - Colisión con objeto fijo
  - Colisión con peatón (atropellamiento)
  - Colisión con vehículo automotor
  - Incendio
  - Salida del camino
  - Volcadura
"

#  - Caída de pasajero 
grupo = "Caída de pasajero"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ log(anio) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total =prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 3.86%


#  - Colisión con animal 
grupo = "Colisión con animal"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje
porcentaje = 100 - porcentaje
porcentaje # Subirá un 3.72%


#  - Colisión con ciclista 
grupo = "Colisión con ciclista"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 8.26%


#  - Colisión con ferrocarril 
grupo = "Colisión con ferrocarril"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 18.93%


#  - Colisión con motocicleta
grupo = "Colisión con motocicleta"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Subirá un 3.90%


#  - Colisión con objeto fijo
grupo = "Colisión con objeto fijo"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^4) + I(anio^3) + I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 1%


#  - Colisión con peatón (atropellamiento)
grupo = "Colisión con peatón (atropellamiento)"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~  log(anio) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 18.50%


#  - Colisión con vehículo automotor
grupo = "Colisión con vehículo automotor"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^4) + I(anio^3) +  I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Bajará un 8.60%


#  - Incendio
grupo = "Incendio"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Subirá un 2.63%


#  - Salida del camino
grupo = "Salida del camino"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Subirá un 1.47%


#  - Volcadura
grupo = "Volcadura"
dt_datos = data.frame( 
  anio = c(2017, 2018, 2019, 2020, 2021),
  total= c( as.numeric(accidentes_por_tipo_2017[ accidentes_por_tipo_2017$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2018[ accidentes_por_tipo_2018$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2019[ accidentes_por_tipo_2019$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2020[ accidentes_por_tipo_2020$TIPACCID == grupo , 2 ]),
            as.numeric(accidentes_por_tipo_2021[ accidentes_por_tipo_2021$TIPACCID == grupo , 2 ])))

modelo = lm(total ~ I(anio^2) + anio ,dt_datos )
summary(modelo)
prediccion = predict(modelo, data.frame(anio=2022))
dt_datos = rbind(dt_datos, data.frame(anio = 2022, total = prediccion ))
porcentaje= dt_datos[dt_datos$anio==2022, 2] * 100 / dt_datos[dt_datos$anio==2021, 2]
porcentaje = 100 - porcentaje
porcentaje # Subirá un 9.56%