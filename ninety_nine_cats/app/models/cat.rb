class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ["Black", "Grey", "Calico", "Orange", "Blue", "Tabby", "White"]
  validates :name, :color, :birth_date, :sex, :description, presence: true
  validates :sex, inclusion: {in: %w(M F)}
  validates :color, inclusion: {in: COLORS}

  has_many :rental_requests,
  class_name: 'CatRentalRequest',
  dependent: :destroy


  def age 
    time_ago_in_words(birth_date)
  end 


end
