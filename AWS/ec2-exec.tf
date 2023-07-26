resource "null_resource" "instance1" {
  depends_on = [module.ec2_project1, aws_eip.eip1]

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/TCC/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip1.public_ip
  }

  provisioner "remote-exec" {
    script = "scripts/install-docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker swarm init --advertise-addr ${module.ec2_project1.private_ip}",
      "sudo docker swarm join-token -q worker > /home/ubuntu/swarm_wkr_token"
    ]
  }

  provisioner "file" {
    source      = "compose/docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/chaves/TCC/seekers-tf.pem"
    destination = "/home/ubuntu/seekers-tf.pem"
  }

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "remote-exec" {
    inline = [
        "sudo chmod 400 /home/ubuntu/seekers-tf.pem",
      "scp -o StrictHostKeyChecking=no -i /home/ubuntu/seekers-tf.pem /home/ubuntu/swarm_wkr_token ubuntu@${aws_eip.eip2.public_ip}:/home/ubuntu/swarm_token",
      "scp -o StrictHostKeyChecking=no -i /home/ubuntu/seekers-tf.pem /home/ubuntu/swarm_wkr_token ubuntu@${aws_eip.eip3.public_ip}:/home/ubuntu/swarm_token",
      "sudo rm -rf /home/ubuntu/seekers-tf.pem"
    ]
  }


#   provisioner "local-exec" {
#     command = "scp -i lab-swarm.pem ubuntu@${aws_eip.eip1.public_ip}:/tmp/swarm_mgr_token swarm_mgr_token"
#     interpreter = ["PowerShell", "-Command"]
#   }

#   provisioner "local-exec" {
#     command = "pscp -i lab-swarm.pem ubuntu@${aws_eip.eip1.public_ip}:/home/ubuntu/swarm_wkr_token C:/git/seekers-terraform/AWS/swarm_wkr_token"
#     interpreter = ["PowerShell", "-Command"]
#   }
}

resource "null_resource" "instance2" {
  depends_on = [module.ec2_project1, module.ec2_project2, aws_eip.eip2, null_resource.instance1]

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/TCC/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip2.public_ip
  }

  provisioner "remote-exec" {
    script = "scripts/install-docker.sh"
  }

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

#   provisioner "file" {
#     source = "C:/git/seekers-terraform/AWS/swarm_wkr_token"
#     destination = "/home/ubuntu/swarm_token"
#   }

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker swarm join --token $(cat /home/ubuntu/swarm_token) ${module.ec2_project1.private_ip}:2377"
    ]
  }
}

resource "null_resource" "instance3" {
  depends_on = [module.ec2_project1, module.ec2_project3, aws_eip.eip3, null_resource.instance2]

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/TCC/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip2.public_ip
  }

  provisioner "remote-exec" {
    script = "scripts/install-docker.sh"
  }

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

#   provisioner "file" {
#     source = "C:/git/seekers-terraform/AWS/swarm_wkr_token"
#     destination = "/home/ubuntu/swarm_token"
#   }

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 30"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker swarm join --token $(cat /home/ubuntu/swarm_token) ${module.ec2_project1.private_ip}:2377"
    ]
  }
}