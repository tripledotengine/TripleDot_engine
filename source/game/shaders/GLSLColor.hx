package game.shaders;

class GLSLColor {
    public static var _map:Map<String, Array<Float>> = [
	    'BLACK' =>  [0.00, 0.00, 0.00],
        'WHITE' =>  [1.00, 1.00, 1.00],
        'CYAN' =>   [0.00, 1.00, 1.00],
	    'LIME' =>   [0.00, 1.00, 0.00],
        'GREEN' =>  [0.00, 1.00, 0.00],
	    'YELLOW '=> [1.00, 1.00, 0.00],
	    'ORANGE' => [1.00, 0.62, 0.00],
	    'RED' =>    [1.00, 0.00, 0.00],
	    'BLUE' =>   [1.00, 0.00, 0.00],
        'GRAY' =>   [0.77, 0.77, 0.77],
        'PURPLE' => [0.75, 0.00, 1.00],
	    'BROWN' =>  [0.50, 0.24, 0.00],
	    'MAGENTA' =>[1.00, 0.00, 0.88],
	    'PINK' =>   [1.00, 0.72, 0.96]
    ];
    /**
     * [Description]
     * @param _ finds GLSL color based on a map!
     */
    public static function findColor(_:String){
        return _map.get(_.toUpperCase());
    }

    public static function findrgbToglsl(r:String,g:String,b:String,?a:String){
        // return _map.get(_.toUpperCase());
    }
}