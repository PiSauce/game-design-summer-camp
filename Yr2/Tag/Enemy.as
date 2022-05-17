package  {
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip{
		private var player:Player;
		private var speed:int;
		private var maxRange:int;
		private var minRange:int;
		private var variation:int;
		private var deltaX:int;
		private var deltaY:int;

		public function Enemy(player:Player) {
			this.player = player;
			this.speed = Math.random() * 5 + 2;
			variation = 100;
			deltaX = 0;//Math.random() * variation - variation/2;
			deltaY = 0;//Math.random() * variation - variation/2;
			maxRange = 1000;
			minRange = 25;
			
			this.x = Math.random() * 1500 - 750;
			this.y = Math.random() * 1000 - 500
		}
		
		public function update(){
			lookAtPlayer();
			move();
		}
		
		private function lookAtPlayer(){
			this.rotation = (Math.atan2((player.y + deltaY - this.y), 
							(player.x + deltaX - this.x)) * 180/Math.PI);
		}
		
		private function move(){
			var dist = 
			Math.sqrt((player.y - this.y) * (player.y - this.y) + 
					  (player.x - this.x) * (player.x - this.x));
			
			if(dist < maxRange && dist > minRange + speed){
				this.x += Math.cos(this.rotation * Math.PI/180) * speed;
				this.y += Math.sin(this.rotation * Math.PI/180) * speed;
			}else if(dist < minRange){
				this.x -= Math.cos(this.rotation * Math.PI/180) * speed;
				this.y -= Math.sin(this.rotation * Math.PI/180) * speed;
			}
			
			while(this.x - this.width/2 <= -750){
				this.x++;
			}
			while(this.x + this.width/2 >= 750){
				this.x--;
			}
			while(this.y - this.height/2 <= -500){
				this.y++;
			}
			while(this.y + this.height/2 >= 500){
				this.y--;
			}
		}

	}
	
}
