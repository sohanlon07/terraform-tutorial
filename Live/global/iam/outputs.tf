# output "all_users" {
#     value = aws_iam_user.example
#     description = "Data for all users"
# }

output "all_arns" {
    value = values(module.users)[*].user_arn
    description = "Data for all users"
}