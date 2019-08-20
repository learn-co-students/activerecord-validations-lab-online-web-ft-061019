class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}, presence: true
    validates :summary, length: {maximum: 250}, presence: true
    validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
    validate :is_clickbait?

    CLICKBAIT_Y = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    
    def is_clickbait?
        if CLICKBAIT_Y.none? { |clickbait| clickbait.match title}
            errors.add(:title, "This must be clickbait-y")
        end
    end
end
