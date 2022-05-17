package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;

	public class Main extends MovieClip {
		private var key: KeyboardListener;
		public var player: Player;
		private var platform: Platform;
		public var level: Level;
		private var spawn: Spawn;
		private var air: Air;
		private var goal: Goal;
		private var badThing: BadThing;
		private var jumpPad: JumpPad;
		private var maxLevel: int = 999;

		public function Main() {
			SkyCollisionDetection.registerRoot(this);
			key = new KeyboardListener(stage);
			platform = new Platform(stage);
			spawn = new Spawn();
			air = new Air();
			goal = new Goal();
			badThing = new BadThing();
			jumpPad = new JumpPad();
			
			level = new Level(this, spawn, platform, air, goal, badThing, jumpPad);
			level.removeListeners();

			hud.visible = false;
			menu.visible = true;
			menu.lvls.visible = false;

			menu.startBtn.addEventListener(MouseEvent.CLICK, startBtn);
			menu.lvlSelect.addEventListener(MouseEvent.MOUSE_UP, lvlSelect);
		}

		private function startBtn(e: MouseEvent) {
			start(0);
		}

		private function lvlSelect(e: MouseEvent) {
			menu.lvls.visible = true;
			menu.lvls.gotoAndPlay(0);

			menu.lvls.lvl1.addEventListener(MouseEvent.CLICK, lvl1);
			menu.lvls.lvl2.addEventListener(MouseEvent.CLICK, lvl2);
			menu.lvls.lvl3.addEventListener(MouseEvent.CLICK, lvl3);
			menu.lvls.lvl4.addEventListener(MouseEvent.CLICK, lvl4);
			menu.lvls.lvl5.addEventListener(MouseEvent.CLICK, lvl5);
			menu.lvls.lvl6.addEventListener(MouseEvent.CLICK, lvl6);
			menu.lvls.lvl7.addEventListener(MouseEvent.CLICK, lvl7);
			menu.lvls.lvl8.addEventListener(MouseEvent.CLICK, lvl8);
			menu.lvls.lvl9.addEventListener(MouseEvent.CLICK, lvl9);
			menu.lvls.lvl10.addEventListener(MouseEvent.CLICK, lvl10);
			menu.lvls.lvl11.addEventListener(MouseEvent.CLICK, lvl11);
			menu.lvls.lvl12.addEventListener(MouseEvent.CLICK, lvl12);
		}

		public function nextLevel() {
			removeChild(player);
			player = new Player(key, level);
			addChild(player);
		}

		public function gotoMenu() {
			if (level.curLevel > maxLevel) {
				maxLevel = level.curLevel;
			}
			level.removeListeners();
			removeChild(player);
			removeChild(level);
			hud.visible = false;
			menu.visible = true;
			menu.lvls.visible = false;

			menu.startBtn.addEventListener(MouseEvent.CLICK, startBtn);
			menu.lvlSelect.addEventListener(MouseEvent.MOUSE_UP, lvlSelect);
			stage.removeEventListener(Event.ENTER_FRAME, update);
		}

		private function update(e: Event) {
			player.update();

			hud.blockCount.gotoAndStop(player.blocks + 1);
			hud.livesCount.gotoAndStop(player.lives + 1);

			if (player.lives <= 0) {
				gotoMenu();
			}
		}

		private function reset(e: MouseEvent) {
			level.remakeLevel();
			player.resetPlayer();
		}

		private function start(lvl: int) {
			hud.visible = true;
			menu.visible = false;
			
			level.changeLevel(lvl)
			level.addListeners();

			addChild(level);
			player = new Player(key, level);
			addChild(player);
			menu.startBtn.removeEventListener(MouseEvent.CLICK, startBtn);
			menu.lvlSelect.removeEventListener(MouseEvent.MOUSE_UP, lvlSelect);
			hud.reset.addEventListener(MouseEvent.MOUSE_UP, reset);
			stage.addEventListener(Event.ENTER_FRAME, update);
		}

		private function lvl1(e: MouseEvent) {
			if (maxLevel > 0) {
				start(0);
			}
		}

		private function lvl2(e: MouseEvent) {
			if (maxLevel > 1) {
				start(1);
			}
		}

		private function lvl3(e: MouseEvent) {
			if (maxLevel > 2) {
				start(2);
			}
		}

		private function lvl4(e: MouseEvent) {
			if (maxLevel > 3) {
				start(3);
			}
		}

		private function lvl5(e: MouseEvent) {
			if (maxLevel > 4) {
				start(4);
			}
		}

		private function lvl6(e: MouseEvent) {
			if (maxLevel > 5) {
				start(5);
			}
		}

		private function lvl7(e: MouseEvent) {
			if (maxLevel > 6) {
				start(6);
			}
		}
		
		private function lvl8(e: MouseEvent) {
			if (maxLevel > 7) {
				start(7);
			}
		}
		
		private function lvl9(e: MouseEvent) {
			if (maxLevel > 8) {
				start(8);
			}
		}
		
		private function lvl10(e: MouseEvent) {
			if (maxLevel > 9) {
				start(9);
			}
		}
		
		private function lvl11(e: MouseEvent) {
			if (maxLevel > 10) {
				start(10);
			}
		}
		
		private function lvl12(e: MouseEvent) {
			if (maxLevel > 11) {
				start(11);
			}
		}
	}

}