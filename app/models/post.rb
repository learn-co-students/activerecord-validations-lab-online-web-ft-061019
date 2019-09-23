class Post < ActiveRecord::Base

    

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :clickbait?

    CLICKBAIT_PATTERNS = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i]

    private


    def clickbait?       
        
        if CLICKBAIT_PATTERNS.none? {|sentence| sentence.match(title)}
            errors.add(:title, "This is non-clickbait!")
        end

    end

end




