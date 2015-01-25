package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.display.BitmapData;
import nme.display.Bitmap;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_4 extends SceneScript
{          	
	
public var _Encantado:Bool;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Encantado", "_Encantado");
_Encantado = false;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _Encantado = false;
propertyChanged("_Encantado", _Encantado);
        setGameAttribute("SceneController", 3);
        setGameAttribute("Inventory", 3);
        getActor(2).setAnimation("" + "BEC");
        stopAllSounds();
        loopSound(getSound(19));
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action1", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if(isInRegion(getActor(1), getRegion(0)))
{
            if((getGameAttribute("Inventory") == 3))
{
                setGameAttribute("String", "Now your staff is glowing");
                setGameAttribute("Inventory", 6);
}

            else
{
                setGameAttribute("String", "1 - You shall ... 2 - You shall not ... 3 - You shall not ...");
}

}

        else if(isInRegion(getActor(1), getRegion(1)))
{
            if((getGameAttribute("Inventory") == 6))
{
                setGameAttribute("String", "The river is opening");
}

            else
{
                setGameAttribute("String", "A flowing river ...");
}

}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action1", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if(((getGameAttribute("Inventory") == 7) || (getGameAttribute("Inventory") == 4)))
{
            setGameAttribute("String", "You tried to swim in the river with your bazooka ...");
            runLater(1000 * 1, function(timeTask:TimedTask):Void {
                        switchScene(GameModel.get().scenes.get(3).getID(), createFadeOut(2, Utils.getColorRGB(0,0,0)), createFadeIn(1, Utils.getColorRGB(0,0,0)));
}, null);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}