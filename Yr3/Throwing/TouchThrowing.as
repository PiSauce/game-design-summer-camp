package  {
	import flash.display.Stage;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import flash.display.Sprite;
	
	public class TouchThrowing {
		private var t:Ball;
		private var s:Stage;

		public function TouchThrowing(target:Ball, s:Stage) {
			// Init variables;
			this.t = target;
			this.s = s;
			
			// Touch point gesture
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// Event listeners
			t.addEventListener(TouchEvent.TOUCH_BEGIN, onTouch);
			t.addEventListener(TouchEvent.TOUCH_END, endTouch);
		}
		
		private function onTouch(e: TouchEvent){
			
		}

	}
	
}
