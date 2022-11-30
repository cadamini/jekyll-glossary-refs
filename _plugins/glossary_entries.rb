module Jekyll
    class GlossaryEntryGenerator < Jekyll::Generator
      safe true
  
      def generate(site)
        @glossary_entries = Hash.new
        @site = site

        @site.data["glossary"]["en"].each do |entry|
            add_term(entry["term"], entry["definition"])
        end
  
        @site.config["glossary_entries"] = @glossary_entries
      end

      private 

      def add_term(term, definition) 
        @glossary_entries[term] = [term, definition]
      end 
    end 
end

