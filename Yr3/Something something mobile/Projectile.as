package {
	import flash.display.MovieClip;
	import flash.display.Stage;

	public class Projectile extends MovieClip {
		private var speed: int;
		private var target: Player;
		private var direction: int;
		private var m:Main;

		public function Projectile(target: Player, m:Main) {
			this.target = target;
			this.m = m;

			reset();
		}

		public function update() {
			move();
		}
		
		public function checkHit() {
			return this.hitTestObject(target);
		}

		private function move(): void {
			var w = this.width / 2;
			var h = this.height / 2;

			this.x += Math.cos(direction * Math.PI / 180) * speed;
			this.y += Math.sin(direction * Math.PI / 180) * speed;

			if (this.x + w < 0 || this.x - w > m.stage.stageWidth) {
				reset();
			}
			if (this.y + h < 0 || this.y - h > m.stage.stageHeight) {
				reset();
			}
		}

		private function reset(): void {
			// Randomize spawn location
			var w = this.width / 2;
			var h = this.height / 2;
			var side = randomRange(0, 3);
			
			switch (side) {
				case 0: // Left
					this.x = 0 - w;
					this.y = randomRange(h, m.stage.stageHeight - h);
					break;
				case 1: // Right
					this.x = m.stage.stageWidth + w;
					this.y = randomRange(h, m.stage.stageHeight - h);
					break;
				case 2: // Top
					this.x = randomRange(w, m.stage.stageWidth - w);
					this.y = 0 - h;
					break;
				case 3: // Bottom
					this.x = randomRange(w, m.stage.stageWidth - w);
					this.y = m.stage.stageHeight + h;
			}
			
			// Randomize speed
			speed = randomRange(3, 10);
			
			// Randomize size
			var size = Math.random() + 0.5;
			this.scaleX = size;
			this.scaleY = size;

			// Randomize direction
			var dX = target.x - this.x;
			var dY = target.y - this.y;
			direction = Math.atan2(dY, dX) * 180 / Math.PI;
		}

		private function randomRange(min: Number, max: Number): Number {
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}

	}

}