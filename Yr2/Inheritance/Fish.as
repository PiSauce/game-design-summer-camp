package  {
	
	public class Fish extends Animal {
		public var depth:int;
		public var lipSize:int;
		public var canCamo:Boolean;
		
		public function Fish(depth:int, lipSize:int, canCamo:Boolean, intel:int, isAlive:Boolean) {
			super(0, intel, isAlive);
			this.depth = depth;
			this.lipSize = lipSize;
			this.canCamo = canCamo;
		}

	}
	
}
