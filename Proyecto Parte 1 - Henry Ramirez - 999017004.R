#Carga de librerias
library(readxl)
library(arules)
library(fim4r)
library(ggplot2)
library(ggalt)
library(dplyr)

#Ruta de la data
ruta<-"C:\\Users\\hedua\\OneDrive\\Escritorio\\MAESTRIA\\4to Trimestre\\INTRO. MINERIA DE DATOS\\Proyecto_Introduccion_Mineria_de_Datos\\DATA\\"



#----------------LIMPIEZA DE LOS DATOS---------------------
#-----------------------------------------------------------



#--Para la data de 2015-2024 se debe realizar cierta limpieza.
#--Tomar las columnas de forma ordenada tomando como referencia la data de 2024
#--Colocar el nombre de las columnas iguales para todos los df.

name_columns <- c("num_correlativo","anio_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5",
                  "mes_ocu","dia_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","tipo_veh",
                  "marca_veh","color_veh","modelo_veh","g_modelo_veh","tipo_eve")



data_2024 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2024.xlsx"))
names(data_2024) <- name_columns

data_2023 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2023.xlsx"))
names(data_2023) <- name_columns

data_2022 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2022.xlsx"))
names(data_2022) <- name_columns

data_2021 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2021.xlsx"))
data_2021<-data_2021[,-12]
names(data_2021) <- name_columns


data_2020 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2020.xlsx"))
names(data_2020) <- name_columns

data_2019 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2019.xlsx"))
names(data_2019) <- name_columns

data_2018 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2018.xlsx"))
names(data_2018) <- name_columns

data_2017 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2017.xlsx"))
names(data_2017) <- name_columns


data_2016 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2016.xlsx"))
data_2016 <- data_2016[, c("núm_corre","año_ocu","día_ocu","hora_ocu","g_hora",
                           "g_hora_5","mes_ocu","día_sem_ocu","mupio_ocu","depto_ocu",
                           "zona_ocu","tipo_veh","marca_veh","color_veh","modelo_veh","g_modelo_veh","tipo_eve")]
names(data_2016) <- name_columns


data_2015 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2015.xlsx"))
data_2015<-data_2015[, c("núm_corre","año_ocu","día_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "día_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","tipo_veh","marca_veh",
                         "color_veh","modelo_veh","g_modelo_veh","tipo_eve")]
names(data_2015) <- name_columns



#--Para la data de 2009-2014 se debe realizar cierta limpieza y agregar columnas que no tiene la data
#--Esas columnas que se va agregar se tomara como valor 'Ignorado' de momento

data_2014 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2014.xlsx"))
data_2014$año_ocu <-2014
data_2014$g_hora_5 <- 4
data_2014$g_modelo_veh <- 99
data_2014<-data_2014[, c("num_correlativo","año_ocu","día_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                        "día_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","tipo_veh","marca_veh",
                        "color_veh","modelo_veh","g_modelo_veh","tipo_eve")]
names(data_2014) <- name_columns




data_2013 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2013.xlsx"))
data_2013$año_ocu <-2013
data_2013$g_hora_5 <- 4
data_2013$g_modelo_veh <- 99
data_2013<-data_2013[, c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "dia_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","tipo_veh","marca_veh",
                         "color_veh","modelo_veh","g_modelo_veh","causa_acc")]
names(data_2013) <- name_columns



data_2012 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2012.xlsx"))
data_2012$año_ocu <-2012
data_2012$g_hora <-5
data_2012$g_hora_5<-4
data_2012$marca_vehi <- 999
data_2012$modelo_vehi <- 9999
data_2012$g_modelo_vehi <- 99
data_2012<-data_2012[, c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "dia_sem_ocu","mupio_ocu","depto_ocu","zona_ocu","tipo_vehi","marca_vehi",
                         "color_vehi","modelo_vehi","g_modelo_vehi","causa_acc")]
names(data_2012) <- name_columns




data_2011 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2011.xlsx"))
data_2011$año_ocu <-2011
data_2011$g_hora <-5
data_2011$g_hora_5<-4
data_2011$g_modelo_vehi <- 99
data_2011<-data_2011[, c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "dia_sem_ocu","muni_ocu","depto_ocu","zona_ocu","tipo_vehiculo","marca_vehi",
                         "color_vehi","modelo_vehi","g_modelo_vehi","causa_acc")]
names(data_2011) <- name_columns




