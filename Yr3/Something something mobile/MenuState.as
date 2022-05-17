package {
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class MenuState extends GameState {

		public function MenuState(main: Main) {
			super("HOME", main);
			GameState.pauseTick = true;
			initButtons();
			showScore();
		}
		
		private function showScore(){
			if(main.hiScore.data.score[0] != null){
				main.score1.text = main.hiScore.data.score[0].toString();
			} else {
				main.score1.text = "0";
			}
			if(main.hiScore.data.score[1] != null){
				main.score2.text = main.hiScore.data.score[1].toString();
			} else {
				main.score2.text = "0";
			}
			if(main.hiScore.data.score[2] != null){
				main.score3.text = main.hiScore.data.score[2].toString();
			} else {
				main.score3.text = "0";
			}
			if(main.hiScore.data.score[3] != null){
				main.score4.text = main.hiScore.data.score[3].toString();
			} else {
				main.score4.text = "0";
			}
			if(main.hiScore.data.score[4] != null){
				main.score5.text = main.hiScore.data.score[4].toString();
			} else {
				main.score5.text = "0";
			}
		}

		private function initButtons() {
			addBtn(main.play_btn);
			addBtn(main.help_btn);
			
			// Touch point setup
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;

			main.play_btn.addEventListener(TouchEvent.TOUCH_END, playHandler);
			main.help_btn.addEventListener(TouchEvent.TOUCH_END, helpHandler);
		}

		private function playHandler(e: TouchEvent) {
			main.changeState("GAME");
		}

		private function helpHandler(e: TouchEvent) {
			main.changeState("HELP");
		}

	}

}