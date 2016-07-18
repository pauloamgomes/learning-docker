<?php
return [
  'fetch' => PDO::FETCH_CLASS,
  'default' => 'mongodb',
  'connections' => [
    'mongodb' => [
      'driver'   => 'mongodb',
      'host'     => 'mongo',
      'port'     => 27017,
      'username' => 'root',
      'password' => 'root',
      'database' => 'llocker',
    ],
  ],
  'migrations' => 'migrations',
];
