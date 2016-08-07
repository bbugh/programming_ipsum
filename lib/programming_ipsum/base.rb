require 'erb'
require_relative 'render_context'

module ProgrammingIpsum
  class Base
    def initialize(phrases, context)
      @phrases = phrases
      @render_context = RenderContext.new(context)
    end

    # Render a sequence of phrases for this ipsum
    # Does not guarantee a number of *sentences*, just phrases.
    def sequence(count = 3)
      render @phrases.sample(count).join(" ")
    end

    # For debugging purposes only - not optimized for general use
    def all_phrases
      width = @phrases.length.to_s.length

      # twice as fast as string concat!
      input = @phrases.each_with_index.map do |phrase, i|
        i.to_s.rjust(width) + ": " + phrase
      end.join("\n")

      render(input)
    end

    private
    def render(input)
      ERB.new(input).result @render_context.binding
    end
  end
end
