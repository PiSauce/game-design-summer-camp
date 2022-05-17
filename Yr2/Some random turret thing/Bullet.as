package  {
	import flash.display.MovieClip;
	
	public class Bullet extends MovieClip{
		private var xVel:Number;
		private var yVel:Number;
		private var radRotation:Number;
		private var speed:Number;
		
		private var stageWidth:int;
		private var stageHeight:int;
		
		public function Bullet(xPos:Number, yPos:Number, degRotation:Number, w:int, h:int) {
			speed = 10;
			this.rotation = degRotation - 90;
			radRotation = (degRotation - 90) * Math.PI/180;
			stageWidth = w;
			stageHeight = h;
			
			yVel = Math.sin(radRotation) * 25;
			xVel = Math.cos(radRotation) * 25;
			
			this.x = xPos + xVel;
			this.y = yPos + yVel;
		}
		
		public function update(){
			yVel = Math.sin(radRotation) * speed;
			xVel = Math.cos(radRotation) * speed;
			
			this.x += xVel;
			this.y += yVel;
			if(this.x > stageWidth + 10 || this.x < -10 || this.y > stageHeight + 12 || this.y < -10){
				this.parent.removeChild(this);
			}
		}

	}
	
}
