require "pry"
def game_hash
  hsh = {
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

def num_points_scored(player)
  result = ""
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    tm_data.each do |tm_attr,tm_val|
      if tm_attr == :players
        if tm_val[player] != nil
          result = tm_val[player][:points]
        end
      end
    end
  end
  result
end

def shoe_size(player)
  result = ""
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    tm_data.each do |tm_attr,tm_val|
      if tm_attr == :players
        if tm_val[player] != nil
          result = tm_val[player][:shoe]
        end
      end
    end
  end
  result
end

def team_colors(name)
  result = []
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    if tm_data[:team_name] == name
        result = tm_data[:colors]
    end
  end
  result
end

def team_names
  names = []
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    names << tm_data[:team_name]
  end
  names
end

def player_numbers(team)
  nums = []
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    if tm_data[:team_name] == team 
      tm_data[:players].each do |name,plyr_data|
        nums << plyr_data[:number]
      end
    end
  end
  nums
end

def player_stats(name)
  the_stats = {}
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    if tm_data[:players][name] != nil
      the_stats = tm_data[:players][name]
    end
  end
  the_stats
end

def big_shoe_rebounds
  max = 0
  rebounds = 0
  stats = game_hash
  stats.each do |tm_loc, tm_data|
    tm_data[:players].each do |name,plyr_data|
      if plyr_data[:shoe] > max
        max = plyr_data[:shoe]
      end
    end
  end
  stats.each do |tm_loc, tm_data|
    tm_data[:players].each do |name,plyr_data|
      if plyr_data[:shoe] == max
        rebounds = plyr_data[:rebounds]
      end
    end
  end
  rebounds
end