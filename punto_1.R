library(DBI)

file_path = 'data/mimic_iv_demo/csv'
excludes = c('2b_concept_relationship.csv', '2b_concept.csv', '2b_vocabulary.csv', 
              'attribute_definition.csv', 'cohort_attribute.csv', 'death.csv')
file_list = list.files(file_path)
to_load = setdiff(file_list, excludes)

mimic_iv_db = dbConnect(RSQLite::SQLite(), 'mimic_iv_demo.sqlite')

for (elem in to_load) {
  dbWriteTable(mimic_iv_db, substr(elem, 1, nchar(elem) - 4), read.csv(paste0(file_path, '/', elem)))
}
