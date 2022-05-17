package {
	import flash.display.Stage;
	import flash.display.Sprite;

	public class Platform extends Sprite {
		private var levelArray: Array;

		public function Platform(s: Stage) {
			
		}
		
		public function removePlatform(){
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}

	}

}