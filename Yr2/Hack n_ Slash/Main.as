package {
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.MovieClip;

	public class Main extends MovieClip {
		public static var WIDTH:int = 550;
		public static var HEIGHT:int = 400;
		
		private var currentState: GameState;

		public function Main() {
			stop();
			currentState = new MenuState(this);

			stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		public function enterFrame(e: Event) {
			currentState.tick();
			if(!GameState.pauseTick){
				currentState.update();
			}
		}
		
		public function removeAllChildren(){
			while(numChildren > 0){
				removeChildAt(0);
			}
		}

		public function changeState(stateName: String) {
			switch (stateName) {
				case "HOME":
					gotoAndStop("HOME");
					currentState = new MenuState(this);
					break;
				case "GAME":
					gotoAndStop("GAME");
					currentState = new PlayState(this);
					break;
				case "TUTORIAL":
					gotoAndStop("TUTORIAL");
					currentState = new HelpState(this);
					break;
				case "GAMEOVER":
					gotoAndStop("GAMEOVER");
					currentState = new EndState(this);
					
			}
		}

	}

}