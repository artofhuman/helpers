module Lotus
  module Helpers
    module HtmlHelper
      # HTML Fragment
      #
      # @since 0.2.6
      # @api private
      #
      # @see Lotus::Helpers::HtmlHelper::HtmlFragment
      class HtmlFragment
        # Initialize a HTML Fragment
        #
        # @param blk [Proc,Lotus::Helpers::HtmlHelper::HtmlBuilder,NilClass] the content block
        #
        # @return [Lotus::Helpers::HtmlHelper::HtmlFragment]
        def initialize(&blk)
          @builder = HtmlBuilder.new
          @blk = blk
        end

        # Resolve and return the output
        #
        # @return [String] the output
        #
        # @since 0.2.6
        # @api private
        #
        # @see Lotus::Helpers::HtmlHelper::EmptyHtmlNode#to_s
        def to_s
          content.to_s
        end

        def content
          result = @builder.resolve(&@blk)

          if @builder.nested?
            @builder.to_s
          else
            "#{ Utils::Escape.html(result) }"
          end
        end
      end
    end
  end
end