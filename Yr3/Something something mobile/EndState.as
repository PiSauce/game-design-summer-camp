package  {
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	
	public class EndState extends GameState{

		public function EndState(main:Main) {
			super("GAMEOVER", main);
			GameState.pauseTick = true;
			main.pointTxt.text = PlayState.points.toString();
			
			// Touch point setup
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			main.back_btn.addEventListener(TouchEvent.TOUCH_END, backHandler);
		}
		
		private function backHandler(e:TouchEvent){
			main.changeState("HOME");
		}

	}
	
}
