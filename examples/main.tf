module "bigquery_members" {
  source  = "path/to/terraform-google-bigquery-dataset-member"
  project = "projectA"
  datasets = [
    {
      id : "datasetA",
      members : [
        {
          member : "user:user-test@gmail.com",
          role : "roles/bigquery.dataEditor"
        },
        {
          member : "group:group-test@gmail.com",
          role : "roles/bigquery.dataOwner"
        }
      ]
    },
    {
      id : "datasetB",
      members : [
        {
          member : "serviceAccount:sa-test@projectA.iam.gserviceaccount.com",
          role : "roles/bigquery.dataViewer"
        }
      ]
    }
  ]
}
