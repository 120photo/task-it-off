require 'rails_helper'

describe Task do
  before do
    @task = Task.create()
  end

  it "is named foo" do
    task = Task.new
    task.name = 'foo'
    task.name.should == 'foo'
  end
end
