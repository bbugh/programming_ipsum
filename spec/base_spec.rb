require 'spec_helper'
require 'programming_ipsum/base.rb'

describe ProgrammingIpsum::Base do
  describe 'sequence' do
    let(:phrases) { ["one", "two", "three"] }
    let(:base) { ProgrammingIpsum::Base.new(phrases, nil) }
    subject { base.sequence(3) }

    it "returns a sequence" do
      expect(subject.length).to eq phrases.join(' ').length
    end

    it "contains the phrases" do
      expect(subject).to include('one').and include('two').and include('three')
    end
  end

  describe 'all_phrases' do
    let(:phrases) { ["one", "two", "three"] }
    let(:base) { ProgrammingIpsum::Base.new(phrases, nil) }
    subject { base.all_phrases }

    it "returns all phrases" do
      expect(subject.split("\n").length).to eq phrases.length
      expect(subject).to include('one').and include('two').and include('three')
    end
  end

  describe 'rendering' do
    let(:phrases) { ["Hello <%= noun %>"] }
    let(:context) { {noun: [{singular: 'programmer'}]} }
    let(:base) { ProgrammingIpsum::Base.new(phrases, context) }
    subject { base.sequence }

    it "renders ERB" do
      expect(subject).to eq "Hello programmer"
    end
  end
end
