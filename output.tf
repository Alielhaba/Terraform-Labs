output "instance_public_ip" {
  value = aws_instance.public-instance.public_ip
}
output "instance_private_ip" {
  value = aws_instance.private-instance.private_ip
}