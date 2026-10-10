output "db_proxy_default_target_groups_id" {
  description = "Map of id values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "db_proxy_default_target_groups_arn" {
  description = "Map of arn values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "db_proxy_default_target_groups_connection_pool_config" {
  description = "Map of connection_pool_config values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => one(v.connection_pool_config) if v.connection_pool_config != null && length(v.connection_pool_config) > 0 }
}
output "db_proxy_default_target_groups_db_proxy_name" {
  description = "Map of db_proxy_name values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => v.db_proxy_name if v.db_proxy_name != null && length(v.db_proxy_name) > 0 }
}
output "db_proxy_default_target_groups_name" {
  description = "Map of name values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "db_proxy_default_target_groups_region" {
  description = "Map of region values across all db_proxy_default_target_groups, keyed the same as var.db_proxy_default_target_groups"
  value       = { for k, v in aws_db_proxy_default_target_group.db_proxy_default_target_groups : k => v.region if v.region != null && length(v.region) > 0 }
}

