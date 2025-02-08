package api.sys;

import openfl.utils.AssetType;
import openfl.utils.Assets as AssetCache;
import openfl.utils.Assets as FileSystem;
import openfl.utils.Assets as IAssetCache;
import openfl.utils.Assets as OpenFlAssets;
import openfl.utils.Assets;

using StringTools;

class ApiCache
{
	private static var cacheMap:Map<Dynamic, Dynamic> = new Map<Dynamic, Dynamic>();
	private static var precacheMap:Map<Dynamic, Dynamic> = new Map<Dynamic, Dynamic>();

	/**
	 * [Chaching!]
	 * @param t 
	 * asset path
	 * @param e 
	 * asset file type | SOUND, IMAGE, FILE
	 * @param d
	 * prechache? optional!
	 */
	public static function che(t:Dynamic, e:Dynamic, ?d:Bool = false)
	{
		if (d = true)
			cache(t, e);
		else
			precache(t, e);
	}

	public static function cache(path:Dynamic, file:Dynamic, ?void:Dynamic->Void)
	{
		if (cacheMap.exists('assets/$path'))
			return;

		if (void != null)
			void(file);
		cacheMap.set(path, file);
		//	done++;
	}

	public static function precache(path:Dynamic, file:Dynamic, ?void:Dynamic->Void)
	{
		if (precacheMap.exists('assets/$path'))
			return;

		if (void != null)
			void(file);
		precacheMap.set(path, file);
		//	done++;
	}
}
