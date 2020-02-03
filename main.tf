
# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "helloworld"
  machine_type = var.machine_type
  zone         = var.zone

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = var.linux
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }


  # Executa a playbook na máquina provisionada
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory --private-key ../id_rsa ansible/playbook.yml"
  }

}

## Cria SQL Gerenciado com Engine MySQL 
#resource "google_sql_database_instance" "helloworld" {
#  name             = "database"
#  database_version = var.mysql
#  region           = var.region
#
#  settings {
#    tier = var.dbtype
#  }
#}
