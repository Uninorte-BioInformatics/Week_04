# Instalar librerías necesarias
## First specify the packages of interest
packages = c("treemapify", "ggplot2")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

# Leer datasets 
condition_occurrence = read.csv("data/mimic_iv_demo/csv/condition_occurrence.csv")
procedure_occurrence = read.csv("data/mimic_iv_demo/csv/procedure_occurrence.csv")

# Subdata
condition_occurrence1 = head(condition_occurrence, 1000)
procedure_occurrence1 = head(procedure_occurrence, 1000)

# Summary
summary(condition_occurrence)
summary(procedure_occurrence)

# Crear Treemap
ggplot(condition_occurrence1, aes(area = condition_occurrence1$condition_concept_id, fill = condition_occurrence1$condition_type_concept_id)) + geom_treemap()
ggplot(procedure_occurrence1, aes(area = procedure_occurrence1$procedure_concept_id, fill = procedure_occurrence1$procedure_type_concept_id)) + geom_treemap()
