#!/usr/bin/ruby

$board = Array(1..100)
$bottom = [3,9,20,25,55]
$bottom_up = [12, 53, 44, 92, 88]

$top = [99,91,80,66,43]
$top_down = [13,56,29,33,10]
$delete = 0

turner = 0 #flag to decide whose turn is there
p1_status = false
p2_status = false
	

#Class declaration
class Player	
	def initialize (id, name, colour)
		@player_id = id
		@player_name = name
		@player_colour = colour
	end
	
	def player_status(release_stat, position_stat, winner_status)
		@player_release = release_stat
		@position = position_stat
		@winner = winner_status
	end
	
	def display_status()
		puts "id=#@player_id \nname=#@player_name \ncolour=#@player_colour \nrelease_stat=#@player_release \nposition=#@position \nwin_stat=#@winner"
	end
	
	def win_stat()
		return @winner
	end
	
	def pos_stat()
		return @position
	end
	
	def rel_stat()
		return @player_release
	end	
	
	def  name()
		return @player_name
	end
end 




#exec('clear')
puts "______________________________________________________________________________________________"
puts "\n****************************************** LUDO *******************************************\n"
puts "----------------------------------------------------------------------------------------------"
print "Enter the name (Player 1) : "
name1 = gets
name1 = name1.chomp

print "Enter the name (Player 2) : "
name2 = gets
name2 = name2.chomp

puts "********************************** WELCOME TO THE GAME ***********************************"
puts "                                         LETS MOVE"

#Objects Created
p1 = Player.new("1", name1, "red")
p1.player_status(false,0,false)


p2 = Player.new("2", name2, "blue")
p2.player_status(false,0,false)

def is_winner(p,id)
	if p.pos_stat == 100
		p.player_status(true,100,true)
		$board[99] = "#{p.name}"
		return true
	
	else return false
	end
end


def process(id,p)
	puts p.name()+ "\n*****************"
	puts "##ROLL THE DICE###"
	STDIN.getc
	dice = 1+rand(6)
	puts "##ROLL## = #{dice}"
	#STDIN.getc
	#testing
	if not p.rel_stat()
		while dice == 1 or dice == 6 
			
			if p.pos_stat == 0				
				puts "Player released"
				p.player_status(true,1,false)
				
				$board[0] = p.name()
				#puts p.name
				puts "{\n#$board}"							
			end	
				
			if p.pos_stat! = 0
				
				puts "\n****ROLL AGAIN****"
				STDIN.getc
				dice = 1+rand(6)
				puts "##ROLL## =  #{dice}" 		
				STDIN.getc
				position = dice + p.pos_stat()
				if position > 100
					return
				end
				
				i=p.pos_stat()
				#check for upgrades
				if $bottom.include?position
					a=$bottom.index(position)
					position=$bottom_up[a]
					p.player_status(true,position,false)
					puts "Upgraded"
				end
				
				#check for downgrades
				if $top.include?position
					a=$top.index(position)
					position=$top_down[a]
					p.player_status(true,position,false)
					puts "Downgraded"
				end
				
				if $board[position-1].is_a?String
					if id==1
						#p2.player_status(false,0,false)
						$delete = 2
						puts "     ******* P2 DELETED *******"
						
					else
						#p1.player_status(false,0,false)
						$delete = 1
						puts "     ******* P1 DELETED *******"
						
					end
				end
				
				$board[$board.index(p.name())]=i
				p.player_status(true,position,false)
				
				#check for winner
				if is_winner(p,id)
					return
				end	
				
				$board[position-1]=p.name()
				puts "{\n#$board}"
						
					
			end
		end
		return   #necessary 
	end
	
	
	if p.rel_stat() and not p.win_stat()
		while dice==1 or dice==6
			position= dice + p.pos_stat()
			if position>100
				return
			end
			
			i=p.pos_stat()
			#check for upgrades
			if $bottom.include?position
				a=$bottom.index(position)
				position=$bottom_up[a]
				p.player_status(true,position,false)
				puts "Upgraded"
			end
				
			#check for downgrades
			if $top.include?position
				a=$top.index(position)
				position=$top_down[a]
				p.player_status(true,position,false)
				puts "Downgraded"
			end
			
			if $board[position-1].is_a?String
				if id==1
					#p2.player_status(false,0,false)
					puts "******* P2 DELETED *******"
					$delete = 2
					
				else
					#p1.player_status(false,0,false)
					$delete = 1
					puts "******* P1 DELETED *******"
					
				end
			end	
			
			$board[$board.index(p.name())] = i
			p.player_status(true,position,false)
						
			#check for winner
			if is_winner(p,id)
				return
			end
			
			$board[position-1]=p.name()
			puts "{\n#$board}"
			puts "\n**** ROLL AGAIN ****"
			STDIN.getc
			dice=1+rand(6)
			puts "##ROLL## =  #{dice}"
			STDIN.getc
			
		end
		
		
		
		position= dice + p.pos_stat()
		if position>100
			return
		end
		
		i=p.pos_stat()
		#check for upgrades
		if $bottom.include?position
			a=$bottom.index(position)
			position=$bottom_up[a]
			p.player_status(true,position,false)
			puts "Upgraded"
		end
		
		#check for downgrades
		if $top.include?position
			a=$top.index(position)
			position=$top_down[a]
			p.player_status(true,position,false)
			puts "Downgraded"
		end
		
		if $board[position-1].is_a?String
			if id==1
				#p2.player_status(false,0,false)
				$delete = 2
				puts "******* P2 DELETED *******"
				
			else
				#p1.player_status(false,0,false)
				$delete = 1
				puts "******* P1 DELETED *******"
			end
		end
			
		$board[$board.index(p.name())]=i
		p.player_status(true,position,false)
		
		#check for winner
		if is_winner(p,id)
			return
		end
		
		$board[position-1]=p.name
		puts "{\n#$board}"
			
		
	end
		
	
end


while not p1.win_stat() and not p2.win_stat()
	if turner%2==0
		p1_status = true
		p2_status = false
	else 
		p2_status = true
		p1_status = false
	end
	
	
	
	if p1_status
		process(1,p1)
	else
		process(2,p2)
	end
	
	if $delete == 2
		p2.player_status(false,0,false)
		$delete = 0
	end
	
	if $delete == 1
		p1.player_status(false,0,false)
		$delete = 0	
	end
	
	turner=turner+1
	STDIN.getc
	
end

puts "\n\n{#$board}\n\n"
puts "                    *********** "+$board[99]+ " wins ***********\n\n"
p1.display_status()
print "\n\n"
p2.display_status()























