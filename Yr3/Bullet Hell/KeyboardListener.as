package  {
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	
	public class KeyboardListener {
		private var keysPressed = new Dictionary();

		public function KeyboardListener(s:Stage) {
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}

		private function keyDown(e: KeyboardEvent){
			keysPressed[e.keyCode] = true;
		}
		
		private function keyUp(e:KeyboardEvent){
			keysPressed[e.keyCode] = false;
		}
		
		public function checkKey(key:int){
			return keysPressed[key] != null && keysPressed[key];
		}

	}
	
}
