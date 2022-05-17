package {
	import flash.display.MovieClip;

	public class Bullet extends MovieClip {
		private var type: String;
		private var spd: int;
		private var tick: int;
		private var target: String;
		private var main:Main;

		public function Bullet(origin: MovieClip, target: String, rot: Number, type: String, spd: int, main:Main) {
			this.x = origin.x;
			this.y = origin.y;
			this.target = target;
			this.main = main;
			this.type = type;
			this.spd = spd;
			this.rotation = rot;
			this.gotoAndStop(type);
		}

		public function update() {
			move();
			tick++;
		}

		public function checkHit() {
			if (target == "ENEMY") {
				for (var i = 0; i < main.em.enemyList.length; i++) {
					var t = main.em.enemyList[i];
					if (SkyCollisionDetection.bitmapHitTest(this, t)) {
						t.hit = true;
						return true;
					}
				}
			}
			if (target == "PLAYER") {
				
			}
		}

		private function move() {
			this.x += Math.cos(this.rotation * Math.PI / 180) * spd;
			this.y += Math.sin(this.rotation * Math.PI / 180) * spd;
		}

	}

}