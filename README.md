# Análisis de Patrones y Clustering en Hechos de Tránsito

## Descripción general
Este proyecto analiza hechos de tránsito en Guatemala utilizando técnicas de minería de datos y clustering.  
Se aplican:

- Reglas de asociación con Apriori
- Reglas de asociación con FP-Growth
- Clustering con K-Means

El objetivo es descubrir patrones relevantes y segmentar datos para entender mejor los hechos de tránsito y sugerir posibles intervenciones.

---

## Origen de los datos

Los datos provienen de dos fuentes oficiales del Instituto Nacional de Estadística (INE) de Guatemala:

1. **Datos 2009-2017:**  
   [https://www.ine.gob.gt/bases-de-datos/accidentes-de-transito/](https://www.ine.gob.gt/bases-de-datos/accidentes-de-transito/)

2. **Datos 2018-2024:**  
   [https://datos.ine.gob.gt/dataset/accidentes-de-transito-hechos](https://datos.ine.gob.gt/dataset/accidentes-de-transito-hechos)  

Estos archivos vienen en formatos Excel y SPSS (.sav). Para convertir los archivos SPSS a Excel se utilizó la herramienta:  
[https://secure.ncounter.de/spssconverter](https://secure.ncounter.de/spssconverter)

Los archivos generados se nombraron como:  **hechos-de-transito-ano-<año>.xlsx**

Todos los archivos se encuentran en la carpeta `DATA` del proyecto.

---

## Ruta de la data

Antes de ejecutar los scripts, asegúrate de que la variable `ruta` (definida en la **línea 10**) apunte a la ubicación donde se encuentran los archivos Excel.  
Cambia la ruta según corresponda a tu equipo:

```r
# Ejemplo de ruta (modificar según tu equipo)
ruta <- "C:\\Users\\hedua\\OneDrive\\Escritorio\\MAESTRIA\\4to Trimestre\\INTRO. MINERIA DE DATOS\\Proyecto_Introduccion_Mineria_de_Datos\\DATA\\"
```


---
## Librerías necesarias

Para ejecutar los scripts se utilizaron las siguientes librerías de R:

```r
library(readxl)    # Lectura de archivos Excel
library(arules)    # Reglas de asociación Apriori y  K-Means
library(fim4r)     # Reglas de asociación FP-Growth
library(ggplot2)   # Visualización de gráficos
library(ggalt)     # Para geom_encircle en gráficos
library(dplyr)     # Manipulación de datos  
```

Para instalar estas librerías, usar el comando:
```r
install.packages("nombre_libreria")
```

---


## Orden Recomendado de Ejecución

1. **Cargar librerías necesarias**  
   - Ver sección de *Librerías necesarias* para todos los paquetes a utilizar.

2. **Preparar los archivos de datos**  
   - Colocar todos los archivos Excel en la carpeta `DATA` del proyecto.  
   - Todos los archivos deben estar en formato `.xlsx`.  
   - Los nombres deben seguir el formato: `hechos-de-transito-ano-<año>.xlsx` (por ejemplo, `hechos-de-transito-ano-2024.xlsx`).

3. **Definir la variable de ruta**  
   - Definir la variable `ruta` apuntando a la carpeta `DATA` en tu equipo.  
   - Ejemplo:  
     ```r
     ruta <- "C:\\Users\\hedua\\OneDrive\\Escritorio\\MAESTRIA\\4to Trimestre\\INTRO. MINERIA DE DATOS\\Proyecto_Introduccion_Mineria_de_Datos\\DATA\\"
     ```

4. **Cargar los archivos Excel**  
   - Utilizar `read_excel()` para cada archivo de datos según el año:  
     ```r
     data_2024 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2024.xlsx"))
     data_2023 <- read_excel(paste0(ruta,"hechos-de-transito-ano-2023.xlsx"))
     # y así sucesivamente hasta 2009
     ```

5. **Ejecutar los scripts de análisis de forma secuencial**  
   - Cargar los datos en orden cronológico (2009-2024).  
   - Ejecutar el algoritmo **Apriori** para reglas de asociación.  
   - Ejecutar el algoritmo **FP-Growth** para reglas de asociación.  
   - Ejecutar **K-Means** para análisis de clustering.  


> Cada sección de análisis está identificada y separada en los scripts para facilitar la ejecución y visualización de resultados.


---
## Limpieza y unificación de datos

- **Años 2015-2024:**  
  - Se tomó como referencia los nombres y el orden de las columnas de la data de 2024.  
  - Para los años 2016 y 2015 se ajustó el orden de las columnas para que coincidieran con la referencia.

- **Años 2009-2014:**  
  - Se agregaron columnas que no existían, asignándoles el valor por defecto `IGNORADO` (representado numéricamente según el diccionario de datos `diccionario-hechos-de-transito-2024.xlsx`).  
  - Se reordenaron las columnas para que coincidieran con la estructura de los años 2015-2024.  
  
- **Unificación completa (2009-2024):**  
  - Se unificaron los datos de 2009 a 2014 en un solo `dataframe` utilizando `dplyr::bind_rows()` para garantizar la misma cantidad y orden de columnas.  

- **Reemplazo de valores “IGNORADO”:**  
  - Se aplicó después de unificar todos los años.  
  - Solo se reemplazaron valores en `g_hora`, `g_hora_5` y `g_modelo_veh`, debido a que requieren condiciones basadas en otros datos.


- **Eliminación de columnas innecesarias:**  
  - Se eliminó la columna `num_corre` porque solo era un identificador secuencial.

-  **Funciones nuevas utilizadas:** 
   - `dplyr::bind_rows()`: se utilizó para unificar todos los `dataframes` de cada año y así garantizar que todos tengan la misma cantidad y orden de columnas.  
   - `names(data_2024) <- name_columns`: se utilizó para asignar nombres consistentes a las columnas de todos los `dataframes`.  
   - `rm()`: se utilizó para eliminar temporalmente `dataframes` intermedios y liberar espacio de memoria RAM, mejorando el rendimiento del equipo durante la ejecución
   - `paste0()` para unir ruta y nombre de archivo.



---
## Requisitos técnicos

- R versión 4.3.2
- Carpeta `DATA` con los archivos Excel.
- Librerías instaladas según lo indicado.