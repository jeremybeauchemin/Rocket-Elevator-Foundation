class Intervention < ApplicationRecord
    belongs_to :employee, foreign_key: "author_id"
    belongs_to :customer
    belongs_to :building
    belongs_to :battery
    belongs_to :elevator
    belongs_to :employee

    def intervention_results_enum
        ['Success','Failed','Incomplete']
    end
    
     def intervention_status_enum
        ['Pending','InProgress','Interrupted','Resumed','Complete']
     end


end
