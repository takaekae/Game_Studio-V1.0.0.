module GameModule
    def self.roll_die
        rand(1..6) #pick a random number from 1 to 6
    end
    def self.game_start(player)
        rolled_number = roll_die
        case rolled_number
        when 1..2
            player.got_blammed
            puts"#{player.name} gotBlammed!."

        when 3..4
            player.got_skipped
            puts "#{player.name} was skipped."
        else
            player.got_wooted
            puts"#{player.name} got w00ted!"
        end
    end
end

#EXERCISE: CREATE A GAME MODULE 


#BLOCKS
# Of viewings 
# of Rounds

# hits vs flops
# strong vs wimpy

# sort by rank
# sort by score