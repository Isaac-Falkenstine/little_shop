FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "name #{n}"}
    sequence(:thumbnail) {|n| "thumbnail #{n}"}
    sequence(:price) {|n| "price #{n}"}
    sequence(:inventory) {|n| "inventory #{n}"}
    sequence(:describtion) {|n| "describtion #{n}"}
    sequence(:enabled) {|n| "enabled #{n}"}
  end

end
