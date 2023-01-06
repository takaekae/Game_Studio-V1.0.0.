require_relative 'game'


module GameStudio
    describe Game do

        before do
            @partial_score = 100
            @player = Player.new("moe",@partial_score)
        
        end
        
        it"has capitalize a player's name." do
            @player.name.should == "Moe"
        end

        it"increases score by 10 when the player got blammed." do
            @player.got_blammed
            @player.score.should == @partial_score + 10

        end

        it"increases score by 5 when the player w00ted." do
            @player.got_wooted
            @player.score.should == @partial_score + 5

        end


        context"Created with a default health." do
            before do
                @player = Player.new("Kiyo", )

            end


            it "has a health of 100" do
                @player.health.should == 100
            end
        end
    end
end
#EXERCISE OF THE TESTING UNIT VIDEO
