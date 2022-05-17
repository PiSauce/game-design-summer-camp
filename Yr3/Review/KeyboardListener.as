package  {
	import flash.utils.Dictionary;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardListener {
		private var keysPressed = new Dictionary;

		public function KeyboardListener(s:Stage) {
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(e:KeyboardEvent){
			keysPressed[e.keyCode] = true;
		}
		
		private function keyUp(e:KeyboardEvent){
			keysPressed[e.keyCode] = false;
		}
		
		public function checkKey(key:int):Boolean {
			return keysPressed[key] != null && keysPressed[key];
		}

	}
	
}
