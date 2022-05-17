package {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Main extends MovieClip {
		private var key: KeyboardListener;
		public var bm: BulletManager;
		private var player: Player;
		public var em: EnemyManager;

		private var tick: int;
		private var pause: Boolean;

		private var totalEnemies: Array = [1];

		public function Main() {
			SkyCollisionDetection.registerRoot(this);
			
			key = new KeyboardListener(stage);
			bm = new BulletManager(this);
			em = new EnemyManager(this);
			pause = false;

			player = new Player(key, bm);
			player.x = stage.stageWidth / 2;
			player.y = stage.stageHeight / 2;
			addChild(player);

			stage.addEventListener(Event.ENTER_FRAME, update);
		}

		public function update(e: Event) {
			level(0);
			if (!pause) {
				player.update();
				bm.update();
				em.update();
				tick++;
			}
		}

		public function level(curLevel: int) {
			if (curLevel == 0) {
				if (tick % 10 == 0) {
					em.createEnemy("WAVE", 550, 50, -5);
				}
			}
		}

	}

}