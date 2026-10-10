variable "db_proxy_default_target_groups" {
  description = <<EOT
Map of db_proxy_default_target_groups, attributes below
Required:
    - db_proxy_name
Optional:
    - region
    - connection_pool_config (block):
        - connection_borrow_timeout (optional)
        - init_query (optional)
        - max_connections_percent (optional)
        - max_idle_connections_percent (optional)
        - session_pinning_filters (optional)
EOT

  type = map(object({
    db_proxy_name = string
    region        = optional(string)
    connection_pool_config = optional(object({
      connection_borrow_timeout    = optional(number)
      init_query                   = optional(string)
      max_connections_percent      = optional(number)
      max_idle_connections_percent = optional(number)
      session_pinning_filters      = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.db_proxy_default_target_groups : (
        v.connection_pool_config == null || (v.connection_pool_config.connection_borrow_timeout == null || (v.connection_pool_config.connection_borrow_timeout >= 0 && v.connection_pool_config.connection_borrow_timeout <= 3600))
      )
    ])
    error_message = "must be between 0 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.db_proxy_default_target_groups : (
        v.connection_pool_config == null || (v.connection_pool_config.max_connections_percent == null || (v.connection_pool_config.max_connections_percent >= 1 && v.connection_pool_config.max_connections_percent <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.db_proxy_default_target_groups : (
        v.connection_pool_config == null || (v.connection_pool_config.max_idle_connections_percent == null || (v.connection_pool_config.max_idle_connections_percent >= 0 && v.connection_pool_config.max_idle_connections_percent <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.db_proxy_default_target_groups : (
        v.connection_pool_config == null || (v.connection_pool_config.session_pinning_filters == null || (alltrue([for x in v.connection_pool_config.session_pinning_filters : contains(["EXCLUDE_VARIABLE_SETS"], x)])))
      )
    ])
    error_message = "must be one of: EXCLUDE_VARIABLE_SETS"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

