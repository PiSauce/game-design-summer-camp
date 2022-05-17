package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip{
		private var ball:Ball;
		private var mThrow: MouseThrowing;
		private var tThrow: TouchThrowing;
		
		private var xMouse: Array = [];
		private var yMouse: Array = [];

		public function Main() {
			ball = new Ball(20, 0x000000);
			mThrow = new MouseThrowing(ball, stage);
			//tThrow = new TouchThrowing(ball, stage);
			
			ball.x = stage.stageWidth/2;
			ball.y = stage.stageHeight/2;
			
			stage.addChild(ball);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event) {
			ball.update();
		}

	}
	
}
