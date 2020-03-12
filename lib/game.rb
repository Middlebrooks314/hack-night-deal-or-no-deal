require_relative 'briefcase'
require 'pry'

class Game
    attr_accessor :player, :player_case
    
    @@cases = []
    CASE_ARRAY = ['.01', 1, 5, 10, 25, 50, 75, 100, 200, 300, 400, 500, 750, 1000, 5000, 10000, 25000, 50000, 75000, 100000, 200000, 300000, 400000, 500000, 750000, 1000000]

    def initialize
        @player = ""
        # @player_case = ""
        self.create_briefcases
        
        # 26.times do 
        #     @@case << Briefcase.new
        # end
    end

    def start_game
        greeting
        create_player
        show_briefcases
        pick_briefcase(true)
        round
        # pick_briefcase
    end

    def greeting
        p "Welcome to Deal or No Deal"
    end

    def create_briefcases
        # Briefcase.cases
        shuffled_arr = CASE_ARRAY.shuffle
        i = 1
        while (i < shuffled_arr.length)
            @@cases << Briefcase.new(i, shuffled_arr[i-1])
            i+=1
        end
    end

    def create_player
        puts 'Enter your name:  '
        @player = gets.chomp
    end

    def show_briefcases
        @@cases.each do |x|
            p x.case_id
        end
    end

    def get_input
        gets.chomp.to_i
    end

    def pick_briefcase(init=false)
        puts "Pick a case:  "
        input = get_input
        # ! only valid case numbers
        idx = @@cases.index do |x|
            x.case_id == input
        end
        if !!init
            @player_case = @@cases.delete_at(idx)
            p "Your case is number #{@player_case.case_id}"
        else
            @current_case = @@cases.delete_at(idx)
            p "This is what you missed out on!!! $#{@current_case.money}"
            p "Remaining briefcases"
            show_briefcases
        end
    end

    def round
        rounds_left = 2
        while rounds_left > 0
            p "Rounds left: #{rounds_left}"
            remove_cases(rounds_left)
            rounds_left -= 1
        end
    end

    def remove_cases(remove_num)
        remove_num.times do
            pick_briefcase
        end
    end
end

game = Game.new
game.start_game