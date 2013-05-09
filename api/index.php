<?php
/**
 * Step 1: Require the Slim Framework
 *
 * If you are not using Composer, you need to require the
 * Slim Framework and register its PSR-0 autoloader.
 *
 * If you are using Composer, you can skip this step.
 */
require 'Slim/Slim.php';

\Slim\Slim::registerAutoloader();

/**
 * Step 2: Instantiate a Slim application
 *
 * This example instantiates a Slim application using
 * its default settings. However, you will usually configure
 * your Slim application now by passing an associative array
 * of setting names and values into the application constructor.
 */
$app = new \Slim\Slim();

/**
 * Step 3: Define the Slim application routes
 *
 * Here we define several Slim application routes that respond
 * to appropriate HTTP request methods. In this example, the second
 * argument for `Slim::get`, `Slim::post`, `Slim::put`, and `Slim::delete`
 * is an anonymous function.
 */


$mysqli = new mysqli("localhost","root","","vbooks");
if($mysqli->connect_errno){
	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	exit;
}

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}

$app->get('/book/:id', function ($id) use ($mysqli){
	$stmt = $mysqli->prepare("SELECT * FROM book WHERE id = ?;");
	$id = intval($id) ;
	$stmt->bind_param('i',$id);
	$stmt->execute();
	$row = $stmt->get_result()->fetch_assoc();
	echo json_encode($row);
});

$app->get('/post/:id', function ($id) use ($mysqli){
	$stmt = $mysqli->prepare("SELECT title,author,description,publish_time,fav,uname,email FROM entry INNER JOIN user WHERE entry.uid = user.id AND user.id = ?;");
	$id = intval($id) ;
	$stmt->bind_param('i',$id);
	$stmt->execute();
	$row = $stmt->get_result()->fetch_assoc();
	echo json_encode($row);
});

$app->get('/tag/:id', function ($id) use ($mysqli){
	$stmt = $mysqli->prepare("SELECT * FROM tbrela INNER JOIN book ON tbrela.bid = book.id WHERE tbrela.tid =? LIMIT 0 , 30;");
	$id = intval($id) ;
	$stmt->bind_param('i',$id);
	$stmt->execute();
	$row = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	echo json_encode($row);
});


$app->get('/list/:offset',function($page) use ($mysqli) {
	$stmt = $mysqli->prepare("SELECT * FROM book ORDER BY id DESC LIMIT 10 OFFSET ?;");
	$offset = intval($page-1) * 2;
	$stmt->bind_param('i',$offset);
	$stmt->execute();
	$row = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	echo json_encode($row);
});

$app->get('/tags/:type',function($type) use ($mysqli) {
	if($type == 'all'){
		$stmt = $mysqli->prepare("SELECT tid,name, detail, COUNT( name ) AS total FROM ( SELECT name, detail,tid FROM tbrela INNER JOIN tag ON tbrela.tid = tag.id LIMIT 0 , 30 )t GROUP BY name ORDER BY total DESC;");
		$stmt->execute();
		$row = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
		echo json_encode($row);
	}
	if($type == 'hot'){
		
	}

});
// POST route

