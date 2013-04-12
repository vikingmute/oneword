<?php
	$mysqli = new mysqli("localhost","root","","vbooks");
	if($mysqli->connect_errno){
		echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
		exit;
	}
	$arrayName = array('Javascript' => 'something detail',
						'jQuery'=>'a js framework',
						'backbone.js' => 'another js framework',
						'node.js' => 'a v8 server js',
						'PHP' => 'nice stuff',
						'CSS3' => 'the makeup',
						'HTML5' => 'things to make you hyper',
						'Python' => 'like a whisper',
						'Mysql' => 'database stuff',
						'Ruby' => 'not a kind of gem');
	foreach ($arrayName as $key => $value) {
		echo $key . 'is -----' . $value .'<br/>';
		$stmt = $mysqli->prepare("INSERT INTO tag(name,detail) VALUES(?,?);");
		$stmt->bind_param('ss',$key,$value);
		$stmt->execute();
		if($stmt->affected_rows == 1){
			echo 'chenggongle insert id is' . $stmt->insert_id. '<br/>';
		}else {
			echo 'fuck cuochu le !!!';
		}

	}

?>