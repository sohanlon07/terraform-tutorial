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