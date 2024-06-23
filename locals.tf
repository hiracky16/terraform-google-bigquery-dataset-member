locals {
    flatten_dataset_members = flatten([
        for dataset in var.datasets : [
            for member in dataset.members : {
                dataset_id: dataset.id,
                member: member.member,
                role: member.role
            }
        ]
    ])

    bigquery_user_members = toset([for f in local.flatten_dataset_members : f.member])
}