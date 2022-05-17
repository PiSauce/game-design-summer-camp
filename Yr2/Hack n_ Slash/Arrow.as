package  {
	import flash.display.MovieClip;
	
	public class Arrow extends MovieClip{
		private var speed:int;
		private var duration:int;
		private var tick:int;
		private var target:MovieClip;

		public function Arrow(pos:MovieClip, target:MovieClip, speed, duration) {
			this.x = pos.x;
			this.y = pos.y;
			this.scaleX = 0.3;
			this.scaleY = 0.3;
			this.rotation = pos.rotation;
			this.speed = speed;
			this.duration = duration;
			this.target = target;
		}
		
		public function update(){
			if(!GameState.pauseTick){
				tick++;
			}
			move();
		}
		
		private function move(){
			this.x += Math.cos(this.rotation * Math.PI / 180) * speed;
			this.y += Math.sin(this.rotation * Math.PI / 180) * speed;
		}
		
		public function getDuration(){
			return (tick >= duration);
		}
		
		public function hitTarget(){
			if(target.hurtBox.hitTestObject(this)){
				target.hitByArrow()
				return true;
			}
		}

	}
	
}
