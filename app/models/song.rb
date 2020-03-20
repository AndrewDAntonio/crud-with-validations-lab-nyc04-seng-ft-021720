class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: true, if: :released?
    validates :artist_name, presence: true
    validate :date_not_possible
    

    def date_not_possible
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end
end
