class Job < ActiveRecord::Base
    belongs_to :client
    has_many :job_services
    has_many :services, through: :job_services
end
