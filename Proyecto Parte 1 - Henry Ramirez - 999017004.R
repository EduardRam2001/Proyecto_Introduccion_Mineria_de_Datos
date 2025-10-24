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

# Elimino la columna 'num_corre' porque solo es un identificador secuencial
data_completa<-data_completa[,-1]





#Eliminamos los df de 2009-2024 para liberer RAM
rm(data_2024, data_2023, data_2022, data_2021, data_2020,data_2019, data_2018, data_2017, data_2016, data_2015,
   data_2014, data_2013, data_2012, data_2011, data_2010, data_2009)











#----------------ALGORITMO APRIORI--------------------------
#-----------------------------------------------------------

#Data del departamento de Guatemala
data_gt <- subset(data_completa,depto_ocu==1)
data.frame(1:ncol(data_gt), colnames(data_gt))
data_gt<-data_gt[,-9]

#Patrón 1: Hechos de transito en las horas pico en Guatemala
aprio_p1 <- subset(data_gt, (hora_ocu >= 5 & hora_ocu <= 9) | (hora_ocu >= 16 & hora_ocu <= 20))
aprio_p1 <- aprio_p1[, c("g_hora_5","mes_ocu","dia_sem_ocu","tipo_veh","tipo_eve")]
reglas_apr_p1 <- apriori(aprio_p1, parameter = list(support=0.25, confidence = 0.45)) 
inspect(reglas_apr_p1[0:23])


#Patron 2: Hecho de transito provocados por el tipo de vehiculo: Motocicleta a nivel general
aprio_p2 <- subset(data_completa, tipo_veh==4)
aprio_p2 <- aprio_p2[, c("g_hora_5", "tipo_eve","mes_ocu","dia_sem_ocu","depto_ocu")]
reglas_apr_p2 <- apriori(aprio_p2, parameter = list(support=0.20, confidence = 0.45))
inspect(reglas_apr_p2[0:17])



#Patron 3: Hecho de transito en zonas activas en los fines de semana en Guatemala
aprio_p3 <- subset(data_gt, zona_ocu %in% c(4,10,15,1) & dia_sem_ocu %in% c(6,7))
aprio_p3 <- aprio_p3[, c("mes_ocu", "g_hora", "tipo_veh", "tipo_eve")]
reglas_apr_p3 <- apriori(aprio_p3, parameter = list(support=0.20, confidence=0.45))
inspect(reglas_apr_p3[0:23])


#Patron 4: Hechos de transito cuando es atropello a nivel general
aprio_p4 <- subset(data_completa, tipo_eve == 5)
aprio_p4 <- aprio_p4[, c("mes_ocu", "g_hora","tipo_veh","depto_ocu")]
reglas_apr_p4 <- apriori(aprio_p4, parameter = list(support=0.10, confidence = 0.35))
inspect(reglas_apr_p4[0:42])


#Patron 5: Hechos de transito en el Municipio de San Miguel Petapa, Guatemala
aprio_p5 <- subset(data_completa, mupio_ocu == 117)
aprio_p5 <- aprio_p5[, c("g_hora","mes_ocu","dia_sem_ocu","tipo_veh","tipo_eve")]
reglas_apr_p5 <- apriori(aprio_p5, parameter = list(support=0.20, confidence=0.45))
inspect(reglas_apr_p5[0:37])













#----------------ALGORITMO FP-GROWTH------------------------
#-----------------------------------------------------------

#Patron 1: Hechos de transito en temporada de lluvia (junio a octubre)
fp_p1 <- subset(data_completa, mes_ocu %in% c(6,7,8,9,10))
fp_p1 <- fp_p1[, c("mes_ocu","depto_ocu","g_hora_5","color_veh","tipo_veh","tipo_eve")]
reglas_fp_p1 <- fim4r(fp_p1, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf_fp_p1 <- as(reglas_fp_p1, "data.frame")



#Patron 2: Hechos de transito con vehículos nuevos (modelos recientes)
fp_p2 <- subset(data_completa, g_modelo_veh ==6)
fp_p2 <- fp_p2[, c("dia_sem_ocu","marca_veh","g_hora_5","tipo_veh","tipo_eve")]
reglas_fp_p2 <- fim4r(fp_p2, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf_fp_p2 <- as(reglas_fp_p2, "data.frame")




#Patron 3: Hechos de transito ocurrido en la noche.
fp_p3 <- subset(data_completa, g_hora_5 ==3)
fp_p3 <- fp_p3[, c("mes_ocu","depto_ocu","color_veh","tipo_veh","tipo_eve")]
reglas_fp_p3 <- fim4r(fp_p3, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf_fp_p3 <- as(reglas_fp_p3, "data.frame")




#Patron 4: Hechos de tránsito relacionados segun el color del vehículo (Claro, oscuro, vivo, Varios)
fp_p4 <- subset(data_completa, color_veh <=17)

fp_p4$grupo_color <- ifelse(fp_p4$color_veh %in% c(3,4,5,9,10,15), "Oscuro",
                            ifelse(fp_p4$color_veh %in% c(2,8,11,12,13,16), "Claro",
                                   ifelse(fp_p4$color_veh %in% c(1,6,7,14), "Vivo",
                                          ifelse(fp_p4$color_veh == 17, "Varios", NA))))

fp_p4 <- fp_p4[, c("grupo_color", "g_hora_5", "tipo_eve")]
reglas_fp_p4 <- fim4r(fp_p4, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf_fp_p4 <- as(reglas_fp_p4, "data.frame")




#Patron 5: Hechos de transito provocados por los buses extraurbano
fp_p5 <- subset(data_completa, tipo_veh  ==7)
fp_p5 <- fp_p5[, c("mes_ocu","depto_ocu","g_hora_5","tipo_eve")]
reglas_fp_p5 <- fim4r(fp_p5, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf_fp_p5 <- as(reglas_fp_p5, "data.frame")
