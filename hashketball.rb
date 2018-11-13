require "pry"

def game_hash

  basketball_hash = {
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

def num_points_scored(players_name)
  players_points = 0
  game_hash.each do |location, data|
    # binding.pry
    data.each do |data, value|
      # binding.pry
      if data == :players
        value.each do |name, number|
          # binding.pry
          if name == players_name
            number.each do |key, num|
              # binding.pry
              if key == :points
                players_points = num
              end
            end
          end
        end
      end
    end
  end
  return players_points
end

def shoe_size(players_name)
  players_shoe_size = 0
  game_hash.each do |location, data|
    # binding.pry
    data.each do |data, value|
      # binding.pry
      if data == :players
        value.each do |name, number|
          # binding.pry
          if name == players_name
            number.each do |key, num|
              # binding.pry
              if key == :shoe
                players_shoe_size = num
              end
            end
          end
        end
      end
    end
  end
  return players_shoe_size
end

def team_colors(team_name)
  team_colors_array = []
  game_hash.each do |location, data|
    # binding.pry
    data.each do |data, value|
      # binding.pry
      if value == team_name
        team_colors_array = game_hash[location][:colors]
        # binding.pry
      end
    end
  end
  return team_colors_array
end

def team_names
  team_names_array = []
  game_hash.each do |location, data|
    # binding.pry
    data.each do |data, value|
      # binding.pry
      if data == :team_name
        team_names_array << value
        # binding.pry
      end
    end
  end
  return team_names_array
end

def player_numbers(team_name)
  team_player_numbers = []
  game_hash.each do |location, data|
    # binding.pry
    data.each do |key_value, value|
      # binding.pry
      if key_value == :players
        value.each do |name, number|
          # binding.pry
          number.each do |key, num|
            # binding.pry
            if key == :number && game_hash[location][:team_name] == team_name
              team_player_numbers << num
              # binding.pry
            end
          end
        end
      end
    end
  end
  return team_player_numbers
end

def player_stats(player_name)
  player_stats_hash = {}
  game_hash.each do |location, data|
    # binding.pry
    data.each do |key_value, value|
      # binding.pry
      if key_value == :players
        value.each do |name, numbers|
          # binding.pry
          if name == player_name
            player_stats_hash = numbers
          #   binding.pry
          end
        end
      end
    end
  end
  return player_stats_hash
end

def num_rebounds(players_name)
  players_rebounds = 0
  game_hash.each do |location, data|
    # binding.pry
    data.each do |data, value|
      # binding.pry
      if data == :players
        value.each do |name, number|
          # binding.pry
          if name == players_name
            number.each do |key, num|
              # binding.pry
              if key == :rebounds
                players_rebounds = num
              end
            end
          end
        end
      end
    end
  end
  return players_rebounds
end

num_rebounds("Ben Gordon")

def big_shoe_rebounds
  big_shoe_player = ""
  players_shoe_size = 0
  game_hash.each do |location, data|
    # binding.pry
    data.each do |key_value, value|
      # binding.pry
      if key_value == :players
        value.each do |name, numbers|
          # binding.pry
          numbers.each do |key, num|
            # binding.pry
            if key == :shoe
              if num > players_shoe_size
                players_shoe_size = num
                big_shoe_player = name
                # binding.pry
              end
            end
          end
        end
      end
    end
  end
  return num_rebounds(big_shoe_player)
end
