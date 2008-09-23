== rails_config_model

    by Brian Hogan
    http://rconfig.rubyforge.org/
    http://www.napcs.com/products/rails/rails_config_model_generator

== DESCRIPTION:
Creates a configuration controller and model that can be used to quickly create configuration table for your system so you can store system-wide variables that you'd like the user to be able to set.

This gem contains a generator to create a simple configuration model, migration, and interface for your application, complete with working tests.

== FEATURES
  
* Generates the controller, model, and the associated files.  
* You can specify the model name and set the fields for the migrations via the generator.

== SYNOPSIS:

=== Setup and overview
Generate a new configuration system for your application by executing the generator from the root of your application.
 
   ruby script\generate rails_config_model Configuration
   
You can also specify the model fields much like the scaffold_resource generator

  ruby script/generate rails_config_model Configuration contact_email:string site_name:string welcome_message:text max_number_of_events:integer
   
Once installed, you modify the generated migration to include the fields you want to configure. There are a few defaults there to give you an idea.
 
The generator will create a controller mounted at /configuration so you can edit your configurations.  Modify this as needed to provide for security.
 
=== The Edit form
The application's edit form uses the *form* helper method to auto-generate the fields. This may not be optimal and you may wish to actually write your own view instead. See app/views/configuration/edit.rhtml for more details.
 
=== Usage
Configuration is simply a model for this table. It is designed to handle a single row of a table, and so additional rows cannot be created. 
If you have a table that looks like this:
    
    id
    contact_email
    site_name
    welcome_message
    max_number_of_events

You simply grab the row from the table
 
     @configuration = Configuration.load
     
and then grab the values out.
 
     email = @configuration.contact_email

Or save new values

  @configuration = Configuration.load
  @configuration.welcome_message = "This is the default message."
  @configuraiton.save
 

== REQUIREMENTS:

* Rails, a database, and a reason to use this.

== INSTALL:

Download and sudo gem install rails_config_model_generator

== LICENSE:

(The MIT License)

Copyright (c) 2007 Brian P. Hogan

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
