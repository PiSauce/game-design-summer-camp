package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip{
		private var kbl:KeyboardListener;
		private var bm:BulletManager;
		private var player:Player;
		private var tick:int;
		public var pauseTick:Boolean;

		public function Main() {
			pauseTick = false;
			
			kbl = new KeyboardListener(stage);
			bm = new BulletManager(this);
			player = new Player(this, kbl, bm);
			
			addChild(player);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event){
			player.update();
			bm.update();
			tick++;
		}
		
		public function getTick(){
			return tick;
		}

	}
	
}