data_2010 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2010.xlsx"))
data_2010$num_hecho <- 1
data_2010$año_ocu <-2010
data_2010$g_hora <-5
data_2010$g_hora_5<-4
data_2010$muni_ocu<-9999
data_2010$marca_v<-999
data_2010$g_modelo_vehi <- 99
data_2010<-data_2010[, c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "dia_sem_ocu","muni_ocu","depto_ocu","zona_ocu","tipo_v","marca_v",
                         "color_v","modelo_v","g_modelo_vehi","causa_ac")]
names(data_2010) <- name_columns




data_2009 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2009.xlsx"))
data_2009$año_ocu <-2009
data_2009$g_hora <-5
data_2009$g_hora_5<-4
data_2009$muni_ocu<-9999
data_2009$zona_ocu<-99
data_2009$marca_vehi<-999
data_2009$g_modelo_vehi <- 99
data_2009<-data_2009[, c("num_hecho","año_ocu","dia_ocu","hora_ocu","g_hora","g_hora_5","mes_ocu",
                         "dia_sem_ocu","muni_ocu","depto_ocu","zona_ocu","tipo_vehi","marca_vehi",
                         "color_vehi","modelo_vehi","g_modelo_vehi","causa_acc")]
names(data_2009) <- name_columns





#Unificamos la data del 2009-2024
data_completa <- bind_rows(data_2024, data_2023, data_2022, data_2021, data_2020,
                           data_2019, data_2018, data_2017, data_2016, data_2015,
                           data_2014, data_2013, data_2012, data_2011, data_2010,
                           data_2009)


# Valores por defecto se reemplazan por condiciones basadas en el diccionario de datos.
# Solo se aplican condiciones a g_hora, g_hora_5 y g_modelo_veh, ya que dependen de otros campos.
data_completa$g_hora <- ifelse(
                              data_completa$hora_ocu >= 0 & data_completa$hora_ocu <= 5, 1,
                              ifelse(data_completa$hora_ocu >= 6 & data_completa$hora_ocu <= 11, 2,
                                     ifelse(data_completa$hora_ocu >= 12 & data_completa$hora_ocu <= 17, 3,
                                            ifelse(data_completa$hora_ocu >= 18 & data_completa$hora_ocu <= 24, 4, 5))))



data_completa$g_hora_5 <- ifelse(
                                  data_completa$g_hora %in% c(1, 2), 1,
                                  ifelse(data_completa$g_hora == 3, 2,
                                         ifelse(data_completa$g_hora == 4, 3, 4)))


data_completa$g_modelo_veh <- ifelse(
                              data_completa$modelo_veh >= 1970 & data_completa$modelo_veh <= 1979, 1,
                              ifelse(data_completa$modelo_veh >= 1980 & data_completa$modelo_veh <= 1989, 2,
                                     ifelse(data_completa$modelo_veh >= 1990 & data_completa$modelo_veh <= 1999, 3,
                                            ifelse(data_completa$modelo_veh >= 2000 & data_completa$modelo_veh <= 2009, 4,
                                                   ifelse(data_completa$modelo_veh >= 2010 & data_completa$modelo_veh <= 2019, 5,
                                                          ifelse(data_completa$modelo_veh >= 2020 & data_completa$modelo_veh <= 2029, 6, 99))))))



#Eliminamos los df de 2009-2024 para liberer RAM
rm(data_2024, data_2023, data_2022, data_2021, data_2020,data_2019, data_2018, data_2017, data_2016, data_2015,
   data_2014, data_2013, data_2012, data_2011, data_2010, data_2009)















data_2013 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2013.xlsx"))
data_2013$año_ocu <-2013

data_2013$g_hora_5 <- ifelse(
                            data_2013$g_hora %in% c(1, 2), 1,
                            ifelse(data_2013$g_hora == 3, 2,
                            ifelse(data_2013$g_hora == 4, 3, 4)
                            ))


data_2014$g_modelo_veh <- ifelse(
                                  data_2014$modelo_veh >= 1970 & data_2014$modelo_veh <= 1979, 1,
                                  ifelse(data_2014$modelo_veh >= 1980 & data_2014$modelo_veh <= 1989, 2,
                                         ifelse(data_2014$modelo_veh >= 1990 & data_2014$modelo_veh <= 1999, 3,
                                                ifelse(data_2014$modelo_veh >= 2000 & data_2014$modelo_veh <= 2009, 4,
                                                       ifelse(data_2014$modelo_veh >= 2010 & data_2014$modelo_veh <= 2019, 5,
                                                              ifelse(data_2014$modelo_veh >= 2020 & data_2014$modelo_veh <= 2029, 6, 99)
                                                       )))))
