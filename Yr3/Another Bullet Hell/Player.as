package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip{
		private var k:KeyboardListener;
		private var bm:BulletManager;
		private var speed:int;
		private var tick:int;
		private var delay:int;
		private var temp:int;
		
		public function Player(k:KeyboardListener, bm:BulletManager) {
			this.k = k;
			this.bm = bm;
			this.speed = 10;
			this.tick = 0;
			this.delay = 1;
		}
		
		public function update(){
			move();
			tick++;
		}
		
		private function move(){
			// Basic movement
			if(k.checkKey(Keyboard.UP)) this.y -= speed;
			if(k.checkKey(Keyboard.LEFT)) this.x -= speed;
			if(k.checkKey(Keyboard.DOWN)) this.y += speed;
			if(k.checkKey(Keyboard.RIGHT)) this.x += speed;
			
			// Lower speed on shift
			if(k.checkKey(Keyboard.SHIFT)){
				speed = 5;
			} else {
				speed = 10;
			}
			
			// Shoot
			if(k.checkKey(Keyboard.Z)) shoot();
		}
		
		private function shoot(){
			if(tick > temp + delay){
				bm.createBullet(this, "ENEMY", -90);
				temp = tick;
			}
		}

	}
	
}
