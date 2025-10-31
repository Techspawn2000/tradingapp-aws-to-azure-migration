# random resources
resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "random_string" "pwd" {
  length           = 12
  special          = true
  override_special = "_-@"
}
