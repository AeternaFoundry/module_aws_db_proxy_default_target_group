resource "aws_db_proxy_default_target_group" "db_proxy_default_target_groups" {
  for_each = var.db_proxy_default_target_groups

  db_proxy_name = each.value.db_proxy_name
  region        = each.value.region

  dynamic "connection_pool_config" {
    for_each = each.value.connection_pool_config != null ? [each.value.connection_pool_config] : []
    content {
      connection_borrow_timeout    = connection_pool_config.value.connection_borrow_timeout
      init_query                   = connection_pool_config.value.init_query
      max_connections_percent      = connection_pool_config.value.max_connections_percent
      max_idle_connections_percent = connection_pool_config.value.max_idle_connections_percent
      session_pinning_filters      = connection_pool_config.value.session_pinning_filters
    }
  }
}

