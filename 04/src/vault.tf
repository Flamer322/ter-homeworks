# resource "vault_generic_secret" "vault_example_write" {
#   path = "secret/example_write"

#   data_json = <<EOT
# {
#   "write": "write!"
# }
# EOT
# }

# data "vault_generic_secret" "vault_example" {
#   path = "secret/example"
# }

# data "vault_generic_secret" "vault_example_write" {
#   path = "secret/example_write"

#   depends_on = [
#     vault_generic_secret.vault_example_write
#   ]
# }

# output "vault_example" {
#   value = nonsensitive(data.vault_generic_secret.vault_example.data)
# }

# output "vault_example_write" {
#   value = nonsensitive(data.vault_generic_secret.vault_example_write.data)
# }
