resource "null_resource" "instance1" {
  depends_on = [module.ec2_project1, aws_eip.eip1]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/41732/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip1.public_ip
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/chaves/41732/seekers-tf.pem"
    destination = "/home/ubuntu/seekers-tf.pem"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/compose/docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/compose/monitoring-compose.yml"
    destination = "/home/ubuntu/monitoring-compose.yml"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/start_model.sh"
    destination = "/home/ubuntu/start_model.sh"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/start_scraper.sh"
    destination = "/home/ubuntu/start_scraper.sh"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/daemon.json"
    destination = "/home/ubuntu/daemon.json"
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/crontab-scripts.sh"
    destination = "/home/ubuntu/crontab-scripts.sh"
  }

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 10"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ubuntu/crontab-scripts.sh /etc/cron.d/crontab-scripts.sh",
      "sudo systemctl restart cron",
      "sleep 20s",
      "sudo mv /home/ubuntu/daemon.json /etc/docker/daemon.json",
      "sudo systemctl restart docker",
      "sleep 20s",
      "mkdir -p /home/ubuntu/.aws",
      "sudo docker swarm init --advertise-addr ${module.ec2_project1.private_ip}",
      "sudo docker swarm join-token -q worker > /home/ubuntu/swarm_wkr_token"
    ]
  }

  provisioner "file" {
    source      = "C:/Users/kaiob/.aws/credentials"
    destination = "/home/ubuntu/.aws/credentials"
  }

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 10"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/seekers-tf.pem",
      "scp -o StrictHostKeyChecking=no -i /home/ubuntu/seekers-tf.pem /home/ubuntu/swarm_wkr_token ubuntu@${aws_eip.eip2.public_ip}:/home/ubuntu/swarm_token",
      "scp -o StrictHostKeyChecking=no -i /home/ubuntu/seekers-tf.pem /home/ubuntu/swarm_wkr_token ubuntu@${aws_eip.eip3.public_ip}:/home/ubuntu/swarm_token",
      "sudo rm -rf /home/ubuntu/seekers-tf.pem",
      "docker stack deploy -c /home/ubuntu/monitoring-compose.yml swarmpit",
      "sleep 5s",
      "docker stack deploy -c /home/ubuntu/docker-compose.yml seekers"
    ]
  }
}

resource "null_resource" "instance2" {
  depends_on = [module.ec2_project1, module.ec2_project2, aws_eip.eip2, null_resource.instance1]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/41732/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip2.public_ip
  }

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 10"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/daemon.json"
    destination = "/home/ubuntu/daemon.json"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ubuntu/daemon.json /etc/docker/daemon.json",
      "sudo systemctl restart docker",
      "sleep 20s",
      "sudo docker swarm join --token $(cat /home/ubuntu/swarm_token) ${module.ec2_project1.private_ip}:2377"
    ]
  }
}

resource "null_resource" "instance3" {
  depends_on = [module.ec2_project1, module.ec2_project3, aws_eip.eip3, null_resource.instance2]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(format("C:/git/seekers-terraform/chaves/41732/%s.pem", var.KEY_NAME))
    host        = aws_eip.eip3.public_ip
  }

  provisioner "local-exec" {
    command     = "Start-Sleep -Seconds 10"
    interpreter = ["PowerShell", "-Command"]
  }

  provisioner "file" {
    source      = "C:/git/seekers-terraform/AWS/scripts/daemon.json"
    destination = "/home/ubuntu/daemon.json"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ubuntu/daemon.json /etc/docker/daemon.json",
      "sudo systemctl restart docker",
      "sleep 20s",
      "sudo docker swarm join --token $(cat /home/ubuntu/swarm_token) ${module.ec2_project1.private_ip}:2377"
    ]
  }
}