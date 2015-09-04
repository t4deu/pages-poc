require "rails_helper"

RSpec.describe Page, type: :model do
  it "has a valid factory" do
    expect(build(:page)).to be_valid
  end

  describe "ActiveModel validations" do
    subject { build(:page) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  describe ".slug" do
    it "is generated if not set" do
      page = create(:page, {title: "The Title", slug: ""})
      expect(page.slug).to eq("the-title")
    end

    it "can be set" do
      page = create(:page, {title: "The Title", slug: "the-title-of-mine"})
      expect(page.slug).to eq("the-title-of-mine")
    end
  end
end
