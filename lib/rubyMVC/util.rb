module RubyMVC
  PROJECT_PATH = Dir.pwd

  PROJECT_PATH_APP        = File.expand_path(File.join(PROJECT_PATH, "app"))
  PROJECT_PATH_CONTROLLER = File.expand_path(File.join(PROJECT_PATH_APP, "controllers"))
  PROJECT_PATH_CONFIG     = File.expand_path(File.join(PROJECT_PATH_APP, "config"))
  PROJECT_PATH_VIEW       = File.expand_path(File.join(PROJECT_PATH_APP, "view"))

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
    $: << PROJECT_PATH_CONTROLLER
    $: << PROJECT_PATH_APP
    $: << PROJECT_PATH_CONFIG
  end

  def self.load_required_controllers
    Dir.glob(PROJECT_PATH_CONTROLLER + "/" + @@common_regex_controller, &method(:require))
  end

end
