require_relative 'grammar'
require_relative 'inflector'

module ProgrammingIpsum
  class RenderContext < BasicObject
    include Grammar
    attr_accessor :phrases, :context

    def initialize(phrases, context)
      @phrases = phrases
      @context = context
      initialize_grammar
    end

    def binding
      ::Kernel.binding
    end
  end
end
