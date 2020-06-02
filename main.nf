$HOSTNAME = ""
params.outdir = 'results'  


if (!params.inputparam){params.inputparam = ""} 

Channel.value(params.inputparam).set{g_1_wdir_g_0}


process Test {

publishDir params.outdir, overwrite: true, mode: 'copy',
	saveAs: {filename ->
	if (filename =~ /.*.txt$/) "outputparam/$filename"
}

input:
 val dir from g_1_wdir_g_0

output:
 file "*.txt"  into g_0_outputFileTxt

"""
ls -l ${dir} > list.txt
"""
}


workflow.onComplete {
println "##Pipeline execution summary##"
println "---------------------------"
println "##Completed at: $workflow.complete"
println "##Duration: ${workflow.duration}"
println "##Success: ${workflow.success ? 'OK' : 'failed' }"
println "##Exit status: ${workflow.exitStatus}"
}
