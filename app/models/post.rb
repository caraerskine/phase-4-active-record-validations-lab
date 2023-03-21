class Post < ApplicationRecord

    validates :title, :content, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    # validates :category, inclusion: { in: %w(Fiction Non-Fiction) } is same below
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] } 
    validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top [number]", 
        "Guess"] }

    validate :click_baity_title
    # validate :check_category,
    
    def click_baity_title
        click_baity_titles = ["Won't Believe", "Secret", "Top [number]", 
        "Guess"]
        # byebug
        # click_baity_titles.each { |cb_title| title.downcase.include?( cb_title.downcase ) ? true :
        #     self.errors.add("Title not click baity enough!") }
    end

    def check_category
        unless self.category == "Fiction" or self.category == "Non-Fiction" 
            self.errors.add("Category must be Fiction or Non-Fiction.")
        end
        # byebug
    end

end
