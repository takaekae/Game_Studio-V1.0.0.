require_relative 'game'
require_relative 'gameModule'


module GameStudio
    describe Game do
        before do
            @game= Game.new("Knuckleheads")
        end    

        context"Knuckleheads" do
            before do
                @initial_score = 100
                @player = GameStudio::Player.new("Kiyo",100, @initial_score)
                @game.add_player(@player) 

            end

            it"gives got w00ted if a high number is rolled" do
                GameModule.stub(:roll_die).and_return(5) #return the value to 5 when is called.
                @game.play(1)
                @player.score.should == @initial_score + 5

            end

            it"skip the game if a medium number is rolled " do
                GameModule.stub(:roll_die).and_return(3) #return the value to 5 when is called.
                @game.play(1)
                @player.score.should == @initial_score

            end

            it"gives got blammed if a low number is rolled" do
                GameModule.stub(:roll_die).and_return(1) #return the value to 5 when is called.
                @game.play(1)
                @player.score.should == @initial_score + 10
            end
        end
    end
end
#   THE EXERCISE OF THE CONDITION VIDEO

# if  low number got blammed
# elsif middle number skip player
# else high number got w00ted
# 