require 'rails_helper'

describe List do
  before do
    @private_list = List.create
    @public_list = List.create(public: true)
  end

  describe "list are private by default" do
    it "checks that list is private" do
      @list = List.create
      expect(@list.public).to be_falsy
    end
  end

  describe "public lists" do
    it "should return existing public lists" do
      @list = List.create(public: true)
      expect(@list.public).to be_truthy
    end
  end
end
