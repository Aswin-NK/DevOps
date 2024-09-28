locals {
  owners = var.businessdivision
  enivronment = var.environment
  name = "${var.environment}-${var.businessdivision}"
  common_tags ={
      owners = local.owners
      enivronment = local.enivronment
      }
}