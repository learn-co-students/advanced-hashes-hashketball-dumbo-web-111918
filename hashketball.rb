# Write your code here!
require 'pry'

def game_hash

hash = { # BEGIN HASH
        home:
        { # begin HOME
              team_name: "Brooklyn Nets",
              colors: ['Black', 'White'],
              players:
              { # begin Players
                'Alan Anderson' =>
                { # player 1
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1
                },
                'Reggie Evans' =>
                { # player 2
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7
                },
                'Brook Lopez' =>
                { # player 3
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15
                },
                'Mason Plumlee' =>
                { # player 4
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 12,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5
                },
                'Jason Terry' =>
                { # player 5
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1
                }
              } # end Players
        }, # end HOME
        away:
        { # begin AWAY
              team_name: "Charlotte Hornets",
              colors: ['Turquoise', 'Purple'],
              players:
              { # begin Players
                'Jeff Adrien' =>
                { # player 1
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2
                },
                'Bismak Biyombo' =>
                { # player 2
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 7,
                  blocks: 15,
                  slam_dunks: 10
                },
                'DeSagna Diop' =>
                { # player 3
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5
                },
                'Ben Gordon' =>
                { # player 4
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0
                },
                'Brendan Haywood' =>
                { # player 5
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 22,
                  blocks: 5,
                  slam_dunks: 12
                }
              } # end Players
        } # end AWAY
      } # END HASH
  hash
end


def num_points_scored(name)
  score = nil
  game_hash.each do |teams, data|
    data[:players].map do |player, stat|
      if name == player
        score = stat[:points] # i can also just do a return here, but i wanted to see how this value changed with binding.pry
        #binding.pry
      end
    end
  end
  score
end

def shoe_size(name)
  game_hash.each do |teams, data|
    data[:players].map do |player,stat|
      if name == player
        return stat[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |teams, data|
    if data[:team_name] == team_name
      return data[:colors]
    end
  end
end

def team_names()
  names = []
  game_hash.each { |teams, data| names << data[:team_name] }
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |teams, data|
    if data[:team_name] == team_name
      data[:players].each do |player, stat|
        numbers << stat[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if player == name
        return stat
      end
    end
  end
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if shoe < stat[:shoe]
        shoe = stat[:shoe]
        rebounds = stat[:rebounds]
      end
    end
  end
  rebounds
end

############### Bonus

def most_points_scored
  points = 0
  points_player = nil
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if points < stat[:points]
        points = stat[:points]
        points_player = player
      end
    end
  end
  points_player
end

def winning_team
  final_score = {}
  game_hash.each do |teams, data|
    score = 0
    final_score[data[:team_name]] = score
    data[:players].each do |player, stat|
      score = score + stat[:points]
    end
    final_score[data[:team_name]] = score
  end
  final_score.max_by {|k,v| v}[0]
end

def player_with_longest_name
  longest_name = nil
  name_length = 0
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if player.length > name_length
        longest_name = player
        name_length = player.length
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  long_player = player_with_longest_name

  steal_player = nil
  no_steals = 0
  game_hash.each do |teams, data|
    data[:players].each do |player, stat|
      if stat[:steals] > no_steals
        steal_player = player
        no_steals = stat[:steals]
      end
    end
  end
  long_player == steal_player
end
