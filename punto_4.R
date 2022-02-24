library("DataQualityDashboard")


DataQualityDashboard::viewDqDashboard(
  jsonPath = file.path(getwd(), "data", "mimic_iv_demo", "json", "results_MIMICIVdemo210426.json"))
)

