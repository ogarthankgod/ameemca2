<?php

$host = '127.0.0.1';
$db   = 'ameemca_lo';
$user = 'freddible';
$pass = 'MYSQL.mysql';
$port = "3306";
$charset = 'utf8mb4';

$options = [
  \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
  \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
  \PDO::ATTR_EMULATE_PREPARES   => false,
];
$dsn = "mysql:host=$host;dbname=$db;charset=$charset;port=$port";
$pdo = new \PDO($dsn, $user, $pass, $options);

$stmt = $pdo->query("SELECT id,staffid,allotment_amount,reg_fee FROM usertable");
$userData = $stmt->fetchAll();

foreach ($userData as $userx) {
  $newAllotmentAmount = number_format($userx['allotment_amount'], 2, '.', '');
  $newRegFee = number_format($userx['reg_fee'], 2, '.', '');
    
  $data = [
    'id' => $userx['id'],
    'allotment_amount' => $newAllotmentAmount,
    'reg_fee' => $newRegFee,
  ];

  $sql = "UPDATE usertable SET allotment_amount=:allotment_amount, reg_fee=:reg_fee WHERE id=:id";
  $stmt = $pdo->prepare($sql);
  $stmt->execute($data);

  echo "Allotment_amount & Reg_fee Algo for [{$userx['staffid']}] \n";
  echo ($userx['allotment_amount']) . " Updated to " . $newAllotmentAmount . "\n";
  echo "{$userx['reg_fee']} Updated to {$newRegFee} \n\n";
}


//TODO.. check for same phone number ,, and patch accordingly.. add uniqueness

// 210151 and 210232 are using thesame phone number