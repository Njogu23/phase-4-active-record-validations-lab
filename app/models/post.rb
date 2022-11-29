class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title_facts

    
    def title_facts
        if [/Won't Believe/i, /Secret/i, /Guess/i, /Top \d/i].none? { |item| item.match title}
            errors.add(:title, "invalid title")
        end
    end
end