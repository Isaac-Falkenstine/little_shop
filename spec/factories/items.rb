FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "name #{n}"}
    thumbnail {"https://us.123rf.com/450wm/ccs0xx01/ccs0xx011609/ccs0xx01160900039/62912048-cute-chibi-kitchen-item-icon.jpg?ver=6"}
    sequence(:inventory) {|n| "#{n}"}
    sequence(:description) {|n| "description #{n}"}
    sequence(:enabled) {|n| "enabled #{n}"}
    sequence(:price) {|n| "#{n}" }
    sequence(:created_at) {|n|}
    sequence(:updated_at) {|n|}
  end

end
