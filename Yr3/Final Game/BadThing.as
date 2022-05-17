package  {
	import flash.display.Sprite;
	
	public class BadThing extends Sprite{

		public function BadThing() {
			// constructor code
		}
		
		public function removeBad() {
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}

	}
	
}
