<?php

$res = [];

if (!$_GET['resource']) {
    file_put_contents('php://stderr', '[!!!] No resource given.' . PHP_EOL);
} elseif (!$_ENV['OIDC_ISSUER_URL']) {
    file_put_contents('php://stderr', '[!!!] No OIDC_ISSUER_URL given.' . PHP_EOL);
} else {
    $res = [
        "subject" => $_GET['resource'],
        "links" => [
            [
                "rel" => "http://openid.net/specs/connect/1.0/issuer",
                "href" => $_ENV['OIDC_ISSUER_URL'],
            ],
        ],
    ];
}
   
echo json_encode($res);