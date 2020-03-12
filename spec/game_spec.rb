require 'game'

describe 'Game' do
    it 'will create a game' do
        game = Game.new

        expect(game.greeting).to  eq("Welcome to Deal or No Deal")
    end
end
