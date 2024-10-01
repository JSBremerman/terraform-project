/***********************************
 Variables
***********************************/

variable "organization_id" {
    description = "Your GCP Organization ID"
}

/*
    NOTE: Your organization most likely already has an access policy name set up.
    DO NOT create an Access Policy https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_policy
    If your organization already has an access policy then recreating one willclear out all existing perimeters and configurations
*/

variable "access_policy_name" {
    description = "Your GCP Access Context Manager Access Policy Name (number really)."
}

# variable "corporate_ip_addresses" {
#     description = "The IP addresses of the corporate network. When a user VPN's into corp and connects to GCP (e.g. via Console) this is the public IP that GCP would 'see'"
#     type = list(string)
# }

# variable "corporate_allowed_regions" {
#     description = "The allowed regions for corporate team to come from. - Must be a valid ISO 3166-1 alpha-2 code"
#     type = list(string)
# }

# variable "wiz_io_ip_addresses" {
#     description = "The IP addresses of the security scanner which will scan the projects in our perimeter"
#     type = list(string)
# }

# variable "wiz_io_allowed_regions" {
#     description = "The allowed regions for the security scanner to come from. - Must be a valid ISO 3166-1 alpha-2 code"
#     type = list(string)
# }

# variable "wiz_io_service_accounts" {
#     type = list(string)  
# }