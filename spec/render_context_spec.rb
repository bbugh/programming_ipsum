require 'erb'
require 'spec_helper'
require 'programming_ipsum/render_context.rb'

describe ProgrammingIpsum::RenderContext do
  let(:context) { {noun: [{singular: 'programmer'}]} }
  subject { ProgrammingIpsum::RenderContext.new(context) }

  it "can be used to render ERB" do
    expect(ERB.new("Hello <%= noun %>").result subject.binding).to eq "Hello programmer"
  end

  it "doesn't have Object methods" do
    expect(subject.object_id).to eq 'INVALID GRAMMAR'
    expect(subject.respond_to?).to eq 'INVALID GRAMMAR'
  end
end
