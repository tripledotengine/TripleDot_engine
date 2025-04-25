package twoB;

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

		// return macro 'Branch: ${branchName}, Commit:  ${commitHash}';
        return macro  'Commit('+$v{commitNumn}+'): '+ $v{commitHash}+'\nOn Branch: '+$v{branchName};
    }
}