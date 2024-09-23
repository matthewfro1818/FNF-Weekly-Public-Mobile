#if !macro
//flixel
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.FlxBasic;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.util.FlxDestroyUtil;

#if DISCORD_ALLOWED
import meta.data.Discord;
#end

import Init;

import hxvlc.flixel.*;

//Mobile Controls
import mobile.meta.data.SUtil;
import mobile.flixel.FlxVirtualPad;
import mobile.flixel.FlxHitbox;
import mobile.flixel.input.FlxMobileInputID;

//Android
#if android
import android.content.Context as AndroidContext;
import android.widget.Toast as AndroidToast;
import android.os.Environment as AndroidEnvironment;
import android.Permissions as AndroidPermissions;
import android.Settings as AndroidSettings;
import android.Tools as AndroidTools;
import android.os.Build.VERSION as AndroidVersion;
import android.os.Build.VERSION_CODES as AndroidVersionCode;
import android.os.BatteryManager as AndroidBatteryManager;
#end

#if sys
import sys.*;
import sys.io.*;
#elseif js
import js.html.*;
#end

import meta.data.Paths;
import meta.data.ClientPrefs;
import meta.data.Conductor;
import meta.data.CoolUtil;
import meta.data.Highscore;

import meta.states.*;

import gameObjects.BGSprite;

import meta.states.KUTValueHandler;

import meta.data.ExUtils;
import meta.data.ExUtils.addShader as ApplyShaderToCamera;
import meta.data.ExUtils.removeShader as RemoveShaderFromCamera;
import meta.data.ExUtils.insertFlxCamera as insertFlxCamera;

using StringTools;
using meta.FlxObjectTools;
#end
