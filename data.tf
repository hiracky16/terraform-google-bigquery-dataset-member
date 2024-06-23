data "google_bigquery_dataset" "datasets" {
  for_each   = { for d in var.datasets : d.id => d }
  dataset_id = each.key
  project    = var.project
}
