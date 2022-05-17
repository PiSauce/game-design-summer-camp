package {

	public class EnemyManager {
		private var main: Main;
		public var enemyList: Array;

		public function EnemyManager(main: Main) {
			this.main = main;
			enemyList = [];
		}

		public function createEnemy(type:String, startX:Number, startY:Number, speed = 5) {
			var e: Enemy = new Enemy(type, startX, startY, speed);
			main.addChild(e);
			enemyList.push(e);
		}

		public function update() {
			for (var i = 0; i < enemyList.length; i++) {
				var e: Enemy = enemyList[i];
				var w = e.width / 2;
				var h = e.height / 2;
				
				e.update();
				if (e.end || e.hit) {
					main.removeChild(e);
					enemyList.removeAt(i);
				}
			}
		}

		public function removeAll() {
			for (var i = 0; i < enemyList.length; i++) {
				var e: Enemy = enemyList[i];
				main.removeChild(e);
				enemyList.shift();
			}
		}

	}

}