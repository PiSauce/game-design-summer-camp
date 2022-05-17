package  {
	import flash.display.MovieClip;
	
	public class Bullet extends MovieClip{
		private var speed:int;
		private var duration:int;
		private var tick:int;
		
		public function Bullet(pos:MovieClip, speed:int, duration:int) {
			this.x = pos.x;
			this.y = pos.y;
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			this.rotation = pos.rotation;
			this.speed = speed;
			this.duration = duration;
		}
		
		public function update(){
			move();
			wrap();
			tick++;
			this.alpha = 1 - tick/duration;
		}
		
		private function wrap(){
			var h = this.height/2;
			var w = this.width/2;
			
			if(this.x + w <= 0) {
				this.x = 550 + w;
			}
			if(this.x - w > 550) {
				this.x = 0 - w;
			}
			if(this.y + h <= 0) {
				this.y = 400 - h;
			}
			if(this.y - h > 400) {
				this.y = 0 - h;
			}
		}
		
		public function getDuration(){
			return tick > duration;
		}
		
		private function move(){
			this.x += Math.cos(this.rotation * Math.PI/180) * speed;
			this.y += Math.sin(this.rotation * Math.PI/180) * speed;
		}

	}
	
}
