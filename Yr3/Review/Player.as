package  {
	import flash.ui.Keyboard;
	import flash.display.MovieClip;
	
	public class Player extends MovieClip{
		private var kbl:KeyboardListener;
		private var xVel:Number;
		private var yVel:Number;
		private var speed:int;
		private var rotSpeed:int;
		private var tick:int;
		private var bulletDelay:int;
		private var bm: BulletManager;
		private var main:Main;

		public function Player(kbl:KeyboardListener, main:Main) {
			this.kbl = kbl;
			this.main = main;
			bm = new BulletManager(main);
			
			xVel = 0;
			yVel = 0;
			speed = 4;
			rotSpeed = 15;
			bulletDelay = 0;
		}
		
		public function update(){
			move();
			wrap();
			shoot();
			bm.update();
			tick++
		}
		
		private function shoot(){
			if(kbl.checkKey(Keyboard.SPACE) && tick >= bulletDelay + 2) {
				bulletDelay = tick;
				bm.createBullet(this, 20, 50);
			}
		}
		
		private function wrap(){
			var h = this.height/2;
			var w = this.width/2;
			
			if(this.x + w <= 0) {
				this.x = main.WIDTH + w;
			}
			if(this.x - w > main.WIDTH) {
				this.x = 0 - w;
			}
			if(this.y + h <= 0) {
				this.y = main.HEIGHT - h;
			}
			if(this.y - h > main.HEIGHT) {
				this.y = 0 - h;
			}
		}
		
		private function move(){
			this.x += xVel;
			this.y += yVel;
			
			xVel *= 0.7;
			yVel *= 0.7;
			
			if(kbl.checkKey(Keyboard.W)){
				xVel += Math.cos(this.rotation * Math.PI/180) * speed; 
				yVel += Math.sin(this.rotation * Math.PI/180) * speed;
			}
			if(kbl.checkKey(Keyboard.S)){
				xVel -= Math.cos(this.rotation * Math.PI/180) * speed; 
				yVel -= Math.sin(this.rotation * Math.PI/180) * speed;
			}
			
			if(kbl.checkKey(Keyboard.A)) this.rotation -= rotSpeed;
			if(kbl.checkKey(Keyboard.D)) this.rotation += rotSpeed;
		}

	}
	
}
