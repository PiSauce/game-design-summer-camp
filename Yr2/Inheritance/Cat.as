package  {
	
	public class Cat {
		public var hasFur:Boolean;
		public var hasChildren:Boolean;
		public var size:int;
		
		public function Cat(hasFur:Boolean, hasChildren:Boolean, size:int, intel:int, isAlive:int) {
			super(4, intel, isAlive);
			this.hasFur = hasFur;
			this.hasChildren = hasChildren;
			this.size = size;
		}

	}
	
}
