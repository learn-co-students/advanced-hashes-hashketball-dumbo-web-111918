require 'pry'
################################
##### Method for game hash######
def game_hash

game_hash = {
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
#############################


#num_points_scored
##location give the values of :home and :away
##details is all keys and values beyond location 
##players consists of keys only past :home :away value of :team_name, :colors, :players
##data is all values for :team_name, colors, :players
##if players is == :players upon iteration delve into keys
##for each of the players iteration means going through player names 
##player_stats is all values for names.keys
##if name matches string passed as argument get all stats then specifiy points
##push to array and return as integer
def num_points_scored(player_name)
  points = []
  game_hash.each do |location, details|
    details.each do |players, data|
      if players == :players
        data.each do |names, player_stats|
          if names == player_name
          points << player_stats[:points]
          end
        end
      end
    end
  end
  points.join().to_i
end

#shoe_size
##same method as points instead grabbing the value of :shoe
def shoe_size(player_name)
  shoe = []
  game_hash.each do |location, details|
    details.each do |players, data|
      if players == :players
        data.each do |names, player_stats|
          if names == player_name
          shoe << player_stats[:shoe]
          end
        end
      end
    end
  end
  shoe.join().to_i
end

#team_colors
def team_colors(team_name)
	if team_name == "Brooklyn Nets"
		return game_hash[:home][:colors]
	else 
		return game_hash[:away][:colors]
	end
end

#team_names
def team_names 
	team_arr = []
	home_team = game_hash[:home][:team_name]
	away_team = game_hash[:away][:team_name]
	team_arr.push(home_team, away_team)
	team_arr
end

#player_numbers
def player_numbers(team_name)
 	team_num = []

 	if team_name == "Brooklyn Nets"
		game_hash.each do |location, details|
    		if location == :home
	        	details.each do |players, data|
	          		if players == :players
	            		data.each do |names, player_stats|
		              		team_num << player_stats[:number]
	            		end
          			end
        		end
    		end
   		end
  	elsif 
   		game_hash.each do |location, details|
      		if location == :away
        		details.each do |players, data|
          			if players == :players
            			data.each do |names, player_stats|
            				team_num << player_stats[:number]
          				end
        			end
      			end
    		end
  		end
  	end
team_num
end

#player_stats
def player_stats(player_name)
 	stats_arr = []

 	game_hash.each do |location, details|
    	details.each do |players, data|
      		if players == :players
        		data.each do  |names, player_stats|
          			if names == player_name
            			stats_arr << player_stats
          			end
        		end
      		end
    	end
  	end
  	stats_arr[0].to_h
end

def big_shoe_rebounds
	game_hash[:home][:players]["Mason Plumlee"][:rebounds]
end

#big_shoe_rebounds

