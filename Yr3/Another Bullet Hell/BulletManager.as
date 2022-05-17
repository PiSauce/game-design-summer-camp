package {
	import flash.display.Stage;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	public class BulletManager {
		private var main: Main;
		private var bulletList: Array;

		public function BulletManager(main: Main) {
			this.main = main;
			bulletList = [];
		}

		public function createBullet(origin:MovieClip, target:String, rot: Number, t: String = "NORMAL", spd: int = 20) {
			var b: Bullet = new Bullet(origin, target, rot, t, spd, main);
			main.addChild(b);
			bulletList.push(b);
		}

		public function update() {
			for (var i = 0; i < bulletList.length; i++) {
				var b: Bullet = bulletList[i];
				var w = b.width/2;
				var h = b.height/2;
				var bounds = b.x - w < 0 || b.x + w > main.stage.stageWidth || b.y - h < 0 || b.y + h > main.stage.stageWidth
				if (bounds || b.checkHit()) {
					main.removeChild(b);
					bulletList.removeAt(i);
				}
				
				b.update();
			}
		}

		public function removeAll() {
			for (var i = 0; i < bulletList.length; i++) {
				var b: Bullet = bulletList[i];
				main.removeChild(b);
				bulletList.shift();
			}
		}

	}

}