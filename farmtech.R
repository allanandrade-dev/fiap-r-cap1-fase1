library(readr)
library(dplyr)

registros_lavoura <- read_csv("relatorio_lavoura.csv")


print("Dados carregados:")
print(registros_lavoura)


estatisticas_gerais <- registros_lavoura %>%
  summarise(
    media_area_m2 = mean(area_m2, na.rm = TRUE),
    desvio_padrao_area = sd(area_m2, na.rm = TRUE),
    media_total_insumo = mean(total_insumo, na.rm = TRUE),
    desvio_padrao_insumo = sd(total_insumo, na.rm = TRUE)
  )

print("Estatísticas Gerais da Lavoura:")
print(estatisticas_gerais)


estatisticas_por_cultura <- registros_lavoura %>%
  group_by(cultura) %>%
  summarise(
    media_area_m2 = mean(area_m2, na.rm = TRUE),
    desvio_padrao_area = sd(area_m2, na.rm = TRUE),
    media_total_insumo = mean(total_insumo, na.rm = TRUE),
    desvio_padrao_insumo = sd(total_insumo, na.rm = TRUE)
  )

print("Estatísticas Agrupadas por Cultura:")
print(estatisticas_por_cultura)
