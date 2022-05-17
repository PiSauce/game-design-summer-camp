package  {
	import flash.events.MouseEvent;
	
	public class EndState extends GameState{

		public function EndState(main:Main) {
			super("GAMEOVER", main);
			GameState.pauseTick = true;
			
			main.killText.text = PlayState.killCount.toString();
			
			main.backBtn.addEventListener(MouseEvent.MOUSE_UP, backHandler);
		}
		
		private function backHandler(e:MouseEvent){
			main.changeState("HOME");
		}

	}
	
}
