module "table_authors" {
  source                = "./modules/dynamodb"
  name                  = "authors"
 
}

module "table_courses" {
  source                = "./modules/dynamodb"
  name                  = "courses"
  
}