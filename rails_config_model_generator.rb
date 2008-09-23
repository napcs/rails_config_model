# This generator borrows heavily from the scaffold_resource generator in Rails 1.2.3
class RailsConfigModelGenerator < Rails::Generator::NamedBase
  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_singular_name
  alias_method  :controller_table_name, :controller_plural_name
  
  def initialize(runtime_args, runtime_options = {})
    super
    
    @controller_name =  @name

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_singular_name, @controller_plural_name = inflect_names(base_name)

    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end
  
  


  def manifest
    recorded_session = record do |m|

       	      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
       	      m.class_collisions(class_path, "#{class_name}")


      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      
      m.template('configuration.rb', File.join('app/models', class_path, "#{file_name}.rb"))

      m.template(
        'configuration_controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template("edit.rhtml",         File.join("app/views", controller_class_path, controller_file_name,  "edit.html.erb"))
      m.template('functional_test.rb', File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb"))
      m.template('unit_test.rb',       File.join('test/unit',       class_path, "#{file_name}_test.rb"))
      m.template('fixtures.yml',       File.join('test/fixtures', "#{table_name}.yml"))

      unless options[:skip_migration]
        m.migration_template(
          'migration.rb', 'db/migrate', 
          :assigns => {
            :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}",
            :attributes     => attributes
          }, 
          :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
        )
      end



    end
    
    action = nil
    action = $0.split("/")[2]
    

    case action
      when "generate" 
        puts
        puts ("-" * 70)
        puts "Your app's configuration is all ready to go! There's just a couple things you might want to do:"
        puts 
        puts "  1. Modify db/migrate/create_#{file_path.gsub(/\//, '_').pluralize} and add any additional columns."
        puts "  2. Open up #{File.join('app/models', class_path, "#{file_name}.rb")} and add any custom validations." 
        puts "  3. Migrate your database (rake db:migrate) and then run your unit tests to make sure this generator didn't break anything!"
        puts "  4. Modify #{File.join("app/views", controller_class_path, controller_file_name,  "edit.rhtml")} and customize it for your application."
        puts
        puts ("-" * 70)
        puts
      when "destroy" 
        puts
        puts ("-" * 70)
          puts
        puts "Thanks for using the rails_config_model generator. If you added any additional files that depend on this, be sure to remove them!"
        puts
        puts ("-" * 70)
        puts
      else
        puts
    end
    recorded_session
  end

  protected
    # Override with your own usage banner.
    def banner
      "Run this to create the files you need for a configuration system.  Usage:  rails_config_model ModelName [field:type, field:type]"
    end
end
