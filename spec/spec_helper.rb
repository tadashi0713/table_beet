# frozen_string_literal: true

require 'coveralls'
require 'rspec/core/sandbox'
require 'table_beet'
Coveralls.wear!

FIXTURES_PATH = File.dirname(__FILE__) + '/fixtures/steps'
OUTPUT_PATH = File.dirname(__FILE__) + '/stepdoc'

RSpec.configure do |c|
  c.around(:each) do |ex|
    #
    # Reset the added steps
    #   on https://github.com/jnicklas/turnip/blob/v1.2.4/lib/turnip/dsl.rb#L21
    #
    RSpec::Core::Sandbox.sandboxed do |config|
      #
      # Sandbox config does not included Turnip::Steps yet.
      #
      config.include Turnip::Steps, turnip: true

      ex.run

      #
      # Reset the addes 'global' steps
      #
      Turnip::Steps.instance_methods.each do |method|
        Turnip::Steps.module_eval { undef_method method }
      end
    end
  end
end
