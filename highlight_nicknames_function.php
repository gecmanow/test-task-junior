<?php

function highlight_nicknames($text) {
    $string = explode(' ', $text);
    foreach ($string as $key => $str) {
        if(preg_match('/^@{1}[a-z]{1}[a-z0-9]+$/', $str)) {
            $string[$key] = '<b>' . $str . '</b>';
        }
    }
    $result = implode(' ', $string);

    return htmlspecialchars($result);
}