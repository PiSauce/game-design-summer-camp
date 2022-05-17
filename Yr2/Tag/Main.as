package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Main extends MovieClip{
		public var player:Player;
		public var bkl:BetterKeyboardListener;
		public var vCam:VCam;
		
		public var timer:Timer;
		public var spawnRate:int;
		
		public var asteroidList:Array;
		public var goal:int;

		public function Main() {
			stop();
			vCam = new VCam();
			bkl = new BetterKeyboardListener(stage);
			player = new Player(bkl);
			asteroidList = [];
			
			spawnRate = 1;
			timer = new Timer(spawnRate * 1000);
			timer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			timer.start();
			
			player.x = 275;
			player.y = 200;
			
			addChild(vCam);
			addChild(player);
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		public function enterFrame(e:Event){
			player.update();
			updateEnemies();
			vcamLooseFollow();
		}
		
		public function spawnEnemy(e:TimerEvent){
			createEnemy();
		}
		
		public function createEnemy(){
			var e:Enemy = new Enemy(player);
			addChild(e);
			asteroidList.push(e);
		}
		
		public function updateEnemies(){
			for(var i = 0; i < asteroidList.length; i++){
				asteroidList[i].update();
				if(asteroidList[i].hitTestObject(player)){
					gameLose();
				}
			}
		}
		
		public function gameLose(){
			gotoAndStop("win");
			timer.stop();
			removeChild(player);
			removeChild(vCam);
			for each(var e in asteroidList){
				removeChild(e);
			}
			stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		public function vcamLooseFollow(){
			var deltaX = player.x - vCam.x;
			var deltaY = player.y - vCam.y;
			var factor = 4;
			vCam.x += deltaX / factor;
			vCam.y += deltaY / factor;
		}

	}
	
}
