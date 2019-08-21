class Post < ActiveRecord::Base
    validates :title, presence: true, clickbait_title: true
    validates :content, length: {minimum: 250}, presence: true
    validates :summary, length: {maximum: 250}, presence: true
    validates :category, inclusion: {in: %w{Fiction Non-Fiction}}

end