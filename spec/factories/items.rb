FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "name #{n}"}
    thumbnail {"https://us.123rf.com/450wm/ccs0xx01/ccs0xx011609/ccs0xx01160900039/62912048-cute-chibi-kitchen-item-icon.jpg?ver=6"}
    sequence(:inventory) {|n| "inventory #{n}"}
    sequence(:description) {|n| "describtion #{n}"}
    sequence(:price) {|n| "price #{n}"}
    enabled { true }
  end

end
