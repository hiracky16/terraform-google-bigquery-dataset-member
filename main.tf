resource "google_bigquery_dataset_iam_member" "bigquery_dataset_members" {
  for_each   = { for d in local.flatten_dataset_members : "${d.dataset_id}-${d.member}-${d.role}" => d }
  dataset_id = data.google_bigquery_dataset.datasets[each.value.dataset_id].dataset_id
  role       = each.value.role
  member     = each.value.member
}

resource "google_project_iam_member" "bigquery_users" {
  for_each = local.bigquery_user_members
  project  = var.project
  member   = each.value
  role     = "roles/bigquery.user"
}
