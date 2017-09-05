class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    phrases.each do |phrase|
      if self.title.to_s.include?(phrase)
        return true
      end
    end
    errors.add(:title, "Error!")
  end
end
