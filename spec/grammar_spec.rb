require 'spec_helper'
require 'programming_ipsum/grammar.rb'

class DummyClass
  attr_accessor :phrases, :context
  include ProgrammingIpsum::Grammar
  def initialize(phrases, context)
    @phrases = phrases
    @context = context
    initialize_grammar
  end
end

describe ProgrammingIpsum::Grammar do
  let(:phrases) { [
    "hello <%= noun %>",
    "goodbye <%= verbing %> <%= noun %>"
  ]}
  let(:context) {
    {
      noun: [ {singular: 'programmer'} ],
      verb: [ {present: 'wobble'} ],
      extra_data: [ 'Ruby', 'JavaScript'  ]
    }
  }

  subject { DummyClass.new(phrases, context) }

  describe 'method_missing' do
    it 'returns a random item when asked for valid data' do
      expect(subject.extra_data).to eq('Ruby') | eq('JavaScript')
    end

    it "returns INVALID GRAMMAR when asked for invalid data" do
      expect(subject.purposeful_failure).to eq 'INVALID GRAMMAR'
    end
  end

  describe 'article' do
    it "adds 'a' or 'an' to words" do
      expect(subject.article("function")).to eq "a function"
      expect(subject.article("iterator")).to eq "an iterator"
    end
  end

  describe 'plural' do
    it "pluralizes any word" do
      expect(subject.plural("boolean")).to eq "booleans"
      expect(subject.plural("hash")).to eq "hashes"
    end
  end

  describe 'singular_noun' do
    it 'returns a singular noun' do
      expect(subject.singular_noun).to eq 'programmer'
    end

    it "has an alias 'noun'" do
      expect(subject.noun).to eq 'programmer'
    end
  end


  describe 'plural_noun' do
    it "returns a plural noun" do
      expect(subject.plural_noun).to eq 'programmers'
    end

    it "has an alias 'nouns'" do
      expect(subject.nouns).to eq 'programmers'
    end

    context 'when a noun has a custom plural form' do
      before { subject.context[:noun] = [{plural: 'asdfasdf'}] }

      it "returns the custom plural form" do
        expect(subject.plural_noun).to eq 'asdfasdf'
      end
    end
  end

  describe 'possessive noun' do
    it "returns a possessive noun" do
      expect(subject.possessive_noun).to eq "programmer's"
    end

    context 'when a noun has a custom possessive form' do
      before { subject.context[:noun] = [{possessive: 'asdfasdf'}] }

      it "returns the custom possessive form" do
        expect(subject.possessive_noun).to eq 'asdfasdf'
      end
    end
  end

  describe 'present_verb' do
    it "returns a present noun" do
      expect(subject.present_verb).to eq "wobble"
    end

    it "has an alias 'verb'" do
      expect(subject.verb).to eq 'wobble'
    end
  end

  describe 'agreement_verb' do
    it "returns an agreement verb" do
      expect(subject.agreement_verb).to eq "wobbles"
    end

    it "has an alias 'verbs'" do
      expect(subject.verbs).to eq 'wobbles'
    end

    context 'when a verb has a custom agreement form' do
      before { subject.context[:verb] = [{agreement: 'asdfasdf'}] }

      it "returns the custom agreement form" do
        expect(subject.agreement_verb).to eq 'asdfasdf'
      end
    end
  end

  describe 'past_verb' do
    it "returns an past verb" do
      expect(subject.past_verb).to eq "wobbled"
    end

    it "has an alias 'verbed'" do
      expect(subject.verbed).to eq 'wobbled'
    end

    context 'when a verb has a custom past form' do
      before { subject.context[:verb] = [{past: 'asdfasdf'}] }

      it "returns the custom past form" do
        expect(subject.past_verb).to eq 'asdfasdf'
      end
    end
  end

  describe 'gerund_verb' do
    it "returns an gerund verb" do
      expect(subject.gerund_verb).to eq "wobbling"
    end

    it "has an alias 'verbing'" do
      expect(subject.verbing).to eq 'wobbling'
    end

    context 'when a verb has a custom gerund form' do
      before { subject.context[:verb] = [{gerund: 'asdfasdf'}] }

      it "returns the custom gerund form" do
        expect(subject.gerund_verb).to eq 'asdfasdf'
      end
    end
  end
end
