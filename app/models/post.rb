class Post < ActiveRecord::Base
   validates :title, presence: true
   validates :content, length: {minimum: 250}
   validates :summary, length: {maximum: 250}
   validates :category, inclusion: {in: ["Non-Fiction", "Fiction"]}
   validate :must_be_clickbaity
   
   def must_be_clickbaity 
      baity = ["Won't Believe", "Secret", "Top ", "Guess"]   
      if self.title != nil
         #run my title through the baity array to see if it is baity
         check_array = baity.map do |bait_phrase|
            self.title.include?(bait_phrase)
         end
         clickbaity = check_array.find {|possible_match| possible_match == true}
      else
         clickbaity = nil
      end

      if clickbaity.nil?
         errors.add(:clickbaity, "must be clickbaity")
      end
   end
end
