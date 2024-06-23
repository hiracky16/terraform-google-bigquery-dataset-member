# terraform-google-bigquery-dataset-member

This Terraform module allows you to manage IAM roles for BigQuery datasets in Google Cloud Platform. It simplifies the process of assigning roles to multiple datasets, supporting multiple roles and members per dataset. This module is ideal for managing access control in a structured and reusable way.

Creates the follow resources:
- google_bigquery_dataset_iam_member
- google_project_iam_member

## Features

- Assign IAM roles to multiple BigQuery datasets.
- Support for multiple roles and members per dataset.
    - Allowed roles are `roles/bigquery.dataViewer`, `roles/bigquery.dataEditor` or `roles/bigquery.dataOwner`
- Members specified will be assigned `roles/bigquery.user` by default.
- Easy integration with existing Terraform configurations.

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
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
```

## Inputs

| Name      | Description                                  | Type   | Default | Required |
|-----------|----------------------------------------------|--------|---------|----------|
| project   | The ID of the project in which the datasets belong. | string | n/a     | yes      |
| datasets  | A list of datasets and their associated IAM members. Each dataset must have an `id` and a list of `members`. | list(object({ id = string, members = list(object({ member = string, role = string })) })) | n/a     | yes      |

## Outputs

No outputs.

## Example
- [example](https://github.com/hiracky16/terraform-google-bigquery-dataset-member/tree/main/examples)

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/hiracky16/terraform-google-bigquery-dataset-member/tree/main/LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or enhancements.

## Authors

- [hiracky16](https://github.com/hiracky16)

## versions.tf

```hcl
terraform {
  required_version = ">= 0.12"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.50, < 5.0"
    }
  }
}
```

