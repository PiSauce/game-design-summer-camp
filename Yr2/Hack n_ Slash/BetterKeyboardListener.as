package {

	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	import flash.utils.Dictionary;
	import flash.display.MovieClip;
	public class BetterKeyboardListener {
		private var keysPressed = new Dictionary();
		public function BetterKeyboardListener(s:Stage) {
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyPress);
			s.addEventListener(KeyboardEvent.KEY_UP, keyRelease);
		}
	
		private function keyPress(e: KeyboardEvent): void {
			keysPressed[e.keyCode] = true;
		}

		private function keyRelease(e: KeyboardEvent): void {
			keysPressed[e.keyCode] = false;
		}
		public function checkKey(keyCode: int): Boolean {
			if (keysPressed[keyCode] != null && keysPressed[keyCode] == true) {
				return true;
			}
			return false;

		}	

	}

}