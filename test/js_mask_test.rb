require File.expand_path(File.join(File.dirname(__FILE__), '../../../../test/test_helper')) 

class JsMaskTest < Test::Unit::TestCase
  include JsMaskHelper
  include CalendarDateSelect::FormHelper

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::FormTagHelper
  
  def test_text_field_with_js_mask
    assert_dom_equal %(<input name=\"schedule[finish]\" size=\"30\" class=\"mask_date_br\" type=\"text\" id=\"schedule_finish\" /><script type=\"text/javascript\">\n//<![CDATA[\n\n        Event.addBehavior.reassignAfterAjax = true;\n        Event.addBehavior({\n            'input#schedule_finish' : JSMask.Run\n        });\n      \n//]]>\n</script>),
      text_field_with_js_mask(:schedule, :finish, :class => 'mask_date_br')
  end
  
  def test_calendar_date_select_tag_with_js_mask
    assert_match %(<input class=\"mask_date_br\" id=\"schedule_finish\" name=\"schedule[finish]\" type=\"text\" value=\"21/05/2008\" />),
      calendar_date_select_tag_with_js_mask('schedule[finish]', '21/05/2008', {:id => 'schedule_finish', :class => 'mask_date_br'})
  end
end
