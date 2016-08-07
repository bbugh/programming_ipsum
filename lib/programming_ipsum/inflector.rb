# An imperfect but close enough English inflector.
class ProgrammingIpsum::Inflector
  def article(word)
    if %w{a e i o u}.include?(word[0].downcase)
      "an #{word}"
    else
      "a #{word}"
    end
  end

  module Noun
    def plural_noun(word)
      if word =~ /(ss|sh|ch|x|o|z)$/
        word + "es"
      elsif word =~ /[aeiou]y$/
        word + "s"
      elsif word[-1] == 'y'
        word[0..-2] + 'ies'
      elsif word =~ /(.*?)(f|fe|ff)$/
        $1 + 'ves'
      else
        word + 's'
      end
    end

    def possessive_noun(word)
      if word[-1] == 's'
        word + "'"
      else
        word + "'s"
      end
    end

    def plural_possessive_noun(word)
      possessive_noun(plural_noun(word))
    end
  end

  # reference http://www.oxforddictionaries.com/words/verb-tenses-adding-ed-and-ing
  module Verb
    # no way to check syllables in ruby, so this has some issues.
    def gerund_verb(word)
      if word =~ /[^oey]e$/
        word[0..-2] + 'ing'
      elsif word[-1] == 'c'
        word + 'king'
      elsif word =~ /[^aeiou][aeiou][^aeiouxw]$/
        word + word[-1] + 'ing'
      else
        word + 'ing'
      end
    end

    def past_verb(word)
      if word[-1] == 'e'
        word + 'd'
      elsif word[-1] == 'c'
        word + 'ked'
      elsif word =~ /[aeiou][aeiou][^aeiou]$/
        word + 'ed'
      elsif word =~ /[aeiou]([^aeiou])$/
        word + $1 + "ed"
      elsif word =~ /[aeiou]l$/
        word + 'led'
      else
        word + 'ed'
      end
    end

    # reference http://smrtenglish.com/me/lesson/2531
    def agreement_verb(word)
      if word =~ /(ss|sh|ch|x|o|z)$/
        word + 'es'
      elsif word =~ /[^aeiou]y$/
        word[0..-2] + 'ies'
      else
        word + 's'
      end
    end
  end

  include Noun
  include Verb
end
