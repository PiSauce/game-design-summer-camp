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

		public function addBtn(btn) {
			btnList.push(btn);
		}

		public function getStateName() {
			return stateName;
		}
		
		public function update(){
			// Something idk
		}
		
	}

}