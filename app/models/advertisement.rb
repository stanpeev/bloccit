class Advertisement < ActiveRecord::Base
  belongs_to :post
  belongs_to :comment
end
