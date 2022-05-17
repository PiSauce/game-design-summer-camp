package  {
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Main extends MovieClip{
		private var kbl:KeyboardListener;
		private var player:Player;
		public var HEIGHT:int = 400;
		public var WIDTH:int = 550;

		public function Main() {
			kbl = new KeyboardListener(stage);
			player = new Player(kbl, this);
			
			player.x = 275;
			player.y = 200;
			player.scaleX = 0.1;
			player.scaleY = 0.1;
			
			addChild(player);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event){
			player.update();
		}

	}
	
}
