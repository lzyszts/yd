<?php 
function deleteRuntime($path){
	var_dump($path);
	if(file_exists($path)){
	    $handle = opendir($path);
		while (false !==$file = readdir($handle)){
			if ($file !='.' && $file != '..'){
				$file_fullpath = $path."/".$file;
				echo iconv('GBK', 'utf-8', $file_fullpath);
				echo "<br />";
				if (!is_dir($file_fullpath)){
					unlink($file_fullpath);
				}else{
					deleteRuntime($file_fullpath);
					//rmdir($file_fullpath);
				}
			}	
		}
	}
}
deleteRuntime(__DIR__.'/../../application/admin/model');