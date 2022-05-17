package {
	import flash.display.MovieClip;

	public class BulletManager {
		private var bulletList: Array;
		private var main: Main;

		public function BulletManager(main: Main) {
			this.main = main;
			bulletList = [];
		}

		public function createBullet(xPos:int, yPos:int, direction:int, spd: int, dur: int) {
			var b: Bullet = new Bullet(xPos, yPos, direction, spd, dur);
			main.addChild(b);
			bulletList.push(b);
		}

		public function update() {// Called by Main to update each bullet
			// Updates only if the game isn't paused
			if (!main.pauseTick) {
				// Iterates through each bullet in list to call its update function
				for (var i = 0; i < bulletList.length; i++) {
					var b: Bullet = bulletList[i];
					b.update();
					if (b.getDuration()) {
						main.removeChild(b)
						bulletList.removeAt(i);
					}
				}
			}
		}

		public function removeAll() {// A function to remove all bullets just in case
			while (bulletList.length > 0) {
				bulletList.pop();
			}
		}

	}

}