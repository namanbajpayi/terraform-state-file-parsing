 # # create key
resource "tls_private_key" "key_pvt" {
  algorithm   = "RSA"
}

/*   save key on local system   */

resource "local_file" "keyfile" {
  depends_on = [ tls_private_key.key_pvt, ]
  content = tls_private_key.key_pvt.private_key_pem
  filename = "key.pem"
}


/*   sending public key to aws   */

resource "aws_key_pair" "key_pub" {
  depends_on = [ local_file.keyfile, ]
  key_name   = "project-key"
  public_key = tls_private_key.key_pvt.public_key_openssh
}
