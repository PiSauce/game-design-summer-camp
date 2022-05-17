package {
	import flash.display.Stage;
	import flash.display.MovieClip;

	public class ProjectileManager {
		private var main: Main;
		private var pList: Array;
		private var player:Player;

		public function ProjectileManager(main:Main, player:Player) {
			this.main = main;
			this.pList = [];
			this.player = player;
		}

		public function update() {
			for (var i = 0; i < pList.length; i++) {
				var p: Projectile = pList[i];
				p.update();
				if(p.checkHit()){
					player.lives--;
					main.removeChild(p);
					pList.removeAt(i);
				}
			}
		}

		public function createProj(target: Player) {
			var p: Projectile = new Projectile(target, main);
			main.addChild(p);
			pList.push(p);
		}
		
		public function removeAll() {// A function to remove all bullets just in case
			while (pList.length > 0) {
				pList.pop();
			}
		}

	}

}