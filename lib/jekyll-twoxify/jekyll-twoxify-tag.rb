module Jekyll
  module TwoXify
    class TwoXifyTag < Liquid::Tag

      def initialize(tagName, image_arg, tokens)
        super
        @image_arg = image_arg
      end

      def render(context)
        # if we pass in something like "post.image.feature" instead of a path,
        # the variable name gets passed in as a string, so we can look it up in the context
        image_path = "#{context[@image_arg.strip]}"
        image_path[0] = "" if image_path[0] == "/"

        site_url = context["site.url"]

        extension = File.extname(image_path)
        path_no_extension = File.extname(image_path).strip.downcase[1..-1]
        image_2x_path = "#{path_no_extension}@2x#{extension}"

        if File.exist?(image_2x_path)
          "src=\"#{site_url}/#{image_path}\" srcset=\"#{image_2x_path}\""
        else
          "src=\"#{site_url}/#{image_path}\""
        end
      end

      Liquid::Template.register_tag "twoxify", self
    end
  end
end