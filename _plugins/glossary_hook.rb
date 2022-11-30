module Foobar
  def self.transform(site)
    
    puts site.config["glossary_entries"]

    site.documents.each do |doc| 
      puts doc
      # page.content match word from @glossary_entries
      doc.content.gsub!('foo', 'bar')
    end 
  end
end

Jekyll::Hooks.register  :site, :pre_render do |site|
  Foobar.transform(site)
end  