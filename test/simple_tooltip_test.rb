require 'test_helper'


class SimpleTooltipTest < Test::Unit::TestCase
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include NAPCS::TooltipHelpers
  
  def test_mixed_in
    @view = ActionView::Base.new 
    assert @view.respond_to?("tooltip_script_tag")
    assert @view.respond_to?("tooltip_tag")
    assert @view.respond_to?("add_tooltips_to_titles")
    assert @view.respond_to?("tooltip_for_element")
    assert @view.respond_to?("tooltip_for_title")
  end
  
  def test_generates_js
    ENV['RAILS_ASSET_ID'] = ''  # prevent the timestamping so this test always works
    assert_equal tooltip_script_tag, '<script src="/javascripts/tooltip.js" type="text/javascript"></script>'
  end
  
  
end
