
class Player
    attr_accessor :winner ,:position,:player_release ,:name, :color
    def initialize(window,id)
    	  
      	if(id==1)
      		@sprite1=Gosu::Image.new(window,"./img/red.png",true)
      		  @x , @y =200,950
      		  @name="RED"
      		  @color="#0000FF"
    	else
      		@sprite1=Gosu::Image.new(window,"./img/blue.png",true)
      		  @x , @y =100,950
      		  @name="BLUE"
      		  @color="#0000FF"
    	end

#      @font1 = Gosu::Font.new(self, Gosu::default_font_name, 200)
      @@winner , @position, @player_release=false ,0, false

    end

   def draw
      @sprite1.draw(@x,@y,0)
  
    end

    def new_position

    	score=@position
    	score=@position

	   	if (score <= 100 && score > 90 || score <= 80 && score > 70 || score <= 60 && score > 50  || score <= 40 && score > 30 || score <= 20 && score > 10  ) 
		  	
		  	@fac_x=score%10
		  	@fac_y=score/10
			
#			if(score == 100 || score == 100) 
#			 $winner=1
#			 $winner_name=@name


			if(@fac_x==0)
			   	@x=54+8
			   	@y=821 - (@fac_y*87 - 87)
			 
			

			else
				@x=821- (@fac_x *87 - 16) + 87
				@y=821 - (@fac_y *87 - 4) #916
			end

		elsif (score == 0)
			@x,@y=100,950
		

		else
			@fac_x=score%10
			@fac_y=score/10
#if(score == 1 || score == 100) 
#			 $winner=1
#			 $winner_name=@name
#end

			if(@fac_x==0)
				@x=838
				@y=821-(@fac_y*87 - 91) 

			else
				@x=(@fac_x *87 + 64) - 87
				@y=821-(@fac_y*87 - 4 )
			end
			
			  
		end
    end

end
