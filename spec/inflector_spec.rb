require 'spec_helper'
require 'programming_ipsum/inflector.rb'

describe ProgrammingIpsum::Inflector do
  subject { ProgrammingIpsum::Inflector.new }

  describe 'article' do
    let(:vowels) { %w{a e i o u} }
    let(:consonants) { ('a'..'z').to_a - vowels }

    it "returns 'an' for words starting with a vowel" do
      vowels.each do |vowel|
        expect(subject.article("#{vowel}gloo")).to eq "an #{vowel}gloo"
      end
    end

    it "returns 'a' for words starting with a consonant" do
      consonants.each do |consonant|
        expect(subject.article("#{consonant}oo")).to eq "a #{consonant}oo"
      end
    end
  end

  context 'nouns' do
    describe 'plural_noun' do
      it "adds 'es' to words ending in (ss|sh|ch|x|o|z)" do
        expect(subject.plural_noun('kiss')).to eq 'kisses'
        expect(subject.plural_noun('hash')).to eq 'hashes'
        expect(subject.plural_noun('witch')).to eq 'witches'
        expect(subject.plural_noun('fox')).to eq 'foxes'
        expect(subject.plural_noun('potato')).to eq 'potatoes'
        expect(subject.plural_noun('buzz')).to eq 'buzzes'
      end

      it "adds 's' to words ending in [vowel]y" do
        expect(subject.plural_noun('gay')).to eq 'gays'
        expect(subject.plural_noun('attorney')).to eq 'attorneys'
        expect(subject.plural_noun('madeupwordiy')).to eq 'madeupwordiys'
        expect(subject.plural_noun('soliloquy')).to eq 'soliloquys'
        expect(subject.plural_noun('banana')).to eq 'bananas'
      end

      it "changes 'y' to 'ies' for words ending in [consonant]y" do
        expect(subject.plural_noun('directory')).to eq 'directories'
        expect(subject.plural_noun('butterfly')).to eq 'butterflies'
      end

      it "changes 'f' to 'vies' for words ending in (f|fe|ff)" do
        expect(subject.plural_noun('knife')).to eq 'knives'
        expect(subject.plural_noun('staff')).to eq 'staves'
        expect(subject.plural_noun('loaf')).to eq 'loaves'
      end
    end

    describe 'possessive_noun' do
      it "adds ' to words ending in s" do
        expect(subject.possessive_noun('buses')).to eq "buses'"
      end

      it "adds 's to words ending in anything but s" do
        expect(subject.possessive_noun('programmer')).to eq "programmer's"
      end
    end

    describe 'plural_possessive_noun' do
      it 'properly creates a plural posessive noun' do
        expect(subject.plural_possessive_noun('dependency')).to eq "dependencies'"
        expect(subject.plural_possessive_noun('variable')).to eq "variables'"
      end
    end
  end

  # verb rule reference http://www.oxforddictionaries.com/words/verb-tenses-adding-ed-and-ing
  context 'verbs' do
    describe 'gerund_verb' do
      it "changes 'e' to 'ing' for words ending in 'e'" do
        expect(subject.gerund_verb('bake')).to eq 'baking'
        expect(subject.gerund_verb('smile')).to eq 'smiling'
      end

      it "adds 'ing' to words ending in (ee|ye|oe)" do
        expect(subject.gerund_verb('free')).to eq 'freeing'
        expect(subject.gerund_verb('dye')).to eq 'dyeing'
        expect(subject.gerund_verb('tiptoe')).to eq 'tiptoeing'
      end

      it "adds 'ling' to words ending in vowel + 'l'" do
        expect(subject.gerund_verb('travel')).to eq 'travelling'
        expect(subject.gerund_verb('distil')).to eq 'distilling'
      end

      it "adds 'ing' to words ending in anything but 'e'" do
        expect(subject.gerund_verb('process')).to eq 'processing'
        expect(subject.gerund_verb('loop')).to eq 'looping'
      end

      it "adds 'ing' to words ending in [vowel][vowel][consonant]" do
        expect(subject.gerund_verb('treat')).to eq 'treating'
        expect(subject.gerund_verb('wheel')).to eq 'wheeling'
      end

      it "adds 'king' to words ending in 'c'" do
        expect(subject.gerund_verb('picnic')).to eq 'picnicking'
        expect(subject.gerund_verb('mimic')).to eq 'mimicking'
      end

      describe 'incomplete inflection rules for [consonant][vowel][consonant]' do
        it "adds an extra consonant and 'ing' to to single-syllable words" do
          # correct
          expect(subject.gerund_verb('sit')).to eq 'sitting'
          # incorrect
          expect(subject.gerund_verb('visit')).to eq 'visitting'
        end

        pending "does not add an extra consonant to multi-syllable words", skip: true do
          pending "Ruby doesn't support syllables."
          expect(subject.gerund_verb('visit')).to eq 'visiting'
        end
      end
    end

    describe 'past_verb' do
      it "adds 'd' to words ending in 'e'" do
        expect(subject.past_verb('bake')).to eq 'baked'
        expect(subject.past_verb('smile')).to eq 'smiled'
      end

      it "adds 'd' to words ending in (ee|ye|oe)" do
        expect(subject.past_verb('free')).to eq 'freed'
        expect(subject.past_verb('dye')).to eq 'dyed'
        expect(subject.past_verb('tiptoe')).to eq 'tiptoed'
      end

      it "adds 'led' to words ending in vowel + 'l'" do
        expect(subject.past_verb('travel')).to eq 'travelled'
        expect(subject.past_verb('distil')).to eq 'distilled'
      end

      context 'verb ending with a single vowel plus a consonant' do
        it "adds an extra consonant and 'ed' to to end-stressed words" do
          # correct
          expect(subject.past_verb('admit')).to eq 'admitted'
          expect(subject.past_verb('stop')).to eq 'stopped'
        end

        it "adds only 'ed' for end-stressed words", skip: true do
          pending "Ruby doesn't understand syllables."
          expect(subject.past_verb('inherit')).to eq 'inherited'
        end

        it "does not add an extra consonant to multi-syllable words", skip: true do
          pending "Ruby doesn't support syllables."
          expect(subject.past_verb('visit')).to eq 'visited'
        end
      end

      it "adds 'ed' to words ending in two vowels plus a consonant" do
        expect(subject.past_verb('treat')).to eq 'treated'
        expect(subject.past_verb('wheel')).to eq 'wheeled'
        expect(subject.past_verb('pour')).to eq 'poured'
      end

      it "adds 'king' to words ending in 'c'" do
        expect(subject.past_verb('picnic')).to eq 'picnicked'
        expect(subject.past_verb('mimic')).to eq 'mimicked'
        expect(subject.past_verb('traffic')).to eq 'trafficked'
      end
    end

    # reference http://smrtenglish.com/me/lesson/2531
    describe 'agreement_verb' do
      it "adds 's' if the word ends in a consonant" do
        expect(subject.agreement_verb('call')).to eq 'calls'
      end

      it "adds 's' if the word ends in a consonant + e" do
        expect(subject.agreement_verb('like')).to eq 'likes'
      end

      it "adds 's' if the word ends in 'ie'" do
        expect(subject.agreement_verb('lie')).to eq 'lies'
      end

      it "adds 'es' if the word ends in (ss|sh|ch|x|o|z)" do
        expect(subject.agreement_verb('kiss')).to eq 'kisses'
        expect(subject.agreement_verb('splash')).to eq 'splashes'
        expect(subject.agreement_verb('approach')).to eq 'approaches'
        expect(subject.agreement_verb('fix')).to eq 'fixes'
        expect(subject.agreement_verb('go')).to eq 'goes'
        expect(subject.agreement_verb('buzz')).to eq 'buzzes'
      end

      it "changes 'y' to 'ies' if it ends in consonant + y" do
        expect(subject.agreement_verb('dry')).to eq 'dries'
        expect(subject.agreement_verb('worry')).to eq 'worries'
      end
    end
  end
end
