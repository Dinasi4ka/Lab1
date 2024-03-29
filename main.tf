module "authors" {
  source                = "./modules/dynamodb"
  name                  = "authors"
 
}

module "courses" {
  source                = "./modules/dynamodb"
  name                  = "courses"
  
}

module "iam" {
  source = "./modules/iam"
  name   = "iam"

  dynamodb_authors_arn = module.authors.dynamodb_arn
  dynamodb_courses_arn = module.courses.dynamodb_arn
}

module "lambda" {
    source = "./modules/lambda"
    name   = "lambda"

    get_all_courses_arn = module.iam.get_all_courses_role_arn
    get_all_authors_arn = module.iam.get_all_authors_role_arn
    get_course_arn      = module.iam.get_course_role_arn
    save_course_arn     = module.iam.save_course_role_arn
    delete_course_arn   = module.iam.delete_course_role_arn
    update_course_arn   = module.iam.update_course_role_arn
   
}