require "pry"
def game_hash
  hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {

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


        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },


      "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },


      "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {

      "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2

      },

      "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10

      },

      "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5

      },

      "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0

      },

      "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location,team_info|
team_info[:players].each do |name,stats|
      if player_name == name
        return stats[:points]
      end
    end
  end
end

def shoe_size (player_name)
  game_hash.each do |location,team_info|
    team_info[:players].each do |name,stats|
      if player_name == name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
if team_name == "Brooklyn Nets"
  game_hash[:home][:colors]
elsif team_name == "Charlotte Hornets"
  game_hash[:away][:colors]
end
end

def team_names()
  array = []
array << game_hash[:home][:team_name]
array << game_hash[:away][:team_name]
return array
end

def player_numbers(team)
  array = []
    if game_hash[:home][:team_name] == team
      game_hash[:home][:players].each do |name, stats|
        stats.each do |stat, value|
          if stat == :number
            array << value
          end
        end
      end
    else
      game_hash[:away][:players].each do |name, stats|
        stats.each do |stat, value|
          if stat == :number
            array << value
          end
        end
      end
    end
    array
  end



def player_stats(name_of_player)
  game_hash.each do |location,team_info|
    team_info[:players].each do |name,stats|
      if name == name_of_player
        return stats
end
end
end
end

  def big_shoe_rebounds()
    names = []
    shoe_sizes = []
        game_hash.each do |location,team_info|
          team_info[:players].each do |name,stats|
            names<<name
              shoe_sizes<<stats[:shoe]
          end
    end

    biggest_shoe = -1
    shoe_sizes.each do |size|
      if size > biggest_shoe
        biggest_shoe = size
      end
    end

    player_with_biggest_shoe = names[shoe_sizes.index(biggest_shoe)]

    game_hash.each do |location,team_info|
      team_info[:players].each do |name,stats|
       if player_with_biggest_shoe == name
         return stats[:rebounds]

        end
      end
    end
  end







# big_shoes = 0
# shoe_sizes= []
#   game_hash.each do |location,team_info|
#     team_info[:players].each do |name,stats|
# stats.each do |specific_stat,value|
#
#
#     shoe_sizes << game_hash[:home][:players][:shoe]
#       end
#     end
#   end
# end
# shoe_size
# end


# players.max_by{|shoe| shoe.fetch(:shoe)}


# =======================================================================================

#   game_hash.each do |location,team_info|
#       team_info[:players].each do |name,stats|
#          stats.max_by {|s| }
# binding.pry
#           stats. each do |stat_name,value|
#
# if stat_name == :shoe
# return stat_name.max_by{|name| name[:shoe]}
#                 end
#             end
#         end
#       end
#     end
