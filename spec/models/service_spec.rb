require 'spec_helper'

describe Service do
    let(:service) {Service.new(name: "web dev", price: 500)}

    before do
        @user = User.create(username: "test", password: "test", email: "fake@email.net")
    end
    

    it 'belongs to a user' do
        service.user = @user

        service.save
        expect(service.user).to eq(@user)
        expect(@user.services).to include(service)

        user.destroy # pervent unique user errors
    end
    
    it 'has many jobs through job_services' do
        job = Job.create(date: Time.now, amount_paid: 250)
        job.services << service
        
        expect(service.job_services.count).to eq(1)
        expect(service.jobs.count).to eq(1)
    end
    
end
