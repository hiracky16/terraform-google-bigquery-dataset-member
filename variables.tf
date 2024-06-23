variable "datasets" {
  type = list(
    object({
      id : string,
      members : list(
        object({
          member : string
          role : string
      }))
  }))

  validation {
    condition = alltrue(
      flatten([
        for d in var.datasets : [
          for m in d.members : contains(
            ["roles/bigquery.dataViewer", "roles/bigquery.dataEditor", "roles/bigquery.dataOwner"],
            m.role
          )
        ]
      ])
    )
    error_message = "Allowed value for datasets.members.role are \"roles/bigquery.dataViewer\", \"roles/bigquery.dataEditor\" or \"roles/bigquery.dataOwner\""
  }

  validation {
    condition = alltrue(
      flatten([
        for d in var.datasets : [
          for m in d.members : anytrue([startswith(m.member, "user:"), startswith(m.member, "serviceAccount:"), startswith(m.member, "group:")])
        ]
      ])
    )
    error_message = "Allowed value for datasets.members.member are started by `user:`, `serviceAccount:` or `group:`."
  }
}

variable "project" {
  type = string
}
