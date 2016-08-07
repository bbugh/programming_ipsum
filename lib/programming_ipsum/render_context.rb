require_relative 'grammar'
require_relative 'inflector'

module ProgrammingIpsum
  class RenderContext < BasicObject
    include Grammar
    attr_accessor :context

    def initialize(context)
      @context = context
      initialize_grammar
    end

    def binding
      ::Kernel.binding
    end
  end
end
