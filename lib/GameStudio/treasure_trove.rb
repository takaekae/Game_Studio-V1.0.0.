Treasure = Struct.new(:name, :points)

module TreasureTrove
    TREASURES = [
    
        Treasure.new(:pie, 5),
        Treasure.new(:bottle, 10),
        Treasure.new(:gem, 3),
        Treasure.new(:onepiece, 7)


    ]

    def self.random
        TREASURES.sample
    end
    
end

if __FILE__ == $0

    puts TreasureTrove::TREASURES
    treasure = TreasureTrove.random
    puts("Enjoy your #{treasure.name} (#{treasure.points}) points.")


end