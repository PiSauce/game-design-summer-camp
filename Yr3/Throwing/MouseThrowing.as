package  {
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class MouseThrowing {
		private var t:Ball;
		private var s:Stage;
		
		private var xMouse:Array = [];
		private var yMouse:Array = [];

		public function MouseThrowing(target:Ball, s:Stage) {
			this.t = target;
			this.s = s;
			
			t.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			s.addEventListener(MouseEvent.MOUSE_MOVE, updateMouse);
		}
		
		private function updateMouse(e: MouseEvent) {
			xMouse.push(s.mouseX);
			if (xMouse.length > 2) {
				xMouse.shift();
			}

			yMouse.push(s.mouseY);
			if (yMouse.length > 2) {
				yMouse.shift();
			}
		}

		private function drag(e: MouseEvent) {
			t.beingDragged = true;
			t.startDrag();
		}

		private function endDrag(e: MouseEvent) {
			t.stopDrag();

			if (t.beingDragged) {
				t.xVel = xMouse[1] - xMouse[0];
				t.yVel = yMouse[1] - yMouse[0];
			}

			t.beingDragged = false;
			s.removeEventListener(MouseEvent.MOUSE_DOWN, drag);
		}

		private function onDown(e: MouseEvent) {
			t.xVel = 0;
			t.yVel = 0;
			s.addEventListener(MouseEvent.MOUSE_UP, endDrag)
			s.addEventListener(MouseEvent.MOUSE_DOWN, drag);
		}

	}
	
}
