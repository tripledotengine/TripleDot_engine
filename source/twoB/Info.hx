package twoB;

using StringTools;
using Lambda;
class Info{

    public static macro  function getGit():haxe.macro.Expr.ExprOf<String>{
		var bproc = new sys.io.Process('git', ['rev-parse', '--abbrev-ref', 'HEAD']);
		var cproc = new sys.io.Process('git', ['rev-parse', '--short', 'HEAD'], false);
		var nproc = new sys.io.Process('git', ['rev-list', 'HEAD', '--count'], false);

		var commitHash:String = "";
		var branchName:String = "";
		var commitNumn:String = "";
        
		try {
			branchName = bproc.stdout.readLine();
            commitHash = cproc.stdout.readLine();
			commitNumn = nproc.stdout.readLine();

			bproc.exitCode(true);
            cproc.exitCode(true);
			nproc.exitCode(true);
		}catch (e){}

        return macro  'Commit('+$v{commitNumn}+'): '+ $v{commitHash}+'\nOn Branch: '+$v{branchName};
    }

//     macro public static function buildDate():ExprOf<Date> {
//         var date = Date.now();
//         var year = toExpr(date.getFullYear());
//         var month = toExpr(date.getMonth());
//         var day = toExpr(date.getDate());
//         var hours = toExpr(date.getHours());
//         var mins = toExpr(date.getMinutes());
//         var secs = toExpr(date.getSeconds());
//         return macro new Date($year, $month, $day, $hours, $mins, $secs);
//     }


//     macro public static function buildDateString():ExprOf<String> {
//         return toExpr(Date.now().toString());
//     }
//     macro public static function buildGitCommitSha():ExprOf<String> {
//         var proc = new sys.io.Process('git', ['log', "--pretty=format:'%h'", '-n', '1']);
//         var sha1 = proc.stdout.readLine();
//         return toExpr(sha1);
//     }
}