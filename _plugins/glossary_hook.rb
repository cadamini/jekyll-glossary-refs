module Foobar
  def self.transform(site)

    site.documents.each do |doc| 
      # page.content match word from @glossary_entries

      site.config["glossary_entries"].keys.each do |term|
        doc.content.gsub!(term, "<a href='#{term}'>#{term}</a>")
      end 
    end
  end
end

Jekyll::Hooks.register  :site, :pre_render do |site|
  Foobar.transform(site)
end  