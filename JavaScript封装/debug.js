/*$()打印数据结果*/
function $(){
	if (arguments.length<2) {
		arguments[0]===undefined?console.log('--------undefined---------'):console.log(arguments[0]);		
	}else{				
		for (let i = 0; i < arguments.length; i++) {
		 	console.log(arguments[i]);					
		}				
	}
}