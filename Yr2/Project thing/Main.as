package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	public class Main extends MovieClip{
		
		public var tank:Tank;
		public var bkl:BetterKeyboardListener;
		
		public function Main() {
			bkl = new BetterKeyboardListener(stage);
			tank = new Tank(bkl);
			
			tank.x = 270;
			tank.y = 200;
			addChild(tank);
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
			
		public function enterFrame(e:Event){
			tank.update();
		}
	}
}
