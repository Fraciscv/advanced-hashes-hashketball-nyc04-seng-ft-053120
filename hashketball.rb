require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end
#We need all players 
def get_players 
    players = game_hash.keys.map do |team|
      game_hash[team][:players] 
    end
    players.flatten
end

def num_points_scored(player_name)
  #knows the number of points scored by each player
    #check that player's points
    #iterate(loop through) thought Top level keys and the players key
      found_player = get_players.find do |player|
        player[:player_name] == player_name 
  end
  found_player[:points]
end

def shoe_size(player_name)
  #knows the shoe size of each player
    #check that player's shoe size
    #iterate(loop through) through Top level keys and the players key
    found_player = get_players.find do |player|
      player[:player_name] == player_name
    end
    found_player[:shoe]
end

def team_colors(team_name)
  #knows the Brooklyn Nets colors are Black and White
  #knows the Charlotte Hornets colors are Turquoise and Purple
  colors = ""
    game_hash.each do |top_level, team_info|
      if team_info[:team_name] == team_name
      colors = team_info[:colors]
    end
  end
  colors
end

def team_names
  #return the team names
  team_names = []
  game_hash.each do |team, team_data|
    team_names.push(team_data[:team_name])
  end
  team_names 
end

def player_numbers(team_name)
  #returns the player jersey number
  player_number = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        player_number.push(player[:number])
      end
    end
  end
  player_number 
end

def player_stats(player_name)
  #return all stats for given player
  player_stats = {}
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        player_stats = player
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  #returns the number of rebounds of the player with the biggest shoe size
  player_name = ""
  shoe_size= 0
  rebounds = 0
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if shoe_size < player[:shoe]
        shoe_size = player[:shoe]
        player_name = player[:player_name]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end
