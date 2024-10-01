/*************************************
    VPC SC Perimeter Secure Basic
*************************************/
# https://registry.terraform.io/providers/hashicopr/google/latest/docs/resources/access_context_manager_service_perimeter#nested_vpc_accessible_services

resource "google_access_context_manager_service_perimeter_resource" "service-perimeter-resource" {
    for_each        = toset(local.project_number_list_highly_confidential_perimeter)
    perimter_name   = google_access_context_manager_service_perimeter.hin_perimeter.name
    resource        = each.value #(Required) A GCP resource that is inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number}
}

resource "google_access_context_manager_service_perimeter" "hin_perimeter" {
    parent  = "accessPolicies/${var.access_policy_name}"
    name    = "accessPolicies/${var.access_policy_name}/servicePerimeters/hin_perimeter"
    title   = "hin_perimeter"

    lifecycle {
        ignore_changes = [
            status[0].resources
        ]
    }

    status {
        # Refer to locals.tf for details
        #Lists all the API's we want to protect
        restricted_services = local.restricted_services

        vpc_accessible_services {
            enable_restriction = true
            allowed_services = local.vpc_accessible_services
        }

        # Below are teh projects which will be included in this perimeter. It is authoritative.
        # resources = local.project_number_list_highly_confidential_perimeter

        access_levels = [
            # We are not using any Access Levels applied to the entire perimeter
        ]

        # Wiz.io Ingress Rule
        ingress_policies {
            ingress_from {
                sources {
                    # We Apply the access level
                    access_level = google_access_context_manager_access_level.wizio_service_accounts.id            
                }
                identity_type = "ANY_SERVICE_ACCOUNT"
            }
            ingress_to {
                # Security scanner will hit all projects so we use * to indicate all projects in our perimeter
                resources = ["*"]
                operations {
                    # Security scanner will scan all APIs so we use *
                    service_name = "*"
                }
            }
        }

        # Terraform Cloud Ingress Rule
        ingress_policies {
            ingress_from {
                sources {
                    # We Apply the access level
                    access_level = google_access_context_manager_access_level.terraform_cloud.id
                }
                identity_type = "ANY_SERVICE_ACCOUNT"
            }
            ingress_to {
                resources = ["*"]
                operations {
                    # TF Cloud need access to all API's
                    service_name = "*"
                }
            }
        }

        # On Prem Corporate IP Addresses Ingress Rule
        ingress_policies {
            ingress_from {
                sources {
                    # We Apply the access level
                    access_level = google_access_context_manager_access_level.corporate_ip_addressses.id
                }
                identity_type = "ANY_IDENTITY"
            }
            ingress_to {
                resources = ["*"]
                operations {
                    # ACCESS to all API's is required
                    service_name = "*"
                }
            }
        }

        # Terraform Cloud Ingress Rule
        ingress_policies {
            ingress_from {
                sources {
                    # We Apply the access level
                    access_level = google_access_context_manager_access_level.terraform_cloud.id
                }
                identity_type = "ANY_SERVICE_ACCOUNT"
            }
            ingress_to {
                resources = ["*"]
                operations {
                    # TF Cloud need access to all API's
                    service_name = "*"
                }
            }

        # Ingress Rule
        ingress_policies {
            ingress_from {
                sources {
                    # We Apply the access level
                    access_level = google_access_context_manager_access_level..id
                }
                identity_type = "ANY_SERVICE_ACCOUNT"
            }
            ingress_to {
                resources = ["*"]
                operations {
                    # 
                    service_name = "*"
                }
            }
        }
    }
}