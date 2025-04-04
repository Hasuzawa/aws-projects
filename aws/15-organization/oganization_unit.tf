locals {
  root = data.aws_organizations_organization.current.roots[0]
}

resource "aws_organizations_organizational_unit" "department" {
  name      = "department"
  parent_id = local.root.id
}

resource "aws_organizations_organizational_unit" "sales" {
  name      = "sales"
  parent_id = aws_organizations_organizational_unit.department.id
}

resource "aws_organizations_organizational_unit" "engineering" {
  name      = "engineering"
  parent_id = aws_organizations_organizational_unit.department.id
}

resource "aws_organizations_organizational_unit" "hardware" {
  name      = "hardware"
  parent_id = aws_organizations_organizational_unit.engineering.id
}

resource "aws_organizations_organizational_unit" "software" {
  name      = "software"
  parent_id = aws_organizations_organizational_unit.engineering.id
}
