package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.sensors.Accelerometer;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.display.StageScaleMode;

	public class Main extends MovieClip {
		private var ball: Ball;
		public var accel: Accelerometer;

		public function Main() {
			// Create Ball
			ball = new Ball(20, 0x0000FF);

			stage.addChild(ball);

			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;

			// Init Accelerometer
			if (Accelerometer.isSupported) {
				accel = new Accelerometer();
				accel.setRequestedUpdateInterval(0);
				accel.addEventListener(AccelerometerEvent.UPDATE, accelUpdate);
			} else {
				trace("Get a better phone");
			}
			
			stage.addEventListener(Event.ENTER_FRAME, update);
			StageScaleMode.EXACT_FIT;
		}
		
		private function update(e:Event){
			ball.update();
		}

		private function accelUpdate(e: AccelerometerEvent): void {
			// Changes the ball's acceleration when the accelerometer updates
			ball.aX = e.accelerationX;
			ball.aY = e.accelerationY;
		}

	}

}