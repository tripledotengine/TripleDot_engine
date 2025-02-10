package;

import api.sys.ApiPath;
import openfl.display.BitmapData;

class Path{
    inline static public function image(file:String, ?bitmap:BitmapData = null){
        return ApiPath.image('assets/data/fonts/'+file, bitmap);
    }

	inline static public function font(file:String)
    {
        return ApiPath.font('assets/data/fonts/'+file+'.ttf');
    }
    
    inline static public function sound(file:String){
        return ApiPath.sounds('assets/data/fonts/'+file);
    }
}