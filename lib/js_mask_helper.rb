#  JS Mask JavaScript framework, version 0.1
#  (c) 2007 Ozéias Sant'ana <ozeias at iconcreative dot net> <oz.santana at gmail dot com>
#
#  JS Mask is freely distributable under the terms of an MIT-style license.
#  For details, see the JS Mask web site: http://blog.iconcreative.net/
#
#  Based on: Xaprb.InputMask by Baron Schwartz <baron at xaprb dot com>
#  Required: Prototype JavaScript framework, version 1.6.0.2
#            LowPro 0.5
#
#--------------------------------------------------------------------------
module JsMaskHelper
  # Add functionality AJAX mask into text input field
  # 
  # Required +options+ are:
  # <tt>:class</tt>::                Define mask style:
  #                                  <tt>mask_date_iso</tt>::  2008-05-21
  #                                  <tt>mask_date_br</tt>::   21/05/2008
  #                                  <tt>mask_time</tt>::      10:46:55
  #                                  <tt>mask_phone</tt>::     (00)0000-0000
  #                                  <tt>mask_ssn</tt>::       000-00-0000
  #                                  <tt>mask_visa</tt>::      0000-0000-0000-0000
  #                                  
  # Returns a text_field tag with the +jsmask+. Example:
  #   text_field_with_js_mask :schedule, :finish, :class => 'mask_date_br'
  #   # => <input type="text" id="schedule_finish" name="schedule[finish]" class="mask_date_br" />
  #   # => <script type="text/javascript">
  #        //<![CDATA[
  #           Event.addBehavior.reassignAfterAjax = true;
  #           Event.addBehavior({
  #             'input#schedule_finish' : JSMask.Run
  #           });
  #        //]]>
  #        </script>
  #
  def text_field_with_js_mask(object, method, tag_options = {})
    text_field(object, method, tag_options) + 
      js_mask_javascript("#{object}_#{method}")
  end
  
  # Required plugin 
  #   calendar_date_select => http://code.google.com/p/calendardateselect/
  # 
  # Returns a text_field tag with the +jsmask+. Example:
  #   calendar_date_select_tag_with_js_mask "schedule[finish]", @date_finish, {:id => 'schedule_finish', :class => 'mask_date_br'}
  #   # => <input class="mask_date_us" id="schedule_finish" name="schedule[finish]" type="text" />
  #   # => <img alt="Calendar" onclick="new CalendarDateSelect( $(this).previous(), {year_range:10} );" src="/images/calendar_date_select/calendar.gif?1207233635" style="border:0px; cursor:pointer;" />
  #   # => <script type="text/javascript">
  #        //<![CDATA[
  #           Event.addBehavior.reassignAfterAjax = true;
  #           Event.addBehavior({
  #             'input#schedule_finish' : JSMask.Run
  #           });
  #        //]]>
  #        </script>
  #
  def calendar_date_select_tag_with_js_mask(name, value = nil, options = {})
    calendar_date_select_tag(name, value, options) + 
      js_mask_javascript(options[:id])
  end

  private
  def js_mask_javascript(id)
    javascript_tag("
        Event.addBehavior.reassignAfterAjax = true;
        Event.addBehavior({
            'input##{id}' : JSMask.Run
        });
      ");
  end
end