$app->post('/register',function() use ($app,$mysqli){
	$req = $app->request()->getBody();
	$json_1 = json_decode($req,true);
	$json_1['flag'] = generateRandomString(15);
	$json_1['password'] = md5($json_1['password']);
	$stmt = $mysqli->prepare("INSERT INTO user(email,password,uname,flag) VALUES(?,?,?,?)");
	$stmt->bind_param('ssss',$json_1['email'],$json_1['password'],$json_1['uname'],$json_1['flag']);
	$stmt->execute();
	if($stmt->affected_rows == 1){
		$bid = $stmt->insert_id;
		echo '{"status":"success","append_id":'.$bid.'}'; 
	}else{
		echo '{"status":"fail"}'; 
	}
});
$app->post('/login',function () use ($app,$mysqli){
	$req = $app->request()->getBody();
	$json_1 = json_decode($req,true);
	$remPwd = $json_1['remPwd'];
	if($json_1['isLogin'] == '1'){
		$stmt = $mysqli->prepare("SELECT * FROM user WHERE uname = ? AND flag = ?");
		$stmt->bind_param('ss',$json_1['uname'],$json_1['flag']);
		$stmt->execute();
		$row = $stmt->get_result()->fetch_assoc();
		if ($row) {
			$row['status'] = 'success';
			$row['avatar'] = "http://www.gravatar.com/avatar/".md5( strtolower( trim($row['email'])))."?s=30";
			echo json_encode($row);
		} else {
			echo '{"status":"fail"}';
		}
	}else{
		$stmt = $mysqli->prepare("SELECT * FROM user WHERE email = ? AND password = ?");
		$stmt->bind_param('ss',$json_1['email'],md5($json_1['password']));
		$stmt->execute();
		$row = $stmt->get_result()->fetch_assoc();
		if ($row) {
			$row['status'] = 'success';
			$row['avatar'] = "http://www.gravatar.com/avatar/".md5( strtolower( trim($row['email'])))."?s=30";
			if($remPwd == '1'){
				setcookie("username",$row['uname'],time()+3600*24*7,"/");
				setcookie("flag",$row['flag'],time()+3600*24*7,"/");
				setcookie("uid",$row['id'],time()+3600*24*7,"/");
			}
			echo json_encode($row);
		} else {
			echo '{"status":"fail"}';
		}
	}

	//echo json_encode($row);

});
$app->post('/post', function () use ($app,$mysqli) {
	$req = $app->request()->getBody();
	$json_1 = json_decode($req,true);

	$stmt = $mysqli->prepare("INSERT INTO book(title,author,publish,image,pages,isbn,summary,tags,type) VALUES(?,?,?,?,?,?,?,?,?)");
	$stmt->bind_param('ssssiissi',$json_1['title'],$json_1['author'],$json_1['publisher'],$json_1['img'],$json_1['pages'],$json_1['isbn'],$json_1['summary'],$json_1['tags'],$json_1['hasVersion']);
	$stmt->execute();
	if($stmt->affected_rows == 1){
		$bid = $stmt->insert_id;
		$tagArr = explode('#', $json_1['tags']);
		$errorArr = array();
		foreach ($tagArr as  $value) {
			$temp = explode('/', $value); 
			$tid = $temp[1];
			$stmt2 = $mysqli->prepare("INSERT INTO tbrela(bid,tid) VALUES(?,?);");
			$stmt2->bind_param('ii',$bid,$tid);
			$stmt2 ->execute();
			if($stmt2->affected_rows != 1){
				$errorArr[] = 'error' + $value;
			}
			$stmt2->close();
		}
		if(count($errorArr) == 0){
			echo '{"status":"success"}';
		}else {
			echo '{"status":"fail"}';
		}
		
	}else {
		echo '{"status":"fail"}';
	}
});

$app->post('/postentry', function () use ($app,$mysqli) {
	$req = $app->request()->getBody();
	$json_1 = json_decode($req,true);
	$date = date('Y-m-d H:i:s');
	$stmt = $mysqli->prepare("INSERT INTO entry(title,author,description,uid,type,publish_time,fav) VALUES(?,?,?,?,?,?,?)");
	$stmt->bind_param('sssissi',$json_1['title'],$json_1['author'],$json_1['description'],$json_1['uid'],$json_1['type'],$date,$json_1['fav']);
	$stmt->execute();
	if($stmt->affected_rows == 1){
		echo '{"status":"success"}';
	}else {
		echo '{"status":"fail"}';
	}
});



// PUT route
$app->put('/put', function () {

	echo 'This is a PUT route';
});

// DELETE route
$app->delete('/delete', function () {
	echo 'This is a DELETE route';
});


/**
 * Step 4: Run the Slim application
 *
 * This method should be called last. This executes the Slim application
 * and returns the HTTP response to the HTTP client.
 */
$app->run();
$mysqli->close();

?>