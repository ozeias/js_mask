module ActionView::Helpers::AssetTagHelper
  alias_method :rails_javascript_include_tag, :javascript_include_tag
  
  # Adds a new option to Rails' built-in <tt>javascript_include_tag</tt>
  # helper - <tt>:jsmask</tt>. Works in the same way as <tt>:defaults</tt> - specifying 
  # <tt>:jsmask</tt> will make sure the necessary javascript libraries. Will happily
  # work along side <tt>:defaults</tt>.
  #
  # <%= javascript_include_tag :defaults, :jsmask %>
  def javascript_include_tag(*sources)
   if sources.delete :jsmask
     sources = sources.concat(
       ['lowpro', 'jsmask']
     ).uniq
   end
   rails_javascript_include_tag(*sources)
  end
end