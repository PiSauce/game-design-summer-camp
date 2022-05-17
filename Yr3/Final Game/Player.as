package {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.display.DisplayObject;

	public class Player extends MovieClip {
		private var key: KeyboardListener;
		private var level: Level;
		private var platform: Platform;
		private var spawn: Spawn;
		private var goal: Goal;
		private var bad: BadThing;
		private var jumpPad:JumpPad;
		private var xVel: int;
		private var yVel: Number;
		private var speed: int;
		private var canJump: Boolean;

		public var blocks: int;
		public var lives: int;

		public function Player(key: KeyboardListener, level: Level) {
			this.key = key;
			this.level = level;
			this.spawn = level.spawn;
			this.platform = level.platform;
			this.goal = level.goal;
			this.bad = level.bad;
			this.jumpPad = level.jumpPad;
			this.xVel = 0;
			this.yVel = 0;
			this.speed = 3;

			this.blocks = 3;
			this.lives = 3;
			
			this.x = spawn.x;
			this.y = spawn.y;
		}

		public function update() {
			move();
			checkDeath();
			if (col(this, goal)) {
				resetPlayer();
				lives = 3;
				level.nextLevel();
			}
		}

		private function checkDeath() {
			if (this.y - this.height / 2 > stage.stageHeight - 50) {
				level.remakeLevel();
				resetPlayer();
				lives--;
			}
			if (col(this, bad)){
				level.remakeLevel();
				resetPlayer();
				lives--;
			}
		}

		public function resetPlayer() {
			spawn.respawn();
			this.x = spawn.x;
			this.y = spawn.y;
			xVel = 0;
			yVel = 0;
			blocks = 3;
		}

		private function move() {
			var up = key.checkKey(Keyboard.W);
			var left = key.checkKey(Keyboard.A);
			var right = key.checkKey(Keyboard.D);

			// Horizontal movement
			if (right) {
				xVel += speed;
			}
			if (left) {
				xVel -= speed;
			}

			for (var i = 0; i < Math.abs(xVel); i++) {
				if (xVel > 0) {
					this.x++;
					if (col(this, platform)) {
						this.y--;
						if (col(this, platform)) {
							this.y--;
							if (col(this, platform)) {
								this.y += 2;
								this.x--;
								xVel = 0;
							}

						}
					}
				} else {
					this.x--;
					if (col(this, platform)) {
						this.x++;
						xVel = 0;
					}
				}
			}

			xVel *= 0.8;

			// Vertical movement
			yVel += 2;

			if (up && canJump) {
				yVel = -15;
				canJump = false;
			}

			for (i = 0; i < Math.abs(yVel); i++) {
				if (yVel > 0) {
					this.y++;
					canJump = false
					if (col(this, platform)) {
						this.y--;
						yVel = 0;
						canJump = true;
					}
				} else {
					this.y--;
					if (col(this, platform)) {
						this.y++;
						yVel = 0;
					}
				}
			}
			
			if(col(this, jumpPad)){
				yVel = -25;
			}
		}

		private function col(objA: DisplayObject, objB: DisplayObject): Boolean {
			return SkyCollisionDetection.bitmapHitTest(objA, objB)
		}

	}

}