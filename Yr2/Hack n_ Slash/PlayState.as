package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class PlayState extends GameState {
		private var player: Player;
		public static var killCount:int;
		private var bkl: BetterKeyboardListener;
		private var em: EnemyManager;
		private var vCam:VCam;
		private var hud:Hud;
		private var red:Red;

		public function PlayState(main: Main) {
			PlayState.killCount = 0;
			super("PLAY", main);
			GameState.pauseTick = false;
			hud = new Hud();
			bkl = new BetterKeyboardListener(main.stage);
			hud = new Hud;
			player = new Player(bkl, hud, 100, main);
			em = new EnemyManager(main, player);
			vCam = new VCam;
			red = new Red;

			player.scaleX = 1;
			player.scaleY = 1;

			main.addChild(red);
			main.addChild(player);
			main.addChild(vCam);
			main.addChild(hud);
		}
		
		// Creates an enemy at a random coordinate on the screen
		private function generateEnemies(){
			var spawnRate = 72;
			if(this.getTick() % spawnRate == 0){
				em.addEnemyRandCoor();
				spawnRate -= 1;
			}
			if(spawnRate < 12){
				spawnRate = 12;
			}
		}
		
		// Overrides the update function from Main to update both the player and enemies
		
		override public function update() {
			player.update();
			generateEnemies();
			em.update();
			updateHUD();
			isGameOver();
		}
		
		private function isGameOver(){
			if(player.isDead()){
				main.removeAllChildren();
				main.changeState("GAMEOVER");
			}
		}
		
		public function updateHUD(){
			looseFollow(player, vCam);
			hud.x = vCam.x;
			hud.y = vCam.y;
			red.x = vCam.x;
			red.y = vCam.y;
			red.alpha = (1 - player.getHealth()) * 0.5;
		}
		
		public function looseFollow(target:MovieClip, follow:MovieClip){
			var deltaX = target.x - follow.x;
			var deltaY = target.y - follow.y;
			var factor = 4;
			follow.x += deltaX / factor;
			follow.y += deltaY / factor;
		}

	}

}