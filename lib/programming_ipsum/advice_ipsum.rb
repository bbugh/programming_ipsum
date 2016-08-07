require_relative 'base'

module ProgrammingIpsum
  class AdviceIpsum < Base
    def initialize
      super(PHRASES, CONTEXT)
    end

    PHRASES = [
      "Your <%= plural_noun %> didn't have <%= plural_noun %> for the <%= plural_noun %> of the <%= possessive_noun %> <%= attribute %>.",
      "<%= article(adjective).capitalize %> <%= type %> was <%= past_verb %>, but then you passed in the <%= noun %> for the <%= type %> <%= noun %> and it couldn't <%= verb %>.",
      "Your code <%= past_verb %> the array's <%= plural_noun %> with <%= article noun %> but didn't <%= verb %> the <%= noun %>.",
      "When you <%= past_verb %> the <%= noun %>, the <%= possessive_noun %> <%= noun %> was a <%= type %>, but you should have <%= past_verb %> the <%= noun %> instead.",
      "Wouldn't <%= verbing %> <%= article noun %> on the <%= noun %> be better?",
      "You can do this by <%= verbing %> an <%= adjective %> <%= type %> to your <%= noun %>, but you'll also need to <%= verb %> the <%= noun %> if you haven't yet.",
      "It sounds like maybe the <%= noun %> was <%= past_verb %> somehow between the <%= verb %> and the <%= verb %>.",
      "You haven't <%= past_verb %> <%= article noun %>, so your <%= noun %> is just <%= verbing %> forever.",
      "Since you are just <%= verbing %> <%= article noun %>, you shouldn't have to <%= verb %> your <%= noun %>.",
      "It works for me, did you <%= verb %> your <%= noun %>?",
      "I recommend <%= verbing %> and <%= verbing %> the <%= noun %>, then working backwards from there.",
      "Also make sure you are <%= verbing %> the <%= plural_noun %> with the same <%= noun %>.",
      "The <%= plural_noun %> are redundant, replace them with <%= article noun %>.",
      "It's a bad idea to <%= verb %> <%= plural_noun %>, <%= plural_noun %>, and <%= plural_noun %> at the same time.",
      "I can't comment on the <%= plural_noun %>, but <%= plural_noun %> are hard to use; that's why we have <%= plural_noun %> and <%= plural_noun %>.",
      "Try \"<%= noun %> katas\" where you repeat exercises in <%= plural_noun %> until it's is second nature.",
      "It's annoying but you need to <%= verb %> all of the <%= adjective %> <%= plural_noun %> first.",
      "You may want to use <%= plural_noun %> that support <%= verbing %>.",
      "For <%= adjective %> <%= plural_noun %>, using the <%= adjective %> <%= noun %> may be \"traditional\" but most people use <%= article adjective %> <%= noun %>, even when <%= verbing %> <%= plural_noun %>.",
      "If you can't <%= verb %> the <%= noun %>, you can just use the <%= noun %> to make it faster.",
      "Using <%= article noun %> instead of <%= article noun %> allows for <%= verbing %> additional <%= plural_noun %>.",
      "If it's not <%= verbing %> your <%= plural_noun %>, something is very wrong...",
      "You could <%= verb %> it as <%= article type %>, but you'd need to <%= verb %> <%= article noun %> also or your results will be wrong.",
      "If you haven't seen <%= article adjective %> <%= noun %> before, it's not as magical as it might appear.",
      "It <%= verbs %> each <%= noun %> and <%= verbs %> <%= article type %> <%= noun %>, and then the <%= noun %> is handed to the next <%= noun %>.",
      "In this case, your <%= noun %> is simply <%= article type %> that <%= verbs %> the <%= noun %>.",
      "<%= article(noun).capitalize %> is just <%= article type %>; when <%= past_verb %>, it <%= verbs %> the <%= noun %> <%= past_verb %> for each <%= noun %> in the <%= plural_noun %> (in this case, the <%= noun %>).",
      "Since you're using <%= language %>, <%= plural_noun %> are overkill here.",
      "This <%= verbs %> <%= adjective %> <%= plural_noun %> because <%= language %> doesn't support <%= plural_noun %>.",
      "Trying to <%= verb %> <%= article noun %> is not purely functional, and will have side effects.",
      "It's more reliable to use <%= article noun %> instead of <%= article noun %> to <%= verb %> the <%= noun %> and the <%= noun %>, but you have to make sure to <%= verb %> the <%= noun %> or you'll get this error.",
      "I'd <%= verb %> <%= article noun %>. That way, your <%= plural_noun %> will <%= past_verb %> the <%= possessive_noun %> <%= noun %>.",
      "You could switch to <%= language %>, it's a lot better at <%= verbing %> <%= plural_noun %>.",
      "To start <%= verbing %>, use <%= article noun %> and it will <%= verb %> it for you automatically.",
      "I recommend that you start with <%= verbing %> the <%= adjective %> <%= plural_noun %> first, because you already have everything you need to <%= verb %> <%= article noun %>.",
      "You could just use <%= article adjective %> <%= noun %> API, they're more reliable.",
      "<%= plural_noun.capitalize %> don't have <%= adjective %> <%= plural_noun %>, but <%= plural_noun %> shouldn't fail to <%= verb %> the <%= attribute %> property.",
      "If you switch to <%= language %>, you won't keep seeing these <%= adjective %> <%= plural_noun %>. :)",
      "It's telling you that the <%= noun %> is <%= adjective %>. Judging from your code, I think it's because you just <%= past_verb %> the <%= attribute %> as plain text, but you didn't <%= verb %> the content as <%= article type %>.",
      "You could <%= verb %> the <%= noun %> <%= attribute %> in the <%= noun %>, but that's really a bad idea. I would probably <%= verb %> <%= article noun %> instead.",
      "There's a bug in <%= language %> that <%= verbs %> the <%= noun %> when you try to do that. As a workaround, use some <%= plural_noun %> to <%= verb %> <%= article noun %>, and it will avoid those pesky <%= adjective %> <%= plural_noun %>.",
      "It's not the prettiest solution, but you can <%= verb %> until it <%= verbs %> <%= article noun %>.",
      "I'm a core contributor to <%= language %>, so I know what I'm talking about.",
      "Why are you <%= verbing %> it instead of <%= verbing %> it? Let the <%= noun %> do it.",
      "You're <%= verbing %> the <%= noun %> and <%= verbing %> whatever it <%= verbs %> to the <%= noun %>. You are not <%= verbing %> it when success is <%= verbed %>.",
      "I think there is an issue with the <%= nouns %> themselves; you are <%= verbing %> <%= article noun %> and expecting it to do something.",
      "If the <%= noun %> is just <%= verbing %>, why are you using <%= article noun %> and not <%= article noun %> or <%= article noun %>?",
      "I do not think the <%= noun %> is what you want. If it's <%= adjective %>, then just <%= verb %> it in the <%= adjective %> <%= noun %>.",
      "Without knowing what is happening in the script file, it is hard to give a full answer.",
      "<%= verbing.capitalize %> an <%= adjective %> <%= noun %> is generally a bad idea. Check if the <%= noun %> can access it and do it that way instead.",
      "If I'm not completely missing something here, you'll need to <%= verb %> the <%= adjective %> <%= noun %>.",
      "You have too many <%= nouns %>, which means there is an additional <%= noun %> within the <%= noun %> itself.",
      "Based on the ordering of your <%= nouns %>, you'll want to <%= verb %> the <%= noun %> after the other <%= noun %> was <%= verbed %> instead.",
      "It seems that the <%= noun %> wasn't <%= verbed %> at the right time. Please note that the <%= noun %> is <%= verbed %> once the code has been <%= verbed %> but not necessarily <%= verbed %> first.",
      "You could try reading the documentation about <%= nouns %> in <%= language %>.",
      "At the end of all of your <%= nouns %>, you can <%= verb %> the <%= attribute %> of the <%= noun %>.",
      "It would appear that <%= nouns %> <%= verb %> the <%= noun %> <%= adverb %>.",
      "If you're willing to <%= verb %> <%= adjective %> <%= nouns %>, you could replace them with <%= nouns %>.",
      "If you're using <%= nouns %>, the author of <%= language %> suggests that you use <%= nouns %> instead.",
      "Check the documentation on <%= nouns %>, and see if there's not <%= article noun %> or <%= noun %> you can use to have the <%= noun %> <%= verb %> it automatically.",
      "Double check the error message. It says that it can't <%= verb %> the <%= noun %>, not that it can't <%= verb %> <%= article noun %>.",
      "If your <%= noun %> is <%= article noun %> with <%= article attribute %> property then you can <%= verb %> it with <%= article noun %>, which will <%= verb %> the <%= noun %> and use that as the <%= possessive_noun %> <%= attribute %>.",
      "That <%= possessive_noun %> <%= noun %> was removed from the latest version of <%= language %>, so you can't use it anymore.",
      "By <%= verbing %> <%= article noun %>, we took a <%= noun %> from the <%= noun %> that represents it, and used those <%= nouns %> to signify that it has to <%= verb %> <%= article noun %>. Make sense?",
      "The way you did it here won't work when you want to <%= verb %> <%= nouns %>. A better way is to <%= verb %> any <%= plural type %> in the <%= noun %> that are equal to that <%= type %>."
    ]

    CONTEXT = {
      noun: [
        # For words that don't follow general english rules, customize them:
        # { singular: "parameter", plural: 'parameters', possessive: "parameter's" },
        { singular: "reference" },
        { singular: "argument" },
        { singular: "parameter" },
        { singular: "loop" },
        { singular: "function" },
        { singular: "variable" },
        { singular: 'method' },
        { singular: 'array' },
        { singular: 'list' },
        { singular: 'statement' },
        { singular: 'object' },
        { singular: 'object literal' },
        { singular: 'array' },
        { singular: 'accessor' },
        { singular: 'return type' },
        { singular: 'instance' },
        { singular: 'element' },
        { singular: 'index', plural: 'indices' },
        { singular: 'dependency' },
        { singular: 'closure' },
        { singular: 'process' },
      ],
      verb: [
        # For words that don't follow general english rules, customize them:
        # { present: 'loop', past: 'looped', gerund: 'looping' },
        { present: 'define' },
        { present: 'pass' },
        { present: 'return' },
        { present: 'process' },
        { present: 'loop' },
        { present: 'initialize' },
        { present: 'iterate' }
      ],
      adjective: [
        'empty',
        'illegal',
        'expected',
        'unexpected',
        'nested',
        'explicit',
        'implicit',
        'out of scope',
        'immutable'
      ],
      adverb: [
        'asynchronously'
      ],
      attribute: [
        'length',
        'name'
      ],
      type: [
        'boolean',
        'string',
        'array',
        'integer',
        'hash'
      ],
      language: [
        'Rails',
        'Ruby',
        'Python',
        'C++',
        'Java',
        'JavaScript'
      ]
    }
  end
end
