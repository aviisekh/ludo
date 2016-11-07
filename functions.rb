
#require 'player'
$bottom =     [4, 9, 20, 28, 40, 51, 63]
$bottom_up = [14, 31, 38, 84, 59, 67,81]

$top =    [99,95,89,64,17]
$top_down=[78,75,26,60,7]
$score1=0

def play()
	return true
end

def instruct()
	return true
end

def roll_dice(player)
	@score=1 +rand(6)
	$score1=@score

  		if (player.player_release==false && @score != 1)
  			player.position=0
 			   	
 	
  		elsif (player.player_release==false && @score == 1)
	   		
	   		 player.player_release=true
	   		 player.position=1

  		else (player.player_release==true )
  			player.position += @score

  			if (player.position > 100)
  				player.position -= @score
  			end
		end


puts "#{@score}"

end

def winning(player)
	if(player.position==100 )
		$winner_name=player.name
		$winner_color=player.color
		return true

	else
		return false
	end
end


def check(player)
				if $bottom.include? player.position
					a=$bottom.index(player.position)
					player.position=$bottom_up[a]
					puts "Upgraded"
				end
				
				#check for downgrades
				if $top.include?player.position
					a=$top.index(player.position)
					player.position=$top_down[a]
					puts "Downgraded"
				end
end

def checkForKill(killed,killer)
	if killed.position == killer.position
		killed.player_release=false
		killed.position=0
		killed.new_position
	end
end 