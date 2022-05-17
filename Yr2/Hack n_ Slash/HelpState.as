package {
	import flash.events.MouseEvent;

	public class HelpState extends GameState {

		public function HelpState(main: Main) {
			super("TUTORIAL", main);
			GameState.pauseTick = true;
			initButtons();
		}

		private function initButtons() {
			addBtn(main.back_btn);

			main.back_btn.addEventListener(MouseEvent.MOUSE_UP, backHandler);
		}

		private function backHandler(e: MouseEvent) {
			main.changeState("HOME");
		}

	}

}