class CatRentalRequest < ApplicationRecord
  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: ["PENDING", "APPROVED", "DENIED"]}
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where("(start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?) AND id != ?", start_date, end_date, start_date, end_date, id ? id : "NULL")
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end 

  def does_not_overlap_approved_request
    errors.add("requests can't overlap!") if overlapping_approved_requests.exists?
  end 
end


