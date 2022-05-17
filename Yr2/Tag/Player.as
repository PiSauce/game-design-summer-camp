package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip{
		private var bkl:BetterKeyboardListener;
		
		private var xVel:Number;
		private var yVel:Number;
		private var speed:int;
		private var rotationSpeed:int;

		public function Player(bkl:BetterKeyboardListener) {
			this.rotation = -90;
			this.bkl = bkl;
			xVel = 0;
			yVel = 0;
			speed = 2;
			rotationSpeed = 14;
		}
		
		public function update(){
			move();
		}
		
		private function move(){
			if(bkl.checkKey(Keyboard.SPACE)){
				this.x += xVel * 1.5;
				this.y += yVel * 1.5;
			} else {
				this.x += xVel;
				this.y += yVel;
			}

			if(bkl.checkKey(Keyboard.W)){
				xVel += Math.cos(this.rotation * Math.PI/180) * speed;
				yVel += Math.sin(this.rotation * Math.PI/180) * speed;
			}
			if(bkl.checkKey(Keyboard.A)){
				this.rotation -= rotationSpeed;
			}
			if(bkl.checkKey(Keyboard.S)){
				xVel -= Math.cos(this.rotation * Math.PI/180) * speed/2;
				yVel -= Math.sin(this.rotation * Math.PI/180) * speed/2;
			}
			if(bkl.checkKey(Keyboard.D)){
				this.rotation += rotationSpeed;
			}
			
			xVel *= 0.8;
			yVel *= 0.8;
			
			// Keep within stage boundaries
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
