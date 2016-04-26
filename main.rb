require 'rubygems'
require 'gosu'
require './player'
require './functions.rb'

$id=0
$count=0
$ang=0
$winner=0
$message="You won the Game"
$winner_name=""

class GameWindow < Gosu::Window 
  def initialize
    super 1462, 1024, false
    self.caption = "Snakes and Ladders"
    @bgimage = Gosu::Image.new(self,"./img/board2.jpg",true)
 #   @indicator = Gosu::Image.new(self,"./img/cur815.gif",true)

    @cursor = Gosu::Image.new(self, "./img/cur815.gif", false)     
#     @roll_button = Gosu::Image.new(self, "./img/button.jpg", false)
  
    @turn1 = Gosu::Image.new(self, "./img/player1.png", false)
  
    @turn2 = Gosu::Image.new(self, "./img/player2.png", false)

    @font = Gosu::Font.new(self, Gosu::default_font_name, 400)
    @font1 = Gosu::Font.new(self, Gosu::default_font_name, 100)
    @font2= Gosu::Font.new(self, Gosu::default_font_name, 200)

    @player1 = Player.new(self,1)  
    @player2 = Player.new(self,0)
  
  end


  def update

  end


  def draw
  	@bgimage.draw(0 ,0, 0)
 # 	@roll_button.draw(1024,924,0)
    @player1.draw
    @player2.draw
    @cursor.draw(mouse_x,mouse_y,0)
    if($count==0)
      @turn2.draw(970,188,0)
      else
      @turn1.draw(971,0,0)
    end
if($winner==1)
  @font1.draw($message,50,300,1)
  @font2.draw($winner_name,200,100,1)

end

 @font.draw($score1, 1050, 500, 1)
#    @indicator.draw_rot(1124,800,1,$ang)
#    puts "jeljfla"
  end

  def button_down(id)
		 if id == Gosu::KbEscape
      	close
    	end 

    if id == Gosu::MsLeft 
    

      if($count==0)
        roll_dice(@player1)
        check(@player1)

        checkForKill(@player2,@player1)

        @player1.new_position
        $count=1

      else($count==1)
        roll_dice(@player2)
        check(@player2)
        
        checkForKill(@player1,@player2)
        @player2.new_position
        $count=0
      end

    end 	


  end

end


window = GameWindow.new

window.show