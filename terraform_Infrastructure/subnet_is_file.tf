# resource "local_file" "pub_subnet_ids" {
#   content  = join(", ",[aws_subnet.public[0].id,aws_subnet.public[1].id])
#   filename = "~/play/the_lads/jenkinsServer/subnetids.txt"
# }
