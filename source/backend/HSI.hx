package backend;

/**
 * [This file exists to easier edit any HScriptModule logic if needed]()
 * Please use this if you call a HScript
 */

class HSI{
    
    var hscriptList:Array<HScriptModule> = [];
    var hscript = new HScriptModule();

    function new(?script:String, ?crash:Bool){
        try{
            hscript.crash = crash;
            hscript.script = script;
    
            hscriptList.push(hscript);
        }catch(e:IrisError) {
			if (hscript != null) hscript.destroy();
		}
    }

    function destroy(){//call on state switch - create a singular switch funciton
        for (hscript in hscriptList){
            hscript.destroy();
        }
        hscriptList = null;
    }
}