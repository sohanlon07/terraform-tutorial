output "all_users" {
    value = aws_iam_user.example
    description = "Data for all users"
}

output "upper_names" {
    value = [for user_name in var.user_names : upper(user_name) if length(user_name) < 5]
}

output "bios" {
    value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
    value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "for_directive" {
    value = "%{ for i, name in var.names}(${i})${name}, %{ endfor}" 
}

output "neo_cloudwatch_policy_arn" {
    value = one(concat(
          aws_iam_user_policy_attachment.neo_cloudwatch_full_access[*].policy_arn,
          aws_iam_user_policy_attachment.neo_cloudwatch_read_only[*].policy_arn
    ))
}