package  {
	import flash.display.MovieClip;
	
	public class Bullet extends MovieClip{
		private var spd:int;
		private var dur:int;
		private var tick:int;

		public function Bullet(xPos:int, yPos:int, direction:int, spd:int, dur:int) {
			this.x = xPos;
			this.y = yPos;
			this.rotation = direction;
			this.spd = spd;
			this.dur = dur;
			this.tick = 0;
		}
		
		public function update(){// Called by BulletManager to update position
			move();
			tick++;
		}
		
		public function getDuration(){
			return tick > dur;
		}
		
		private function move(){
			this.x += Math.cos(this.rotation * Math.PI/180) * spd;
			this.y += Math.sin(this.rotation * Math.PI/180) * spd;
		}

	}
	
}
