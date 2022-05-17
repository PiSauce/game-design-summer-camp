package {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;

	public class Player extends MovieClip {
		private var key: KeyboardListener;
		private var bm: BulletManager;
		private var speed: int;
		private var lastShoot: int;
		private var main:Main;

		public function Player(main:Main , key: KeyboardListener, bm: BulletManager) {
			// Giving player class access to other classes
			this.key = key;
			this.bm = bm;
			this.main = main;
			
			// Initializing player variables
			this.speed = 10;
		}
		
		public function update() {// Called by Main to update the player
			move();
			shoot();
		}

		private function shoot() {// Uses BulletManager to create bullet at location
			// Creates a 2 tick(frame) delay between shots
			if (key.checkKey(Keyboard.SPACE) && lastShoot + 2 <= main.getTick()) {
				bm.createBullet(this.x, this.y, -90, 10, 50);
				lastShoot = main.getTick();
			}
		}

		private function move() {// Checks keyboard presses using KeyboardListener class
			if (key.checkKey(Keyboard.W)) this.y -= speed;
			if (key.checkKey(Keyboard.A)) this.x -= speed;
			if (key.checkKey(Keyboard.S)) this.y += speed;
			if (key.checkKey(Keyboard.D)) this.x += speed;
		}

	}

}