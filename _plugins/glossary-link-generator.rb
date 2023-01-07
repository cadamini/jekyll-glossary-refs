module GlossaryData
  def glossary
    self['glossary']
  end
end

module Jekyll
  class GlossaryLinkGenerator < Generator
    def generate(site)
      site.data.extend(GlossaryData)

      glossary_terms = {}
      site.data.glossary.each do |entry|
        glossary_terms[entry['term'].downcase] = entry['definition']
        glossary_terms[entry['term']] = entry['definition']
      end

      # pages 
      site.pages.each do |page|
        glossary_terms.each do |term, definition|

          page.content = page.content.gsub(term) do |match|
            "<a href='/glossary.html##{term}'>#{term}</a>"
          end
        end
      end

      # posts
      site.posts.docs.each do |post|
        glossary_terms.each do |term, definition|
          post.content = post.content.gsub(term) do |match|
            "<a href='/glossary.html##{term}'>#{term}</a>"
          end
        end
      end

      # Notes

      # For all content, use site.documents instead of the two code blocks for posts and pages above
      # The site.documents attribute is an array of all the documents in your site, 
      # including pages, posts, and any other collections that you have defined in your configuration. 
      # You can use this attribute if you want to apply the glossary link generator to all types of documents in your site.
      # You can also use site.collections[COLLECTION_NAME].docs if you want to apply it to a specific collection of documents.
      # Just replace COLLECTION_NAME with the name of the collection you want to use.

      # You can also use site.collections['posts'].docs for the posts instead of site.posts.
      # site.collections is a hash of all the collections defined in your site's configuration, 
      # and each collection has a 'docs' attribute that returns an array of all the documents in the collection.
      # This is useful if you want to apply the glossary link generator to a collection other than 'posts', 
      # or if you want to apply it to multiple collections.

    end
  end
end

=begin

Yes, you can use Sass to style the popover element and JavaScript to toggle the popover's visibility on hover or click. Here is an example of how you can do this:

First, add the popover HTML element to your glossary link. You can do this by modifying the gsub block in your plugin code like so:
Copy code
page.content = page.content.gsub(term) do |match|
  "<a href='#' class='glossary-link' data-toggle='popover' data-content='#{definition}'>#{term}</a>"
end
Then, add some styles to the popover element using Sass. You can do this by adding the following to your Sass file:
Copy code
.glossary-link {
  &[data-toggle='popover'] {
    position: relative;

    &:before {
      content: "";
      position: absolute;
      top: -5px;
      right: 100%;
      border-width: 5px;
      border-style: solid;
      border-color: transparent transparent #333 transparent;
    }

    &:after {
      content: "";
      position: absolute;
      top: -4px;
      right: 100%;
      border-width: 4px;
      border-style: solid;
      border-color: transparent transparent white transparent;
    }
  }

  &[data-toggle='popover']:hover {
    &:before, &:after {
      top: -10px;
    }
  }

  &[data-toggle='popover']:focus {
    &:before, &:after {
      top: -10px;
    }
  }
}

.popover {
  position: absolute;
  top: -9999px;
  left: -9999px;
  display: block;
  max-width: 200px;
  padding: 1px;
  font-family: sans-serif;
  font-size: 14px;
  font-style: normal;
  font-weight: normal;
  line-height:

=end