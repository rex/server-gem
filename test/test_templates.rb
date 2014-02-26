require 'helper'
require 'server/packages/templates/renderer'

class TestTemplates < Test::Unit::TestCase

  context "Templates" do

    should "find the raw template path" do
      assert Server::Templates::Renderer.template_path.is_a? String
    end

  end

end