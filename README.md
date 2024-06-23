# terraform-google-bigquery-dataset-member

## Overview

The `terraform-google-bigquery-dataset-member` module provides a comprehensive solution for assigning IAM roles to BigQuery datasets. This module simplifies the process of managing IAM policies for BigQuery datasets, making it easier to control access and permissions.

## Features

- Assign IAM roles to multiple BigQuery datasets.
- Support for multiple roles and members per dataset.
- Easy integration with existing Terraform configurations.
- Members specified will be assigned `roles/bigquery.user` by default.

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
