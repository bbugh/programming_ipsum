module ProgrammingIpsum
  module Grammar
    def initialize_grammar
      @inflector = Inflector.new
    end

    # Catch-all for allowing other keys than :verb and :noun
    def method_missing(key, *args, &block)
      @context.fetch(key, ['INVALID GRAMMAR']).sample
    end

    # Helper to add an indefinite article to any word
    # Usage:
    #  <%= article singular_noun %>
    def article(word)
      @inflector.article(word)
    end

    # Helper to pluralize any word (based on noun rules)
    # Usage:
    #  <%= plural unit_of_measurement %>
    def plural(noun)
      @inflector.plural_noun(noun)
    end

    # Returns a singular noun like "programmer"
    def singular_noun
      random_noun :singular
    end

    # Returns a plural noun like "programmers"
    def plural_noun
      random_noun :plural
    end

    # Returns a possessive noun like "programmer's"
    def possessive_noun
      random_noun :possessive
    end

    alias :noun :singular_noun
    alias :nouns :plural_noun
    # no alias for possessive_noun, what would it be called?

    # Returns a present verb, like "render"
    def present_verb
      random_verb :present
    end

    # Returns an agreement verb (for plural nouns) like "renders"
    def agreement_verb
      random_verb :agreement
    end

    # Returns a past tense verb like "rendered"
    def past_verb
      random_verb :past
    end

    # Returns an gerund verb like "rendering"
    def gerund_verb
      random_verb :gerund
    end

    alias :verb :present_verb
    alias :verbs :agreement_verb
    alias :verbed :past_verb
    alias :verbing :gerund_verb

    private

    def random_noun(type)
      noun = @context[:noun].sample
      noun[type] || @inflector.send("#{type}_noun", noun[:singular])
    end

    def random_verb(type)
      verb = @context[:verb].sample
      verb[type] || @inflector.send("#{type}_verb", verb[:present])
    end
  end
end
