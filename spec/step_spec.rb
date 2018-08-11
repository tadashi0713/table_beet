# frozen_string_literal: true

require "spec_helper"

describe TableBeet::Step do
  let(:step) do
    TableBeet::Loader.new(path: FIXTURES_PATH).load
    TableBeet::World.scopes[:turnip].first
  end

  describe "#id" do
    it "should return method id" do
      expect(step.id).to be_instance_of(Integer)
    end
  end

  describe "#source" do
    it "should return step source" do
      expect(step.source).to include("expect(name).to eq('Kuririn')")
    end
  end

  describe "#location" do
    it "should return location of source" do
      expect(step.location).to include("global_steps.rb:3")
      expect(step.location).to include(FIXTURES_PATH)
    end
  end
end
