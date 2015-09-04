FactoryGirl.define do
  sequence(:title) { |n| "Big ball of fire #{n}" }
  factory :page do
    title
    slug { title }
    description "This big thing that burns our skins and called Sun"
    body "The *Sun*, that now bellongs to the **Oracle**, is the most important and only star in this solar system"
    author "The Universe"
  end
end
