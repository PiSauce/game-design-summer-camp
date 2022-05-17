package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.ui.MultitouchInputMode;
	import flash.ui.Multitouch;
	import flash.events.Event;

	public class PlayState extends GameState {
		private var player: Player;
		private var pm: ProjectileManager;

		private var tick: int
		private var spawnTimer: int; // Time in frames (24 per second)

		public static var points: int;

		public function PlayState(main: Main) {
			super("PLAY", main);
			GameState.pauseTick = false;
			addBtn(main.pause_btn);
			addBtn(main.back_btn2);
			main.back_btn2.visible = false;

			// Init variables
			tick = 0;
			spawnTimer = 24 * 5; // 5 seconds

			// Create new player
			player = new Player();

			player.x = main.stage.stageWidth / 2;
			player.y = main.stage.stageHeight / 2;

			main.addChild(player);
			player.moveTo(player.x, player.y - 1);

			// Create projectile manager
			pm = new ProjectileManager(main, player);

			// Touch point setup
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;

			// Add event listeners
			main.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouch);
			main.pause_btn.addEventListener(TouchEvent.TOUCH_END, pauseHandler);
			main.back_btn2.addEventListener(TouchEvent.TOUCH_END, backHandler);
		}

		override public function update() {
			if (!GameState.pauseTick) {
				if (player.lives <= 0) {
					endGame();
				}
				player.update();
				pm.update();
				spawnProjectile();
				updateHud();
				tick++;
			}
		}

		private function endGame() {
			main.removeAllChildren();
			main.setScore(points);
			main.changeState("GAMEOVER");
		}

		private function pauseHandler(e: TouchEvent) {
			GameState.pauseTick = !GameState.pauseTick;
			if (GameState.pauseTick) {
				main.back_btn2.visible = true;
				main.pause_btn.gotoAndStop("PLAY");
			} else {
				main.back_btn2.visible = false;
				main.pause_btn.gotoAndStop("PAUSE");
			}
		}

		private function backHandler(e: TouchEvent) {
			main.removeAllChildren();
			main.setScore(points);
			main.changeState("HOME");
		}

		private function updateHud() {
			points = Math.floor(tick / 24);
			main.pointTxt.text = points.toString();
			main.livesCount.gotoAndStop(player.lives.toString());
		}

		private function spawnProjectile() {
			if (tick % spawnTimer == 0) {
				pm.createProj(player);
			}
		}

		private function movePlayer(e: TouchEvent) {
			player.moveTo(e.stageX, e.stageY);
		}

		private function onTouch(e: TouchEvent) {
			player.moveTo(e.stageX, e.stageY);
			main.stage.addEventListener(TouchEvent.TOUCH_MOVE, movePlayer);
		}

		private function endTouch(e: TouchEvent) {
			main.stage.removeEventListener(TouchEvent.TOUCH_MOVE, movePlayer);
		}

	}

}