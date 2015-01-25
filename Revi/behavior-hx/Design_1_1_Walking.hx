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



class Design_1_1_Walking extends ActorScript
{          	
	
public var _speed:Float;

public var _walkR:String;

public var _walkL:String;

public var _walkU:String;

public var _walkD:String;

public var _isWalking:Bool;

public var _lookingR:Bool;

public var _lookingUp:Bool;

public var _idleR:String;

public var _idleL:String;

public var _idleU:String;

public var _idleD:String;

public var _lookingDown:Bool;

public var _side:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("speed", "_speed");
_speed = 0.0;
nameMap.set("walkR", "_walkR");
nameMap.set("walkL", "_walkL");
nameMap.set("walkU", "_walkU");
nameMap.set("walkD", "_walkD");
nameMap.set("isWalking", "_isWalking");
_isWalking = false;
nameMap.set("lookingR", "_lookingR");
_lookingR = false;
nameMap.set("lookingUp", "_lookingUp");
_lookingUp = false;
nameMap.set("idleR", "_idleR");
nameMap.set("idleL", "_idleL");
nameMap.set("idleU", "_idleU");
nameMap.set("idleD", "_idleD");
nameMap.set("lookingDown", "_lookingDown");
_lookingDown = false;
nameMap.set("Actor", "actor");
nameMap.set("side", "_side");
_side = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        /* 0 - up
1 - right
2 - down
3 - left */
        _isWalking = false;
propertyChanged("_isWalking", _isWalking);
        if(isKeyDown("right"))
{
            actor.setXVelocity(_speed);
            _isWalking = true;
propertyChanged("_isWalking", _isWalking);
            _side = asNumber(1);
propertyChanged("_side", _side);
}

        else if(isKeyDown("left"))
{
            actor.setXVelocity(-(_speed));
            _isWalking = true;
propertyChanged("_isWalking", _isWalking);
            _side = asNumber(3);
propertyChanged("_side", _side);
}

        else
{
            actor.setXVelocity(0);
}

        if(isKeyDown("up"))
{
            actor.setYVelocity(-(_speed));
            _isWalking = true;
propertyChanged("_isWalking", _isWalking);
            _side = asNumber(0);
propertyChanged("_side", _side);
}

        else if(isKeyDown("down"))
{
            actor.setYVelocity(_speed);
            _isWalking = true;
propertyChanged("_isWalking", _isWalking);
            _side = asNumber(2);
propertyChanged("_side", _side);
}

        else
{
            actor.setYVelocity(0);
}

        /* "Troca anima~x00e7ao" */
        if(!(_isWalking))
{
            if((_side == 0))
{
                actor.setAnimation("" + _idleU);
}

            else if((_side == 1))
{
                actor.setAnimation("" + _idleR);
}

            else if((_side == 2))
{
                actor.setAnimation("" + _idleD);
}

            else if((_side == 3))
{
                actor.setAnimation("" + _idleL);
}

}

        else
{
            if((_side == 0))
{
                actor.setAnimation("" + _walkU);
}

            else if((_side == 1))
{
                actor.setAnimation("" + _walkR);
}

            else if((_side == 2))
{
                actor.setAnimation("" + _walkD);
}

            else if((_side == 3))
{
                actor.setAnimation("" + _walkL);
}

}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((actor.getX() < 0))
{
            actor.setX(0);
}

        else if((actor.getX() > ((getSceneWidth()) - (actor.getWidth()))))
{
            actor.setX(((getSceneWidth()) - (actor.getWidth())));
}

        if((actor.getY() < 0))
{
            actor.setY(0);
}

        else if((actor.getY() > ((getSceneHeight()) - (actor.getHeight()))))
{
            actor.setY(((getSceneHeight()) - (actor.getHeight())));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}