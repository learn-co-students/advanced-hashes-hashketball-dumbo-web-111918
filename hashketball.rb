
def game_hash
  { :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash[:home][:players].map do |name, stats| 
    if name == player 
      return stats[:points]
    end
  end
  game_hash[:away][:players].map do |name, stats| 
    if name == player 
      return stats[:points]
    end
  end
end

def shoe_size(player)
  game_hash[:home][:players].map do |name, stats| 
    if name == player 
      return stats[:shoe]
    end
  end
  game_hash[:away][:players].map do |name, stats| 
    if name == player 
      return stats[:shoe]
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team 
    return game_hash[:home][:colors]
  end
  if game_hash[:away][:team_name] == team 
    return game_hash[:away][:colors]
  end
end

def team_names
  all_team_names = []
  all_team_names << game_hash[:home][:team_name]
  all_team_names << game_hash[:away][:team_name]
  return all_team_names
end

def player_numbers(team)
all_stats = []   
  if game_hash[:home][:team_name] == team 
      game_hash[:home][:players].map do |players, info|
        info.map do |catagory, stats| 
        if catagory == :number 
          all_stats << stats
        end
      end
    end
  end
  if game_hash[:away][:team_name] == team 
      game_hash[:away][:players].map do |players, info|
        info.map do |catagory, stats| 
        if catagory == :number 
          all_stats << stats
        end
      end
    end
  end
  return all_stats 
end

def player_stats(player)
  player_stats = {}
  game_hash[:home][:players].map do |name, stats|
    if name == player 
      player_stats = stats 
    end
  end
  game_hash[:away][:players].map do |name, stats|
    if name == player 
      player_stats = stats 
    end
  end
  player_stats
end

def big_shoe_rebounds
  
    # This is obviosly the wrong way to do this. 
    # But I think I deserve an award for dumbest successful method. 
    
    # First I created variables for all the shoe sizes. 

    alan = game_hash[:home][:players]["Alan Anderson"][:shoe]
    reggie = game_hash[:home][:players]["Reggie Evans"][:shoe]
    brook = game_hash[:home][:players]["Brook Lopez"][:shoe]
    mason = game_hash[:home][:players]["Mason Plumlee"][:shoe]
    jason = game_hash[:home][:players]["Jason Terry"][:shoe]
    jeff = game_hash[:away][:players]["Jeff Adrien"][:shoe]
    bismak = game_hash[:away][:players]["Bismak Biyombo"][:shoe]
    desagna = game_hash[:away][:players]["DeSagna Diop"][:shoe]
    ben = game_hash[:away][:players]["Ben Gordon"][:shoe]
    brendan = game_hash[:away][:players]["Brendan Haywood"][:shoe]
    
    # Then I put the shoe sizes into a hash with the name as a key. 

    largest_shoes = {"Alan Anderson": alan, "Reggie Evans": reggie, "Brook Lopez": brook, "Mason Plumlee": mason, "Jason Terry": jason, "Jeff Adrien": jeff, "Bismak Biyombo": bismak, "Desagna Diop": desagna, "Ben Gordon": ben, "Brendan Haywood": brendan }

    # Then I iterated through largest_shoes and set the highest 
    # shoe size as largest_shoe and the shoe_name to the respective name.
    # Then once I had the name of the largest shoe player in "shoe_name",
    # I check if the name matches the players in :away and :home. 
    # If it finds it, it returns the rebounds of that player. 

largest_shoe = 0
shoe_name = nil
    largest_shoes.map do |name, shoe| 
      if shoe > largest_shoe
        largest_shoe = shoe
        shoe_name = name
      end
    end
    game_hash[:away][:players].each do |name, info|
      if name == shoe_name.to_s
        return game_hash[:away][:players][shoe_name.to_s][:rebounds]
      end
    end
    game_hash[:home][:players].each do |name, info|
      if name == shoe_name.to_s
        return game_hash[:home][:players][shoe_name.to_s][:rebounds]
      end
    end
end