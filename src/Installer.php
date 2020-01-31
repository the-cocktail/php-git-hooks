<?php

namespace PHPCodeChecker;

class Installer
{
    public static function postInstall()
    {
            system('sh vendor/the-cocktail/php-git-hooks/src/setup.sh');
    }
}