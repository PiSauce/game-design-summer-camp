
package  {
	import flash.display.MovieClip;
	
	public class HitBox extends MovieClip{
		private var dmg:int;

		public function HitBox() {
			// constructor code
		}
		
		public function setDmg(dmg:int){
			this.dmg = dmg;
		}
		
		public function getDmg(){
			return dmg;
		}
		
		public function showHitbox(){
			this.visible = true;
		}
		
		public function hideHitbox(){
			this.visible = false;
		}
		
	}
	
}
