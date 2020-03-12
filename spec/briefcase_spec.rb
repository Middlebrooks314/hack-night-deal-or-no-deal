require 'briefcase'

describe 'Briefcase' do
    it 'will create a briefcase' do
        briefcase = Briefcase.new(7, 10)

        expect(briefcase.case_id).to eq(7)
        expect(briefcase.money).to eq(10)
    end
end
