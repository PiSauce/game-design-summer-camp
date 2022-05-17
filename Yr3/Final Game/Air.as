package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	
	public class Air extends Sprite{

		public function Air() {
			
		}
		
		public function removeAir(){
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}
		
		public function getChildren(){
			return this.numChildren;
		}
		
		public function getChild(index:int){
			return this.getChildAt(index);
		}

	}
	
}
