resource "aws_ecr_repository" "app" {
  name = basename(abspath("../"))
}
