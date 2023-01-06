require_relative 'game'
module GameStudio
    class Player

        attr_accessor :name, :health, :score

        def initialize(name, health = 100, score = 100)
            @name = name.capitalize
            @health = health
            @score = score
            @treasure_points = Hash.new(0)
        end
        def self.from_csv(line)
            name, health, score = line.split(',')
            Player.new(name.to_s, Integer(health), Integer(score))
        end

        def to_csv
            "#{@name}, #{@health}, #{@score}"
        end

        def each_treasure
            @treasure_points.each do|name, points|
                treasure = Treasure.new(name, points)
                yield treasure
                
            end
        end

        def points_consumed
            @treasure_points.values.reduce(0, :+)

        end

        def found_treasure(treasure)
            @treasure_points[treasure.name] += treasure.points
            puts("Additional points for #{@name} by founding #{treasure.name} with a treasure points of #{treasure.points}")
            puts("#{@name}'s treasure : #{@treasure_points}")
            @score +=treasure.points
        end

        def strong?
            @score >= 110
        end

        def status
            strong? ? "Strong" : "Wimpy"
        end

        def got_blammed 
            @health += 10
            @score += 10

        end

        def got_skipped
            @health += 10
            @score += 0
        end

        def got_wooted
            @health += 5
            @score += 5
        end

        def <=>(other_player)
            other_player.score <=> @score
        end

        def to_s

            print ("I'm #{@name} with health of #{@health} and a score of #{@score} (#{status})\t\t\t\n\n")
        end
    


    end



    if __FILE__ == $0
        player = Player.new("Moe", 100, 103)
        puts player.score
        puts player
    end
end