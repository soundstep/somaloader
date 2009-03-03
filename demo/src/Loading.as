package {
	import caurina.transitions.Tweener;		import com.soma.loader.ILoading;	import com.soma.loader.SomaLoaderEvent;		import flash.display.Sprite;	import flash.text.AntiAliasType;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;		
	/**
	 * <b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a><br />
	 * <b>Class version:</b> 1.0<br />
	 * <b>Actionscript version:</b> 3.0<br />
	 * <b>Copyright:</b> 
	 * <br />
	 * <b>Date:</b> 20 Feb 2009<br />
	 * <b>Usage:</b>
	 * @example
	 * <listing version="3.0"></listing>
	 */
	
	public class Loading extends Sprite implements ILoading {

		//------------------------------------
		// private, protected properties
		//------------------------------------
		
		//------------------------------------
		// public properties
		//------------------------------------
		
		public var info:TextField;
		public var line:Sprite;
		public var lineItem:Sprite;
		
		//------------------------------------
		// constructor
		//------------------------------------
		
		public function Loading() {
			alpha = 0;
			visible = false;
			draw();
		}
		
		//
		// PRIVATE, PROTECTED
		//________________________________________________________________________________________________
		
		private function draw():void {
			graphics.beginFill(0x000000, .7);
			graphics.drawRect(0, 0, 180, 40);
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";
			tf.size = 11;
			info = new TextField();
			info.defaultTextFormat = tf;
			info.antiAliasType = AntiAliasType.ADVANCED;
			info.autoSize = TextFieldAutoSize.LEFT;
			info.embedFonts = true;
			info.textColor = 0xFFFFFF;
			info.x = 10;
			info.y = 8;
			addChild(info);
			line = new Sprite();
			line.x = 10;
			line.y = 30;
			line.graphics.beginFill(0xFFFFFF);
			line.graphics.drawRect(0, 0, 160, 1);
			line.width = 0;
			addChild(line);
			lineItem = new Sprite();
			lineItem.x = 10;
			lineItem.y = 28;
			lineItem.graphics.beginFill(0xFFFFFF);
			lineItem.graphics.drawRect(0, 0, 160, 1);
			lineItem.width = 0;
			addChild(lineItem);
		}
		
		//
		// PUBLIC
		//________________________________________________________________________________________________
		
		public function itemStart(event:SomaLoaderEvent):void {
			
		}
		
		public function itemProgress(event:SomaLoaderEvent):void {
			lineItem.width = 160 * event.percentItem / 100;
		}
		
		public function itemComplete(event:SomaLoaderEvent):void {
			
		}
		
		public function queueStart():void {
			Tweener.addTween(this, {time: .7, _autoAlpha:1});
		}

		public function queueProgress(event:SomaLoaderEvent):void {
			info.htmlText = "Loading " + Math.round(event.percentQueue) + "%";
			line.width = 160 * event.percentQueue / 100;
		}
		
		public function queueComplete():void {
			Tweener.addTween(this, {time: .7, _autoAlpha:0});
		}
		
		public function error(event:SomaLoaderEvent):void {
			
		}
		
	}
	
}
