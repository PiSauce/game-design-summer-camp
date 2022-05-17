package {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;

	public class GameState {
		private var btnList: Array;
		private var stateName: String;
		private var ticks: int;
		public var main: Main;
		public static var pauseTick: Boolean;

		public function GameState(sn: String, main: Main) {
			this.main = main;
			btnList = [];
			stateName = sn;
			pauseTick = false;
			ticks = 0;
		}

		public function addBtn(btn: SimpleButton) {
			btnList.push(btn);
		}

		public function getStateName() {
			return stateName;
		}
		
		public function getTick(){
			return ticks;
		}

		public function tick() {
			if (!GameState.pauseTick) {
				ticks++;
			}
		}

		public function update() {
			tick();
		}

	}

}