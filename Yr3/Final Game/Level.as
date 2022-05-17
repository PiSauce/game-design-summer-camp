package {
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Level extends Sprite {
		private var main: Main;
		public var platform: Platform;
		public var spawn: Spawn;
		public var air: Air;
		public var goal: Goal;
		public var highlight: Tile;
		public var bad: BadThing;
		public var jumpPad: JumpPad;

		private var tutorial: Tutorial;

		private var levelArray: Array;
		public var curLevel: int;

		public function Level(main: Main, s: Spawn, p: Platform, a: Air, g: Goal, b: BadThing, j: JumpPad) {
			this.main = main;
			this.platform = p;
			this.spawn = s;
			this.air = a;
			this.goal = g;
			this.bad = b;
			this.jumpPad = j;
			tutorial = new Tutorial;
			highlight = new Tile(0xDDDDDD);

			this.levelArray = [];
			this.curLevel = 0;
		}

		public function changeLevel(level: int): void {
			tutorial.gotoAndStop(level + 1);
			curLevel = level;
			clear();
			/* A blank level
			else if (level == n) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				];
			}
			*/
			if (level == 0) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 3, 0],
					[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
				];
			} else if (level == 1) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 3, 0],
					[1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1],
				];
			} else if (level == 2) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 3, 0],
					[1, 1, 1, 1, 4, 4, 4, 1, 1, 1, 1],
				];
			} else if (level == 3) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 4, 0, 0, 0, 3, 0, 0],
					[1, 1, 1, 0, 4, 0, 0, 1, 1, 1, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0],
				];
			} else if (level == 4) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
				];
			} else if (level == 5) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0],
					[0, 0, 0, 6, 6, 6, 6, 6, 0, 0, 0],
					[2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3],
					[1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1],
					[0, 0, 0, 5, 5, 5, 5, 5, 0, 0, 0],
				];
			} else if (level == 6) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[2, 0, 0, 6, 6, 6, 6, 6, 0, 0, 3],
					[1, 1, 0, 6, 6, 6, 6, 6, 0, 1, 1],
					[0, 0, 0, 5, 5, 5, 5, 5, 0, 0, 0],
				];
			} else if (level == 7) {
				levelArray = [
					[0, 0, 0, 6, 6, 6, 0, 0, 0, 0, 0],
					[2, 0, 0, 6, 6, 6, 0, 0, 0, 0, 3],
					[1, 1, 0, 6, 6, 6, 0, 0, 0, 1, 1],
					[0, 0, 0, 6, 6, 6, 0, 0, 0, 0, 0],
					[0, 0, 0, 6, 6, 6, 0, 0, 0, 0, 0],
					[0, 0, 0, 6, 6, 6, 0, 0, 0, 0, 0],
					[0, 0, 0, 6, 6, 6, 0, 0, 0, 0, 0],
				];
			} else if (level == 8) {
				levelArray = [
					[0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0],
					[2, 0, 0, 0, 0, 6, 6, 6, 6, 0, 3],
					[1, 1, 0, 0, 0, 6, 6, 6, 6, 1, 1],
					[0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0],
					[0, 0, 0, 0, 0, 6, 6, 6, 0, 0, 0],
					[0, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0],
				];
			} else if (level == 9) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 4, 0, 4, 0, 0, 0, 0],
					[0, 0, 0, 0, 4, 3, 4, 0, 5, 0, 0],
					[0, 0, 0, 0, 4, 0, 4, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 5, 0, 0],
					[1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
				];
			} else if (level == 10) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[1, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0],
				];
			} else if (level == 11) {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
					[0, 2, 0, 0, 0, 0, 0, 0, 0, 5, 0],
					[1, 1, 1, 0, 4, 4, 4, 0, 0, 0, 0],
				];
			} else {
				levelArray = [
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
					[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				];
			}

			makeLevel();
		}

		public function makeLevel() {
			for (var row: int = 0; row < levelArray.length; row++) {
				for (var col: int = 0; col < levelArray[row].length; col++) {
					var tile: Tile;
					if (levelArray[row][col] == 0) {
						tile = new Tile(0xFFFFFF);
						air.addChild(tile);
					}
					if (levelArray[row][col] == 1) {
						tile = new Tile(0x000000);
						platform.addChild(tile);
					}
					if (levelArray[row][col] == 2) {
						tile = new Tile(0x00FF00);
						spawn.addChild(tile);
						tile.x -= tile.width / 2;
						tile.y -= tile.width / 2;
						spawn.x = col * tile.width + tile.width / 2;
						spawn.y = row * tile.height + tile.width / 2;
						continue;
					}
					if (levelArray[row][col] == 3) {
						tile = new Tile(0x00FF00);
						goal.addChild(tile);
						goal.x = col * tile.width;
						goal.y = row * tile.height;
						continue;
					}
					if (levelArray[row][col] == 4) {
						tile = new Tile(0xFF0000);
						bad.addChild(tile);
					}
					if (levelArray[row][col] == 5) {
						tile = new Tile(0x0000FF);
						jumpPad.addChild(tile);
					}
					if (levelArray[row][col] == 6) {
						continue;
					}

					tile.x = col * tile.width;
					tile.y = row * tile.height;
				}
			}

			this.addChild(platform);
			this.addChild(bad);
			this.addChild(jumpPad);
			this.addChild(spawn);
			this.addChild(air);
			this.addChild(goal);
			this.addChild(highlight);
			highlight.x = 0;
			highlight.y = 0;
			this.addChild(tutorial);
			tutorial.x = main.stage.stageWidth / 2;
			tutorial.y = main.stage.stageHeight / 2;
		}

		public function remakeLevel() {
			clear();
			changeLevel(curLevel);
		}

		public function nextLevel() {
			curLevel++;
			clear();
			changeLevel(curLevel);
			main.nextLevel();
		}

		public function removeListeners() {
			main.stage.removeEventListener(Event.ENTER_FRAME, hover);
			highlight.removeEventListener(MouseEvent.CLICK, placeBlock);
		}

		public function addListeners() {
			main.stage.addEventListener(Event.ENTER_FRAME, hover);
			highlight.addEventListener(MouseEvent.CLICK, placeBlock);
		}

		private function hover(e: Event) {
			for (var i = 0; i < air.getChildren(); i++) {
				var tile = air.getChild(i);
				var a = mouseX - main.player.x;
				var b = mouseY - main.player.y;
				var dist = Math.sqrt(a * a + b * b);
				if (tile.hitTestPoint(mouseX, mouseY) && dist < 150) {
					highlight.x = tile.x;
					highlight.y = tile.y;
				}
			}
		}

		private function placeBlock(e: MouseEvent) {
			var p: Player = main.player;
			if (!SkyCollisionDetection.bitmapHitTest(highlight, p) && p.blocks > 0) {
				this.removeChild(platform);
				var tile: Tile = new Tile(0x000000);
				platform.addChild(tile)
				tile.x = highlight.x;
				tile.y = highlight.y;
				this.addChild(platform);
				p.blocks -= 1;
			}
		}

		private function clear() {
			platform.removePlatform();
			spawn.removeSpawn();
			air.removeAir();
			goal.removeGoal();
			bad.removeBad();
			jumpPad.removeJump();
			try {
				this.removeChild(highlight);
				this.removeChild(platform);
				this.removeChild(air);
				this.removeChild(goal);
				this.removeChild(spawn);
				this.removeChild(tutorial);
				this.removeChild(bad);
				this.removeChild(jumpPad);
			} catch (error: Error) {

			}
		}

	}

}