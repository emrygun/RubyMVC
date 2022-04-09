module Rulers
  @@project_path = Dir.pwd

  @@project_path_controller = File.expand_path(File.join(@@project_path, "app" ,"controllers"))
  @@project_path_app = File.expand_path(File.join(@@project_path, "app"))
  @@project_path_config = File.expand_path(File.join(@@project_path, "config"))
  @@project_path_view = File.expand_path(File.join(@@project_path_app, "view"))

  @@common_regex_controller = "*_controller.rb"

  def self.to_underscore(string)
    string
      .gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      .gsub(/([a-z\d])([A-Z])/,'\1_\2')
      .tr("-", "_")
      .downcase
  end

  def self.resolve_const(const)
    return Object.const_get(const) if Object.const_defined?(const)
    Object.const_get(to_underscore(const))
  end

  def self.load_project_paths
    $: << @@project_path_controller
    $: << @@project_path_app
    $: << @@project_path_config
  end

  def self.load_required_controllers
    Dir.glob(@@project_path_controller + "/" + @@common_regex_controller, &method(:require))
  end

end
