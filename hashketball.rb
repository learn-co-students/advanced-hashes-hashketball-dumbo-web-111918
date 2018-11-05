# Write your code here!
def game_hash
  {
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

#trying to figure out how to combine all players into one hash
def all_players
  away = game_hash[:away][:players];
  home = game_hash[:home][:players];
  home.merge(away)
end

def num_points_scored(player)
  all_players[player][:points]
end

def shoe_size(player)
  all_players[player][:shoe]
end

#probably a shorter way to do this one
def team_colors(team_name)
  if game_hash[:home][:team_name].include?(team_name)
    game_hash[:home][:colors]
  else game_hash[:away][:team_name].include?(team_name)
    game_hash[:away][:colors]
  end
end

#made an array of team names
def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  if game_hash[:home][:team_name].include?(team_name)
    game_hash[:home][:players].collect { |player, number| number[:number] }
  else game_hash[:away][:team_name].include?(team_name)
    game_hash[:away][:players].collect { |player, number| number[:number] }
  end
end

def player_stats(player)
  all_players[player]
end

#two step process, first get the biggest shoe size, then used .find to get the player
def big_shoe_rebounds
  biggest_shoe = all_players.collect { |player, player_data| player_data[:shoe]}.max
  biggest_shoe_person = all_players.find { |player, player_data| player_data[:shoe] == biggest_shoe }
  biggest_shoe_person[1][:rebounds]
end

#bonus section

#this one is almost the same as the shoe/rebounds one
def most_points_scored
  most_points = all_players.collect { |player, player_data| player_data[:points]}.max
  most_points_person = all_players.find { |player, player_data| player_data[:points] == most_points }
  most_points_person[0]
end

# .sum wasn't working in ruby v 2.3
def winning_team
  home_points = game_hash[:home][:players].collect { |player, player_data| player_data[:points]}
  home_sum = home_points.reduce(:+)
  away_points = game_hash[:away][:players].collect { |player, player_data| player_data[:points]}
  away_sum = away_points.reduce(:+)
  if home_sum > away_sum
    game_hash[:home][:team_name]
  elsif away_sum > home_sum
    game_hash[:away][:team_name]
  else
    "tie score"
  end
end

def player_with_longest_name
  all_names = all_players.keys
  longest_name = all_names.collect { |name| name.length}.max
  longest_name_player = all_names.find { |name| name.length == longest_name}
  longest_name_player
end

def long_name_steals_a_ton?
  all_players.values
  steal_array = all_players.collect {|s, steals| steals[:steals]}.max
  if steal_array == all_players[player_with_longest_name][:steals]
    true
  else
    false
  end
end
