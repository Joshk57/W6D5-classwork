class Cat < ApplicationRecord
    CAT_COLORS = ['black', 'blue', 'green', 'hot pink']
    validates :birth_date, :name, presence: true
    validates :color, presence: true, inclusion: { in: CAT_COLORS, message: "%{value} is not a valid color" }
    validates :sex, presence: true, inclusion: { in: %W(M F), message: "%{value} is not a valid sex"}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "your cat can't be a time traveller")
        end
    end

    def age
        time_ago_in_words(Time.now - @birth_date)
    end



end