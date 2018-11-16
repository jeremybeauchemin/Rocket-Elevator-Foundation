class author < ApplicationRecord
    belongs_to :employee
    belongs_to :customer
end