require_relative 'player'
require_relative 'gameModule'
require_relative 'treasure_trove'
module GameStudio
    class Game
        attr_reader :title

        def initialize(title)
            @title = title
            @players = []
        end

        def load_player(from_file)
            File.readlines(from_file).each do |line|
                add_player(Player.from_csv(line))             
            end
        end 

        def save_player(to_file="player_ranking.csv")
            File.open(to_file, "w") do |file|
                @players.sort.each do|player|
                    file.puts player.to_csv
                end
            end
        end

        def add_player(player)
            @players << player
        end

    

        def play(rounds)
            puts "There are #{@players.size} players in #{@title}:"

            puts @players.sort

            treasures = TreasureTrove::TREASURES
            puts("\nThere are #{treasures.size} available in the Treasure Trove.")
            
            treasures.each do |treasure|
                puts("#{treasure.name} has #{treasure.points} points.")

            end

            @players.each do|player|
                puts player.to_s
            end


            1.upto(rounds)do |round|
                puts("\n\nRound : #{round}")
                @players.each do|player|
                    # CALLING THE MODULE
                    GameModule.game_start(player)
                    treasure  = TreasureTrove.random
                    player.found_treasure(treasure)
                    puts player.to_s
                end
            end 
        end   
        
        def total_points_consumed
            @players.reduce(0)do |sum, player|
            sum + player.points_consumed
            end
        end

        def print_status
            puts"\n#{@title}'s Stats:"

            puts"#{total_points_consumed} total points consumed."
            @players.sort.each do|player|
                puts"\n#{player.name}'s treasure points totals:  "

                player.each_treasure do |treasure|
                    puts "#{treasure.points} total #{treasure.name}"
                end
                puts"#{player.points_consumed} grand total points"

            end
            
            strong , wimpy = @players.partition.each do|player|
                player.strong?
            end


            puts "\nStrong : "
            puts strong.sort


            puts "\nWimpy : "
            puts wimpy.sort
        end
    end
end