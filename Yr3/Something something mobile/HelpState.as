package {
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;

	public class HelpState extends GameState {

		public function HelpState(main: Main) {
			super("HELP", main);
			GameState.pauseTick = true;
			initButtons();
		}

		private function initButtons() {
			addBtn(main.back_btn);
			
			// Touch point setup
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;

			main.back_btn.addEventListener(TouchEvent.TOUCH_END, backHandler);
		}

		private function backHandler(e: TouchEvent) {
			main.changeState("HOME");
		}

	}

}