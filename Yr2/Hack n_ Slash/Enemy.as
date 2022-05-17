package {
	import flash.display.MovieClip;

	public class Enemy extends MovieClip {
		private var player: Player;
		private var speed: int;
		private var minRange: int;
		private var curHealth: int;
		private var curState: String;
		private var totalHealth: int;
		private var hit: Boolean;
		private var tick: int;
		private var cooldown: int;
		private var hitPlayer: Boolean;
		private var attackRate: int;
		private var damage: int;
		private var enemyName: String;
		private var main: Main;
		public var am: ArrowManager;

		public function Enemy(player: Player, health: int, main: Main, enemyName) {
			this.player = player;
			totalHealth = health;
			curHealth = health;
			curState = "IDLE";
			hitPlayer = false;
			hit = false;
			tick = 1;
			this.speed = Math.random() * 3 + 4;
			damage = 36 - attackRate;

			am = new ArrowManager(main);

			this.enemyName = enemyName;

			this.gotoAndStop(enemyName + "IDLE");

			this.scaleX = 0.3;
			this.scaleY = 0.3;

			this.x = (Math.random() * 2130) - 1065;
			this.y = (Math.random() * 2130) - 1065;
			
			if(this.enemyName == "BASIC"){
				minRange = this.width/2;
				attackRate = Math.random() * 24 + 12;
			} else if(this.enemyName == "ARCHER") {
				minRange = 200;
				attackRate = Math.random() * 24 + 24;
			}

			this.healthBar.alpha = 0;
		}

		public function update() {
			move();
			beingAttacked();
			updateHealthBar();
			attackPlayer();
			updateState();
			am.update();

			if(distToPlayer() <= minRange + 70) {
				tick++;
			}
		}

		private function attackPlayer() {
			if(cooldown + attackRate <= tick) {
				curState = "ATTACK";
				this.gotoAndStop(enemyName + "ATTACK");
				cooldown = tick;
			}
		}

		private function beingAttacked() {
			var playerState: String = player.getState();
			var hitBox: HitBox;
			var dmg: int;
			if(playerState == "ATTACK1") {
				hitBox = player.attack1.hitBox;
				if(hit == false && hitBox != null && this.hitTestObject(hitBox)) {
					this.healthBar.alpha = 1;
					dmg = hitBox.getDmg();
					curHealth -= dmg;
					hit = true;
				}
				if(hitBox == null) {
					hit = false;
				}
			} else if(playerState == "ATTACK2") {
				hitBox = player.attack2.hitBox;
				if(hit == false && hitBox != null && this.hitTestObject(hitBox)) {
					this.healthBar.alpha = 1;
					dmg = hitBox.getDmg();
					curHealth -= dmg;
					hit = true;
				}
				if(hitBox == null) {
					hit = false;
				}
			} else if(playerState == "ATTACK3") {
				hitBox = player.attack3.hitBox;
				if(hit == false && hitBox != null && this.hitTestObject(hitBox)) {
					this.healthBar.alpha = 1;
					dmg = hitBox.getDmg();
					curHealth -= dmg;
					hit = true;
				}
				if(hitBox == null) {
					hit = false;
				}
			} else if(player.getState() == "IDLE") {
				hit = false;
			}
		}

		private function updateState() {
			if(curState == "ATTACK") {
				if(enemyName == "BASIC") {
					if(this.attack.hitBox != null && !hitPlayer) {
						this.attack.hitBox.setDmg(damage);
						player.attackedBy(this);
					} else if(this.attack.hitBox == null) {
						hitPlayer = false;
					}
					if(this.attack.currentFrame == this.attack.totalFrames) {
						curState = "IDLE";
						this.gotoAndStop(enemyName + "IDLE");
						player.setHit(false);
					}
				}
				if(enemyName == "ARCHER"){
					if(this.attack2.currentFrame == 16){
						am.createArrow(this, player, 20, 50);
					}
					if(this.attack2.currentFrame == this.attack2.totalFrames) {
						curState = "IDLE";
						this.gotoAndStop(enemyName + "IDLE");
					}
				}
			}
		}

		private function updateHealthBar() {
			var healthLeft: int = Math.floor(curHealth / totalHealth * 100);
			if(this.healthBar.alpha >= 0) {
				this.healthBar.alpha -= 0.05;
			}
			if(healthLeft <= 0) {
				this.healthBar.gotoAndStop(0);
			} else {
				this.healthBar.gotoAndStop(healthLeft);
			}
		}

		public function distToPlayer() {
			var deltaX = player.x - this.x;
			var deltaY = player.y - this.y;
			var a = deltaX * deltaX;
			var b = deltaY * deltaY;
			return Math.sqrt(a + b);
		}

		public function isDead() {
			return curHealth <= 0;
		}

		public function getState() {
			return curState;
		}

		public function setHitPlayer(isHit: Boolean) {
			hitPlayer = isHit;
		}

		private function move() {
			this.rotation = (Math.atan2((player.y - this.y), (player.x - this.x)) * 180 / Math.PI);
			var dist = distToPlayer();
			if(curState == "IDLE") {
				if(dist > minRange + speed) {
					this.x += Math.cos(this.rotation * Math.PI / 180) * speed;
					this.y += Math.sin(this.rotation * Math.PI / 180) * speed;
				}
			}

		}
	}
}