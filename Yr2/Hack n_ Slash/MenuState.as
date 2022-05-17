package {
	import flash.events.MouseEvent;

	public class MenuState extends GameState {

		public function MenuState(main: Main) {
			super("HOME", main);
			GameState.pauseTick = true;
			initButtons();
		}

		private function initButtons() {
			addBtn(main.play_btn);
			addBtn(main.help_btn);

			main.play_btn.addEventListener(MouseEvent.MOUSE_UP, playHandler);
			main.help_btn.addEventListener(MouseEvent.MOUSE_UP, helpHandler);
		}

		private function playHandler(e: MouseEvent) {
			main.changeState("GAME");
		}

		private function helpHandler(e: MouseEvent) {
			main.changeState("TUTORIAL");
		}

	}

}