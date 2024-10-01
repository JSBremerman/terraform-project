/*********************************
Access Levels
**********************************/
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resoures/access_context_manager_access_level

#Access Level for Wiz.io Service Account(s)

resource "google_access_context_manager_access_level" "wizio_service_accounts" {
    parent  = "accessPolicies/${var.access_policy_name}"
    name    = "accessPolicies/${var.access_policy_name}/accessLevels/wizio_service_accounts"
    title   = "wizio_service_accounts"
    basic {
        conditions {
            members         = local.wiz_io_service_accounts #Wiz.io specific service accounts(s)
            regions         = local.wiz_io_allowed_regions
            ip_subnetworks  = local.wiz.io_ip_addresses
        }
    }
}

# Access Level for Terraform Cloud Service Accounts(s)

resource "google_accesss_context_manager_access_level" "terraform_cloud" {
    parent  = "accessPolicies/${var.access_policy_name}"
    name    = "accessPolicies/${var.access_policy_name}/accessLevels/terraform_cloud"
    title   = "terraform_cloud"
    basic {
        conditions {
            members = local.tf_cloud_service_accounts # TF Cloud specific service accounts
            regions = local.tf_cloud_allowed_regions # ip_subnetworks = local.tf_cloud_ip_addresses
        }
    }
}

# Access Level for Corporate Public IP Addresses

resource "google_access_context_manager_access_level" "corporate_ip_addressses" {
    partent = "accessPolicies/${var.access_policy_name}"
    name    = "accessPolicies/${var.access_policy_name}/accessLevels/corporate_ip_addresses"
    title   = "corporate_ip_addresses"
    basic {
        conditions {
            regions         = local.corporate_allowed_regions # Corporate specific allowed regions(s)
            ip_subnetworks  = local.corporate_ip_addresses
        }
    }
}

#Access Level for Qualys CloudView Service Account(s)

resource "google_access_context_manager_access_level" "qualys_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/qualys_service_accounts"
    title       = "qualys_service_accounts"
    basic {
        conditions {
            members         = local.qualys_service_accounts # Qualys specific service account(s)
            regions         = local.qualys_allowed_regions
            ip_subnetworks  = local.qualys_ip_addresses
        }
    }
}

# Access Level for Commvault Service Accounts(s)

resource "google_access_context_manager_access_level" "commvault_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/commvault_service_accounts"
    title       = "commvault_service_accounts"
    basic {
        conditions {
            members = local.commvault_service_accounts # Commvault specific service accounts(s)
        }
    }
}

# Access Level for Cloud Build Service Accounts(s)

resource "google_access_context_manager_access_level" "cloud_build_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/cloud_build_service_accounts"
    title       = "cloud_build_service_accounts"
    basic {
        conditions {
            members = local.cloud_build_service_accounts # Cloud Build service accounts(s)
        }
    }
}

# RITM001773658

resource "google_access_context_manager_access_level" "infor_cloud_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/infor_cloud_service_accounts"
    title       = "infor_cloud_service_accounts"
    basic {
        conditions {
            members = local.infor_cloud_service_accounts #SA used by Infor Cloud            
        }
    }
}

# RITM001792958

resource "google_access_context_manager_access_level" "hrg_tel_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/hrg_tel_service_accounts"
    title       = "hrg_tel_service_accounts"
    basic {
        conditions {
            members = local.hrg_tel_service_accounts
        }
    }
}

# SCTASK001989632 Access Level for HCA Para Looker Service Accounts(s) (RITM001807298)

resource "google_access_context_manager_access_level" "hca_para_looker_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/hca_para_looker_service_accounts"
    title       = "hca_para_looker_service_accounts"
    basic {
        conditions {
            members = local.hca_para_looker_service_accounts # HCA Para Looker Service Accounts(s)
        }
    }
}

# RITM001837767

resource "google_access_context_manager_access_level" "hca_dsa_scheduling_power_bi_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/hca_dsa_scheduling_power_bi_service_accounts"
    title       = "hca_dsa_scheduling_power_bi_service_accounts"
    basic {
        conditions {
            members = local.hca_dsa_scheduling_power_bi_service_accounts            
        }
    }
}

# RITM001841258

resource "google_access_context_manager_access_level" "palantir_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/palantir_service_accounts"
    title       = "palantir_service_accounts"
    basic {
        conditions {
            members = local.palantir_service_accounts
        }
    }
}

# RITM001842317

resource "google_access_context_manager_access_level" "hca_hin_hr_power_bi_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/hca_hin_hr_power_bi_service_accounts"
    title       = "hca_erp_hin_hr_power_bi_service_accounts"
    basic {
        conditions {
            members = local.hca_hin_hr_power_bi_service_accounts # HCA HIN HR PowerBI SA
        }
    }
}

# RITM001885052

resource "google_access_context_manager_access_level" "hca_erp_hin_hr_power_bi_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/hca_erp_hin_hr_power_bi_service_accounts"
    title       = "hca_erp_hin_hr_power_bi_service_accounts"
    basic {
        conditions {
            members = local.hca_erp_hin_hr_power_bi_service_accounts_power_bi_service_accounts # HCA ERP HIN PowerBI SA            
        }
    }
}

#RITM001840492 RSS mgt recommender service accounts

resource "google_access_context_manager_access_level" "rss_mgt_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/rss_mgt_service_accounts"
    title       = "rss_mgt_service_accounts"
    basic {
        conditions {
            members = local.rss_mgt_service_accounts
            regions = local.us_allowed_regions
        }
    }
}

resource "google_access_context_manager_access_level" "qlik_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/qlik_service_accounts"
    title       = "qlik_service_accounts"
    basic {
        conditions {
            members = local.qlik_service_accounts
            regions = local.us_allowed_regions
        }
    }
}

resource "google_access_context_manager_access_level" "dbt_cloud_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/dbt_cloud_service_accounts"
    title       = "dbt_cloud_service_accounts"
    basic {
        conditions {
            members = local.dbt_cloud_service_accounts
            regions = local.us_allowed_regions
        }
    }
}

# RITM001773658

resource "google_access_context_manager_access_level" "infor_bq_viewcloud_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/infor_bq_viewcloud_service_accounts"
    title       = "infor_bq_viewcloud_service_accounts"
    basic {
        conditions {
            members = local.infor_bq_viewcloud_service_accounts #SA used by Infor Cloud View Only BQ            
        }
    }
}

# RITM001962528

resource "google_access_context_manager_access_level" "augmedix_cloud_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/augmedix_cloud_service_accounts"
    title       = "augmediz_cloud_service_accounts"
    basic {
        conditions {
            members = local.augmedix_cloud_service_accounts # SA used by Augmedix            
        }
    }
}

# RITM001972380

resource "google_access_context_manager_access_level" "cdr_cloud_service_accounts" {
    parent      = "accessPolicies/${var.access_policy_name}"
    name        = "accessPolicies/${var.access_policy_name}/accessLevels/cdr_cloud_service_accounts"
    title       = "cdr_cloud_service_accounts"
    basic {
        conditions {
            members = local.cdr_cloud_service_accounts            
        }
    }
}

resource "google_access_context_manager_access_level" "hca_hra_hri_pwrbi_service_accounts" {
    parent  = "accessPolicies/${var.access_policy_name}"
    name    = "accessPolicies/${var.access_policy_name}/accessLevels/hca_hra_pwrbi_service_accounts"
    title   = "hca_hra_hri_pwrbi_service_accounts"
    basic {
        conditions {
            members = local.hca_hra_hri_pwrbi_service_accounts_power_bi_service_accounts
        }
    }
}