class Briefcase
    attr_reader :case_id, :money

    # @@CASE_ARRAY = [1,5,10,100,200]

    def initialize(case_id, money)
        @case_id = case_id
        @money = money
    end
end