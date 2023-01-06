module GameSystem
    VERSION = 2.0

    def self.info
        puts "Game system version #{VERSION}"
    end

    class Player
    end
end

puts GameSystem::VERSION
puts GameSystem.info
GameSystem::Player.new