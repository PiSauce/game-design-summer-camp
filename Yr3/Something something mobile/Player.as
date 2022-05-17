package {
	import flash.display.MovieClip;

	public class Player extends MovieClip {
		private var speed: int;
		private var targetX:int;
		private var targetY:int;
		
		private var angle:Number;
		public var lives;

		public function Player() {
			// Init variables
			this.speed = 10;
			this.angle = 0;
			this.lives = 5;
		}
		
		public function update(){
			move();
		}
		
		private function move(){
			var distX = targetX - this.x;
			var distY = targetY - this.y;
			
			var angle = Math.atan2(distY, distX);
			
			this.rotation = averageNums(this.rotation / 180 * Math.PI, angle, 0.7) * 180 / Math.PI;
			this.x += Math.cos(this.rotation * Math.PI/180) * speed;
			this.y += Math.sin(this.rotation * Math.PI/180) * speed;
		}

		public function moveTo(xPos, yPos) {
			targetX = xPos;
			targetY = yPos;
		}

		private function averageNums(a: Number, b: Number, f: Number = 0.5): Number {
			var avg: Number = (Math.atan2(Math.sin(a) * (f) + Math.sin(b) * (1 - f), Math.cos(a) * (f) + Math.cos(b) * (1 - f)));
			return avg;
		}

	}

}