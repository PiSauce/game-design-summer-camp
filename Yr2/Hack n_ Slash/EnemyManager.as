package {

	public class EnemyManager {
		private var enemyList: Array;
		private var main: Main;
		private var player: Player;
		private var am: ArrowManager;

		public function EnemyManager(main: Main, player: Player) {
			this.main = main;
			this.player = player;
			this.am = am;
			enemyList = []
		}

		public function update() {
			for(var i = 0; i < enemyList.length; i++) {
				var e: Enemy = enemyList[i];
				e.update();
				if(e.isDead()) {
					PlayState.killCount++;
					player.skillPoints++;
					player.heal();
					e.am.removeAll();
					main.removeChild(e);
					enemyList.removeAt(i)
				}
			}
		}

		public function addEnemy() {
			var randomizer = Math.floor(Math.random() * 5);
			var e:Enemy;
			if(randomizer == 1) {
				e = new Enemy(player, 50, main, "ARCHER");
			} else {
				e = new Enemy(player, 50, main, "BASIC");
			}
			main.addChild(e);
			enemyList.push(e);
		}

		public function addEnemyRandCoor() {
			var randomizer = Math.floor(Math.random() * 2 + 1);
			var e:Enemy;
			if(randomizer == 1) {
				e = new Enemy(player, 50, main, "BASIC");
			} else if(randomizer == 2) {
				e = new Enemy(player, 50, main, "ARCHER");
			}
			e.x = randomRange(Main.WIDTH, 0);
			e.y = randomRange(Main.HEIGHT, 0);
			main.addChild(e);
			enemyList.push(e)
		}

		public function randomRange(max: int, min: int): int {
			return(Math.random() * (max - min + 1)) + min;
		}

	}

}