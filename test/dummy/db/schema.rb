# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190814130442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.integer  "acctid"
    t.string   "homedir"
    t.boolean  "local"
    t.string   "domain"
    t.string   "accttype"
    t.bigint   "vm_or_template_id"
    t.string   "display_name"
    t.string   "comment"
    t.string   "expires"
    t.boolean  "enabled"
    t.datetime "last_logon"
    t.bigint   "host_id"
    t.index ["accttype"], name: "index_accounts_on_accttype", using: :btree
    t.index ["host_id"], name: "index_accounts_on_host_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_accounts_on_vm_id", using: :btree
  end

  create_table "advanced_settings", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "description"
    t.text     "value"
    t.string   "default_value"
    t.string   "min"
    t.string   "max"
    t.boolean  "read_only"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.index ["resource_id", "resource_type"], name: "index_advanced_settings_on_resource_id_and_resource_type", using: :btree
  end

  create_table "asset_details", id: :bigserial, force: :cascade do |t|
    t.text     "description"
    t.text     "contact"
    t.text     "location"
    t.text     "room"
    t.text     "rack_name"
    t.text     "lowest_rack_unit"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "product_name"
    t.string   "manufacturer"
    t.string   "machine_type"
    t.string   "model"
    t.string   "serial_number"
    t.string   "field_replaceable_unit"
    t.string   "part_number"
    t.string   "location_led_ems_ref"
    t.string   "location_led_state"
    t.index ["resource_id", "resource_type"], name: "index_asset_details_on_resource_id_and_resource_type", using: :btree
  end

  create_table "assigned_server_roles", id: :bigserial, force: :cascade do |t|
    t.bigint  "miq_server_id"
    t.bigint  "server_role_id"
    t.boolean "active"
    t.integer "priority"
    t.index ["miq_server_id"], name: "index_assigned_server_roles_on_miq_server_id", using: :btree
    t.index ["server_role_id"], name: "index_assigned_server_roles_on_server_role_id", using: :btree
  end

  create_table "audit_events", id: :bigserial, force: :cascade do |t|
    t.string   "event"
    t.string   "status"
    t.text     "message"
    t.string   "severity"
    t.bigint   "target_id"
    t.string   "target_class"
    t.string   "userid"
    t.string   "source"
    t.datetime "created_on"
    t.index ["target_id", "target_class"], name: "index_audit_events_on_target_id_and_target_class", using: :btree
  end

  create_table "authentication_configuration_script_bases", id: :bigserial, force: :cascade do |t|
    t.bigint "authentication_id"
    t.bigint "configuration_script_base_id"
    t.index ["configuration_script_base_id"], name: "index_configuration_script_base_id", using: :btree
  end

  create_table "authentication_orchestration_stacks", id: :bigserial, force: :cascade do |t|
    t.bigint "authentication_id"
    t.bigint "orchestration_stack_id"
    t.index ["authentication_id", "orchestration_stack_id"], name: "index_authentication_orchestration_stacks", unique: true, using: :btree
  end

  create_table "authentications", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "authtype"
    t.string   "userid"
    t.string   "password"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "last_valid_on"
    t.datetime "last_invalid_on"
    t.datetime "credentials_changed_on"
    t.string   "status"
    t.string   "status_details"
    t.string   "type"
    t.text     "auth_key"
    t.string   "fingerprint"
    t.string   "service_account"
    t.boolean  "challenge"
    t.boolean  "login"
    t.text     "public_key"
    t.text     "htpassd_users",                             default: [], array: true
    t.text     "ldap_id",                                   default: [], array: true
    t.text     "ldap_email",                                default: [], array: true
    t.text     "ldap_name",                                 default: [], array: true
    t.text     "ldap_preferred_user_name",                  default: [], array: true
    t.string   "ldap_bind_dn"
    t.boolean  "ldap_insecure"
    t.string   "ldap_url"
    t.string   "request_header_challenge_url"
    t.string   "request_header_login_url"
    t.text     "request_header_headers",                    default: [], array: true
    t.text     "request_header_preferred_username_headers", default: [], array: true
    t.text     "request_header_name_headers",               default: [], array: true
    t.text     "request_header_email_headers",              default: [], array: true
    t.string   "open_id_sub_claim"
    t.string   "open_id_user_info"
    t.string   "open_id_authorization_endpoint"
    t.string   "open_id_token_endpoint"
    t.text     "open_id_extra_scopes",                      default: [], array: true
    t.text     "open_id_extra_authorize_parameters"
    t.text     "certificate_authority"
    t.string   "google_hosted_domain"
    t.text     "github_organizations",                      default: [], array: true
    t.string   "rhsm_sku"
    t.string   "rhsm_pool_id"
    t.string   "rhsm_server"
    t.string   "manager_ref"
    t.text     "options"
    t.bigint   "evm_owner_id"
    t.bigint   "miq_group_id"
    t.bigint   "tenant_id"
    t.index ["resource_id", "resource_type"], name: "index_authentications_on_resource_id_and_resource_type", using: :btree
    t.index ["type"], name: "index_authentications_on_type", using: :btree
  end

  create_table "automate_workspaces", id: :bigserial, force: :cascade do |t|
    t.string "guid"
    t.bigint "user_id"
    t.bigint "tenant_id"
    t.jsonb  "output"
    t.jsonb  "input"
  end

  create_table "availability_zones", id: :bigserial, force: :cascade do |t|
    t.bigint "ems_id"
    t.string "name"
    t.string "ems_ref"
    t.string "type"
    t.index ["ems_id"], name: "index_availability_zones_on_ems_id", using: :btree
    t.index ["type"], name: "index_availability_zones_on_type", using: :btree
  end

  create_table "binary_blob_parts", id: :bigserial, force: :cascade do |t|
    t.binary "data"
    t.bigint "binary_blob_id"
    t.index ["binary_blob_id"], name: "index_binary_blob_parts_on_binary_blob_id", using: :btree
  end

  create_table "binary_blobs", id: :bigserial, force: :cascade do |t|
    t.string  "resource_type"
    t.bigint  "resource_id"
    t.string  "md5"
    t.decimal "size",          precision: 20
    t.decimal "part_size",     precision: 20
    t.string  "name"
    t.string  "data_type"
    t.index ["resource_id", "resource_type"], name: "index_binary_blobs_on_resource_id_and_resource_type", using: :btree
  end

  create_table "blacklisted_events", id: :bigserial, force: :cascade do |t|
    t.string   "event_name"
    t.string   "provider_model"
    t.bigint   "ems_id"
    t.boolean  "system"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bottleneck_events", id: :bigserial, force: :cascade do |t|
    t.datetime "timestamp"
    t.datetime "created_on"
    t.string   "resource_name"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "event_type"
    t.integer  "severity"
    t.string   "message"
    t.text     "context_data"
    t.boolean  "future"
    t.index ["resource_id", "resource_type"], name: "index_bottleneck_events_on_resource_id_and_resource_type", using: :btree
  end

  create_table "canisters", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "serial_number"
    t.string   "name"
    t.string   "position"
    t.string   "status"
    t.string   "health_state"
    t.string   "disk_bus_type"
    t.string   "phy_isolation"
    t.string   "controller_redundancy_status"
    t.integer  "disks"
    t.integer  "disk_channel"
    t.integer  "system_cache_memory"
    t.string   "power_state"
    t.string   "host_ports"
    t.string   "hardware_version"
    t.bigint   "physical_storage_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "chargeable_fields", id: :bigserial, force: :cascade do |t|
    t.bigint "chargeback_rate_detail_measure_id"
    t.string "metric"
    t.string "group"
    t.string "source"
    t.string "description"
  end

  create_table "chargeback_rate_detail_currencies", id: :bigserial, force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "full_name"
    t.string   "symbol"
    t.string   "unicode_hex"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chargeback_rate_detail_measures", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "units"
    t.string   "units_display"
    t.integer  "step"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "chargeback_rate_details", id: :bigserial, force: :cascade do |t|
    t.boolean  "enabled",                            default: true
    t.string   "description"
    t.string   "group"
    t.string   "source"
    t.string   "metric"
    t.string   "per_time"
    t.string   "per_unit"
    t.string   "friendly_rate"
    t.bigint   "chargeback_rate_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "chargeback_rate_detail_measure_id"
    t.bigint   "chargeback_rate_detail_currency_id"
    t.bigint   "chargeable_field_id"
    t.string   "sub_metric"
    t.index ["chargeback_rate_id"], name: "index_chargeback_rate_details_on_chargeback_rate_id", using: :btree
  end

  create_table "chargeback_rates", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "description"
    t.string   "rate_type"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.boolean  "default",     default: false
  end

  create_table "chargeback_tiers", id: :bigserial, force: :cascade do |t|
    t.bigint "chargeback_rate_detail_id"
    t.float  "start"
    t.float  "finish"
    t.float  "fixed_rate"
    t.float  "variable_rate"
  end

  create_table "classifications", id: :bigserial, force: :cascade do |t|
    t.text    "description"
    t.string  "icon"
    t.boolean "read_only"
    t.string  "syntax"
    t.boolean "single_value"
    t.text    "example_text"
    t.bigint  "tag_id"
    t.bigint  "parent_id",    default: 0
    t.boolean "show"
    t.boolean "default"
    t.boolean "perf_by_tag"
    t.index ["parent_id"], name: "index_classifications_on_parent_id", using: :btree
    t.index ["tag_id"], name: "index_classifications_on_tag_id", using: :btree
  end

  create_table "cloud_database_flavors", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "type"
    t.string  "ems_ref"
    t.integer "cpus"
    t.bigint  "memory"
    t.bigint  "max_size"
    t.integer "max_connections"
    t.string  "performance"
    t.boolean "enabled"
    t.bigint  "ems_id"
    t.index ["ems_id"], name: "index_cloud_database_flavors_on_ems_id", using: :btree
    t.index ["type"], name: "index_cloud_database_flavors_on_type", using: :btree
  end

  create_table "cloud_databases", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "ems_ref"
    t.string "db_engine"
    t.string "status"
    t.string "status_reason"
    t.bigint "used_storage"
    t.bigint "max_storage"
    t.text   "extra_attributes"
    t.bigint "ems_id"
    t.bigint "resource_group_id"
    t.bigint "cloud_database_flavor_id"
    t.bigint "cloud_tenant_id"
    t.index ["cloud_database_flavor_id"], name: "index_cloud_databases_on_cloud_database_flavor_id", using: :btree
    t.index ["ems_id"], name: "index_cloud_databases_on_ems_id", using: :btree
    t.index ["type"], name: "index_cloud_databases_on_type", using: :btree
  end

  create_table "cloud_networks", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "ems_ref"
    t.bigint  "ems_id"
    t.string  "cidr"
    t.string  "status"
    t.boolean "enabled"
    t.boolean "external_facing"
    t.bigint  "cloud_tenant_id"
    t.bigint  "orchestration_stack_id"
    t.boolean "shared"
    t.string  "provider_physical_network"
    t.string  "provider_network_type"
    t.string  "provider_segmentation_id"
    t.boolean "vlan_transparent"
    t.text    "extra_attributes"
    t.string  "type"
    t.index ["cloud_tenant_id"], name: "index_cloud_networks_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_cloud_networks_on_ems_id", using: :btree
    t.index ["type"], name: "index_cloud_networks_on_type", using: :btree
  end

  create_table "cloud_object_store_containers", id: :bigserial, force: :cascade do |t|
    t.string  "ems_ref"
    t.string  "key"
    t.integer "object_count"
    t.bigint  "bytes"
    t.bigint  "ems_id"
    t.bigint  "cloud_tenant_id"
    t.string  "name"
    t.string  "type"
    t.index ["type"], name: "index_cloud_object_store_containers_on_type", using: :btree
  end

  create_table "cloud_object_store_objects", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "etag"
    t.string   "key"
    t.string   "content_type"
    t.bigint   "content_length"
    t.datetime "last_modified"
    t.bigint   "ems_id"
    t.bigint   "cloud_tenant_id"
    t.bigint   "cloud_object_store_container_id"
    t.string   "name"
    t.string   "type"
    t.index ["type"], name: "index_cloud_object_store_objects_on_type", using: :btree
  end

  create_table "cloud_resource_quotas", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "service_name"
    t.string   "name"
    t.integer  "value"
    t.string   "type"
    t.bigint   "ems_id"
    t.bigint   "cloud_tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["type"], name: "index_cloud_resource_quotas_on_type", using: :btree
  end

  create_table "cloud_services", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "source"
    t.string   "executable_name"
    t.string   "hostname"
    t.string   "status"
    t.boolean  "scheduling_disabled"
    t.string   "scheduling_disabled_reason"
    t.bigint   "ems_id"
    t.bigint   "host_id"
    t.bigint   "system_service_id"
    t.bigint   "availability_zone_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["availability_zone_id"], name: "index_cloud_services_on_availability_zone_id", using: :btree
    t.index ["ems_id"], name: "index_cloud_services_on_ems_id", using: :btree
    t.index ["host_id"], name: "index_cloud_services_on_host_id", using: :btree
    t.index ["system_service_id"], name: "index_cloud_services_on_system_service_id", using: :btree
  end

  create_table "cloud_subnets", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "ems_ref"
    t.bigint  "ems_id"
    t.bigint  "availability_zone_id"
    t.bigint  "cloud_network_id"
    t.string  "cidr"
    t.string  "status"
    t.boolean "dhcp_enabled"
    t.string  "gateway"
    t.string  "network_protocol"
    t.bigint  "cloud_tenant_id"
    t.string  "dns_nameservers"
    t.string  "ipv6_router_advertisement_mode"
    t.string  "ipv6_address_mode"
    t.text    "extra_attributes"
    t.string  "type"
    t.bigint  "network_router_id"
    t.bigint  "network_group_id"
    t.bigint  "parent_cloud_subnet_id"
    t.index ["cloud_network_id"], name: "index_cloud_subnets_on_cloud_network_id", using: :btree
    t.index ["cloud_tenant_id"], name: "index_cloud_subnets_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_cloud_subnets_on_ems_id", using: :btree
    t.index ["network_group_id"], name: "index_cloud_subnets_on_network_group_id", using: :btree
    t.index ["parent_cloud_subnet_id"], name: "index_cloud_subnets_on_parent_cloud_subnet_id", using: :btree
    t.index ["type"], name: "index_cloud_subnets_on_type", using: :btree
  end

  create_table "cloud_subnets_network_ports", id: :bigserial, force: :cascade do |t|
    t.bigint "cloud_subnet_id"
    t.bigint "network_port_id"
    t.string "address"
    t.index ["address"], name: "index_cloud_subnets_network_ports_on_address", using: :btree
    t.index ["cloud_subnet_id", "network_port_id", "address"], name: "index_cloud_subnets_network_ports_address", unique: true, using: :btree
    t.index ["network_port_id"], name: "index_cloud_subnets_network_ports_on_network_port_id", using: :btree
  end

  create_table "cloud_tenant_flavors", id: :bigserial, force: :cascade do |t|
    t.bigint "cloud_tenant_id"
    t.bigint "flavor_id"
    t.index ["cloud_tenant_id", "flavor_id"], name: "index_cloud_tenant_flavors_on_cloud_tenant_id_and_flavor_id", unique: true, using: :btree
  end

  create_table "cloud_tenants", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "enabled"
    t.string   "ems_ref"
    t.bigint   "ems_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.bigint   "parent_id"
    t.index ["type"], name: "index_cloud_tenants_on_type", using: :btree
  end

  create_table "cloud_tenants_vms", id: :bigserial, force: :cascade do |t|
    t.bigint "cloud_tenant_id"
    t.bigint "vm_id"
  end

  create_table "cloud_volume_backups", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "type"
    t.string   "name"
    t.string   "description"
    t.string   "ems_ref"
    t.string   "status"
    t.datetime "creation_time"
    t.bigint   "size"
    t.integer  "object_count"
    t.boolean  "is_incremental"
    t.boolean  "has_dependent_backups"
    t.bigint   "cloud_volume_id"
    t.bigint   "availability_zone_id"
    t.index ["ems_id"], name: "index_cloud_volume_backups_on_ems_id", using: :btree
  end

  create_table "cloud_volume_snapshots", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "ems_ref"
    t.bigint   "ems_id"
    t.bigint   "cloud_volume_id"
    t.string   "name"
    t.string   "description"
    t.string   "status"
    t.datetime "creation_time"
    t.bigint   "size"
    t.bigint   "cloud_tenant_id"
    t.boolean  "encrypted"
    t.index ["type"], name: "index_cloud_volume_snapshots_on_type", using: :btree
  end

  create_table "cloud_volume_types", id: :bigserial, force: :cascade do |t|
    t.text     "description"
    t.string   "name"
    t.string   "type"
    t.string   "backend_name"
    t.string   "ems_ref"
    t.bigint   "ems_id"
    t.boolean  "public"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cloud_volumes", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "ems_ref"
    t.bigint   "size"
    t.bigint   "ems_id"
    t.bigint   "availability_zone_id"
    t.bigint   "cloud_volume_snapshot_id"
    t.string   "name"
    t.string   "status"
    t.string   "description"
    t.string   "volume_type"
    t.boolean  "bootable"
    t.datetime "creation_time"
    t.bigint   "cloud_tenant_id"
    t.integer  "iops"
    t.boolean  "encrypted"
    t.index ["type"], name: "index_cloud_volumes_on_type", using: :btree
  end

  create_table "compliance_details", id: :bigserial, force: :cascade do |t|
    t.bigint   "compliance_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "miq_policy_id"
    t.string   "miq_policy_desc"
    t.boolean  "miq_policy_result"
    t.bigint   "condition_id"
    t.string   "condition_desc"
    t.boolean  "condition_result"
    t.index ["compliance_id"], name: "index_compliance_details_on_compliance_id", using: :btree
    t.index ["condition_id"], name: "index_compliance_details_on_condition_id", using: :btree
    t.index ["miq_policy_id"], name: "index_compliance_details_on_miq_policy_id", using: :btree
  end

  create_table "compliances", id: :bigserial, force: :cascade do |t|
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.boolean  "compliant"
    t.datetime "timestamp"
    t.datetime "updated_on"
    t.string   "event_type"
    t.index ["resource_id", "resource_type"], name: "index_compliances_on_resource_id_and_resource_type", using: :btree
  end

  create_table "computer_systems", id: :bigserial, force: :cascade do |t|
    t.string   "managed_entity_type"
    t.bigint   "managed_entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["managed_entity_id", "managed_entity_type"], name: "index_computer_systems_managed_entity", using: :btree
  end

  create_table "conditions", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "expression"
    t.string   "towhat"
    t.datetime "file_mtime"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.string   "filename"
    t.text     "applies_to_exp"
    t.bigint   "miq_policy_id"
    t.string   "notes"
    t.boolean  "read_only"
    t.index ["guid"], name: "index_conditions_on_guid", unique: true, using: :btree
    t.index ["miq_policy_id"], name: "index_conditions_on_miq_policy_id", using: :btree
  end

  create_table "conditions_miq_policies", id: :bigserial, force: :cascade do |t|
    t.bigint "miq_policy_id"
    t.bigint "condition_id"
  end

  create_table "configuration_locations", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.bigint   "provisioning_manager_id"
    t.string   "manager_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "parent_id"
    t.string   "parent_ref"
    t.string   "title"
    t.index ["manager_ref"], name: "index_configuration_locations_on_manager_ref", using: :btree
    t.index ["provisioning_manager_id"], name: "index_configuration_locations_on_provisioning_manager_id", using: :btree
  end

  create_table "configuration_locations_configuration_profiles", id: :bigserial, force: :cascade do |t|
    t.bigint "configuration_location_id"
    t.bigint "configuration_profile_id"
    t.index ["configuration_location_id"], name: "index_configuration_locations_configuration_profiles_location", using: :btree
    t.index ["configuration_profile_id"], name: "index_configuration_locations_configuration_profiles_profile", using: :btree
  end

  create_table "configuration_organizations", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.bigint   "provisioning_manager_id"
    t.string   "manager_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "parent_id"
    t.string   "parent_ref"
    t.string   "title"
    t.index ["manager_ref"], name: "index_configuration_organizations_on_manager_ref", using: :btree
    t.index ["provisioning_manager_id"], name: "index_configuration_organizations_on_provisioning_manager_id", using: :btree
  end

  create_table "configuration_organizations_configuration_profiles", id: :bigserial, force: :cascade do |t|
    t.bigint "configuration_organization_id"
    t.bigint "configuration_profile_id"
    t.index ["configuration_organization_id"], name: "index_configuration_organizations_configuration_profiles_org", using: :btree
    t.index ["configuration_profile_id"], name: "index_configuration_organizations_configuration_profiles_p", using: :btree
  end

  create_table "configuration_profiles", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "description"
    t.bigint   "direct_operating_system_flavor_id"
    t.bigint   "manager_id"
    t.bigint   "direct_customization_script_ptable_id"
    t.bigint   "direct_customization_script_medium_id"
    t.string   "manager_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "parent_id"
    t.string   "parent_ref"
    t.bigint   "operating_system_flavor_id"
    t.bigint   "customization_script_medium_id"
    t.bigint   "customization_script_ptable_id"
    t.index ["direct_customization_script_medium_id"], name: "index_configuration_profiles_on_customization_script_medium_id", using: :btree
    t.index ["direct_customization_script_ptable_id"], name: "index_configuration_profiles_on_customization_script_ptable_id", using: :btree
    t.index ["direct_operating_system_flavor_id"], name: "index_configuration_profiles_on_operating_system_flavor_id", using: :btree
    t.index ["manager_id"], name: "index_configuration_profiles_on_manager_id", using: :btree
    t.index ["manager_ref"], name: "index_configuration_profiles_on_manager_ref", using: :btree
    t.index ["type"], name: "index_configuration_profiles_on_type", using: :btree
  end

  create_table "configuration_profiles_configuration_tags", id: :bigserial, force: :cascade do |t|
    t.bigint "configuration_profile_id"
    t.bigint "configuration_tag_id"
    t.index ["configuration_profile_id"], name: "configuration_profiles_configuration_tags_profile_id", using: :btree
    t.index ["configuration_tag_id"], name: "configuration_profiles_configuration_tags_tag_id", using: :btree
  end

  create_table "configuration_script_sources", id: :bigserial, force: :cascade do |t|
    t.bigint   "manager_id"
    t.string   "manager_ref"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "scm_type"
    t.string   "scm_url"
    t.string   "scm_branch"
    t.boolean  "scm_clean"
    t.boolean  "scm_delete_on_update"
    t.boolean  "scm_update_on_launch"
    t.bigint   "authentication_id"
    t.string   "type"
    t.string   "status"
    t.datetime "last_updated_on"
    t.text     "last_update_error"
    t.index ["manager_id"], name: "index_configuration_script_sources_on_manager_id", using: :btree
  end

  create_table "configuration_scripts", id: :bigserial, force: :cascade do |t|
    t.bigint   "manager_id"
    t.string   "manager_ref"
    t.string   "name"
    t.string   "description"
    t.text     "variables"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "survey_spec"
    t.bigint   "inventory_root_group_id"
    t.string   "type"
    t.bigint   "parent_id"
    t.bigint   "configuration_script_source_id"
    t.index ["inventory_root_group_id"], name: "index_configuration_scripts_on_inventory_root_group_id", using: :btree
    t.index ["type"], name: "index_configuration_scripts_on_type", using: :btree
  end

  create_table "configuration_tags", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "manager_ref"
    t.string   "name"
    t.bigint   "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["type"], name: "index_configuration_tags_on_type", using: :btree
  end

  create_table "configuration_tags_configured_systems", id: :bigserial, force: :cascade do |t|
    t.bigint "configured_system_id"
    t.bigint "configuration_tag_id"
    t.index ["configuration_tag_id"], name: "configured_systems_configuration_tag_id", using: :btree
    t.index ["configured_system_id"], name: "configured_systems_configuration_system_id", using: :btree
  end

  create_table "configured_systems", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "hostname"
    t.bigint   "direct_operating_system_flavor_id"
    t.bigint   "configuration_profile_id"
    t.bigint   "manager_id"
    t.string   "manager_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_checkin"
    t.string   "build_state"
    t.bigint   "configuration_location_id"
    t.bigint   "configuration_organization_id"
    t.string   "ipaddress"
    t.string   "mac_address"
    t.boolean  "ipmi_present"
    t.string   "puppet_status"
    t.bigint   "direct_customization_script_ptable_id"
    t.bigint   "direct_customization_script_medium_id"
    t.bigint   "operating_system_flavor_id"
    t.bigint   "customization_script_medium_id"
    t.bigint   "customization_script_ptable_id"
    t.bigint   "inventory_root_group_id"
    t.string   "virtual_instance_ref"
    t.string   "counterpart_type"
    t.bigint   "counterpart_id"
    t.index ["counterpart_id", "counterpart_type"], name: "index_configured_systems_on_counterpart_id_and_counterpart_type", using: :btree
    t.index ["direct_operating_system_flavor_id"], name: "index_configured_systems_on_direct_operating_system_flavor_id", using: :btree
    t.index ["manager_id", "type"], name: "index_configured_systems_on_manager_id_and_type", using: :btree
    t.index ["manager_ref"], name: "index_configured_systems_on_manager_ref", using: :btree
    t.index ["type"], name: "index_configured_systems_on_type", using: :btree
  end

  create_table "container_build_pods", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "namespace"
    t.string   "message"
    t.string   "phase"
    t.string   "reason"
    t.string   "output_docker_image_reference"
    t.string   "completion_timestamp"
    t.string   "start_timestamp"
    t.bigint   "duration"
    t.bigint   "container_build_id"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.index ["ems_id"], name: "index_container_build_pods_on_ems_id", using: :btree
  end

  create_table "container_builds", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "namespace"
    t.string   "service_account"
    t.string   "build_source_type"
    t.string   "source_binary"
    t.string   "source_dockerfile"
    t.string   "source_git"
    t.string   "source_context_dir"
    t.string   "source_secret"
    t.string   "output_name"
    t.bigint   "completion_deadline_seconds"
    t.bigint   "container_project_id"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.index ["ems_id"], name: "index_container_builds_on_ems_id", using: :btree
  end

  create_table "container_conditions", id: :bigserial, force: :cascade do |t|
    t.bigint   "container_entity_id"
    t.string   "name"
    t.string   "status"
    t.datetime "last_heartbeat_time"
    t.datetime "last_transition_time"
    t.string   "reason"
    t.string   "message"
    t.string   "container_entity_type"
  end

  create_table "container_deployment_nodes", id: :bigserial, force: :cascade do |t|
    t.string   "address"
    t.string   "name"
    t.text     "labels"
    t.bigint   "container_deployment_id"
    t.bigint   "vm_id"
    t.text     "docker_storage_devices",   default: [],              array: true
    t.bigint   "docker_storage_data_size"
    t.text     "customizations"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["container_deployment_id"], name: "index_container_deployment_nodes_on_container_deployment_id", using: :btree
    t.index ["vm_id"], name: "index_container_deployment_nodes_on_vm_id", using: :btree
  end

  create_table "container_deployments", id: :bigserial, force: :cascade do |t|
    t.string   "kind"
    t.string   "version"
    t.boolean  "containerized"
    t.string   "method_type"
    t.string   "metrics_endpoint"
    t.text     "customizations"
    t.boolean  "deploy_metrics"
    t.boolean  "deploy_registry"
    t.bigint   "automation_task_id"
    t.bigint   "deployed_ems_id"
    t.bigint   "deployed_on_ems_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["automation_task_id"], name: "index_container_deployments_on_automation_task_id", using: :btree
    t.index ["deployed_ems_id"], name: "index_container_deployments_on_deployed_ems_id", using: :btree
    t.index ["deployed_on_ems_id"], name: "index_container_deployments_on_deployed_on_ems_id", using: :btree
  end

  create_table "container_env_vars", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.text   "value"
    t.string "field_path"
    t.bigint "container_id"
  end

  create_table "container_groups", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "restart_policy"
    t.string   "dns_policy"
    t.bigint   "ems_id"
    t.bigint   "container_node_id"
    t.datetime "last_perf_capture_on"
    t.bigint   "container_replicator_id"
    t.string   "ipaddress"
    t.string   "type"
    t.bigint   "container_project_id"
    t.string   "phase"
    t.string   "message"
    t.string   "reason"
    t.bigint   "container_build_pod_id"
    t.datetime "created_on"
    t.datetime "deleted_on"
    t.bigint   "old_ems_id"
    t.bigint   "old_container_project_id"
    t.index ["deleted_on"], name: "index_container_groups_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_container_groups_on_ems_id", using: :btree
    t.index ["type"], name: "index_container_groups_on_type", using: :btree
  end

  create_table "container_groups_container_services", id: :bigserial, force: :cascade do |t|
    t.bigint "container_service_id"
    t.bigint "container_group_id"
  end

  create_table "container_image_registries", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.string "port"
    t.bigint "ems_id"
  end

  create_table "container_images", id: :bigserial, force: :cascade do |t|
    t.string   "tag"
    t.string   "name"
    t.string   "image_ref"
    t.bigint   "container_image_registry_id"
    t.bigint   "ems_id"
    t.datetime "last_sync_on"
    t.datetime "last_scan_attempt_on"
    t.string   "digest"
    t.datetime "registered_on"
    t.string   "architecture"
    t.string   "author"
    t.string   "command",                     default: [], array: true
    t.string   "entrypoint",                  default: [], array: true
    t.string   "docker_version"
    t.text     "exposed_ports"
    t.text     "environment_variables"
    t.bigint   "size"
    t.datetime "created_on"
    t.bigint   "old_ems_id"
    t.datetime "deleted_on"
    t.string   "type"
    t.index ["deleted_on"], name: "index_container_images_on_deleted_on", using: :btree
  end

  create_table "container_label_tag_mappings", id: :bigserial, force: :cascade do |t|
    t.string   "labeled_resource_type"
    t.string   "label_name"
    t.text     "label_value"
    t.bigint   "tag_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["tag_id"], name: "index_container_label_tag_mappings_on_tag_id", using: :btree
  end

  create_table "container_limit_items", id: :bigserial, force: :cascade do |t|
    t.string "item_type"
    t.string "resource"
    t.string "max"
    t.string "min"
    t.string "default"
    t.string "default_request"
    t.string "max_limit_request_ratio"
    t.bigint "container_limit_id"
  end

  create_table "container_limits", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "ems_ref"
    t.bigint   "container_project_id"
    t.bigint   "ems_id"
    t.datetime "created_on"
  end

  create_table "container_nodes", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.bigint   "ems_id"
    t.string   "lives_on_type"
    t.bigint   "lives_on_id"
    t.datetime "last_perf_capture_on"
    t.string   "identity_infra"
    t.string   "identity_machine"
    t.string   "identity_system"
    t.string   "type"
    t.string   "kubernetes_kubelet_version"
    t.string   "kubernetes_proxy_version"
    t.string   "container_runtime_version"
    t.integer  "max_container_groups"
    t.datetime "created_on"
    t.bigint   "old_ems_id"
    t.datetime "deleted_on"
    t.index ["deleted_on"], name: "index_container_nodes_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_container_nodes_on_ems_id", using: :btree
    t.index ["type"], name: "index_container_nodes_on_type", using: :btree
  end

  create_table "container_port_configs", id: :bigserial, force: :cascade do |t|
    t.string  "ems_ref"
    t.integer "port"
    t.integer "host_port"
    t.string  "protocol"
    t.bigint  "container_id"
    t.string  "name"
  end

  create_table "container_projects", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "display_name"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.datetime "deleted_on"
    t.bigint   "old_ems_id"
    t.index ["deleted_on"], name: "index_container_projects_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_container_projects_on_ems_id", using: :btree
  end

  create_table "container_quota_items", id: :bigserial, force: :cascade do |t|
    t.string   "resource"
    t.bigint   "container_quota_id"
    t.decimal  "quota_desired",      precision: 30, scale: 3
    t.decimal  "quota_enforced",     precision: 30, scale: 3
    t.decimal  "quota_observed",     precision: 30, scale: 3
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.datetime "deleted_on"
    t.index ["deleted_on"], name: "index_container_quota_items_on_deleted_on", using: :btree
  end

  create_table "container_quota_scopes", id: :bigserial, force: :cascade do |t|
    t.bigint   "container_quota_id"
    t.string   "scope"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "deleted_on"
  end

  create_table "container_quotas", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "ems_ref"
    t.bigint   "container_project_id"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.datetime "deleted_on"
    t.index ["deleted_on"], name: "index_container_quotas_on_deleted_on", using: :btree
  end

  create_table "container_replicators", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.bigint   "ems_id"
    t.string   "resource_version"
    t.integer  "replicas"
    t.integer  "current_replicas"
    t.bigint   "container_project_id"
    t.datetime "created_on"
  end

  create_table "container_routes", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "host_name"
    t.string   "path"
    t.bigint   "ems_id"
    t.bigint   "container_project_id"
    t.bigint   "container_service_id"
    t.datetime "created_on"
    t.index ["ems_id"], name: "index_container_routes_on_ems_id", using: :btree
  end

  create_table "container_service_port_configs", id: :bigserial, force: :cascade do |t|
    t.string  "ems_ref"
    t.string  "name"
    t.integer "port"
    t.string  "target_port"
    t.string  "protocol"
    t.bigint  "container_service_id"
    t.integer "node_port"
  end

  create_table "container_services", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.string   "session_affinity"
    t.string   "portal_ip"
    t.bigint   "ems_id"
    t.bigint   "container_project_id"
    t.string   "service_type"
    t.bigint   "container_image_registry_id"
    t.datetime "created_on"
    t.index ["ems_id"], name: "index_container_services_on_ems_id", using: :btree
  end

  create_table "container_template_parameters", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "display_name"
    t.string   "description"
    t.string   "value"
    t.string   "generate"
    t.string   "from"
    t.boolean  "required"
    t.bigint   "container_template_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["container_template_id"], name: "index_container_template_parameters_on_container_template_id", using: :btree
  end

  create_table "container_templates", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.bigint   "ems_id"
    t.bigint   "container_project_id"
    t.text     "objects"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "object_labels"
    t.string   "type"
    t.index ["container_project_id"], name: "index_container_templates_on_container_project_id", using: :btree
    t.index ["ems_id"], name: "index_container_templates_on_ems_id", using: :btree
  end

  create_table "container_volumes", id: :bigserial, force: :cascade do |t|
    t.bigint   "parent_id"
    t.string   "type"
    t.string   "name"
    t.string   "empty_dir_medium_type"
    t.string   "gce_pd_name"
    t.string   "git_repository"
    t.string   "git_revision"
    t.string   "nfs_server"
    t.string   "iscsi_target_portal"
    t.string   "iscsi_iqn"
    t.integer  "iscsi_lun"
    t.string   "glusterfs_endpoint_name"
    t.string   "claim_name"
    t.string   "rbd_ceph_monitors"
    t.string   "rbd_image"
    t.string   "rbd_pool"
    t.string   "rbd_rados_user"
    t.string   "rbd_keyring"
    t.string   "common_path"
    t.string   "common_fs_type"
    t.string   "common_read_only"
    t.string   "common_volume_id"
    t.string   "common_partition"
    t.string   "common_secret"
    t.string   "ems_ref"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.text     "capacity"
    t.string   "access_modes"
    t.string   "reclaim_policy"
    t.string   "status_phase"
    t.string   "status_message"
    t.string   "status_reason"
    t.string   "parent_type"
    t.bigint   "persistent_volume_claim_id"
    t.datetime "created_on"
    t.index ["type"], name: "index_container_volumes_on_type", using: :btree
  end

  create_table "containers", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.integer  "restart_count"
    t.string   "state"
    t.string   "name"
    t.string   "backing_ref"
    t.datetime "last_perf_capture_on"
    t.string   "type"
    t.bigint   "container_image_id"
    t.string   "reason"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "exit_code"
    t.integer  "signal"
    t.string   "message"
    t.string   "last_state"
    t.string   "last_reason"
    t.datetime "last_started_at"
    t.datetime "last_finished_at"
    t.integer  "last_exit_code"
    t.integer  "last_signal"
    t.string   "last_message"
    t.datetime "deleted_on"
    t.bigint   "ems_id"
    t.bigint   "old_ems_id"
    t.float    "request_cpu_cores"
    t.bigint   "request_memory_bytes"
    t.float    "limit_cpu_cores"
    t.bigint   "limit_memory_bytes"
    t.string   "image"
    t.string   "image_pull_policy"
    t.string   "memory"
    t.float    "cpu_cores"
    t.bigint   "container_group_id"
    t.boolean  "privileged"
    t.bigint   "run_as_user"
    t.boolean  "run_as_non_root"
    t.string   "capabilities_add"
    t.string   "capabilities_drop"
    t.text     "command"
    t.index ["deleted_on"], name: "index_containers_on_deleted_on", using: :btree
    t.index ["type"], name: "index_containers_on_type", using: :btree
  end

  create_table "conversion_hosts", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "type"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "version"
    t.integer  "max_concurrent_tasks"
    t.boolean  "vddk_transport_supported"
    t.boolean  "ssh_transport_supported"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "concurrent_transformation_limit"
    t.string   "cpu_limit"
    t.string   "memory_limit"
    t.string   "network_limit"
    t.string   "blockio_limit"
    t.index ["resource_id", "resource_type"], name: "index_conversion_hosts_on_resource_id_and_resource_type", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_conversion_hosts_on_resource_type_and_resource_id", using: :btree
  end

  create_table "custom_attributes", id: :bigserial, force: :cascade do |t|
    t.string "section"
    t.string "name"
    t.text   "value"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "source"
    t.text   "description"
    t.text   "value_interpolated"
    t.text   "unique_name"
    t.text   "serialized_value"
    t.index ["resource_id", "resource_type"], name: "index_custom_attributes_on_resource_id_and_resource_type", using: :btree
  end

  create_table "custom_buttons", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "description"
    t.string   "applies_to_class"
    t.text     "visibility_expression"
    t.text     "options"
    t.string   "userid"
    t.boolean  "wait_for_complete"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "name"
    t.text     "visibility"
    t.bigint   "applies_to_id"
    t.text     "enablement_expression"
    t.text     "disabled_text"
  end

  create_table "customization_scripts", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "manager_id"
    t.string   "manager_ref"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.boolean  "user_defined"
    t.boolean  "in_use"
    t.index ["manager_id", "type"], name: "index_on_customization_script_provisioning_manager_id", using: :btree
    t.index ["manager_ref"], name: "index_customization_scripts_on_manager_ref", using: :btree
    t.index ["type"], name: "index_customization_scripts_on_type", using: :btree
  end

  create_table "customization_scripts_operating_system_flavors", id: :bigserial, force: :cascade do |t|
    t.bigint "customization_script_id"
    t.bigint "operating_system_flavor_id"
    t.index ["customization_script_id"], name: "index_on_customization_scripts_operating_system_flavors_i2", using: :btree
    t.index ["operating_system_flavor_id", "customization_script_id"], name: "index_on_customization_scripts_operating_system_flavors_i1", using: :btree
  end

  create_table "customization_specs", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "ems_id"
    t.string   "typ"
    t.text     "description"
    t.datetime "last_update_time"
    t.text     "spec"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["ems_id"], name: "index_customization_specs_on_ems_id", using: :btree
  end

  create_table "customization_templates", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "script"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.bigint   "pxe_image_type_id"
    t.string   "type"
    t.boolean  "system"
    t.index ["type"], name: "index_customization_templates_on_type", using: :btree
  end

  create_table "database_backups", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialog_field_associations", id: :bigserial, force: :cascade do |t|
    t.bigint "trigger_id"
    t.bigint "respond_id"
  end

  create_table "dialog_fields", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.string   "data_type"
    t.string   "notes"
    t.string   "notes_display"
    t.string   "display"
    t.string   "display_method"
    t.text     "display_method_options"
    t.boolean  "required"
    t.string   "required_method"
    t.text     "required_method_options"
    t.text     "default_value"
    t.text     "values"
    t.string   "values_method"
    t.text     "values_method_options"
    t.text     "options"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "label"
    t.bigint   "dialog_group_id"
    t.integer  "position"
    t.string   "validator_type"
    t.string   "validator_rule"
    t.boolean  "reconfigurable"
    t.boolean  "dynamic"
    t.boolean  "show_refresh_button"
    t.boolean  "load_values_on_init"
    t.boolean  "read_only"
    t.boolean  "auto_refresh"
    t.boolean  "trigger_auto_refresh"
    t.boolean  "visible"
    t.index ["type"], name: "index_dialog_fields_on_type", using: :btree
  end

  create_table "dialog_groups", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "display"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "label"
    t.string   "display_method"
    t.text     "display_method_options"
    t.bigint   "dialog_tab_id"
    t.integer  "position"
  end

  create_table "dialog_tabs", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "display"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "label"
    t.string   "display_method"
    t.text     "display_method_options"
    t.bigint   "dialog_id"
    t.integer  "position"
  end

  create_table "dialogs", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "buttons"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "label"
  end

  create_table "direct_configuration_profiles_configuration_tags", id: :bigserial, force: :cascade do |t|
    t.bigint "configuration_profile_id"
    t.bigint "configuration_tag_id"
    t.index ["configuration_profile_id"], name: "index_direct_configuration_profiles_tags_profile_id", using: :btree
    t.index ["configuration_tag_id"], name: "index_direct_configuration_profiles_tags_tag_id", using: :btree
  end

  create_table "direct_configuration_tags_configured_systems", id: :bigserial, force: :cascade do |t|
    t.bigint "configured_system_id"
    t.bigint "configuration_tag_id"
    t.index ["configuration_tag_id"], name: "index_direct_configured_systems_tag_tag_id", using: :btree
    t.index ["configured_system_id"], name: "index_direct_configured_systems_tags_system_id", using: :btree
  end

  create_table "disks", id: :bigserial, force: :cascade do |t|
    t.string   "device_name"
    t.string   "device_type"
    t.string   "location"
    t.string   "filename"
    t.bigint   "hardware_id"
    t.string   "mode"
    t.string   "controller_type"
    t.bigint   "size"
    t.bigint   "free_space"
    t.bigint   "size_on_disk"
    t.boolean  "present",            default: true
    t.boolean  "start_connected",    default: true
    t.boolean  "auto_detect"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "disk_type"
    t.bigint   "storage_id"
    t.bigint   "backing_id"
    t.string   "backing_type"
    t.bigint   "storage_profile_id"
    t.boolean  "bootable"
    t.index ["device_name"], name: "index_disks_on_device_name", using: :btree
    t.index ["device_type"], name: "index_disks_on_device_type", using: :btree
    t.index ["hardware_id"], name: "index_disks_on_hardware_id", using: :btree
    t.index ["storage_id"], name: "index_disks_on_storage_id", using: :btree
  end

  create_table "drift_states", id: :bigserial, force: :cascade do |t|
    t.datetime "timestamp"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.text     "data"
    t.index ["resource_id", "resource_type", "timestamp"], name: "index_states_on_resource_id_and_resource_type_and_timestamp", using: :btree
    t.index ["timestamp"], name: "index_drift_states_on_timestamp", using: :btree
  end

  create_table "ems_clusters", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "uid_ems"
    t.boolean  "ha_enabled"
    t.boolean  "ha_admit_control"
    t.integer  "ha_max_failures"
    t.boolean  "drs_enabled"
    t.string   "drs_automation_level"
    t.integer  "drs_migration_threshold"
    t.datetime "last_perf_capture_on"
    t.string   "ems_ref_obj"
    t.bigint   "effective_cpu"
    t.bigint   "effective_memory"
    t.string   "ems_ref"
    t.string   "type"
    t.index ["ems_id"], name: "index_ems_clusters_on_ems_id", using: :btree
    t.index ["type"], name: "index_ems_clusters_on_type", using: :btree
    t.index ["uid_ems"], name: "index_ems_clusters_on_uid", using: :btree
  end

  create_table "ems_folders", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "uid_ems"
    t.string   "ems_ref_obj"
    t.string   "ems_ref"
    t.string   "type"
    t.boolean  "hidden"
    t.index ["ems_id"], name: "index_ems_folders_on_ems_id", using: :btree
    t.index ["type"], name: "index_ems_folders_on_type", using: :btree
    t.index ["uid_ems"], name: "index_ems_folders_on_uid", using: :btree
  end

  create_table "endpoints", id: :bigserial, force: :cascade do |t|
    t.string   "role"
    t.string   "ipaddress"
    t.string   "hostname"
    t.integer  "port"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "verify_ssl"
    t.string   "url"
    t.string   "security_protocol"
    t.string   "api_version"
    t.string   "path"
    t.text     "certificate_authority"
  end

  create_table "entitlements", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_group_id"
    t.bigint   "miq_user_role_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "filters"
    t.text     "filter_expression"
  end

  create_table "event_logs", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "generated"
    t.text     "message"
    t.string   "uid"
    t.bigint   "event_id"
    t.string   "computer_name"
    t.string   "source"
    t.bigint   "operating_system_id"
    t.string   "level"
    t.string   "category"
    t.index ["event_id"], name: "index_event_logs_on_event_id", using: :btree
    t.index ["operating_system_id"], name: "index_event_logs_on_operating_system_id", using: :btree
  end

  create_table "event_streams", id: :bigserial, force: :cascade do |t|
    t.string   "event_type"
    t.text     "message"
    t.datetime "timestamp"
    t.string   "host_name"
    t.bigint   "host_id"
    t.string   "vm_name"
    t.string   "vm_location"
    t.bigint   "vm_or_template_id"
    t.string   "dest_host_name"
    t.bigint   "dest_host_id"
    t.string   "dest_vm_name"
    t.string   "dest_vm_location"
    t.bigint   "dest_vm_or_template_id"
    t.string   "source"
    t.bigint   "chain_id"
    t.bigint   "ems_id"
    t.boolean  "is_task"
    t.text     "full_data"
    t.datetime "created_on"
    t.string   "username"
    t.bigint   "ems_cluster_id"
    t.string   "ems_cluster_name"
    t.string   "ems_cluster_uid"
    t.bigint   "dest_ems_cluster_id"
    t.string   "dest_ems_cluster_name"
    t.string   "dest_ems_cluster_uid"
    t.bigint   "availability_zone_id"
    t.bigint   "container_node_id"
    t.string   "container_node_name"
    t.bigint   "container_group_id"
    t.string   "container_group_name"
    t.string   "container_namespace"
    t.string   "type"
    t.string   "target_type"
    t.bigint   "target_id"
    t.bigint   "container_id"
    t.string   "container_name"
    t.bigint   "container_replicator_id"
    t.string   "container_replicator_name"
    t.bigint   "middleware_server_id"
    t.string   "middleware_server_name"
    t.bigint   "middleware_deployment_id"
    t.string   "middleware_deployment_name"
    t.bigint   "generating_ems_id"
    t.bigint   "physical_server_id"
    t.string   "ems_ref"
    t.bigint   "middleware_domain_id"
    t.string   "middleware_domain_name"
    t.bigint   "user_id"
    t.bigint   "group_id"
    t.bigint   "tenant_id"
    t.string   "vm_ems_ref"
    t.string   "dest_vm_ems_ref"
    t.bigint   "physical_chassis_id"
    t.bigint   "physical_switch_id"
    t.index ["availability_zone_id", "type"], name: "index_event_streams_on_availability_zone_id_and_type", using: :btree
    t.index ["chain_id", "ems_id"], name: "index_event_streams_on_chain_id_and_ems_id", using: :btree
    t.index ["dest_host_id"], name: "index_event_streams_on_dest_host_id", using: :btree
    t.index ["dest_vm_or_template_id"], name: "index_event_streams_on_dest_vm_or_template_id", using: :btree
    t.index ["ems_cluster_id"], name: "index_event_streams_on_ems_cluster_id", using: :btree
    t.index ["ems_id"], name: "index_event_streams_on_ems_id", using: :btree
    t.index ["event_type"], name: "index_event_streams_on_event_type", using: :btree
    t.index ["generating_ems_id"], name: "index_event_streams_on_generating_ems_id", using: :btree
    t.index ["host_id"], name: "index_event_streams_on_host_id", using: :btree
    t.index ["timestamp"], name: "index_event_streams_on_timestamp", using: :btree
    t.index ["vm_or_template_id"], name: "index_event_streams_on_vm_or_template_id", using: :btree
  end

  create_table "ext_management_systems", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.bigint   "zone_id"
    t.string   "type"
    t.string   "api_version"
    t.string   "uid_ems"
    t.integer  "host_default_vnc_port_start"
    t.integer  "host_default_vnc_port_end"
    t.string   "provider_region"
    t.text     "last_refresh_error"
    t.datetime "last_refresh_date"
    t.bigint   "provider_id"
    t.string   "realm"
    t.bigint   "tenant_id"
    t.string   "project"
    t.bigint   "parent_ems_id"
    t.string   "subscription"
    t.text     "last_metrics_error"
    t.datetime "last_metrics_update_date"
    t.datetime "last_metrics_success_date"
    t.boolean  "tenant_mapping_enabled"
    t.boolean  "enabled"
    t.text     "options"
    t.bigint   "zone_before_pause_id"
    t.index ["guid"], name: "index_ext_management_systems_on_guid", unique: true, using: :btree
    t.index ["parent_ems_id"], name: "index_ext_management_systems_on_parent_ems_id", using: :btree
    t.index ["type"], name: "index_ext_management_systems_on_type", using: :btree
    t.index ["zone_before_pause_id"], name: "index_ext_management_systems_on_zone_before_pause_id", using: :btree
  end

  create_table "file_depots", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "uri"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "type"
    t.string   "support_case"
    t.string   "aws_region"
    t.string   "keystone_api_version"
    t.string   "v3_domain_ident"
    t.string   "security_protocol"
    t.string   "openstack_region"
    t.index ["type"], name: "index_file_depots_on_type", using: :btree
  end

  create_table "filesystems", id: :bigserial, force: :cascade do |t|
    t.text     "name"
    t.string   "md5"
    t.bigint   "size"
    t.datetime "atime"
    t.datetime "mtime"
    t.datetime "ctime"
    t.string   "rsc_type"
    t.text     "base_name"
    t.bigint   "miq_set_id"
    t.bigint   "scan_item_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "file_version"
    t.string   "product_version"
    t.string   "file_version_header"
    t.string   "product_version_header"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "permissions"
    t.string   "owner"
    t.string   "group"
    t.bigint   "host_service_group_id"
    t.index ["host_service_group_id"], name: "index_filesystems_on_host_service_group_id", using: :btree
    t.index ["miq_set_id"], name: "index_filesystems_on_miq_set_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_filesystems_on_resource_id_and_resource_type", using: :btree
    t.index ["scan_item_id"], name: "index_filesystems_on_scan_item_id", using: :btree
  end

  create_table "firewall_rules", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "group"
    t.boolean  "enabled"
    t.boolean  "required"
    t.string   "host_protocol"
    t.string   "direction"
    t.integer  "port"
    t.integer  "end_port"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.bigint   "source_security_group_id"
    t.string   "source_ip_range"
    t.string   "ems_ref"
    t.string   "network_protocol"
    t.index ["resource_id", "resource_type"], name: "index_firewall_rules_on_resource_id_and_resource_type", using: :btree
  end

  create_table "firmwares", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "build"
    t.string   "version"
    t.datetime "release_date"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.bigint   "guest_device_id"
    t.index ["guest_device_id"], name: "index_firmwares_on_guest_device_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_firmwares_on_resource_id_and_resource_type", using: :btree
  end

  create_table "flavors", id: :bigserial, force: :cascade do |t|
    t.bigint  "ems_id"
    t.string  "name"
    t.string  "description"
    t.integer "cpus"
    t.integer "cpu_cores"
    t.bigint  "memory"
    t.string  "ems_ref"
    t.string  "type"
    t.boolean "supports_32_bit"
    t.boolean "supports_64_bit"
    t.boolean "enabled"
    t.boolean "supports_hvm"
    t.boolean "supports_paravirtual"
    t.boolean "block_storage_based_only"
    t.boolean "cloud_subnet_required"
    t.bigint  "ephemeral_disk_size"
    t.integer "ephemeral_disk_count"
    t.bigint  "root_disk_size"
    t.bigint  "swap_disk_size"
    t.boolean "publicly_available"
    t.index ["ems_id"], name: "index_flavors_on_ems_id", using: :btree
    t.index ["type"], name: "index_flavors_on_type", using: :btree
  end

  create_table "floating_ips", id: :bigserial, force: :cascade do |t|
    t.string  "type"
    t.string  "ems_ref"
    t.string  "address"
    t.bigint  "ems_id"
    t.bigint  "vm_id"
    t.boolean "cloud_network_only"
    t.bigint  "cloud_tenant_id"
    t.bigint  "network_port_id"
    t.bigint  "cloud_network_id"
    t.string  "fixed_ip_address"
    t.string  "status"
    t.bigint  "network_router_id"
    t.index ["cloud_network_id"], name: "index_floating_ips_on_cloud_network_id", using: :btree
    t.index ["cloud_tenant_id"], name: "index_floating_ips_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_floating_ips_on_ems_id", using: :btree
    t.index ["network_port_id"], name: "index_floating_ips_on_network_port_id", using: :btree
    t.index ["network_router_id"], name: "index_floating_ips_on_network_router_id", using: :btree
    t.index ["type"], name: "index_floating_ips_on_type", using: :btree
  end

  create_table "generic_object_definitions", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "properties"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "generic_objects", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "uid"
    t.bigint   "generic_object_definition_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.jsonb    "properties",                   default: {}
  end

  create_table "git_references", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "commit_sha"
    t.datetime "commit_time"
    t.text     "commit_message"
    t.string   "type"
    t.bigint   "git_repository_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["type"], name: "index_git_references_on_type", using: :btree
  end

  create_table "git_repositories", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "last_refresh_on"
    t.integer  "verify_ssl"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "guest_applications", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "vendor"
    t.string   "version"
    t.text     "description"
    t.string   "package_name"
    t.string   "product_icon"
    t.string   "transform"
    t.integer  "language"
    t.string   "typename"
    t.bigint   "vm_or_template_id"
    t.string   "product_key"
    t.string   "path"
    t.string   "arch"
    t.bigint   "host_id"
    t.string   "release"
    t.datetime "install_time"
    t.bigint   "container_image_id"
    t.index ["host_id"], name: "index_guest_applications_on_host_id", using: :btree
    t.index ["typename"], name: "index_guest_applications_on_typename", using: :btree
    t.index ["vm_or_template_id"], name: "index_guest_applications_on_vm_id", using: :btree
  end

  create_table "guest_devices", id: :bigserial, force: :cascade do |t|
    t.string  "device_name"
    t.string  "device_type"
    t.string  "location"
    t.string  "filename"
    t.bigint  "hardware_id"
    t.string  "mode"
    t.string  "controller_type"
    t.bigint  "size"
    t.bigint  "free_space"
    t.bigint  "size_on_disk"
    t.string  "address"
    t.bigint  "switch_id"
    t.bigint  "lan_id"
    t.string  "model"
    t.string  "iscsi_name"
    t.string  "iscsi_alias"
    t.boolean "present",                default: true
    t.boolean "start_connected",        default: true
    t.boolean "auto_detect"
    t.string  "uid_ems"
    t.boolean "chap_auth_enabled"
    t.string  "manufacturer"
    t.string  "field_replaceable_unit"
    t.bigint  "parent_device_id"
    t.string  "vlan_key"
    t.boolean "vlan_enabled"
    t.string  "peer_mac_address"
    t.index ["device_name"], name: "index_guest_devices_on_device_name", using: :btree
    t.index ["device_type"], name: "index_guest_devices_on_device_type", using: :btree
    t.index ["hardware_id"], name: "index_guest_devices_on_hardware_id", using: :btree
    t.index ["lan_id"], name: "index_guest_devices_on_lan_id", using: :btree
    t.index ["parent_device_id"], name: "index_guest_devices_on_parent_device_id", using: :btree
    t.index ["switch_id"], name: "index_guest_devices_on_switch_id", using: :btree
  end

  create_table "hardwares", id: :bigserial, force: :cascade do |t|
    t.string  "config_version"
    t.string  "virtual_hw_version"
    t.string  "guest_os"
    t.integer "cpu_sockets",          default: 1
    t.string  "bios"
    t.string  "bios_location"
    t.string  "time_sync"
    t.text    "annotation"
    t.bigint  "vm_or_template_id"
    t.integer "memory_mb"
    t.bigint  "host_id"
    t.integer "cpu_speed"
    t.string  "cpu_type"
    t.bigint  "size_on_disk"
    t.string  "manufacturer",         default: ""
    t.string  "model",                default: ""
    t.integer "number_of_nics"
    t.integer "cpu_usage"
    t.integer "memory_usage"
    t.integer "cpu_cores_per_socket"
    t.integer "cpu_total_cores"
    t.boolean "vmotion_enabled"
    t.bigint  "disk_free_space"
    t.bigint  "disk_capacity"
    t.string  "guest_os_full_name"
    t.integer "memory_console"
    t.integer "bitness"
    t.string  "virtualization_type"
    t.string  "root_device_type"
    t.bigint  "computer_system_id"
    t.bigint  "disk_size_minimum"
    t.bigint  "memory_mb_minimum"
    t.boolean "introspected"
    t.string  "provision_state"
    t.string  "serial_number"
    t.bigint  "switch_id"
    t.string  "firmware_type"
    t.bigint  "canister_id"
    t.index ["computer_system_id"], name: "index_hardwares_on_computer_system_id", using: :btree
    t.index ["host_id"], name: "index_hardwares_on_host_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_hardwares_on_vm_id", using: :btree
  end

  create_table "host_aggregate_hosts", id: :bigserial, force: :cascade do |t|
    t.bigint "host_id"
    t.bigint "host_aggregate_id"
    t.index ["host_id", "host_aggregate_id"], name: "index_host_aggregate_hosts_on_host_id_and_aggregate_id", unique: true, using: :btree
  end

  create_table "host_aggregates", id: :bigserial, force: :cascade do |t|
    t.bigint "ems_id"
    t.string "name"
    t.string "ems_ref"
    t.string "type"
    t.text   "metadata"
    t.index ["ems_id"], name: "index_host_aggregates_on_ems_id", using: :btree
  end

  create_table "host_service_groups", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.bigint "host_id"
    t.index ["type"], name: "index_host_service_groups_on_type", using: :btree
  end

  create_table "host_storages", id: :bigserial, force: :cascade do |t|
    t.bigint  "storage_id"
    t.bigint  "host_id"
    t.boolean "read_only"
    t.string  "ems_ref"
    t.index ["host_id", "storage_id"], name: "index_host_storages_on_host_id_and_storage_id", unique: true, using: :btree
  end

  create_table "host_switches", id: :bigserial, force: :cascade do |t|
    t.bigint "host_id"
    t.bigint "switch_id"
  end

  create_table "hosts", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "hostname"
    t.string   "ipaddress"
    t.string   "vmm_vendor"
    t.string   "vmm_version"
    t.string   "vmm_product"
    t.string   "vmm_buildnumber"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.bigint   "ems_id"
    t.string   "user_assigned_os"
    t.string   "power_state",             default: ""
    t.integer  "smart"
    t.string   "settings"
    t.datetime "last_perf_capture_on"
    t.string   "uid_ems"
    t.string   "connection_state"
    t.string   "ssh_permit_root_login"
    t.string   "ems_ref_obj"
    t.boolean  "admin_disabled"
    t.string   "service_tag"
    t.string   "asset_tag"
    t.string   "ipmi_address"
    t.string   "mac_address"
    t.string   "type"
    t.boolean  "failover"
    t.string   "ems_ref"
    t.boolean  "hyperthreading"
    t.bigint   "ems_cluster_id"
    t.integer  "next_available_vnc_port"
    t.string   "hypervisor_hostname"
    t.bigint   "availability_zone_id"
    t.boolean  "maintenance"
    t.string   "maintenance_reason"
    t.bigint   "physical_server_id"
    t.index ["availability_zone_id"], name: "index_hosts_on_availability_zone_id", using: :btree
    t.index ["ems_id"], name: "index_hosts_on_ems_id", using: :btree
    t.index ["guid"], name: "index_hosts_on_guid", unique: true, using: :btree
    t.index ["hostname"], name: "index_hosts_on_hostname", using: :btree
    t.index ["ipaddress"], name: "index_hosts_on_ipaddress", using: :btree
    t.index ["type"], name: "index_hosts_on_type", using: :btree
  end

  create_table "import_file_uploads", id: :bigserial, force: :cascade do |t|
  end

  create_table "iso_datastores", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.datetime "last_refresh_on"
  end

  create_table "iso_images", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.bigint "iso_datastore_id"
    t.bigint "pxe_image_type_id"
  end

  create_table "jobs", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "state"
    t.string   "status"
    t.text     "message"
    t.string   "name"
    t.string   "userid"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "target_id"
    t.string   "target_class"
    t.string   "type"
    t.text     "agent_message"
    t.datetime "started_on"
    t.string   "dispatch_status"
    t.string   "sync_key"
    t.bigint   "miq_server_id"
    t.string   "zone"
    t.text     "options"
    t.text     "context"
    t.bigint   "miq_task_id"
    t.index ["dispatch_status"], name: "index_jobs_on_dispatch_status", using: :btree
    t.index ["guid"], name: "index_jobs_on_guid", unique: true, using: :btree
    t.index ["miq_server_id"], name: "index_jobs_on_miq_server_id", using: :btree
    t.index ["miq_task_id"], name: "index_jobs_on_miq_task_id", using: :btree
    t.index ["state"], name: "index_jobs_on_state", using: :btree
    t.index ["target_id", "target_class"], name: "index_jobs_on_target_id_and_target_class", using: :btree
    t.index ["type"], name: "index_jobs_on_type", using: :btree
  end

  create_table "key_pairs_vms", id: :bigserial, force: :cascade do |t|
    t.bigint "authentication_id"
    t.bigint "vm_id"
  end

  create_table "lans", id: :bigserial, force: :cascade do |t|
    t.bigint   "switch_id"
    t.string   "name"
    t.string   "tag"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "uid_ems"
    t.boolean  "allow_promiscuous"
    t.boolean  "forged_transmits"
    t.boolean  "mac_changes"
    t.boolean  "computed_allow_promiscuous"
    t.boolean  "computed_forged_transmits"
    t.boolean  "computed_mac_changes"
    t.bigint   "parent_id"
    t.string   "ems_ref"
    t.index ["switch_id"], name: "index_lans_on_switch_id", using: :btree
  end

  create_table "lifecycle_events", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "status"
    t.string   "event"
    t.string   "message"
    t.string   "location"
    t.bigint   "vm_or_template_id"
    t.string   "created_by"
    t.datetime "created_on"
    t.index ["guid"], name: "index_lifecycle_events_on_guid", unique: true, using: :btree
    t.index ["vm_or_template_id"], name: "index_lifecycle_events_on_vm_id", using: :btree
  end

  create_table "load_balancer_health_check_members", id: :bigserial, force: :cascade do |t|
    t.bigint "load_balancer_health_check_id"
    t.bigint "load_balancer_pool_member_id"
    t.string "status"
    t.string "status_reason"
    t.index ["load_balancer_health_check_id", "load_balancer_pool_member_id"], name: "load_balancer_health_check_members_index", unique: true, using: :btree
    t.index ["load_balancer_pool_member_id"], name: "members_load_balancer_pool_member_index", using: :btree
  end

  create_table "load_balancer_health_checks", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.string   "protocol"
    t.integer  "port"
    t.string   "url_path"
    t.integer  "interval"
    t.integer  "timeout"
    t.integer  "healthy_threshold"
    t.integer  "unhealthy_threshold"
    t.bigint   "ems_id"
    t.bigint   "load_balancer_listener_id"
    t.bigint   "cloud_tenant_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.bigint   "load_balancer_id"
    t.string   "type"
    t.index ["cloud_tenant_id"], name: "index_load_balancer_health_checks_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_load_balancer_health_checks_on_ems_id", using: :btree
    t.index ["ems_ref"], name: "index_load_balancer_health_checks_on_ems_ref", using: :btree
    t.index ["load_balancer_id"], name: "index_load_balancer_health_checks_on_load_balancer_id", using: :btree
    t.index ["load_balancer_listener_id"], name: "index_load_balancer_health_checks_on_load_balancer_listener_id", using: :btree
  end

  create_table "load_balancer_listener_pools", id: :bigserial, force: :cascade do |t|
    t.bigint   "load_balancer_listener_id"
    t.bigint   "load_balancer_pool_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["load_balancer_listener_id", "load_balancer_pool_id"], name: "load_balancer_listener_pools_index", unique: true, using: :btree
    t.index ["load_balancer_pool_id"], name: "index_load_balancer_listener_pools_on_load_balancer_pool_id", using: :btree
  end

  create_table "load_balancer_listeners", id: :bigserial, force: :cascade do |t|
    t.string    "ems_ref"
    t.string    "name"
    t.string    "description"
    t.string    "load_balancer_protocol"
    t.string    "instance_protocol"
    t.bigint    "ems_id"
    t.bigint    "cloud_tenant_id"
    t.bigint    "load_balancer_id"
    t.datetime  "created_at",               null: false
    t.datetime  "updated_at",               null: false
    t.string    "type"
    t.int4range "load_balancer_port_range"
    t.int4range "instance_port_range"
    t.index ["cloud_tenant_id"], name: "index_load_balancer_listeners_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_load_balancer_listeners_on_ems_id", using: :btree
    t.index ["ems_ref"], name: "index_load_balancer_listeners_on_ems_ref", using: :btree
    t.index ["load_balancer_id"], name: "index_load_balancer_listeners_on_load_balancer_id", using: :btree
  end

  create_table "load_balancer_pool_member_pools", id: :bigserial, force: :cascade do |t|
    t.bigint "load_balancer_pool_id"
    t.bigint "load_balancer_pool_member_id"
    t.index ["load_balancer_pool_id", "load_balancer_pool_member_id"], name: "load_balancer_pool_member_pools_index", unique: true, using: :btree
    t.index ["load_balancer_pool_member_id"], name: "load_balancer_pool_member_index", using: :btree
  end

  create_table "load_balancer_pool_members", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "address"
    t.integer  "port"
    t.bigint   "cloud_tenant_id"
    t.bigint   "cloud_subnet_id"
    t.bigint   "network_port_id"
    t.bigint   "resource_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.bigint   "vm_id"
    t.string   "type"
    t.bigint   "ems_id"
    t.index ["cloud_subnet_id"], name: "index_load_balancer_pool_members_on_cloud_subnet_id", using: :btree
    t.index ["cloud_tenant_id"], name: "index_load_balancer_pool_members_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_load_balancer_pool_members_on_ems_id", using: :btree
    t.index ["ems_ref"], name: "index_load_balancer_pool_members_on_ems_ref", using: :btree
    t.index ["network_port_id"], name: "index_load_balancer_pool_members_on_network_port_id", using: :btree
    t.index ["resource_group_id"], name: "index_load_balancer_pool_members_on_resource_group_id", using: :btree
    t.index ["vm_id"], name: "index_load_balancer_pool_members_on_vm_id", using: :btree
  end

  create_table "load_balancer_pools", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.string   "description"
    t.string   "load_balancer_algorithm"
    t.string   "protocol"
    t.bigint   "ems_id"
    t.bigint   "cloud_tenant_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "type"
    t.index ["cloud_tenant_id"], name: "index_load_balancer_pools_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_load_balancer_pools_on_ems_id", using: :btree
    t.index ["ems_ref"], name: "index_load_balancer_pools_on_ems_ref", using: :btree
  end

  create_table "load_balancers", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "name"
    t.string   "description"
    t.bigint   "ems_id"
    t.bigint   "cloud_tenant_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "type"
    t.boolean  "retired"
    t.datetime "retires_on"
    t.bigint   "retirement_warn"
    t.datetime "retirement_last_warn"
    t.string   "retirement_state"
    t.string   "retirement_requester"
    t.index ["cloud_tenant_id"], name: "index_load_balancers_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_load_balancers_on_ems_id", using: :btree
    t.index ["ems_ref"], name: "index_load_balancers_on_ems_ref", using: :btree
  end

  create_table "log_files", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.bigint   "miq_task_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "logging_started_on"
    t.datetime "logging_ended_on"
    t.string   "state"
    t.boolean  "historical"
    t.string   "log_uri"
    t.bigint   "file_depot_id"
    t.string   "local_file"
    t.index ["miq_task_id"], name: "index_log_files_on_miq_task_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_log_files_on_resource_id_and_resource_type", using: :btree
  end

  create_table "manageiq_bishop_new_bishop_tests", force: :cascade do |t|
    t.string   "title"
    t.integer  "test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metric_rollups", id: :bigserial, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
  end

  create_table "metric_rollups_01", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_01_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_01_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_02", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_02_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_02_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_03", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_03_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_03_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_04", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_04_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_04_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_05", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_05_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_05_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_06", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_06_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_06_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_07", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_07_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_07_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_08", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_08_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_08_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_09", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_09_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_09_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_10", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_10_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_10_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_11", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_11_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_11_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metric_rollups_12", id: :bigint, default: -> { "nextval('metric_rollups_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.integer  "stat_container_group_create_rate"
    t.integer  "stat_container_group_delete_rate"
    t.integer  "stat_container_image_registration_rate"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metric_rollups_12_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metric_rollups_12_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics", id: :bigserial, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
  end

  create_table "metrics_00", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_00_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_00_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_01", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_01_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_01_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_02", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_02_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_02_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_03", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_03_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_03_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_04", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_04_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_04_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_05", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_05_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_05_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_06", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_06_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_06_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_07", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_07_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_07_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_08", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_08_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_08_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_09", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_09_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_09_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_10", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_10_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_10_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_11", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_11_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_11_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_12", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_12_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_12_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_13", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_13_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_13_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_14", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_14_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_14_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_15", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_15_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_15_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_16", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_16_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_16_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_17", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_17_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_17_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_18", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_18_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_18_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_19", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_19_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_19_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_20", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_20_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_20_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_21", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_21_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_21_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_22", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_22_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_22_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "metrics_23", id: :bigint, default: -> { "nextval('metrics_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.float    "cpu_usage_rate_average"
    t.float    "cpu_usagemhz_rate_average"
    t.float    "mem_usage_absolute_average"
    t.float    "disk_usage_rate_average"
    t.float    "net_usage_rate_average"
    t.float    "sys_uptime_absolute_latest"
    t.datetime "created_on"
    t.float    "derived_cpu_available"
    t.float    "derived_memory_available"
    t.float    "derived_memory_used"
    t.float    "derived_cpu_reserved"
    t.float    "derived_memory_reserved"
    t.integer  "derived_vm_count_on"
    t.integer  "derived_host_count_on"
    t.integer  "derived_vm_count_off"
    t.integer  "derived_host_count_off"
    t.float    "derived_storage_total"
    t.float    "derived_storage_free"
    t.string   "capture_interval_name"
    t.text     "assoc_ids"
    t.float    "cpu_ready_delta_summation"
    t.float    "cpu_system_delta_summation"
    t.float    "cpu_wait_delta_summation"
    t.string   "resource_name"
    t.float    "cpu_used_delta_summation"
    t.text     "tag_names"
    t.bigint   "parent_host_id"
    t.bigint   "parent_ems_cluster_id"
    t.bigint   "parent_storage_id"
    t.bigint   "parent_ems_id"
    t.float    "derived_storage_vm_count_registered"
    t.float    "derived_storage_vm_count_unregistered"
    t.float    "derived_storage_vm_count_unmanaged"
    t.float    "derived_storage_used_registered"
    t.float    "derived_storage_used_unregistered"
    t.float    "derived_storage_used_unmanaged"
    t.float    "derived_storage_snapshot_registered"
    t.float    "derived_storage_snapshot_unregistered"
    t.float    "derived_storage_snapshot_unmanaged"
    t.float    "derived_storage_mem_registered"
    t.float    "derived_storage_mem_unregistered"
    t.float    "derived_storage_mem_unmanaged"
    t.float    "derived_storage_disk_registered"
    t.float    "derived_storage_disk_unregistered"
    t.float    "derived_storage_disk_unmanaged"
    t.float    "derived_storage_vm_count_managed"
    t.float    "derived_storage_used_managed"
    t.float    "derived_storage_snapshot_managed"
    t.float    "derived_storage_mem_managed"
    t.float    "derived_storage_disk_managed"
    t.text     "min_max"
    t.integer  "intervals_in_rollup"
    t.float    "mem_vmmemctl_absolute_average"
    t.float    "mem_vmmemctltarget_absolute_average"
    t.float    "mem_swapin_absolute_average"
    t.float    "mem_swapout_absolute_average"
    t.float    "mem_swapped_absolute_average"
    t.float    "mem_swaptarget_absolute_average"
    t.float    "disk_devicelatency_absolute_average"
    t.float    "disk_kernellatency_absolute_average"
    t.float    "disk_queuelatency_absolute_average"
    t.float    "derived_vm_used_disk_storage"
    t.float    "derived_vm_allocated_disk_storage"
    t.float    "derived_vm_numvcpus"
    t.bigint   "time_profile_id"
    t.integer  "derived_host_sockets"
    t.integer  "derived_host_count_total"
    t.integer  "derived_vm_count_total"
    t.index ["resource_id", "resource_type", "capture_interval_name", "timestamp"], name: "index_metrics_23_on_resource_and_ts", using: :btree
    t.index ["timestamp", "capture_interval_name", "resource_id", "resource_type"], name: "index_metrics_23_on_ts_and_capture_interval_name", using: :btree
  end

  create_table "middleware_datasources", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.bigint   "server_id"
    t.text     "properties"
    t.bigint   "ems_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "feed"
    t.string   "type"
    t.index ["type"], name: "index_middleware_datasources_on_type", using: :btree
  end

  create_table "middleware_deployments", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.bigint   "server_id"
    t.bigint   "ems_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
    t.string   "feed"
    t.text     "properties"
    t.bigint   "server_group_id"
    t.string   "type"
    t.index ["type"], name: "index_middleware_deployments_on_type", using: :btree
  end

  create_table "middleware_diagnostic_reports", id: :bigserial, force: :cascade do |t|
    t.datetime "queued_at"
    t.string   "requesting_user"
    t.string   "status"
    t.string   "error_message"
    t.bigint   "middleware_server_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["middleware_server_id"], name: "index_middleware_diagnostic_reports_on_middleware_server_id", using: :btree
  end

  create_table "middleware_domains", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.string   "feed"
    t.string   "type_path"
    t.string   "profile"
    t.text     "properties"
    t.bigint   "ems_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.index ["type"], name: "index_middleware_domains_on_type", using: :btree
  end

  create_table "middleware_messagings", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.string   "feed"
    t.bigint   "server_id"
    t.text     "properties"
    t.bigint   "ems_id"
    t.string   "messaging_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "type"
    t.index ["type"], name: "index_middleware_messagings_on_type", using: :btree
  end

  create_table "middleware_server_groups", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.string   "feed"
    t.string   "type_path"
    t.string   "profile"
    t.text     "properties"
    t.bigint   "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.index ["type"], name: "index_middleware_server_groups_on_type", using: :btree
  end

  create_table "middleware_servers", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "feed"
    t.string   "ems_ref"
    t.string   "nativeid"
    t.string   "type_path"
    t.string   "hostname"
    t.string   "product"
    t.text     "properties"
    t.bigint   "ems_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "lives_on_type"
    t.bigint   "lives_on_id"
    t.bigint   "server_group_id"
    t.string   "type"
    t.index ["lives_on_id", "lives_on_type"], name: "index_middleware_servers_on_lives_on_id_and_lives_on_type", using: :btree
    t.index ["type"], name: "index_middleware_servers_on_type", using: :btree
  end

  create_table "miq_actions", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.string   "action_type"
    t.text     "options"
    t.index ["guid"], name: "index_miq_actions_on_guid", unique: true, using: :btree
  end

  create_table "miq_ae_classes", id: :bigserial, force: :cascade do |t|
    t.text     "description"
    t.string   "display_name"
    t.string   "name"
    t.string   "type"
    t.string   "inherits"
    t.string   "visibility"
    t.string   "owner"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "namespace_id"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.index ["namespace_id"], name: "index_miq_ae_classes_on_namespace_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_classes_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_fields", id: :bigserial, force: :cascade do |t|
    t.string   "aetype"
    t.string   "name"
    t.string   "display_name"
    t.string   "datatype"
    t.integer  "priority"
    t.string   "owner"
    t.text     "default_value"
    t.boolean  "substitute",         default: true, null: false
    t.text     "message"
    t.string   "visibility"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "class_id"
    t.text     "collect"
    t.bigint   "method_id"
    t.string   "scope"
    t.text     "description"
    t.text     "condition"
    t.text     "on_entry"
    t.text     "on_exit"
    t.text     "on_error"
    t.string   "max_retries"
    t.string   "max_time"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.index ["class_id"], name: "index_miq_ae_fields_on_ae_class_id", using: :btree
    t.index ["method_id"], name: "index_miq_ae_fields_on_method_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_fields_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_instances", id: :bigserial, force: :cascade do |t|
    t.string   "display_name"
    t.string   "name"
    t.string   "inherits"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "class_id"
    t.text     "description"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.index ["class_id"], name: "index_miq_ae_instances_on_ae_class_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_instances_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_methods", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "class_id"
    t.string   "display_name"
    t.text     "description"
    t.string   "scope"
    t.string   "language"
    t.string   "location"
    t.text     "data"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.text     "embedded_methods",   comment: "Ordered list of embedded method names", array: true
    t.text     "options"
    t.index ["class_id"], name: "index_miq_ae_methods_on_class_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_methods_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_namespaces", id: :bigserial, force: :cascade do |t|
    t.bigint   "parent_id"
    t.string   "name"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "description"
    t.string   "display_name"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.integer  "priority"
    t.boolean  "enabled"
    t.bigint   "tenant_id"
    t.string   "commit_sha"
    t.datetime "commit_time"
    t.text     "commit_message"
    t.bigint   "git_repository_id"
    t.string   "ref"
    t.string   "ref_type"
    t.datetime "last_import_on"
    t.string   "source"
    t.string   "top_level_namespace"
    t.index ["parent_id"], name: "index_miq_ae_namespaces_on_parent_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_namespaces_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_values", id: :bigserial, force: :cascade do |t|
    t.bigint   "instance_id"
    t.bigint   "field_id"
    t.text     "value"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "display_name"
    t.text     "condition"
    t.text     "collect"
    t.text     "on_entry"
    t.text     "on_exit"
    t.text     "on_error"
    t.string   "max_retries"
    t.string   "max_time"
    t.string   "updated_by"
    t.bigint   "updated_by_user_id"
    t.index ["field_id"], name: "index_miq_ae_values_on_field_id", using: :btree
    t.index ["instance_id"], name: "index_miq_ae_values_on_instance_id", using: :btree
    t.index ["updated_by_user_id"], name: "index_miq_ae_values_on_updated_by_user_id", using: :btree
  end

  create_table "miq_ae_workspaces", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.text     "uri"
    t.text     "workspace"
    t.text     "setters"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "miq_alert_status_actions", id: :bigserial, force: :cascade do |t|
    t.string   "action_type"
    t.bigint   "user_id"
    t.string   "comment"
    t.bigint   "assignee_id"
    t.bigint   "miq_alert_status_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["assignee_id"], name: "index_miq_alert_status_actions_on_assignee_id", using: :btree
    t.index ["miq_alert_status_id"], name: "index_miq_alert_status_actions_on_miq_alert_status_id", using: :btree
    t.index ["user_id"], name: "index_miq_alert_status_actions_on_user_id", using: :btree
  end

  create_table "miq_alert_statuses", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_alert_id"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.datetime "evaluated_on"
    t.boolean  "result"
    t.text     "url"
    t.string   "severity"
    t.boolean  "acknowledged"
    t.bigint   "ems_id"
    t.string   "description"
    t.boolean  "resolved"
    t.string   "event_ems_ref"
    t.bigint   "assignee_id"
    t.index ["assignee_id"], name: "index_miq_alert_statuses_on_assignee_id", using: :btree
    t.index ["event_ems_ref"], name: "index_miq_alert_statuses_on_event_ems_ref", using: :btree
    t.index ["miq_alert_id"], name: "index_miq_alert_statuses_on_miq_alert_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_miq_alert_statuses_on_resource_id_and_resource_type", using: :btree
  end

  create_table "miq_alerts", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "options"
    t.string   "db"
    t.text     "miq_expression"
    t.text     "responds_to_events"
    t.boolean  "enabled"
    t.boolean  "read_only"
    t.text     "hash_expression"
    t.string   "severity"
  end

  create_table "miq_approvals", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "state"
    t.string   "reason"
    t.bigint   "miq_request_id"
    t.datetime "stamped_on"
    t.string   "stamper_name"
    t.bigint   "stamper_id"
    t.bigint   "approver_id"
    t.string   "approver_type"
    t.string   "approver_name"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.index ["approver_id", "approver_type"], name: "index_miq_approvals_on_approver_id_and_approver_type", using: :btree
    t.index ["miq_request_id"], name: "index_miq_approvals_on_miq_request_id", using: :btree
    t.index ["stamper_id"], name: "index_miq_approvals_on_stamper_id", using: :btree
  end

  create_table "miq_databases", id: :bigserial, force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "registration_type"
    t.string   "registration_organization"
    t.string   "registration_server"
    t.string   "registration_http_proxy_server"
    t.string   "cfme_version_available"
    t.boolean  "postgres_update_available"
    t.string   "session_secret_token"
    t.string   "csrf_secret_token"
    t.string   "registration_organization_display_name"
  end

  create_table "miq_dialogs", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "dialog_type"
    t.text     "content"
    t.boolean  "default",     default: false
    t.string   "filename"
    t.datetime "file_mtime"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "miq_enterprises", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "settings"
  end

  create_table "miq_event_definitions", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.string   "event_type"
    t.text     "definition"
    t.boolean  "default"
    t.boolean  "enabled"
    t.index ["guid"], name: "index_miq_event_definitions_on_guid", unique: true, using: :btree
  end

  create_table "miq_globals", id: :bigserial, force: :cascade do |t|
    t.string   "section"
    t.string   "key"
    t.text     "value"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "miq_groups", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "group_type"
    t.integer  "sequence"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "settings"
    t.bigint   "tenant_id"
  end

  create_table "miq_groups_users", id: :bigserial, force: :cascade do |t|
    t.bigint "miq_group_id"
    t.bigint "user_id"
    t.index ["user_id", "miq_group_id"], name: "index_miq_groups_users_on_user_id_and_miq_group_id", unique: true, using: :btree
  end

  create_table "miq_policies", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "expression"
    t.string   "towhat"
    t.string   "guid"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "notes"
    t.boolean  "active"
    t.string   "mode"
    t.boolean  "read_only"
  end

  create_table "miq_policy_contents", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_policy_id"
    t.bigint   "miq_action_id"
    t.bigint   "miq_event_definition_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "qualifier"
    t.integer  "success_sequence"
    t.integer  "failure_sequence"
    t.boolean  "success_synchronous"
    t.boolean  "failure_synchronous"
    t.index ["miq_action_id"], name: "index_miq_policy_contents_on_miq_action_id", using: :btree
    t.index ["miq_event_definition_id"], name: "index_miq_policy_contents_on_miq_event_definition_id", using: :btree
    t.index ["miq_policy_id"], name: "index_miq_policy_contents_on_miq_policy_id", using: :btree
  end

  create_table "miq_product_features", id: :bigserial, force: :cascade do |t|
    t.string   "identifier"
    t.string   "name"
    t.string   "description"
    t.string   "feature_type"
    t.boolean  "protected",    default: false
    t.bigint   "parent_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "hidden"
    t.bigint   "tenant_id"
    t.index ["parent_id"], name: "index_miq_product_features_on_parent_id", using: :btree
    t.index ["tenant_id"], name: "index_miq_product_features_on_tenant_id", using: :btree
  end

  create_table "miq_product_features_shares", id: :bigserial, force: :cascade do |t|
    t.bigint "miq_product_feature_id"
    t.bigint "share_id"
    t.index ["miq_product_feature_id"], name: "index_miq_product_features_shares_on_miq_product_feature_id", using: :btree
    t.index ["share_id"], name: "index_miq_product_features_shares_on_share_id", using: :btree
  end

  create_table "miq_queue", id: :bigserial, force: :cascade do |t|
    t.bigint   "target_id"
    t.integer  "priority"
    t.string   "method_name"
    t.string   "state"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "lock_version",   default: 0
    t.string   "task_id"
    t.datetime "deliver_on"
    t.string   "queue_name"
    t.string   "class_name"
    t.bigint   "instance_id"
    t.text     "args"
    t.text     "miq_callback"
    t.binary   "msg_data"
    t.string   "zone"
    t.string   "role"
    t.string   "server_guid"
    t.integer  "msg_timeout"
    t.bigint   "handler_id"
    t.string   "handler_type"
    t.datetime "expires_on"
    t.string   "tracking_label",             comment: "label to track requests through the system"
    t.bigint   "user_id"
    t.bigint   "group_id"
    t.bigint   "tenant_id"
    t.bigint   "miq_task_id"
    t.index ["class_name", "method_name", "queue_name", "state", "zone"], name: "miq_queue_put_idx", using: :btree
    t.index ["miq_task_id"], name: "index_miq_queue_on_miq_task_id", using: :btree
    t.index ["queue_name", "zone", "role", "server_guid", "priority", "deliver_on", "task_id"], name: "miq_queue_get_idx", where: "((state)::text = 'ready'::text)", using: :btree
    t.index ["task_id", "zone"], name: "miq_queue_get_sub_idx", where: "(((state)::text = 'dequeue'::text) AND (task_id IS NOT NULL))", using: :btree
    t.index ["task_id"], name: "index_miq_queue_on_task_id", using: :btree
  end

  create_table "miq_regions", id: :bigserial, force: :cascade do |t|
    t.integer  "region"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "description"
    t.string   "guid"
    t.string   "migrations_ran",                   array: true
    t.bigint   "maintenance_zone_id"
  end

  create_table "miq_report_result_details", id: :bigserial, force: :cascade do |t|
    t.bigint "miq_report_result_id"
    t.string "data_type"
    t.text   "data"
    t.index ["miq_report_result_id", "data_type", "id"], name: "miq_report_result_details_idx", using: :btree
  end

  create_table "miq_report_results", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "miq_report_id"
    t.bigint   "miq_task_id"
    t.string   "userid"
    t.string   "report_source"
    t.string   "db"
    t.text     "report"
    t.datetime "created_on"
    t.datetime "scheduled_on"
    t.datetime "last_run_on"
    t.datetime "last_accessed_on"
    t.integer  "report_rows_per_detail_row"
    t.bigint   "miq_group_id"
    t.index ["miq_group_id"], name: "index_miq_report_results_on_miq_group_id", using: :btree
    t.index ["miq_report_id"], name: "index_miq_report_results_on_miq_report_id", using: :btree
    t.index ["miq_task_id"], name: "index_miq_report_results_on_miq_task_id", using: :btree
  end

  create_table "miq_reports", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "rpt_group"
    t.string   "rpt_type"
    t.integer  "priority"
    t.string   "db"
    t.text     "cols"
    t.text     "include"
    t.text     "col_order"
    t.text     "headers"
    t.text     "conditions"
    t.string   "order"
    t.string   "sortby"
    t.string   "group"
    t.string   "graph"
    t.integer  "dims"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "filename"
    t.datetime "file_mtime"
    t.text     "categories"
    t.text     "timeline"
    t.string   "template_type"
    t.string   "where_clause"
    t.text     "db_options"
    t.text     "generate_cols"
    t.text     "generate_rows"
    t.text     "col_formats"
    t.string   "tz"
    t.bigint   "time_profile_id"
    t.text     "display_filter"
    t.text     "col_options"
    t.text     "rpt_options"
    t.bigint   "miq_group_id"
    t.bigint   "user_id"
    t.index ["db"], name: "index_miq_reports_on_db", using: :btree
    t.index ["miq_group_id"], name: "index_miq_reports_on_miq_group_id", using: :btree
    t.index ["rpt_type"], name: "index_miq_reports_on_rpt_type", using: :btree
    t.index ["template_type"], name: "index_miq_reports_on_template_type", using: :btree
    t.index ["time_profile_id"], name: "index_miq_reports_on_time_profile_id", using: :btree
  end

  create_table "miq_request_tasks", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "state"
    t.string   "request_type"
    t.string   "userid"
    t.text     "options"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "message"
    t.string   "status"
    t.string   "type"
    t.bigint   "miq_request_id"
    t.bigint   "source_id"
    t.string   "source_type"
    t.bigint   "destination_id"
    t.string   "destination_type"
    t.bigint   "miq_request_task_id"
    t.string   "phase"
    t.text     "phase_context"
    t.bigint   "tenant_id"
    t.string   "cancelation_status"
    t.bigint   "conversion_host_id"
    t.index ["destination_id", "destination_type"], name: "index_miq_request_tasks_on_destination_id_and_destination_type", using: :btree
    t.index ["miq_request_id"], name: "index_miq_request_tasks_on_miq_request_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_miq_request_tasks_on_source_id_and_source_type", using: :btree
    t.index ["type"], name: "index_miq_request_tasks_on_type", using: :btree
  end

  create_table "miq_requests", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "approval_state"
    t.string   "type"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "fulfilled_on"
    t.bigint   "requester_id"
    t.string   "requester_name"
    t.string   "request_type"
    t.string   "request_state"
    t.string   "message"
    t.string   "status"
    t.text     "options"
    t.string   "userid"
    t.bigint   "source_id"
    t.string   "source_type"
    t.bigint   "destination_id"
    t.string   "destination_type"
    t.bigint   "tenant_id"
    t.bigint   "service_order_id"
    t.boolean  "process"
    t.string   "cancelation_status"
    t.index ["destination_id", "destination_type"], name: "index_miq_requests_on_destination_id_and_destination_type", using: :btree
    t.index ["requester_id"], name: "index_miq_requests_on_requester_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_miq_requests_on_source_id_and_source_type", using: :btree
    t.index ["type"], name: "index_miq_requests_on_type", using: :btree
  end

  create_table "miq_roles_features", id: :bigserial, force: :cascade do |t|
    t.bigint "miq_user_role_id"
    t.bigint "miq_product_feature_id"
  end

  create_table "miq_schedules", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "sched_action"
    t.text     "filter"
    t.string   "resource_type"
    t.text     "run_at"
    t.boolean  "enabled"
    t.string   "userid"
    t.string   "prod_default"
    t.datetime "last_run_on"
    t.datetime "created_on"
    t.datetime "updated_at"
    t.bigint   "miq_search_id"
    t.bigint   "zone_id"
    t.boolean  "adhoc"
    t.bigint   "file_depot_id"
    t.bigint   "resource_id"
    t.index ["miq_search_id"], name: "index_miq_schedules_on_miq_search_id", using: :btree
    t.index ["zone_id"], name: "index_miq_schedules_on_zone_id", using: :btree
  end

  create_table "miq_scsi_luns", id: :bigserial, force: :cascade do |t|
    t.bigint  "miq_scsi_target_id"
    t.integer "lun"
    t.string  "canonical_name"
    t.string  "lun_type"
    t.string  "device_name"
    t.bigint  "block"
    t.integer "block_size"
    t.bigint  "capacity"
    t.string  "device_type"
    t.string  "uid_ems"
    t.index ["miq_scsi_target_id"], name: "index_miq_scsi_luns_on_miq_scsi_target_id", using: :btree
  end

  create_table "miq_scsi_targets", id: :bigserial, force: :cascade do |t|
    t.bigint  "guest_device_id"
    t.integer "target"
    t.string  "iscsi_name"
    t.string  "iscsi_alias"
    t.string  "address"
    t.string  "uid_ems"
    t.index ["guest_device_id"], name: "index_miq_scsi_targets_on_guest_device_id", using: :btree
  end

  create_table "miq_searches", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text   "options"
    t.text   "filter"
    t.string "db"
    t.string "search_type"
    t.string "search_key"
  end

  create_table "miq_servers", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "status"
    t.datetime "started_on"
    t.datetime "stopped_on"
    t.integer  "pid"
    t.string   "build"
    t.float    "percent_memory"
    t.float    "percent_cpu"
    t.float    "cpu_time"
    t.string   "name"
    t.text     "capabilities"
    t.datetime "last_heartbeat"
    t.integer  "os_priority"
    t.boolean  "is_master",                               default: false
    t.binary   "logo"
    t.string   "version"
    t.bigint   "zone_id"
    t.string   "upgrade_status"
    t.string   "upgrade_message"
    t.decimal  "memory_usage",             precision: 20
    t.decimal  "memory_size",              precision: 20
    t.string   "hostname"
    t.string   "ipaddress"
    t.string   "drb_uri"
    t.string   "mac_address"
    t.bigint   "vm_id"
    t.boolean  "has_active_userinterface"
    t.boolean  "has_active_webservices"
    t.integer  "sql_spid"
    t.boolean  "rh_registered"
    t.boolean  "rh_subscribed"
    t.string   "last_update_check"
    t.boolean  "updates_available"
    t.bigint   "log_file_depot_id"
    t.decimal  "proportional_set_size",    precision: 20
    t.boolean  "has_active_websocket"
    t.decimal  "system_memory_free",       precision: 20
    t.decimal  "system_memory_used",       precision: 20
    t.decimal  "system_swap_free",         precision: 20
    t.decimal  "system_swap_used",         precision: 20
    t.boolean  "has_active_cockpit_ws"
    t.decimal  "unique_set_size",          precision: 20
    t.index ["guid"], name: "index_miq_servers_on_guid", unique: true, using: :btree
    t.index ["vm_id"], name: "index_miq_servers_on_vm_id", using: :btree
    t.index ["zone_id"], name: "index_miq_servers_on_zone_id", using: :btree
  end

  create_table "miq_sets", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "set_type"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "guid"
    t.boolean  "read_only"
    t.text     "set_data"
    t.string   "mode"
    t.string   "owner_type"
    t.bigint   "owner_id"
    t.string   "userid"
    t.bigint   "group_id"
    t.index ["group_id"], name: "index_miq_sets_on_group_id", using: :btree
    t.index ["guid"], name: "index_miq_sets_on_guid", unique: true, using: :btree
    t.index ["name"], name: "index_miq_sets_on_name", using: :btree
    t.index ["owner_id", "owner_type"], name: "index_miq_sets_on_owner_id_and_owner_type", using: :btree
    t.index ["set_type"], name: "index_miq_sets_on_set_type", using: :btree
    t.index ["userid"], name: "index_miq_sets_on_userid", using: :btree
  end

  create_table "miq_shortcuts", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "url"
    t.string  "rbac_feature_name"
    t.boolean "startup"
    t.integer "sequence"
  end

  create_table "miq_tasks", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "status"
    t.text     "message"
    t.string   "userid"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "pct_complete"
    t.text     "context_data"
    t.text     "results"
    t.bigint   "miq_server_id"
    t.string   "identifier"
    t.datetime "started_on"
    t.string   "zone"
    t.index ["miq_server_id"], name: "index_miq_tasks_on_miq_server_id", using: :btree
  end

  create_table "miq_user_roles", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.boolean  "read_only"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "settings"
  end

  create_table "miq_widget_contents", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_widget_id"
    t.bigint   "miq_report_result_id"
    t.text     "contents"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "timezone"
    t.bigint   "miq_group_id"
    t.bigint   "user_id"
    t.index ["miq_report_result_id"], name: "index_miq_widget_contents_on_miq_report_result_id", using: :btree
    t.index ["miq_widget_id"], name: "index_miq_widget_contents_on_miq_widget_id", using: :btree
    t.index ["user_id"], name: "index_miq_widget_contents_on_user_id", using: :btree
  end

  create_table "miq_widget_shortcuts", id: :bigserial, force: :cascade do |t|
    t.string  "description"
    t.bigint  "miq_shortcut_id"
    t.bigint  "miq_widget_id"
    t.integer "sequence"
  end

  create_table "miq_widgets", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "description"
    t.string   "title"
    t.string   "content_type"
    t.text     "options"
    t.text     "visibility"
    t.bigint   "user_id"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.bigint   "miq_schedule_id"
    t.boolean  "enabled"
    t.boolean  "read_only"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "last_generated_content_on"
    t.bigint   "miq_task_id"
    t.index ["miq_schedule_id"], name: "index_miq_widgets_on_miq_schedule_id", using: :btree
    t.index ["miq_task_id"], name: "index_miq_widgets_on_miq_task_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_miq_widgets_on_resource_id_and_resource_type", using: :btree
    t.index ["user_id"], name: "index_miq_widgets_on_user_id", using: :btree
  end

  create_table "miq_workers", id: :bigserial, force: :cascade do |t|
    t.string   "guid"
    t.string   "status"
    t.datetime "started_on"
    t.datetime "stopped_on"
    t.datetime "last_heartbeat"
    t.integer  "pid"
    t.string   "queue_name"
    t.string   "type"
    t.float    "percent_memory"
    t.float    "percent_cpu"
    t.float    "cpu_time"
    t.integer  "os_priority"
    t.decimal  "memory_usage",          precision: 20
    t.decimal  "memory_size",           precision: 20
    t.string   "uri"
    t.bigint   "miq_server_id"
    t.integer  "sql_spid"
    t.decimal  "proportional_set_size", precision: 20
    t.decimal  "unique_set_size",       precision: 20
    t.index ["guid"], name: "index_miq_workers_on_guid", unique: true, using: :btree
    t.index ["miq_server_id"], name: "index_miq_workers_on_miq_server_id", using: :btree
    t.index ["queue_name"], name: "index_miq_workers_on_queue_name", using: :btree
    t.index ["status"], name: "index_miq_workers_on_status", using: :btree
    t.index ["type"], name: "index_miq_workers_on_worker_type", using: :btree
  end

  create_table "network_groups", id: :bigserial, force: :cascade do |t|
    t.string  "ems_ref"
    t.string  "name"
    t.string  "cidr"
    t.string  "status"
    t.boolean "enabled"
    t.bigint  "ems_id"
    t.bigint  "orchestration_stack_id"
    t.string  "type"
    t.index ["ems_id"], name: "index_network_groups_on_ems_id", using: :btree
    t.index ["orchestration_stack_id"], name: "index_network_groups_on_orchestration_stack_id", using: :btree
    t.index ["type"], name: "index_network_groups_on_type", using: :btree
  end

  create_table "network_ports", id: :bigserial, force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.string  "ems_ref"
    t.bigint  "ems_id"
    t.string  "mac_address"
    t.string  "status"
    t.boolean "admin_state_up"
    t.string  "device_owner"
    t.string  "device_ref"
    t.bigint  "device_id"
    t.string  "device_type"
    t.bigint  "cloud_tenant_id"
    t.string  "binding_host_id"
    t.string  "binding_virtual_interface_type"
    t.text    "extra_attributes"
    t.string  "source"
    t.index ["cloud_tenant_id"], name: "index_network_ports_on_cloud_tenant_id", using: :btree
    t.index ["device_id", "device_type"], name: "index_network_ports_on_device_id_and_device_type", using: :btree
    t.index ["ems_id"], name: "index_network_ports_on_ems_id", using: :btree
    t.index ["type"], name: "index_network_ports_on_type", using: :btree
  end

  create_table "network_ports_security_groups", id: :bigserial, force: :cascade do |t|
    t.bigint "network_port_id"
    t.bigint "security_group_id"
    t.index ["network_port_id", "security_group_id"], name: "index_network_ports_security_groups", unique: true, using: :btree
  end

  create_table "network_routers", id: :bigserial, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "ems_ref"
    t.bigint "ems_id"
    t.bigint "cloud_network_id"
    t.string "admin_state_up"
    t.bigint "cloud_tenant_id"
    t.string "status"
    t.text   "extra_attributes"
    t.bigint "network_group_id"
    t.index ["cloud_network_id"], name: "index_network_routers_on_cloud_network_id", using: :btree
    t.index ["cloud_tenant_id"], name: "index_network_routers_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_network_routers_on_ems_id", using: :btree
    t.index ["network_group_id"], name: "index_network_routers_on_network_group_id", using: :btree
    t.index ["type"], name: "index_network_routers_on_type", using: :btree
  end

  create_table "networks", id: :bigserial, force: :cascade do |t|
    t.bigint   "hardware_id"
    t.bigint   "device_id"
    t.string   "description"
    t.string   "guid"
    t.boolean  "dhcp_enabled"
    t.string   "ipaddress"
    t.string   "subnet_mask"
    t.datetime "lease_obtained"
    t.datetime "lease_expires"
    t.string   "default_gateway"
    t.string   "dhcp_server"
    t.string   "dns_server"
    t.string   "hostname"
    t.string   "domain"
    t.string   "ipv6address"
    t.index ["device_id"], name: "index_networks_on_device_id", using: :btree
    t.index ["hardware_id"], name: "index_networks_on_hardware_id", using: :btree
  end

  create_table "notification_recipients", id: :bigserial, force: :cascade do |t|
    t.bigint  "notification_id"
    t.bigint  "user_id"
    t.boolean "seen"
    t.index ["notification_id"], name: "index_notification_recipients_on_notification_id", using: :btree
    t.index ["user_id"], name: "index_notification_recipients_on_user_id", using: :btree
  end

  create_table "notification_types", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "level"
    t.string  "audience"
    t.text    "message"
    t.integer "expires_in"
    t.string  "link_to"
    t.index ["name"], name: "index_notification_types_on_name", unique: true, using: :btree
  end

  create_table "notifications", id: :bigserial, force: :cascade do |t|
    t.bigint   "notification_type_id", null: false
    t.bigint   "user_id"
    t.string   "subject_type"
    t.bigint   "subject_id"
    t.string   "cause_type"
    t.bigint   "cause_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "options"
    t.index ["cause_type", "cause_id"], name: "index_notifications_on_cause_type_and_cause_id", using: :btree
    t.index ["notification_type_id"], name: "index_notifications_on_notification_type_id", using: :btree
    t.index ["subject_type", "subject_id"], name: "index_notifications_on_subject_type_and_subject_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "openscap_results", id: :bigserial, force: :cascade do |t|
    t.bigint   "container_image_id"
    t.datetime "created_at"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.index ["container_image_id"], name: "index_openscap_results_on_container_image_id", using: :btree
  end

  create_table "openscap_rule_results", id: :bigserial, force: :cascade do |t|
    t.bigint "openscap_result_id"
    t.string "name"
    t.string "result"
    t.string "severity"
    t.string "title"
    t.string "cves"
    t.index ["openscap_result_id"], name: "index_openscap_rule_results_on_openscap_result_id", using: :btree
  end

  create_table "operating_system_flavors", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.bigint   "provisioning_manager_id"
    t.string   "manager_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["manager_ref"], name: "index_operating_system_flavors_on_manager_ref", using: :btree
    t.index ["provisioning_manager_id"], name: "index_operating_system_flavors_on_provisioning_manager_id", using: :btree
  end

  create_table "operating_systems", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "product_name"
    t.string  "version"
    t.string  "build_number"
    t.string  "system_root"
    t.string  "distribution"
    t.string  "product_type"
    t.string  "service_pack"
    t.string  "productid"
    t.bigint  "vm_or_template_id"
    t.bigint  "host_id"
    t.integer "bitness"
    t.string  "product_key"
    t.integer "pw_hist"
    t.integer "max_pw_age"
    t.integer "min_pw_age"
    t.integer "min_pw_len"
    t.boolean "pw_complex"
    t.boolean "pw_encrypt"
    t.integer "lockout_threshold"
    t.bigint  "lockout_duration"
    t.integer "reset_lockout_counter"
    t.string  "system_type"
    t.bigint  "computer_system_id"
    t.string  "kernel_version"
    t.index ["computer_system_id"], name: "index_operating_systems_on_computer_system_id", using: :btree
    t.index ["host_id"], name: "index_operating_systems_on_host_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_operating_systems_on_vm_id", using: :btree
  end

  create_table "orchestration_stack_outputs", id: :bigserial, force: :cascade do |t|
    t.string "key"
    t.text   "value"
    t.text   "description"
    t.bigint "stack_id"
    t.text   "ems_ref"
    t.index ["stack_id"], name: "index_orchestration_stack_outputs_on_stack_id", using: :btree
  end

  create_table "orchestration_stack_parameters", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.text   "value"
    t.bigint "stack_id"
    t.text   "ems_ref"
    t.index ["stack_id"], name: "index_orchestration_stack_parameters_on_stack_id", using: :btree
  end

  create_table "orchestration_stack_resources", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "logical_resource"
    t.text     "physical_resource"
    t.string   "resource_category"
    t.string   "resource_status"
    t.text     "resource_status_reason"
    t.datetime "last_updated"
    t.bigint   "stack_id"
    t.text     "ems_ref"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.index ["stack_id"], name: "index_orchestration_stack_resources_on_stack_id", using: :btree
  end

  create_table "orchestration_stacks", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.string   "status"
    t.text     "ems_ref"
    t.string   "ancestry"
    t.bigint   "ems_id"
    t.bigint   "orchestration_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "retired"
    t.datetime "retires_on"
    t.bigint   "retirement_warn"
    t.datetime "retirement_last_warn"
    t.string   "retirement_state"
    t.string   "retirement_requester"
    t.text     "status_reason"
    t.bigint   "cloud_tenant_id"
    t.string   "resource_group"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.bigint   "configuration_script_base_id"
    t.integer  "verbosity"
    t.text     "hosts",                        array: true
    t.index "ancestry varchar_pattern_ops", name: "index_orchestration_stacks_on_ancestry_vpo", using: :btree
    t.index ["ancestry"], name: "index_orchestration_stacks_on_ancestry", using: :btree
    t.index ["orchestration_template_id"], name: "index_orchestration_stacks_on_orchestration_template_id", using: :btree
    t.index ["type"], name: "index_orchestration_stacks_on_type", using: :btree
  end

  create_table "orchestration_templates", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.text     "content"
    t.string   "md5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "draft"
    t.boolean  "orderable"
    t.string   "ems_ref"
    t.bigint   "ems_id"
    t.index ["ems_id"], name: "index_orchestration_templates_on_ems_id", using: :btree
    t.index ["md5"], name: "index_orchestration_templates_on_md5", using: :btree
    t.index ["type"], name: "index_orchestration_templates_on_type", using: :btree
  end

  create_table "os_processes", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.integer  "pid"
    t.bigint   "memory_usage"
    t.bigint   "memory_size"
    t.float    "percent_memory"
    t.float    "percent_cpu"
    t.integer  "cpu_time"
    t.integer  "priority"
    t.bigint   "operating_system_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.index ["operating_system_id"], name: "index_os_processes_on_operating_system_id", using: :btree
  end

  create_table "partitions", id: :bigserial, force: :cascade do |t|
    t.bigint   "disk_id"
    t.string   "name"
    t.bigint   "size"
    t.bigint   "free_space"
    t.bigint   "used_space"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "location"
    t.bigint   "hardware_id"
    t.string   "volume_group"
    t.integer  "partition_type"
    t.string   "controller"
    t.string   "virtual_disk_file"
    t.string   "uid"
    t.bigint   "start_address"
    t.index ["disk_id"], name: "index_partitions_on_disk_id", using: :btree
    t.index ["hardware_id", "volume_group"], name: "index_partitions_on_hardware_id_and_volume_group", using: :btree
  end

  create_table "patches", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "vendor"
    t.text     "description"
    t.string   "service_pack"
    t.string   "is_valid"
    t.string   "installed"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "vm_or_template_id"
    t.bigint   "host_id"
    t.datetime "installed_on"
    t.index ["host_id"], name: "index_patches_on_host_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_patches_on_vm_id", using: :btree
  end

  create_table "persistent_volume_claims", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "ems_ref"
    t.string   "name"
    t.datetime "ems_created_on"
    t.string   "resource_version"
    t.text     "desired_access_modes", default: [], array: true
    t.string   "phase"
    t.text     "actual_access_modes",  default: [], array: true
    t.text     "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "container_project_id"
    t.text     "requests"
    t.text     "limits"
  end

  create_table "physical_chassis", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "uid_ems"
    t.string   "ems_ref"
    t.bigint   "physical_rack_id"
    t.string   "name"
    t.string   "vendor"
    t.string   "type"
    t.string   "health_state"
    t.string   "overall_health_state"
    t.integer  "management_module_slot_count"
    t.integer  "switch_slot_count"
    t.integer  "fan_slot_count"
    t.integer  "blade_slot_count"
    t.integer  "powersupply_slot_count"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.bigint   "parent_physical_chassis_id"
  end

  create_table "physical_disks", id: :bigserial, force: :cascade do |t|
    t.string   "model"
    t.string   "vendor"
    t.string   "status"
    t.string   "location"
    t.string   "serial_number"
    t.string   "health_state"
    t.string   "controller_type"
    t.string   "disk_size"
    t.bigint   "physical_storage_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["location"], name: "index_physical_disks_on_location", using: :btree
    t.index ["physical_storage_id"], name: "index_physical_disks_on_physical_storage_id", using: :btree
  end

  create_table "physical_network_ports", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "uid_ems"
    t.string   "type"
    t.string   "port_name"
    t.string   "port_type"
    t.string   "peer_mac_address"
    t.string   "vlan_key"
    t.string   "mac_address"
    t.integer  "port_index"
    t.boolean  "vlan_enabled"
    t.bigint   "guest_device_id"
    t.bigint   "switch_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "connected_port_uid"
    t.string   "port_status"
  end

  create_table "physical_racks", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "uid_ems"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ems_ref"
  end

  create_table "physical_servers", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "name"
    t.string   "type"
    t.string   "uid_ems"
    t.string   "ems_ref"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "health_state"
    t.string   "power_state"
    t.string   "hostname"
    t.string   "product_name"
    t.string   "manufacturer"
    t.string   "machine_type"
    t.string   "model"
    t.string   "serial_number"
    t.string   "field_replaceable_unit"
    t.string   "raw_power_state"
    t.string   "vendor"
    t.bigint   "physical_rack_id"
    t.string   "ems_compliance_name"
    t.string   "ems_compliance_status"
    t.bigint   "physical_chassis_id"
  end

  create_table "physical_storages", id: :bigserial, force: :cascade do |t|
    t.string   "ems_ref"
    t.string   "uid_ems"
    t.string   "name"
    t.string   "type"
    t.string   "access_state"
    t.string   "health_state"
    t.string   "overall_health_state"
    t.bigint   "ems_id"
    t.bigint   "physical_rack_id"
    t.integer  "drive_bays"
    t.integer  "enclosures"
    t.integer  "canister_slots"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.bigint   "physical_chassis_id"
  end

  create_table "pictures", id: :bigserial, force: :cascade do |t|
    t.bigint "resource_id"
    t.string "resource_type"
    t.binary "content"
    t.string "extension"
    t.string "md5"
  end

  create_table "policy_event_contents", id: :bigserial, force: :cascade do |t|
    t.bigint "policy_event_id"
    t.bigint "resource_id"
    t.string "resource_type"
    t.string "resource_description"
    t.index ["policy_event_id"], name: "index_policy_event_contents_on_policy_event_id", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_policy_event_contents_on_resource_id_and_resource_type", using: :btree
  end

  create_table "policy_events", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_event_definition_id"
    t.string   "event_type"
    t.string   "miq_event_definition_description"
    t.bigint   "miq_policy_id"
    t.string   "miq_policy_description"
    t.string   "result"
    t.datetime "timestamp"
    t.bigint   "target_id"
    t.string   "target_class"
    t.string   "target_name"
    t.bigint   "chain_id"
    t.string   "username"
    t.bigint   "host_id"
    t.bigint   "ems_cluster_id"
    t.bigint   "ems_id"
    t.index ["chain_id"], name: "index_policy_events_on_chain_id", using: :btree
    t.index ["ems_cluster_id"], name: "index_policy_events_on_ems_cluster_id", using: :btree
    t.index ["ems_id"], name: "index_policy_events_on_ems_id", using: :btree
    t.index ["host_id"], name: "index_policy_events_on_host_id", using: :btree
    t.index ["miq_event_definition_id"], name: "index_policy_events_on_miq_event_definition_id", using: :btree
    t.index ["miq_policy_id"], name: "index_policy_events_on_miq_policy_id", using: :btree
    t.index ["target_id", "target_class"], name: "index_policy_events_on_target_id_and_target_class", using: :btree
  end

  create_table "providers", id: :bigserial, force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "guid"
    t.bigint   "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "tenant_id"
    t.index ["type"], name: "index_providers_on_type", using: :btree
  end

  create_table "pxe_image_types", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "provision_type"
  end

  create_table "pxe_images", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.bigint   "pxe_server_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.bigint   "pxe_menu_id"
    t.string   "type"
    t.bigint   "pxe_image_type_id"
    t.string   "kernel"
    t.string   "kernel_options"
    t.string   "initrd"
    t.boolean  "default_for_windows"
    t.string   "path"
    t.index ["pxe_server_id"], name: "index_pxe_images_on_pxe_server_id", using: :btree
    t.index ["type"], name: "index_pxe_images_on_type", using: :btree
  end

  create_table "pxe_menus", id: :bigserial, force: :cascade do |t|
    t.string   "file_name"
    t.text     "contents"
    t.bigint   "pxe_server_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "type"
    t.index ["type"], name: "index_pxe_menus_on_type", using: :btree
  end

  create_table "pxe_servers", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "uri_prefix"
    t.string   "uri"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "last_refresh_on"
    t.text     "visibility"
    t.string   "access_url"
    t.string   "pxe_directory"
    t.string   "customization_directory"
    t.string   "windows_images_directory"
  end

  create_table "registry_items", id: :bigserial, force: :cascade do |t|
    t.bigint   "miq_set_id"
    t.bigint   "scan_item_id"
    t.bigint   "vm_or_template_id"
    t.string   "name"
    t.text     "data"
    t.string   "format"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "value_name"
    t.index ["miq_set_id"], name: "index_registry_items_on_miq_set_id", using: :btree
    t.index ["scan_item_id"], name: "index_registry_items_on_scan_item_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_registry_items_on_vm_id", using: :btree
  end

  create_table "relationships", id: :bigserial, force: :cascade do |t|
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "ancestry"
    t.string   "relationship"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index "ancestry varchar_pattern_ops", name: "index_relationships_on_ancestry_vpo", using: :btree
    t.index ["ancestry"], name: "index_relationships_on_ancestry", using: :btree
    t.index ["resource_id", "resource_type", "relationship"], name: "index_relationships_on_resource_and_relationship", using: :btree
  end

  create_table "repositories", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "relative_path"
    t.bigint   "storage_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.index ["storage_id"], name: "index_repositories_on_storage_id", using: :btree
  end

  create_table "reserves", id: :bigserial, force: :cascade do |t|
    t.string "resource_type"
    t.bigint "resource_id"
    t.text   "reserved"
    t.index ["resource_id", "resource_type"], name: "index_reserves_on_resource_id_and_resource_type", using: :btree
  end

  create_table "resource_actions", id: :bigserial, force: :cascade do |t|
    t.string   "action"
    t.bigint   "dialog_id"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ae_namespace"
    t.string   "ae_class"
    t.string   "ae_instance"
    t.string   "ae_message"
    t.text     "ae_attributes"
    t.bigint   "configuration_template_id"
    t.string   "configuration_template_type"
  end

  create_table "resource_groups", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.bigint   "ems_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_pools", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "ems_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "uid_ems"
    t.integer  "memory_reserve"
    t.boolean  "memory_reserve_expand"
    t.integer  "memory_limit"
    t.integer  "memory_shares"
    t.string   "memory_shares_level"
    t.integer  "cpu_reserve"
    t.boolean  "cpu_reserve_expand"
    t.integer  "cpu_limit"
    t.integer  "cpu_shares"
    t.string   "cpu_shares_level"
    t.boolean  "is_default"
    t.string   "ems_ref_obj"
    t.boolean  "vapp"
    t.string   "ems_ref"
    t.index ["ems_id"], name: "index_resource_pools_on_ems_id", using: :btree
    t.index ["uid_ems"], name: "index_resource_pools_on_uid", using: :btree
  end

  create_table "rss_feeds", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.text     "title"
    t.text     "link"
    t.text     "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "yml_file_mtime"
    t.index ["name"], name: "index_rss_feeds_on_name", using: :btree
  end

  create_table "scan_histories", id: :bigserial, force: :cascade do |t|
    t.bigint   "vm_or_template_id"
    t.string   "status"
    t.text     "message"
    t.datetime "started_on"
    t.datetime "finished_on"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "task_id"
    t.integer  "status_code"
    t.index ["vm_or_template_id"], name: "index_scan_histories_on_vm_id", using: :btree
  end

  create_table "scan_items", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "guid"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "item_type"
    t.text     "definition"
    t.string   "filename"
    t.datetime "file_mtime"
    t.string   "prod_default"
    t.string   "mode"
    t.index ["guid"], name: "index_scan_items_on_guid", unique: true, using: :btree
    t.index ["item_type"], name: "index_scan_items_on_item_type", using: :btree
    t.index ["name"], name: "index_scan_items_on_name", using: :btree
  end

  create_table "scan_results", id: :bigserial, force: :cascade do |t|
    t.string "scan_status"
    t.string "scan_result_message"
    t.string "scan_type"
    t.string "resource_type"
    t.bigint "resource_id"
    t.index ["resource_type", "resource_id"], name: "index_scan_results_on_resource_type_and_resource_id", using: :btree
  end

  create_table "schema_migrations_ran", id: :bigserial, force: :cascade do |t|
    t.string   "version"
    t.datetime "created_at", null: false
  end

  create_table "security_contexts", id: :bigserial, force: :cascade do |t|
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "se_linux_user"
    t.string "se_linux_role"
    t.string "se_linux_type"
    t.string "se_linux_level"
  end

  create_table "security_groups", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "type"
    t.bigint "ems_id"
    t.string "ems_ref"
    t.bigint "cloud_network_id"
    t.bigint "cloud_tenant_id"
    t.bigint "orchestration_stack_id"
    t.bigint "network_group_id"
    t.bigint "network_router_id"
    t.bigint "cloud_subnet_id"
    t.index ["cloud_network_id"], name: "index_security_groups_on_cloud_network_id", using: :btree
    t.index ["cloud_subnet_id"], name: "index_security_groups_on_cloud_subnet_id", using: :btree
    t.index ["cloud_tenant_id"], name: "index_security_groups_on_cloud_tenant_id", using: :btree
    t.index ["ems_id"], name: "index_security_groups_on_ems_id", using: :btree
    t.index ["network_group_id"], name: "index_security_groups_on_network_group_id", using: :btree
    t.index ["network_router_id"], name: "index_security_groups_on_network_router_id", using: :btree
    t.index ["orchestration_stack_id"], name: "index_security_groups_on_orchestration_stack_id", using: :btree
    t.index ["type"], name: "index_security_groups_on_type", using: :btree
  end

  create_table "security_groups_vms", id: :bigserial, force: :cascade do |t|
    t.bigint "security_group_id"
    t.bigint "vm_id"
  end

  create_table "server_roles", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "max_concurrent"
    t.boolean  "external_failover"
    t.string   "role_scope"
  end

  create_table "service_connections", id: :bigserial, force: :cascade do |t|
    t.bigint "service_bundle_id"
    t.bigint "service_template_a_id"
    t.bigint "service_template_b_id"
    t.text   "properties"
    t.index ["service_template_a_id"], name: "index_service_connections_on_service_template_a_id", using: :btree
    t.index ["service_template_b_id"], name: "index_service_connections_on_service_template_b_id", using: :btree
  end

  create_table "service_instances", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "type"
    t.bigint   "ems_id"
    t.bigint   "service_offering_id"
    t.bigint   "service_parameters_set_id"
    t.jsonb    "extra"
    t.datetime "deleted_on"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["deleted_on"], name: "index_service_instances_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_service_instances_on_ems_id", using: :btree
    t.index ["service_offering_id"], name: "index_service_instances_on_service_offering_id", using: :btree
    t.index ["service_parameters_set_id"], name: "index_service_instances_on_service_parameters_set_id", using: :btree
  end

  create_table "service_offerings", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "type"
    t.text     "description"
    t.bigint   "ems_id"
    t.jsonb    "extra"
    t.datetime "deleted_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["deleted_on"], name: "index_service_offerings_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_service_offerings_on_ems_id", using: :btree
  end

  create_table "service_orders", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.bigint   "tenant_id"
    t.bigint   "user_id"
    t.string   "user_name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "placed_at"
  end

  create_table "service_parameters_sets", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ems_ref"
    t.string   "type"
    t.text     "description"
    t.bigint   "ems_id"
    t.bigint   "service_offering_id"
    t.jsonb    "extra"
    t.datetime "deleted_on"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["deleted_on"], name: "index_service_parameters_sets_on_deleted_on", using: :btree
    t.index ["ems_id"], name: "index_service_parameters_sets_on_ems_id", using: :btree
    t.index ["service_offering_id"], name: "index_service_parameters_sets_on_service_offering_id", using: :btree
  end

  create_table "service_resources", id: :bigserial, force: :cascade do |t|
    t.bigint   "service_template_id"
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.integer  "group_idx"
    t.integer  "scaling_min"
    t.integer  "scaling_max"
    t.string   "start_action"
    t.integer  "start_delay"
    t.string   "stop_action"
    t.integer  "stop_delay"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
    t.bigint   "service_id"
    t.bigint   "source_id"
    t.string   "source_type"
    t.integer  "provision_index"
    t.jsonb    "options",             default: {}
    t.string   "status"
  end

  create_table "service_template_catalogs", id: :bigserial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "tenant_id"
  end

  create_table "service_templates", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "guid"
    t.string   "type"
    t.bigint   "service_template_id"
    t.text     "options"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "display"
    t.bigint   "evm_owner_id"
    t.bigint   "miq_group_id"
    t.string   "service_type"
    t.string   "prov_type"
    t.float    "provision_cost"
    t.bigint   "service_template_catalog_id"
    t.text     "long_description"
    t.bigint   "tenant_id"
    t.string   "generic_subtype"
    t.datetime "deleted_on"
    t.boolean  "internal"
    t.index ["generic_subtype"], name: "index_service_templates_on_generic_subtype", using: :btree
    t.index ["type"], name: "index_service_templates_on_type", using: :btree
  end

  create_table "services", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "guid"
    t.string   "type"
    t.bigint   "service_template_id"
    t.text     "options"
    t.boolean  "display"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.bigint   "evm_owner_id"
    t.bigint   "miq_group_id"
    t.boolean  "retired"
    t.datetime "retires_on"
    t.bigint   "retirement_warn"
    t.datetime "retirement_last_warn"
    t.string   "retirement_state"
    t.string   "retirement_requester"
    t.bigint   "tenant_id"
    t.string   "ancestry"
    t.string   "initiator",                         comment: "Entity that initiated the service creation"
    t.index "ancestry varchar_pattern_ops", name: "index_services_on_ancestry_vpo", using: :btree
    t.index ["ancestry"], name: "index_services_on_ancestry", using: :btree
    t.index ["type"], name: "index_services_on_type", using: :btree
  end

  create_table "sessions", id: :bigserial, force: :cascade do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "settings_changes", id: :bigserial, force: :cascade do |t|
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["key"], name: "index_settings_changes_on_key", using: :btree
    t.index ["resource_id", "resource_type"], name: "index_settings_changes_on_resource_id_and_resource_type", using: :btree
  end

  create_table "shares", id: :bigserial, force: :cascade do |t|
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.bigint   "tenant_id"
    t.bigint   "user_id"
    t.boolean  "allow_tenant_inheritance"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["resource_type", "resource_id"], name: "index_shares_on_resource_type_and_resource_id", using: :btree
    t.index ["tenant_id"], name: "index_shares_on_tenant_id", using: :btree
    t.index ["user_id"], name: "index_shares_on_user_id", using: :btree
  end

  create_table "showback_data_rollups", id: :bigserial, force: :cascade do |t|
    t.jsonb    "data"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.jsonb    "context"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_showback_data_rollups_on_resource_type_and_resource_id", using: :btree
  end

  create_table "showback_data_views", id: :bigserial, force: :cascade do |t|
    t.bigint   "cost_subunits"
    t.string   "cost_currency"
    t.bigint   "showback_envelope_id"
    t.bigint   "showback_data_rollup_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.jsonb    "data_snapshot",                        comment: "Snapshot of the data of showbackevent"
    t.jsonb    "context_snapshot"
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["showback_data_rollup_id"], name: "index_showback_data_views_on_showback_data_rollup_id", using: :btree
    t.index ["showback_envelope_id"], name: "index_showback_data_views_on_showback_envelope_id", using: :btree
  end

  create_table "showback_envelopes", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "state"
    t.bigint   "accumulated_cost_subunits"
    t.string   "accumulated_cost_currency"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["resource_type", "resource_id"], name: "index_showback_envelopes_on_resource_type_and_resource_id", using: :btree
  end

  create_table "showback_input_measures", id: :bigserial, force: :cascade do |t|
    t.string   "entity"
    t.string   "description"
    t.string   "group"
    t.text     "fields"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "showback_price_plans", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_showback_price_plans_on_resource_type_and_resource_id", using: :btree
  end

  create_table "showback_rates", id: :bigserial, force: :cascade do |t|
    t.string   "calculation"
    t.string   "entity"
    t.string   "field"
    t.jsonb    "screener"
    t.datetime "start_date"
    t.string   "concept"
    t.bigint   "showback_price_plan_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "group"
    t.string   "tier_input_variable"
    t.boolean  "uses_single_tier"
    t.boolean  "tiers_use_full_value"
    t.index ["entity", "field"], name: "index_showback_rates_on_entity_and_field", using: :btree
    t.index ["showback_price_plan_id"], name: "index_showback_rates_on_showback_price_plan_id", using: :btree
  end

  create_table "showback_tiers", id: :bigserial, force: :cascade do |t|
    t.float  "tier_start_value"
    t.float  "tier_end_value"
    t.bigint "fixed_rate_subunits"
    t.string "fixed_rate_currency"
    t.string "fixed_rate_per_time"
    t.bigint "variable_rate_subunits"
    t.string "variable_rate_currency"
    t.string "variable_rate_per_unit"
    t.string "variable_rate_per_time"
    t.float  "step_value"
    t.string "step_time_unit"
    t.float  "step_time_value"
    t.string "step_unit"
    t.bigint "showback_rate_id"
    t.index ["showback_rate_id"], name: "index_showback_tiers_on_showback_rate_id", using: :btree
  end

  create_table "snapshots", id: :bigserial, force: :cascade do |t|
    t.string   "uid"
    t.string   "parent_uid"
    t.string   "name"
    t.text     "description"
    t.integer  "current"
    t.bigint   "total_size"
    t.string   "filename"
    t.datetime "create_time"
    t.text     "disks"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "parent_id"
    t.bigint   "vm_or_template_id"
    t.string   "uid_ems"
    t.string   "ems_ref_obj"
    t.string   "ems_ref"
    t.index ["parent_id"], name: "index_snapshots_on_parent_id", using: :btree
    t.index ["parent_uid"], name: "index_snapshots_on_parent_uid", using: :btree
    t.index ["uid"], name: "index_snapshots_on_uid", using: :btree
    t.index ["vm_or_template_id"], name: "index_snapshots_on_vm_id", using: :btree
  end

  create_table "storage_files", id: :bigserial, force: :cascade do |t|
    t.text     "name"
    t.string   "size"
    t.datetime "mtime"
    t.string   "rsc_type"
    t.text     "base_name"
    t.string   "ext_name"
    t.bigint   "storage_id"
    t.bigint   "vm_or_template_id"
    t.index ["storage_id"], name: "index_storage_files_on_storage_id", using: :btree
    t.index ["vm_or_template_id"], name: "index_storage_files_on_vm_id", using: :btree
  end

  create_table "storage_profile_storages", id: :bigserial, force: :cascade do |t|
    t.bigint "storage_profile_id"
    t.bigint "storage_id"
    t.index ["storage_id"], name: "index_storage_profile_storages_on_storage_id", using: :btree
    t.index ["storage_profile_id"], name: "index_storage_profile_storages_on_storage_profile_id", using: :btree
  end

  create_table "storage_profiles", id: :bigserial, force: :cascade do |t|
    t.bigint   "ems_id"
    t.string   "name"
    t.string   "ems_ref"
    t.string   "profile_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "storages", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "store_type"
    t.bigint   "total_space"
    t.bigint   "free_space"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "multiplehostaccess"
    t.string   "location",                      default: ""
    t.datetime "last_scan_on"
    t.bigint   "uncommitted"
    t.datetime "last_perf_capture_on"
    t.string   "ems_ref_obj"
    t.boolean  "directory_hierarchy_supported"
    t.boolean  "thin_provisioning_supported"
    t.boolean  "raw_disk_mappings_supported"
    t.boolean  "master",                        default: false
    t.string   "ems_ref"
    t.string   "storage_domain_type"
    t.string   "status"
    t.index ["location"], name: "index_storages_on_location", using: :btree
    t.index ["name"], name: "index_storages_on_name", using: :btree
  end

  create_table "storages_vms_and_templates", id: :bigserial, force: :cascade do |t|
    t.bigint "storage_id"
    t.bigint "vm_or_template_id"
    t.index ["vm_or_template_id", "storage_id"], name: "index_storages_vms_on_vm_id_and_storage_id", unique: true, using: :btree
  end

  create_table "subnets", id: :bigserial, force: :cascade do |t|
    t.string "ems_ref"
    t.string "name"
    t.string "cidr"
    t.string "type"
    t.bigint "lan_id"
  end

  create_table "switches", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.integer  "ports"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "uid_ems"
    t.boolean  "allow_promiscuous"
    t.boolean  "forged_transmits"
    t.boolean  "mac_changes"
    t.string   "switch_uuid"
    t.boolean  "shared"
    t.integer  "mtu"
    t.bigint   "ems_id"
    t.string   "type"
    t.string   "health_state"
    t.string   "power_state"
    t.index ["name"], name: "index_switches_on_name", using: :btree
  end

  create_table "system_consoles", id: :bigserial, force: :cascade do |t|
    t.string   "url_secret"
    t.string   "host_name"
    t.integer  "port"
    t.boolean  "ssl"
    t.string   "protocol"
    t.string   "secret"
    t.boolean  "opened"
    t.bigint   "vm_id"
    t.bigint   "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "url"
    t.integer  "proxy_pid"
    t.string   "proxy_status"
    t.index ["url_secret"], name: "index_system_consoles_on_url_secret", unique: true, using: :btree
    t.index ["user_id"], name: "index_system_consoles_on_user_id", using: :btree
    t.index ["vm_id"], name: "index_system_consoles_on_vm_id", using: :btree
  end

  create_table "system_services", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "svc_type"
    t.string  "typename"
    t.string  "start"
    t.text    "image_path"
    t.string  "display_name"
    t.string  "depend_on_service"
    t.string  "depend_on_group"
    t.string  "object_name"
    t.text    "description"
    t.bigint  "vm_or_template_id"
    t.string  "enable_run_levels"
    t.string  "disable_run_levels"
    t.bigint  "host_id"
    t.boolean "running"
    t.text    "dependencies"
    t.string  "systemd_load"
    t.string  "systemd_active"
    t.string  "systemd_sub"
    t.bigint  "host_service_group_id"
    t.index ["host_id"], name: "index_system_services_on_host_id", using: :btree
    t.index ["host_service_group_id"], name: "index_system_services_on_host_service_group_id", using: :btree
    t.index ["typename"], name: "index_system_services_on_typename", using: :btree
    t.index ["vm_or_template_id"], name: "index_system_services_on_vm_id", using: :btree
  end

  create_table "taggings", id: :bigserial, force: :cascade do |t|
    t.bigint "taggable_id"
    t.bigint "tag_id"
    t.string "taggable_type"
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree
  end

  create_table "tags", id: :bigserial, force: :cascade do |t|
    t.text "name"
  end

  create_table "tenant_quotas", id: :bigserial, force: :cascade do |t|
    t.bigint   "tenant_id"
    t.string   "name"
    t.string   "unit"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "warn_value"
  end

  create_table "tenants", id: :bigserial, force: :cascade do |t|
    t.string   "domain"
    t.string   "subdomain"
    t.string   "name"
    t.string   "login_text"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "login_logo_file_name"
    t.string   "login_logo_content_type"
    t.integer  "login_logo_file_size"
    t.datetime "login_logo_updated_at"
    t.string   "ancestry"
    t.boolean  "divisible"
    t.text     "description"
    t.boolean  "use_config_for_attributes"
    t.bigint   "default_miq_group_id"
    t.string   "source_type"
    t.bigint   "source_id"
    t.index "ancestry varchar_pattern_ops", name: "index_tenants_on_ancestry_vpo", using: :btree
    t.index ["ancestry"], name: "index_tenants_on_ancestry", using: :btree
    t.index ["domain"], name: "index_tenants_on_domain", using: :btree
    t.index ["source_type", "source_id"], name: "index_tenants_on_source_type_and_source_id", using: :btree
    t.index ["subdomain"], name: "index_tenants_on_subdomain", using: :btree
  end

  create_table "time_profiles", id: :bigserial, force: :cascade do |t|
    t.string   "description"
    t.string   "profile_type"
    t.string   "profile_key"
    t.text     "profile"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.boolean  "rollup_daily_metrics"
  end

  create_table "transformation_mapping_items", id: :bigserial, force: :cascade do |t|
    t.bigint   "source_id"
    t.string   "source_type"
    t.bigint   "destination_id"
    t.string   "destination_type"
    t.bigint   "transformation_mapping_id"
    t.jsonb    "options",                   default: {}
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["transformation_mapping_id"], name: "index_transformation_mapping_items_on_transformation_mapping_id", using: :btree
  end

  create_table "transformation_mappings", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "comments"
    t.string   "state"
    t.jsonb    "options",     default: {}
    t.bigint   "tenant_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "icon"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "userid"
    t.text     "settings"
    t.datetime "lastlogon"
    t.datetime "lastlogoff"
    t.bigint   "current_group_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.index ["current_group_id"], name: "index_users_on_current_group_id", using: :btree
    t.index ["userid"], name: "index_users_on_userid", using: :btree
  end

  create_table "vim_performance_operating_ranges", id: :bigserial, force: :cascade do |t|
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.bigint   "time_profile_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "values"
    t.integer  "days"
    t.index ["resource_id", "resource_type"], name: "index_vpor_on_resource", using: :btree
    t.index ["time_profile_id"], name: "index_vpor_on_time_profile_id", using: :btree
  end

  create_table "vim_performance_states", id: :bigserial, force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "capture_interval"
    t.string   "resource_type"
    t.bigint   "resource_id"
    t.text     "state_data"
    t.index ["resource_id", "resource_type", "timestamp"], name: "index_vim_performance_states_on_resource_and_timestamp", using: :btree
  end

  create_table "vmdb_database_metrics", id: :bigserial, force: :cascade do |t|
    t.bigint   "vmdb_database_id"
    t.integer  "running_processes"
    t.integer  "active_connections"
    t.datetime "timestamp"
    t.string   "capture_interval_name"
    t.bigint   "disk_total_bytes"
    t.bigint   "disk_free_bytes"
    t.bigint   "disk_used_bytes"
    t.bigint   "disk_total_inodes"
    t.bigint   "disk_used_inodes"
    t.bigint   "disk_free_inodes"
  end

  create_table "vmdb_databases", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "ipaddress"
    t.string   "vendor"
    t.string   "version"
    t.string   "data_directory"
    t.datetime "last_start_time"
    t.string   "data_disk"
  end

  create_table "vmdb_indexes", id: :bigserial, force: :cascade do |t|
    t.bigint "vmdb_table_id"
    t.string "name"
    t.text   "prior_raw_metrics"
  end

  create_table "vmdb_metrics", id: :bigserial, force: :cascade do |t|
    t.bigint   "resource_id"
    t.string   "resource_type"
    t.bigint   "size"
    t.bigint   "rows"
    t.bigint   "pages"
    t.float    "percent_bloat"
    t.float    "wasted_bytes"
    t.integer  "otta"
    t.bigint   "table_scans"
    t.bigint   "sequential_rows_read"
    t.bigint   "index_scans"
    t.bigint   "index_rows_fetched"
    t.bigint   "rows_inserted"
    t.bigint   "rows_updated"
    t.bigint   "rows_deleted"
    t.bigint   "rows_hot_updated"
    t.bigint   "rows_live"
    t.bigint   "rows_dead"
    t.datetime "last_vacuum_date"
    t.datetime "last_autovacuum_date"
    t.datetime "last_analyze_date"
    t.datetime "last_autoanalyze_date"
    t.datetime "timestamp"
    t.string   "capture_interval_name"
    t.index ["resource_id", "resource_type", "timestamp"], name: "index_vmdb_metrics_on_resource_and_timestamp", using: :btree
  end

  create_table "vmdb_tables", id: :bigserial, force: :cascade do |t|
    t.bigint "vmdb_database_id"
    t.string "name"
    t.string "type"
    t.bigint "parent_id"
    t.text   "prior_raw_metrics"
    t.index ["type"], name: "index_vmdb_tables_on_type", using: :btree
  end

  create_table "vms", id: :bigserial, force: :cascade do |t|
    t.string   "vendor"
    t.string   "format"
    t.string   "version"
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "config_xml"
    t.string   "autostart"
    t.bigint   "host_id"
    t.datetime "last_sync_on"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "storage_id"
    t.string   "guid"
    t.bigint   "ems_id"
    t.datetime "last_scan_on"
    t.datetime "last_scan_attempt_on"
    t.string   "uid_ems"
    t.datetime "retires_on"
    t.boolean  "retired"
    t.datetime "boot_time"
    t.string   "tools_status"
    t.string   "standby_action"
    t.string   "power_state"
    t.datetime "state_changed_on"
    t.string   "previous_state"
    t.string   "connection_state"
    t.datetime "last_perf_capture_on"
    t.boolean  "registered"
    t.boolean  "busy"
    t.boolean  "smart"
    t.integer  "memory_reserve"
    t.boolean  "memory_reserve_expand"
    t.integer  "memory_limit"
    t.integer  "memory_shares"
    t.string   "memory_shares_level"
    t.integer  "cpu_reserve"
    t.boolean  "cpu_reserve_expand"
    t.integer  "cpu_limit"
    t.integer  "cpu_shares"
    t.string   "cpu_shares_level"
    t.string   "cpu_affinity"
    t.datetime "ems_created_on"
    t.boolean  "template",                 default: false
    t.bigint   "evm_owner_id"
    t.string   "ems_ref_obj"
    t.bigint   "miq_group_id"
    t.boolean  "linked_clone"
    t.boolean  "fault_tolerance"
    t.string   "type"
    t.string   "ems_ref"
    t.bigint   "ems_cluster_id"
    t.bigint   "retirement_warn"
    t.datetime "retirement_last_warn"
    t.integer  "vnc_port"
    t.bigint   "flavor_id"
    t.bigint   "availability_zone_id"
    t.boolean  "cloud"
    t.string   "retirement_state"
    t.bigint   "cloud_network_id"
    t.bigint   "cloud_subnet_id"
    t.bigint   "cloud_tenant_id"
    t.string   "raw_power_state"
    t.boolean  "publicly_available"
    t.bigint   "orchestration_stack_id"
    t.string   "retirement_requester"
    t.bigint   "tenant_id"
    t.bigint   "resource_group_id"
    t.boolean  "deprecated"
    t.bigint   "storage_profile_id"
    t.boolean  "cpu_hot_add_enabled"
    t.boolean  "cpu_hot_remove_enabled"
    t.boolean  "memory_hot_add_enabled"
    t.integer  "memory_hot_add_limit"
    t.integer  "memory_hot_add_increment"
    t.string   "hostname"
    t.index ["availability_zone_id"], name: "index_vms_on_availability_zone_id", using: :btree
    t.index ["ems_id"], name: "index_vms_on_ems_id", using: :btree
    t.index ["evm_owner_id"], name: "index_vms_on_evm_owner_id", using: :btree
    t.index ["flavor_id"], name: "index_vms_on_flavor_id", using: :btree
    t.index ["guid"], name: "index_vms_on_guid", unique: true, using: :btree
    t.index ["host_id"], name: "index_vms_on_host_id", using: :btree
    t.index ["location"], name: "index_vms_on_location", using: :btree
    t.index ["miq_group_id"], name: "index_vms_on_miq_group_id", using: :btree
    t.index ["name"], name: "index_vms_on_name", using: :btree
    t.index ["storage_id"], name: "index_vms_on_storage_id", using: :btree
    t.index ["type"], name: "index_vms_on_type", using: :btree
    t.index ["uid_ems"], name: "index_vms_on_vmm_uuid", using: :btree
  end

  create_table "volumes", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "typ"
    t.string   "filesystem"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.bigint   "hardware_id"
    t.string   "volume_group"
    t.string   "uid"
    t.bigint   "size"
    t.bigint   "free_space"
    t.bigint   "used_space"
    t.index ["hardware_id", "volume_group"], name: "index_volumes_on_hardware_id_and_volume_group", using: :btree
  end

  create_table "windows_images", id: :bigserial, force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "path"
    t.integer "index"
    t.bigint  "pxe_server_id"
    t.bigint  "pxe_image_type_id"
  end

  create_table "zones", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.text     "settings"
    t.bigint   "log_file_depot_id"
    t.boolean  "visible"
  end

end
