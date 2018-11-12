require "pry"

def game_hash
 game_hash = {
            :home => {
                    :team_name => "Brooklyn Nets",
                    :colors =>["Black", "White"],
                    :players =>{
                            "Alan Anderson" => {
                                          :number => 0,
                                          :shoe => 16,
                                          :points => 22,
                                          :rebounds => 12,
                                          :assists => 12,
                                          :steals => 3,
                                          :blocks => 1,
                                          :slam_dunks => 1
                             }, 
                               "Reggie Evans" => {
                                         :number => 30,
                                         :shoe => 14,
                                         :points => 12,
                                         :rebounds => 12,
                                         :assists => 12,
                                         :steals => 12,
                                         :blocks => 12,
                                         :slam_dunks => 7
                      },
                        "Brook Lopes" =>{
                                        :number => 11,
                                        :shoe => 17,
                                        :points => 17,
                                        :rebounds => 19,
                                        :assists => 10,
                                        :steals => 3,
                                        :blocks => 1,
                                        :slam_dunks => 15
                        }
            }
            },
            :away =>{
                    :team_name => "Charlotte Hornets",
                    :colors => ["Turquoise", "Purple"],
                    :players =>{
                      "JeffAdrien" => {
                                        :number => 4,
                                        :shoe => 18,
                                        :points => 10,
                                        :rebounds => 1,
                                        :assists => 1,
                                        :steals => 2,
                                        :blocks => 7,
                                        :slam_dunks => 2
                         },
                       "Bismark Biyombo" => {:number => 0,
                                       :shoe => 16,
                                        :points => 12,
                                        :rebounds => 4,
                                        :assists => 7,
                                        :steals => 7,
                                        :blocks => 15,
                                        :slam_dunks => 10
                        
                         },
                      "DeSagna Diop" => {:number => 2,
                                        :shoe => 14,
                                        :points => 24,
                                        :rebounds => 12,
                                        :assists => 12,
                                        :steals => 4,
                                        :blocks => 5,
                                        :slam_dunks => 5
                        
                      }
                    }
            }
          }

return game_hash
end

  
def num_points_scored (name)
  
    game_hash.each do |team_origin, team_attribute|
      binding.pry
      team_attribute.each do |players|
        binding.pry
        if  players[player_name] == name
          binding.pry
          result << game_hash[team_origin][:players][name][points]
        end
      end
      result
end
  
  
    
      

def shoe_size(name)
   
end


def team_colors(team_name)
 result = []
    game_hash.each do |team_origin, team_attribute|
        if team_attribute[:team_name] == team_name
            result << game_hash[team_origin][:colors]
        end
    end
    result.flatten
end

def team_names
    array = []
    game_hash.each do |team_origin, team|
        array << team[:team_name]
    end
    array
end

def player_numbers(team_name)
   
end

def player_stats(name)
  result = []
  game_hash.each do |team_origin, players|
    team_origin.each do |players, name|
      players.each do |name|
        if players.has_key?(name)
          return players[name]
        end
      end
    end
  end
end

def big_shoe_rebounds
  
end